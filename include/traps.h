/*****************************************************************
*       traps.h
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/



// These are arbitrarily chosen, but with care not to overlap
// processor defined exceptions or interrupt vectors.
#define T_SYSCALL	0x40	// system call
#define T_IRQ		0x80	// interrupt
#define T_UND		0x01	// undefined instruction
#define T_PABT		0x02	// prefetch abort
#define T_DABT		0x04	// data abort

#define IRQ_TIMER3	3
#define IRQ_MINIUART	29

#define INT_REGS_BASE 	(DEVSPACE+0xB200)
