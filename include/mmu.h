/*****************************************************************
*       mmu.h
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/


#define MBYTE		0x100000
#define K_PDX_BASE	0x4000
#define K_PTX_BASE	0x3000

#define CACHELINESIZE   32

/*
 * page table entries.
*/

#define UNMAPPED	0x00000000

#define COARSE		(0<<4|1)
#define SECTION		(0<<4|2)

#define LARGE		0x00000001
#define SMALL		0x00000002
#define BUFFERED	0x00000004
#define CACHED		0x00000008
#define DOMAIN0		0

#define NOACCESS	0
#define K_RW		1
#define U_AP		2
#define U_RW		3

#define ACCESS_PERM(n, v)	(((v) & 3) << (((n) * 2) + 4))
#define PDX_AP(ap)		(ACCESS_PERM(3, (ap)))
#define PTX_AP(ap) 		(ACCESS_PERM(3, (ap)) | ACCESS_PERM(2, (ap)) \
				| ACCESS_PERM(1, (ap)) | ACCESS_PERM(0, (ap)))

#define HVECTORS        0xffff0000

// A virtual address 'la' has a three-part structure as follows:
//
// +--------12------+-------8--------+---------12----------+
// | Page Directory |   Page Table   | Offset within Page  |
// |      Index     |      Index     |                     |
// +----------------+----------------+---------------------+
//  \--- PDX(va) --/ \--- PTX(va) --/

// page directory index
#define PDX(va)         (((uint)(va) >> PDXSHIFT) & 0xFFF)

// page table index
#define PTX(va)         (((uint)(va) >> PTXSHIFT) & 0xFF)

// construct virtual address from indexes and offset
#define PGADDR(d, t, o) ((uint)((d) << PDXSHIFT | (t) << PTXSHIFT | (o)))

// Address in page table or page directory entry
#define PTE_ADDR(pte)   ((uint)(pte) & ~0xFFF)
#define PTE_FLAGS(pte)  ((uint)(pte) &  0xFFF)

// Page directory and page table constants.
#define NPDENTRIES      1024    // # directory entries per page directory
#define NPTENTRIES      1024    // # PTEs per page table
#define PGSIZE          4096    // bytes mapped by a page

#define PGSHIFT         12      // log2(PGSIZE)
#define PTXSHIFT        12      // offset of PTX in a linear address
#define PDXSHIFT        20      // offset of PDX in a linear address


#define PGROUNDUP(sz)  (((sz)+PGSIZE-1) & ~(PGSIZE-1))
#define PGROUNDDOWN(a) (((a)) & ~(PGSIZE-1))

#define PGDIR_BASE	P2V(K_PDX_BASE)

#define KVMPDXATTR       DOMAIN0|PDX_AP(U_RW)|SECTION|CACHED|BUFFERED

#define UVMPDXATTR 	DOMAIN0|COARSE
#define UVMPTXATTR	PTX_AP(U_RW)|CACHED|BUFFERED|SMALL

