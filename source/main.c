/*****************************************************************
*       main.c
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/


#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "arm.h"

extern char end[]; // first address after kernel loaded from ELF file
extern pde_t *kpgdir;
extern FBI fbinfo;

void OkLoop()
{
   setgpiofunc(16, 1); // gpio 16, set as an output
   while(1){
        setgpioval(16, 0);
        delay(1000000);
        setgpioval(16, 1);
        delay(1000000);
   }
}

void NotOkLoop()
{
   setgpiofunc(16, 1); // gpio 16, set as an output
   while(1){
        setgpioval(16, 0);
        delay(100000);
        setgpioval(16, 1);
        delay(100000);
   }
}

void machinit(void)
{
    memset(cpus, 0, sizeof(struct cpu)*NCPU);
}


void enableirqminiuart(void);

int cmain()
{

  mmuinit1();
  machinit();
  uartinit();
  dsb_barrier();
  consoleinit();
  cprintf("\nHello World from xv6\n");
  kinit1(end, P2V(8*1024*1024));  // reserve 8 pages for PGDIR
  kpgdir=p2v(K_PDX_BASE);
  pinit();
  tvinit();
  cprintf("it is ok after tvinit\n");
  binit();
cprintf("it is ok after binit\n");
  fileinit();
cprintf("it is ok after fileinit\n");
  iinit();
cprintf("it is ok after iinit\n");
  ideinit();
cprintf("it is ok after ideinit\n");
  timer3init();
  kinit2(P2V(8*1024*1024), P2V(PHYSTOP));
cprintf("it is ok after kinit2\n");
  userinit();
cprintf("it is ok after userinit\n");
  scheduler();


  NotOkLoop();

  return 0;
}