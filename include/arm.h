/*****************************************************************
*       arm.h
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/




#define PSR_MODE_USR		0x00000010 
#define PSR_MODE_FIQ		0x00000011
#define PSR_MODE_IRQ		0x00000012
#define PSR_MODE_SVC		0x00000013
#define PSR_MODE_MON		0x00000016
#define PSR_MODE_ABT		0x00000017
#define PSR_MODE_UND		0x0000001B
#define PSR_MODE_SYS		0x0000001F
#define PSR_MASK		0x0000001F
#define USER_MODE		0x0

#define PSR_DISABLE_IRQ		0x00000080
#define PSR_DISABLE_FIQ		0x00000040

#define PSR_V			0x10000000
#define PSR_C			0x20000000
#define PSR_Z			0x40000000
#define PSR_N			0x80000000


static inline uint
inw(uint addr)
{
    uint data;

    asm volatile("ldr %0,[%1]" : "=r"(data) : "r"(addr));
    return data;
}

static inline void
outw(uint addr, uint data)
{
    asm volatile("str %1,[%0]" : : "r"(addr), "r"(data));
}


// Layout of the trap frame built on the stack
// by exception.s, and passed to trap().
struct trapframe {
  uint sp; // user mode sp
  uint r0;
  uint r1; 
  uint r2;
  uint r3;
  uint r4;
  uint r5;
  uint r6;
  uint r7;
  uint r8;
  uint r9;
  uint r10;
  uint r11;
  uint r12;
  uint r13;
  uint r14;
  uint trapno;
  uint ifar; // Instruction Fault Address Register (IFAR)
  uint cpsr;
  uint spsr; // saved cpsr from the trapped/interrupted mode
  uint pc; // return address of the interrupted code
};

