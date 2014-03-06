/*****************************************************************
*	entry.s
*	by Zhiyi Huang, hzy@cs.otago.ac.nz
*	University of Otago
*
********************************************************************/

.section .init
.globl _start
_start:

b entry  /* branch to the actual entry code */

.section .data

.align 4
.globl font
font:
	.incbin "font1.bin"

.align 4
.global _binary_initcode_start
_binary_initcode_start:
	.incbin "initcode"
.global _binary_initcode_end
_binary_initcode_end:

.align 4
.global _binary_fs_img_start
_binary_fs_img_start:
        .incbin "fs.img"
.global _binary_fs_img_end
_binary_fs_img_end:


.section .text

entry:

/* interrupts disabled, SVC mode by setting PSR_DISABLE_IRQ|PSR_DISABLE_FIQ|PSR_MODE_SVC */
mov r1, #0x00000080 /* PSR_DISABLE_IRQ */
orr r1, #0x00000040 /* PSR_DISABLE_FIQ */
orr r1, #0x00000013 /* PSR_MODE_SVC */
msr cpsr, r1

mov sp, #0x3000 
bl mmuinit0

/* switch SP and PC into KZERO space */
mov r1, sp
add r1, #0x80000000
mov sp, r1

ldr r1, =_pagingstart
bx r1

.global _pagingstart
_pagingstart:
bl cmain  /* call C functions now */
bl NotOkLoop

.global dsb_barrier
dsb_barrier:
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4
	bx lr
.global flush_dcache_all
flush_dcache_all:
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4 /* dsb */
	mov r0, #0
	mcr p15, 0, r0, c7, c14, 0 /* invalidate d-cache */
	bx lr
.global flush_idcache
flush_idcache:
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4 /* dsb */
	mov r0, #0
	mcr p15, 0, r0, c7, c14, 0 /* invalidate d-cache */
	mov r0, #0
	mcr p15, 0, r0, c7, c5, 0 /* invalidate i-cache */
	bx lr
.global flush_tlb
flush_tlb:
	mov r0, #0
	mcr p15, 0, r0, c8, c7, 0
	mcr p15, 0, r0, c7, c10, 4
	bx lr
.global flush_dcache /* flush a range of data cache flush_dcache(va1, va2) */
flush_dcache:
	mcrr p15, 0, r0, r1, c14
	bx lr
.global set_pgtbase /* set the page table base set_pgtbase(base) */
set_pgtbase:
	mcr p15, 0, r0, c2, c0
	bx lr

.global getsystemtime
getsystemtime:
	ldr r0, =0xFE003004 /* addr of the time-stamp lower 32 bits */
	ldrd r0, r1, [r0]
	bx lr


