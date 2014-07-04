/*****************************************************************
*       console.c
*       adapted from MIT xv6 by Zhiyi Huang, hzy@cs.otago.ac.nz
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

#define BACKSPACE 0x100

static int panicked = 0;

static struct {
  struct spinlock lock;
  int locking;
} cons;


uint cursor_x=0, cursor_y=0;
uint frameheight=768, framewidth=1024, framecolors=16;
uint fontheight=16, fontwidth=8;
FBI fbinfo __attribute__ ((aligned (16), nocommon));


extern u8 font[];
static uint gpucolour=0xffff;

void setgpucolour(u16 c)
{
    gpucolour = c;
}

uint initframebuf(uint width, uint height, uint depth)
{
    fbinfo.width = width;
    fbinfo.height = height;
    fbinfo.v_width = width;
    fbinfo.v_height = height;
    fbinfo.pitch = 0;
    fbinfo.depth = depth;
    fbinfo.x = 0;
    fbinfo.y = 0;
    fbinfo.fbp = 0;
    fbinfo.fbs = 0;
    writemailbox((uint *)&fbinfo, 1);
    return readmailbox(1);
}

#define INPUT_BUF 128
struct {
  struct spinlock lock;
  char buf[INPUT_BUF];
  uint r;  // Read index
  uint w;  // Write index
  uint e;  // Edit index
} input;

int
consolewrite(struct inode *ip, char *buf, int n)
{
  int i;

//  cprintf("consolewrite is called: ip=%x buf=%x, n=%x", ip, buf, n);
  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++){
    gpuputc(buf[i] & 0xff);
    uartputc(buf[i] & 0xff);
  }
  release(&cons.lock);
  ilock(ip);

  return n;
}


void drawpixel(uint x, uint y)
{
    u16 *addr;

    if(x >= framewidth || y >= frameheight) return;
    addr = (u16 *) fbinfo.fbp;
//    addr = (u16 *) ((FBI *)FrameBufferInfo)->fbp;
    addr += y*1024 + x;
    *addr = gpucolour;
    return;
}


void drawcursor(uint x, uint y)
{
u8 row, bit;

    for(row=0; row<15; row++)
        for(bit=0; bit<8; bit++)
            drawpixel(x+bit, y+row);
}

void drawcharacter(u8 c, uint x, uint y)
{
u8 *faddr;
u8 row, bit, bits;
uint tv;

    if(c > 127) return;
    tv = ((uint)c) << 4;
    faddr = font + tv;
    for(row=0; row<15; row++){
        bits = *(faddr+row);
        for(bit=0; bit<8; bit++){
            if((bits>>bit) & 1) drawpixel(x+bit, y+row);
        }
    }

}

//static void
void
gpuputc(uint c)
{
    if(c=='\n'){
	cursor_x = 0;
	cursor_y += fontheight;
	if(cursor_y >= frameheight) {
		memmove((u8 *)fbinfo.fbp, (u8 *)fbinfo.fbp+framewidth*fontheight*2, (frameheight - fontheight)*framewidth*2);
		cursor_y = frameheight - fontheight;
		setgpucolour(0);
		while(cursor_x < framewidth) {
		    drawcursor(cursor_x, cursor_y);
		    cursor_x = cursor_x + fontwidth;
		}
		setgpucolour(0xffff);
		cursor_x = 0;
	}
    } else if(c == BACKSPACE) {
	if (cursor_x > 0) {
		cursor_x -= fontwidth;
		setgpucolour(0);
		drawcursor(cursor_x, cursor_y);
		setgpucolour(0xffff);
	}
    } else {
	setgpucolour(0);
	drawcursor(cursor_x, cursor_y);
	setgpucolour(0xffff);
	if(c!=' ') drawcharacter(c, cursor_x, cursor_y);
	cursor_x = cursor_x + fontwidth;
	if(cursor_x >= framewidth) {
	    cursor_x = 0;
	    cursor_y += fontheight;
	    if(cursor_y >= frameheight) {
		memmove((u8 *)fbinfo.fbp, (u8 *)fbinfo.fbp+framewidth*fontheight*2, (frameheight - fontheight)*framewidth*2);
		cursor_y = frameheight - fontheight;
		setgpucolour(0);
		while(cursor_x < framewidth) {
		    drawcursor(cursor_x, cursor_y);
		    cursor_x = cursor_x + fontwidth;
		}
		setgpucolour(0xffff);
		cursor_x = 0;
	    }
	}
    }

}


static void
printint(int xx, int base, int sign)
{
  static u8 digits[] = "0123456789abcdef";
  u8 buf[16];
  int i;
  uint x, y, b;

  if(sign && (sign = xx < 0))
    x = -xx;
  else
    x = xx;

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0){
    gpuputc(buf[i]);
    uartputc(buf[i]);
  }
}


// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
  int i, c;
  int locking;
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);

  if (fmt == 0)
    panic("null fmt");

  argp = (uint *)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    if(c != '%'){
        gpuputc(c);
	uartputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++){
        gpuputc(*s);
	uartputc(*s);
      }
      break;
    case '%':
	gpuputc('%');
	uartputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
	gpuputc('%');
	uartputc('%');
	gpuputc(c);
	uartputc(c);
      break;
    }
  }
  if(locking)
    release(&cons.lock);
}

void
panic(char *s)
{
  int i;
  uint pcs[10];

  cprintf("cpu%d: panic: ", 0);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU

  for(;;)
    ;
}

#define C(x)  ((x)-'@')  // Control-x

void
consputc(int c)
{
  if(panicked){
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    gpuputc('\b'); gpuputc(' '); gpuputc('\b');
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else if(c == C('D')) {
    gpuputc('^'); gpuputc('D');
    uartputc('^'); uartputc('D');
  } else {
    gpuputc(c);
    uartputc(c);
  }
}


void
consoleintr(int (*getc)(void))
{
  int c;

  acquire(&input.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
	if(c == 0xa) break;
        c = (c == 0xd) ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
          wakeup(&input.r);
        }
      }
      break;
    }
  }
  release(&input.lock);
}

int
consoleread(struct inode *ip, char *dst, int n)
{
  uint target;
  int c;

//cprintf("inside consoleread\n");
  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
      if(curr_proc->killed){
        release(&input.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &input.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&input.lock);
  ilock(ip);

  return target - n;
}

void consoleinit(void)
{
uint fbinfoaddr;

  fbinfoaddr = initframebuf(framewidth, frameheight, framecolors);
  if(fbinfoaddr != 0) NotOkLoop();

  initlock(&cons.lock, "console");
  memset(&input, 0, sizeof(input));
  initlock(&input.lock, "input");

  memset(devsw, 0, sizeof(struct devsw)*NDEV);
  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;
  panicked = 0; // must initialize in code since the compiler does not

  cursor_x=cursor_y=0;
}

