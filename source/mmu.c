/*****************************************************************
*       mmu.c
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/


#include "types.h"
#include "defs.h"
#include "memlayout.h"
#include "mmu.h"

void mmuinit0(void)
{
        pde_t *l1;
	pte_t *l2;
        uint pa, va, *p;

	// diable mmu
	// use inline assembly here as there is a limit on 
	// branch distance after mmu is disabled
	asm volatile("mrc p15, 0, r1, c1, c0, 0\n\t"
		"bic r1,r1,#0x00000004\n\t"
		"bic r1,r1,#0x00001000\n\t"
		"bic r1,r1,#0x00000800\n\t"
		"bic r1,r1,#0x00000001\n\t"
		"mcr p15, 0, r1, c1, c0, 0\n\t"
		"mov r0, #0\n\t"
		"mcr p15, 0, r0, c7, c7, 0\n\t"
		"mcr p15, 0, r0, c8, c7, 0\n\t"
		::: "r0", "r1", "cc", "memory");


	for(p=(uint *)0x2000; p<(uint *)0x8000; p++) *p = 0;

        l1 = (pde_t *) K_PDX_BASE;
        l2 = (pte_t *) K_PTX_BASE;

        // map all of ram at KERNBASE
	va = KERNBASE;
	for(pa = PA_START; pa < PA_START+RAMSIZE; pa += MBYTE){
                l1[PDX(va)] = pa|DOMAIN0|PDX_AP(K_RW)|SECTION|CACHED|BUFFERED;
                va += MBYTE;
        }

        // identity map first MB of ram so mmu can be enabled
        l1[PDX(PA_START)] = PA_START|DOMAIN0|PDX_AP(K_RW)|SECTION|CACHED|BUFFERED;

        // map IO region
        va = DEVSPACE;
        for(pa = PHYSIO; pa < PHYSIO+IOSIZE; pa += MBYTE){
                l1[PDX(va)] = pa|DOMAIN0|PDX_AP(K_RW)|SECTION;
                va += MBYTE;
        }

	// map GPU memory
	va = GPUMEMBASE;
	for(pa = GPUMEMBASE; pa < (uint)GPUMEMBASE+(uint)GPUMEMSIZE; pa += MBYTE){
		l1[PDX(va)] = pa|DOMAIN0|PDX_AP(K_RW)|SECTION;
		va += MBYTE;
	}

        // double map exception vectors at top of virtual memory
        va = HVECTORS;
        l1[PDX(va)] = (uint)l2|DOMAIN0|COARSE;
        l2[PTX(va)] = PA_START|PTX_AP(K_RW)|SMALL;


	asm volatile("mov r1, #1\n\t"
                "mcr p15, 0, r1, c3, c0\n\t"
                "mov r1, #0x4000\n\t"
                "mcr p15, 0, r1, c2, c0\n\t"
                "mrc p15, 0, r0, c1, c0, 0\n\t"
                "mov r1, #0x00002000\n\t"
                "orr r1, #0x00000004\n\t"
                "orr r1, #0x00001000\n\t"
                "orr r1, #0x00000001\n\t"
		"orr r0, r1\n\t"
		"mcr p15, 0, r0, c1, c0, 0\n\t"
		"mov r1, #1\n\t"
		"mcr p15, 0, r1, c15, c12, 0\n\t"
                ::: "r0", "r1", "cc", "memory");

}

void
mmuinit1(void)
{
        pde_t *l1;
	uint va1, va2;

        l1 = (pde_t*)(K_PDX_BASE);

        // undo identity map of first MB of ram
        l1[PDX(PA_START)] = 0;

	// drain write buffer; writeback data cache range [va, va+n]
	va1 = (uint)&l1[PDX(PA_START)];
	va2 = va1 + sizeof(pde_t);
	va1 = va1 & ~((uint)CACHELINESIZE-1);
	va2 = va2 & ~((uint)CACHELINESIZE-1);
	flush_dcache(va1, va2);

        // invalidate TLB; DSB barrier used
	flush_tlb();

}

