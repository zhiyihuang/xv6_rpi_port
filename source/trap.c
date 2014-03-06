/*****************************************************************
*       trap.c
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
#include "traps.h"
#include "spinlock.h"

extern u8 *vectors;

void cprintf(char*, ...);
void dsb_barrier(void);
void flush_idcache(void);
void *memmove(void *dst, const void *src, uint n);
void set_mode_sp(char *, uint);

struct spinlock tickslock;
uint ticks;

void enable_intrs(void)
{
        intctrlregs *ip;

        ip = (intctrlregs *)INT_REGS_BASE;
        ip->gpuenable[0] |= 1 << 29;   // enable the miniuart through Aux
        //ip->gpuenable[1] |= 1 << 25; // enable uart
        ip->armenable |= 1 << 0;       // enable the system timer
}


void disable_intrs(void)
{
        intctrlregs *ip;
        int disable;

        ip = (intctrlregs *)INT_REGS_BASE;
        disable = ~0;
        ip->gpudisable[0] = disable;
        ip->gpudisable[1] = disable;
        ip->armdisable = disable;
        ip->fiqctrl = 0;
}


void tvinit(void)
{
	uint *d, *s;
	char *ptr;

	/* initialize the exception vectors */
	d = (uint *)HVECTORS;
	s = (uint *)&vectors;
	memmove(d, s, sizeof(Vpage0));

	/* cacheuwbinv(); drain write buffer and prefetch buffer
	 * writeback and invalidate data cache
	 * invalidate instruction cache
	 */
	dsb_barrier();
	flush_idcache();
	ptr = kalloc();
	memset(ptr, 0, PGSIZE);
	set_mode_sp(ptr+4096, 0xD1);/* fiq mode, fiq and irq are disabled */

	ptr = kalloc();
	memset(ptr, 0, PGSIZE);
	set_mode_sp(ptr+4096, 0xD2);/* irq mode, fiq and irq are disabled */
	ptr = kalloc();
	memset(ptr, 0, PGSIZE);
	set_mode_sp(ptr+4096, 0xDB);/* undefined mode, fiq and irq are disabled */
	ptr = kalloc();
	memset(ptr, 0, PGSIZE);
	set_mode_sp(ptr+4096, 0xD7);/*  abort mode, fiq and irq are disabled */
	ptr = kalloc();
	memset(ptr, 0, PGSIZE);
	set_mode_sp(ptr+4096, 0xD6);/* secure monitor mode, fiq and irq are disabled */
	ptr = kalloc();
	memset(ptr, 0, PGSIZE);
	set_mode_sp(ptr+4096, 0xDF);/* system mode, fiq and irq are disabled */

	dsb_barrier();
}

void trap_oops(struct trapframe *tf)
{

cprintf("trapno: %x, spsr: %x, sp: %x, pc: %x cpsr: %x ifar: %x\n", tf->trapno, tf->spsr, tf->sp, tf->pc, tf->cpsr, tf->ifar);
cprintf("Saved registers: r0: %x, r1: %x, r2: %x, r3: %x, r4: %x, r5: %x\n", tf->r0, tf->r1, tf->r2, tf->r3, tf->r4, tf->r5);
cprintf("More registers: r6: %x, r7: %x, r8: %x, r9: %x, r10: %x, r11: %x, r12: %x\n", tf->r6, tf->r7, tf->r8, tf->r9, tf->r10, tf->r11, tf->r12);

//NotOkLoop();
}

void handle_irq(struct trapframe *tf)
{
	intctrlregs *ip;

/*cprintf("trapno: %x, spsr: %x, sp: %x, lr: %x cpsr: %x ifar: %x\n", tf->trapno, tf->spsr, tf->sp, tf->pc, tf->cpsr, tf->ifar);
cprintf("Saved registers: r0: %x, r1: %x, r2: %x, r3: %x, r4: %x, r5: %x, r6: %x\n", tf->r0, tf->r1, tf->r2, tf->r3, tf->r4, tf->r5, tf->r6);
cprintf("More registers: r6: %x, r7: %x, r8: %x, r9: %x, r10: %x, r11: %x, r12: %x, r13: %x, r14: %x\n", tf->r7, tf->r8, tf->r9, tf->r10, tf->r11, tf->r12, tf->r13, tf->r14);
*/
	ip = (intctrlregs *)INT_REGS_BASE;
	while(ip->gpupending[0] || ip->gpupending[1] || ip->armpending){
	    if(ip->gpupending[0] & (1 << 3)) {
		timer3intr();
	    }
	    if(ip->gpupending[0] & (1 << 29)) {
		miniuartintr();
	    }
	}

}


//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
	intctrlregs *ip;
	uint istimer;

//cprintf("Trap %d from cpu %d eip %x (cr2=0x%x)\n",
//              tf->trapno, curr_cpu->id, tf->eip, 0);
  //trap_oops(tf);
  if(tf->trapno == T_SYSCALL){
    if(curr_proc->killed)
      exit();
    curr_proc->tf = tf;
    syscall();
    if(curr_proc->killed)
      exit();
    return;
  }

  istimer = 0;
  switch(tf->trapno){
  case T_IRQ:
	ip = (intctrlregs *)INT_REGS_BASE;
	while(ip->gpupending[0] || ip->gpupending[1] || ip->armpending){
	    if(ip->gpupending[0] & (1 << IRQ_TIMER3)) {
		istimer = 1;
		timer3intr();
	    }
	    if(ip->gpupending[0] & (1 << IRQ_MINIUART)) {
		miniuartintr();
	    }
	}

	break;
  default:
    if(curr_proc == 0 || (tf->spsr & 0xF) != USER_MODE){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d addr %x spsr %x cpsr %x ifar %x\n",
              tf->trapno, curr_cpu->id, tf->pc, tf->spsr, tf->cpsr, tf->ifar);
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d on cpu %d "
            "addr 0x%x spsr 0x%x cpsr 0x%x ifar 0x%x--kill proc\n",
            curr_proc->pid, curr_proc->name, tf->trapno, curr_cpu->id, tf->pc,
            tf->spsr, tf->cpsr, tf->ifar);
    curr_proc->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)

//cprintf("Proc pointer: %d\n", curr_proc);
  if(curr_proc){
        if(curr_proc->killed && (tf->spsr&0xF) == USER_MODE)
                exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
        if(curr_proc->state == RUNNING && istimer)
                yield();

  // Check if the process has been killed since we yielded
        if(curr_proc->killed && (tf->spsr&0xF) == USER_MODE)
                exit();
  }

//cprintf("Proc pointer: %d after\n", curr_proc);

}

