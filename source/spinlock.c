/*****************************************************************
*       spinlock.c
*       adapted from MIT xv6 by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/



#include "types.h"
#include "defs.h"
#include "param.h"
#include "arm.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
  lk->locked = 0;
  lk->cpu = 0;
}

// Acquire the lock.
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk)){
    cprintf("lock name: %s, locked: %d, cpu: %x CPSR: %x\n", lk->name, lk->locked, lk->cpu, readcpsr());
    panic("acquire");
  }

  lk->locked = 1;

  // Record info about lock acquisition for debugging.
  lk->cpu = curr_cpu;
}

// Release the lock.
void
release(struct spinlock *lk)
{

  if(!holding(lk))
    panic("release");

  lk->pcs[0] = 0;
  lk->cpu = 0;

  lk->locked = 0;
  popcli();
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
}


// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
int rv;
  rv = lock->locked && lock->cpu == curr_cpu;
/*  if(rv){
    cprintf("The held lock: %s, locked: %d, cpu: %x\n", lock->name, lock->locked, lock->cpu);
  }*/
  return rv;
}


// Pushcli/popcli are like cli/sti except that they are matched:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
  uint cpsr;
  cpsr = readcpsr();
  cli();
  if(curr_cpu->ncli++ == 0)
    curr_cpu->intena = (cpsr & PSR_DISABLE_IRQ) ? 0: 1;
}

void
popcli(void)
{
  if(!(readcpsr()&PSR_DISABLE_IRQ))
    panic("popcli - interruptible");
  if(--curr_cpu->ncli < 0)
    panic("popcli");
  if(curr_cpu->ncli == 0 && curr_cpu->intena)
    sti();
}

