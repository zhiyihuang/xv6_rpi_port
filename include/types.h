/*****************************************************************
*       types.h
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/


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
        uint     vtable[8];
} Vpage0;


/* ARM interrupt control registers */
typedef struct intctrlregs {
        uint  armpending;
        uint  gpupending[2];
        uint  fiqctrl;
        uint  gpuenable[2];
        uint  armenable;
        uint  gpudisable[2];
        uint  armdisable;
} intctrlregs;

struct framebufdescription {
	uint width; //width
	uint height; // height
	uint v_width; // virtual width
	uint v_height; // virtual height
	uint pitch; // GPU pitch
	uint depth; // bit depth
	uint x;
	uint y;
	uint fbp; //GPU framebuffer pointer
	uint fbs; // GPU framebuffer size
};

typedef struct framebufdescription FBI;
