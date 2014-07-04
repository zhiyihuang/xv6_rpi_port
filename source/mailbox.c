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
#include "mailbox.h"

/* Note: for more tags refer to 
https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */
/* Note for Matthew: support more than one tag in buffer */


void
create_request(volatile uint *mbuf, uint tag, uint buflen, uint len, uint *data) 
{
    int i;
    volatile uint *tag_info;
    uint nw, tag_len, total_len;

    tag_info = mbuf + POS_TAG;

    tag_info[POS_TAG_ID] = tag;
    tag_info[POS_TAG_BUFLEN] = buflen;
    tag_info[POS_TAG_DATALEN] = len & 0x7FFFFFFF;

    nw = buflen >> 2;

    if (!data)
        for (i = 0; i < nw; ++i) tag_info[POS_TAG_DATA + i] = 0;
    else
        for (i = 0; i < nw; ++i) tag_info[POS_TAG_DATA + i] = data[i];

    tag_info[POS_TAG_DATA+nw] = 0; // indicate end of tag

    tag_len = mbuf[MB_HEADER_LENGTH + POS_TAG_BUFLEN];
    total_len = (MB_HEADER_LENGTH*4) + (TAG_HEADER_LENGTH*4) + tag_len + 4;

    mbuf[POS_OVERALL_LENGTH] = total_len;
    mbuf[POS_RV] = MPI_REQUEST;

}

volatile uint *mailbuffer;

void mailboxinit()
{
mailbuffer = (uint *)kalloc();
}

uint
readmailbox(u8 channel)
{
	uint x, y, z;

again:
	while ((inw(MAILBOX_BASE+24) & 0x40000000) != 0);
	x = inw(MAILBOX_BASE);
	z = x & 0xf; y = (uint)(channel & 0xf);
	if(z != y) goto again;

	return x&0xfffffff0;
}

void
writemailbox(uint *addr, u8 channel)
{
	uint x, y, a;

	a = (uint)addr;
	a -= KERNBASE;   /* convert to ARM physical address */
	a += 0x40000000; /* convert to VC address space */
	x = a & 0xfffffff0;
	y = x | (uint)(channel & 0xf);

	flush_dcache_all();

	while ((inw(MAILBOX_BASE+24) & 0x80000000) != 0);
	outw(MAILBOX_BASE+32, y);
}
