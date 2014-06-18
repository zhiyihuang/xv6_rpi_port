/*****************************************************************
*       mailbox.c
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/



#include "types.h"
#include "defs.h"
#include "param.h"
#include "traps.h"
#include "spinlock.h"
#include "fs.h"
#include "file.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "arm.h"

#define MAILBOX_BASE	0xFE00B880

uint
readmailbox(u8 channel)
{
	uint x, y, z;

again:
	while ((inw(MAILBOX_BASE+24) & 0x40000000) != 0);
	x = inw(MAILBOX_BASE);
	z = x & 0xf; y = (uint)(channel & 0xf);
	if((z ^ y) != 0) goto again;

	return x&0xfffffff0;
}

void
writemailbox(uint addr, u8 channel)
{
	uint x, y;

	addr -= KERNBASE;   /* convert to ARM physical address */
	addr += 0x40000000; /* convert to VC address space */
	x = addr & 0xfffffff0;
	y = x | (uint)(channel & 0xf);

	while ((inw(MAILBOX_BASE+24) & 0x80000000) != 0);
	outw(MAILBOX_BASE+32, y);
}
