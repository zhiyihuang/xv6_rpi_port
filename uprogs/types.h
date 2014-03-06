typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned long long u64;

typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;
typedef uint pde_t;
typedef uint pte_t;


/* trap vectors layout at virtual 
address HVECTORS (and KZERO(0x80000000), doubled mapped).*/
typedef struct Vpage0 {
        void    (*vectors[8])(void);
        u32     vtable[8];
} Vpage0;


/* interrupt control registers */
typedef struct Intregs {
        u32  ARMpending;
        u32  GPUpending[2];
        u32  FIQctl;
        u32  GPUenable[2];
        u32  ARMenable;
        u32  GPUdisable[2];
        u32  ARMdisable;
} Intregs;


typedef struct Mach
{
        int     machno;                 /* physical id of processor */

        int     flushmmu;               /* flush current proc mmu state */

        /* stats */
        int     tlbfault;
        int     tlbpurge;
        int     pfault;
        int     cs;
        int     syscall;
        int     load;
        int     intr;
        int     lastintr;
        int     ilockdepth;


        int     cpumhz;
        /* vfp2 or vfp3 fpu */
        int     havefp;
        int     havefpvalid;
        int     fpon;
        int     fpconfiged;
        int     fpnregs;
        int     fppid;                  /* pid of last fault */
        int     fpcnt;                  /* how many consecutive at that addr */

        /* save areas for exceptions, hold R0-R4 */
        u32  sfiq[5];
        u32  sirq[5];
        u32  sund[5];
        u32  sabt[5];
        u32  smon[5];                /* probably not needed */
        u32  ssys[5];

        int     stack[1];
} Mach;


struct framebufferdescription {
	u32 width; //width
	u32 height; // height
	u32 v_width; // virtual width
	u32 v_height; // virtual height
	u32 pitch; // GPU pitch
	u32 depth; // bit depth
	u32 x;
	u32 y;
	u32 fbp; //GPU framebuffer pointer
	u32 fbs; // GPU framebuffer size
};

typedef struct framebufferdescription FBI;
