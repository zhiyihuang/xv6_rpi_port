/*****************************************************************
*       vm.c
*       adapted from MIT xv6 by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/



#include "param.h"
#include "types.h"
#include "defs.h"
#include "arm.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "elf.h"

extern char data[];  // defined by kernel.ld
extern char end[];  // defined by kernel.ld

pde_t *kpgdir;  // for use in scheduler()

// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, uint l1attr, int alloc)
{
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if((uint)*pde != 0){
    pgtab = (pte_t*)p2v(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table 
    // entries, if necessary.
    *pde = v2p(pgtab) | l1attr;
//cprintf("the pde value is %x\n", (uint)*pde);
  }
  return &pgtab[PTX(va)];
}

// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, uint l1attr, uint l2attr)
{
  char *a, *last;
  pte_t *pte;
  
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);

//cprintf("size= %x a=%x last= %x pa=%x\n", size, a, last, pa);

  if((SECTION & l1attr) != 0){// for 1 MB pages
	for(;;){
	    if(a > last) break;
	    if((uint)pgdir[PDX(a)] != 0) panic("remap");
	    pgdir[PDX(a)] = pa | l1attr;
//cprintf("The pgdir entry: %x value: %x a=%x last= %x\n", PDX(a), pgdir[PDX(a)], a, last);
	    a += MBYTE;
	    pa += MBYTE;
	}
  } else if((COARSE & l1attr) != 0){// for 4kB pages
	for(;;){
	//cprintf("The pgdir is %x value: %x a=%x last= %x\n", pgdir+PDX(a), pgdir[PDX(a)], a, last);
	    if((pte = walkpgdir(pgdir, a, l1attr, 1)) == 0)
		return -1;
	    if((uint)*pte != 0) panic("remap");
	    *pte = pa | l2attr;
//cprintf("The pte value is %x, the pde values is %x\n", (uint)*pte, pgdir[PDX(a)]);
	    if(a == last) break;
	    a += PGSIZE;
	    pa += PGSIZE;
	}
  } else panic("Unknown page attribute");
  return 0;
}

// There is one page table per process, plus one that's used when
// a CPU is not running any process (kpgdir). The kernel uses the
// current process's page table during system calls and interrupts;
// page protection bits prevent user code from using the kernel's
// mappings.
// 
// setupkvm() and exec() set up every page table like this:
//
//   0..KERNBASE: user memory (text+data+stack+heap), mapped to
//                phys memory allocated by the kernel
//   KERNBASE..KERNBASE+EXTMEM: mapped to 0..EXTMEM (for I/O space)
//   KERNBASE+EXTMEM..data: mapped to EXTMEM..V2P(data)
//                for the kernel's instructions and r/o data
//   data..KERNBASE+PHYSTOP: mapped to V2P(data)..PHYSTOP, 
//                                  rw data + free physical memory
//   0xfe000000..0: mapped direct (devices such as ioapic)
//
// The kernel allocates physical memory for its heap and for user memory
// between V2P(end) and the end of physical memory (PHYSTOP)
// (directly addressable from end..P2V(PHYSTOP)).

// This table defines the kernel's mappings, which are present in
// every process's page table.
static struct kmap {
  void *virt;
  uint phys_start;
  uint phys_end;
  uint l1attr;
  uint l2attr;
} kmap[] = {
 { (void*)KERNBASE, PA_START, PHYSTOP, DOMAIN0|PDX_AP(U_RW)|SECTION|CACHED|BUFFERED, 0},
 { (void*)DEVSPACE, PHYSIO, PHYSIO+IOSIZE, DOMAIN0|PDX_AP(U_RW)|SECTION, 0},
 { (void*)HVECTORS, PA_START, PA_START+TVSIZE, DOMAIN0|COARSE, PTX_AP(K_RW)|SMALL},
};

// Set up kernel part of a page table. 
// However, since the kernel part is shared, only the user part
// of the pgd is allocated (one page only for simplicity, so user space
// is now limited to 1GB
pde_t*
setupkvm(void)
{
  pde_t *pgdir;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
//cprintf("inside setupkvm: pgdir=%x\n", pgdir);
  memset(pgdir, 0, PGSIZE);
//cprintf("after memset\n", pgdir);
  return pgdir;
}


// Set up kernel part of a page table.
pde_t*
setupkvm_new(void)
{
  pde_t *pgdir;
  struct kmap *k;

/*  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;*/

  pgdir = kpgdir;
  memset(pgdir, 0, 4*PGSIZE);
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
                (uint)k->phys_start, k->l1attr, k->l2attr) < 0)
      return 0;
  return pgdir;
}

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
  kpgdir = setupkvm_new();
  switchkvm();
}

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
// do nothing here as the same pgdir is shared between kernel and user;
// will see if the user portion of the pgdir should be removed.
}

void
switchkvm_new(void)
{
  dsb_barrier();
  flush_idcache();
  //cprintf("The phy pgtbase address is %x\n", (uint)v2p(kpgdir));
  set_pgtbase((uint)v2p(kpgdir));   // switch to the kernel page table
  //cprintf("after set_pgtbase\n");
  dsb_barrier();
  flush_tlb();
  //cprintf("after flush_tlb\n");
}

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  //cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
//cprintf("before copying uvm to kvm kpgdir=%x the first entry: %x\n", kpgdir, kpgdir[0]);
  memmove((void *)kpgdir, (void *)p->pgdir, PGSIZE);  // switch to new user address space
  flush_idcache();
  flush_tlb();
  popcli();
}


// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
//cprintf("inituvm: page is allocated at %x\n", mem);
  mappages(pgdir, 0, PGSIZE, v2p(mem), UVMPDXATTR, UVMPTXATTR);
  memmove(mem, init, sz);
}

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  if((uint)addr + sz > USERBOUND)
    panic("loaduvm: user address space exceeds the allowed space (> 0x80000000)");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, UVMPDXATTR, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, p2v(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
}

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  char *mem;
  uint a;

  if(newsz >= USERBOUND)
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), UVMPDXATTR, UVMPTXATTR);
  }
  return newsz;
}

// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
    pte = walkpgdir(pgdir, (char*)a, UVMPDXATTR, 0);
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if(*pte != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
      char *v = p2v(pa);
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, USERBOUND, 0);
  for(i = 0; i < NPDENTRIES; i++){
    if((uint)pgdir[i] != 0){
      char * v = p2v(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
}

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, UVMPDXATTR, 0);
  if(pte == 0)
    panic("clearpteu");
  *pte &= ~PTX_AP(U_AP);
}

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, UVMPDXATTR, 0)) == 0)
      panic("copyuvm: pte should exist");
    if((uint)*pte == 0)
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), UVMPDXATTR, flags) < 0)
      goto bad;
  }
  return d;

bad:
  freevm(d);
  return 0;
}

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, UVMPDXATTR, 0);
  if((uint)*pte == 0)
    return 0;
  if(((uint)*pte & PTX_AP(U_AP)) == 0)
    return 0;
  return (char*)p2v(PTE_ADDR(*pte));
}

// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}


