
_forktest:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	e92d4800 	push	{fp, lr}
   4:	e28db004 	add	fp, sp, #4
  forktest();
   8:	eb00000f 	bl	4c <forktest>
  exit();
   c:	eb0000e3 	bl	3a0 <exit>

00000010 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
  10:	e92d000e 	push	{r1, r2, r3}
  14:	e92d4838 	push	{r3, r4, r5, fp, lr}
  18:	e28db010 	add	fp, sp, #16
  1c:	e1a05000 	mov	r5, r0
  20:	e59b4004 	ldr	r4, [fp, #4]
  write(fd, s, strlen(s));
  24:	e1a00004 	mov	r0, r4
  28:	eb000051 	bl	174 <strlen>
  2c:	e1a01004 	mov	r1, r4
  30:	e1a02000 	mov	r2, r0
  34:	e1a00005 	mov	r0, r5
  38:	eb00010c 	bl	470 <write>
}
  3c:	e24bd010 	sub	sp, fp, #16
  40:	e8bd4838 	pop	{r3, r4, r5, fp, lr}
  44:	e28dd00c 	add	sp, sp, #12
  48:	e12fff1e 	bx	lr

0000004c <forktest>:

void
forktest(void)
{
  4c:	e92d4818 	push	{r3, r4, fp, lr}
  int n, pid;

  printf(1, "fork test\n");
  50:	e3a00001 	mov	r0, #1
  write(fd, s, strlen(s));
}

void
forktest(void)
{
  54:	e28db00c 	add	fp, sp, #12
  int n, pid;

  printf(1, "fork test\n");
  58:	e59f108c 	ldr	r1, [pc, #140]	; ec <forktest+0xa0>
  5c:	ebffffeb 	bl	10 <printf>

  for(n=0; n<N; n++){
  60:	e3a04000 	mov	r4, #0
  64:	ea000003 	b	78 <forktest+0x2c>
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
  68:	0a00001b 	beq	dc <forktest+0x90>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  6c:	e2844001 	add	r4, r4, #1
  70:	e3540ffa 	cmp	r4, #1000	; 0x3e8
  74:	0a000010 	beq	bc <forktest+0x70>
    pid = fork();
  78:	eb0000bb 	bl	36c <fork>
    if(pid < 0)
  7c:	e3500000 	cmp	r0, #0
  80:	aafffff8 	bge	68 <forktest+0x1c>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
  84:	e3540000 	cmp	r4, #0
  88:	0a000004 	beq	a0 <forktest+0x54>
    if(wait() < 0){
  8c:	eb0000d0 	bl	3d4 <wait>
  90:	e3500000 	cmp	r0, #0
  94:	ba00000d 	blt	d0 <forktest+0x84>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
  98:	e2544001 	subs	r4, r4, #1
  9c:	1afffffa 	bne	8c <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
  a0:	eb0000cb 	bl	3d4 <wait>
  a4:	e3700001 	cmn	r0, #1
    printf(1, "wait got too many\n");
  a8:	e3a00001 	mov	r0, #1
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
  ac:	1a00000b 	bne	e0 <forktest+0x94>
    printf(1, "wait got too many\n");
    exit();
  }
  
  printf(1, "fork test OK\n");
  b0:	e59f1038 	ldr	r1, [pc, #56]	; f0 <forktest+0xa4>
}
  b4:	e8bd4818 	pop	{r3, r4, fp, lr}
  if(wait() != -1){
    printf(1, "wait got too many\n");
    exit();
  }
  
  printf(1, "fork test OK\n");
  b8:	eaffffd4 	b	10 <printf>
    if(pid == 0)
      exit();
  }
  
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
  bc:	e3a00001 	mov	r0, #1
  c0:	e59f102c 	ldr	r1, [pc, #44]	; f4 <forktest+0xa8>
  c4:	e1a02004 	mov	r2, r4
  c8:	ebffffd0 	bl	10 <printf>
    exit();
  cc:	eb0000b3 	bl	3a0 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
  d0:	e3a00001 	mov	r0, #1
  d4:	e59f101c 	ldr	r1, [pc, #28]	; f8 <forktest+0xac>
  d8:	ebffffcc 	bl	10 <printf>
      exit();
  dc:	eb0000af 	bl	3a0 <exit>
    }
  }
  
  if(wait() != -1){
    printf(1, "wait got too many\n");
  e0:	e59f1014 	ldr	r1, [pc, #20]	; fc <forktest+0xb0>
  e4:	ebffffc9 	bl	10 <printf>
    exit();
  e8:	eb0000ac 	bl	3a0 <exit>
  ec:	000007b0 	.word	0x000007b0
  f0:	000007e4 	.word	0x000007e4
  f4:	000007f4 	.word	0x000007f4
  f8:	000007bc 	.word	0x000007bc
  fc:	000007d0 	.word	0x000007d0

00000100 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 104:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 108:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 10c:	e4d13001 	ldrb	r3, [r1], #1
 110:	e3530000 	cmp	r3, #0
 114:	e4c23001 	strb	r3, [r2], #1
 118:	1afffffb 	bne	10c <strcpy+0xc>
    ;
  return os;
}
 11c:	e28bd000 	add	sp, fp, #0
 120:	e8bd0800 	pop	{fp}
 124:	e12fff1e 	bx	lr

00000128 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 128:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 12c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 130:	e5d03000 	ldrb	r3, [r0]
 134:	e5d12000 	ldrb	r2, [r1]
 138:	e3530000 	cmp	r3, #0
 13c:	1a000004 	bne	154 <strcmp+0x2c>
 140:	ea000005 	b	15c <strcmp+0x34>
 144:	e5f03001 	ldrb	r3, [r0, #1]!
 148:	e3530000 	cmp	r3, #0
 14c:	0a000006 	beq	16c <strcmp+0x44>
 150:	e5f12001 	ldrb	r2, [r1, #1]!
 154:	e1530002 	cmp	r3, r2
 158:	0afffff9 	beq	144 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 15c:	e0620003 	rsb	r0, r2, r3
 160:	e28bd000 	add	sp, fp, #0
 164:	e8bd0800 	pop	{fp}
 168:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 16c:	e5d12001 	ldrb	r2, [r1, #1]
 170:	eafffff9 	b	15c <strcmp+0x34>

00000174 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 174:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 178:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 17c:	e5d03000 	ldrb	r3, [r0]
 180:	e3530000 	cmp	r3, #0
 184:	01a00003 	moveq	r0, r3
 188:	0a000006 	beq	1a8 <strlen+0x34>
 18c:	e1a02000 	mov	r2, r0
 190:	e3a03000 	mov	r3, #0
 194:	e5f21001 	ldrb	r1, [r2, #1]!
 198:	e2833001 	add	r3, r3, #1
 19c:	e1a00003 	mov	r0, r3
 1a0:	e3510000 	cmp	r1, #0
 1a4:	1afffffa 	bne	194 <strlen+0x20>
    ;
  return n;
}
 1a8:	e28bd000 	add	sp, fp, #0
 1ac:	e8bd0800 	pop	{fp}
 1b0:	e12fff1e 	bx	lr

000001b4 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1b4:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 1b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1bc:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1c0:	0a000006 	beq	1e0 <memset+0x2c>
 1c4:	e6ef1071 	uxtb	r1, r1
 1c8:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 1cc:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1d0:	e2533001 	subs	r3, r3, #1
 1d4:	e4cc1001 	strb	r1, [ip], #1
 1d8:	1afffffc 	bne	1d0 <memset+0x1c>
 1dc:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 1e0:	e28bd000 	add	sp, fp, #0
 1e4:	e8bd0800 	pop	{fp}
 1e8:	e12fff1e 	bx	lr

000001ec <strchr>:

char*
strchr(const char *s, char c)
{
 1ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1f0:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1f4:	e5d03000 	ldrb	r3, [r0]
 1f8:	e3530000 	cmp	r3, #0
 1fc:	1a000004 	bne	214 <strchr+0x28>
 200:	ea000008 	b	228 <strchr+0x3c>
 204:	e5d03001 	ldrb	r3, [r0, #1]
 208:	e2800001 	add	r0, r0, #1
 20c:	e3530000 	cmp	r3, #0
 210:	0a000004 	beq	228 <strchr+0x3c>
    if(*s == c)
 214:	e1530001 	cmp	r3, r1
 218:	1afffff9 	bne	204 <strchr+0x18>
      return (char*)s;
  return 0;
}
 21c:	e28bd000 	add	sp, fp, #0
 220:	e8bd0800 	pop	{fp}
 224:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 228:	e1a00003 	mov	r0, r3
 22c:	eafffffa 	b	21c <strchr+0x30>

00000230 <gets>:
}

char*
gets(char *buf, int max)
{
 230:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 234:	e28db018 	add	fp, sp, #24
 238:	e24dd00c 	sub	sp, sp, #12
 23c:	e1a08000 	mov	r8, r0
 240:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 244:	e1a06000 	mov	r6, r0
 248:	e3a05000 	mov	r5, #0
 24c:	ea000008 	b	274 <gets+0x44>
    cc = read(0, &c, 1);
 250:	eb000079 	bl	43c <read>
    if(cc < 1)
 254:	e3500000 	cmp	r0, #0
 258:	da00000b 	ble	28c <gets+0x5c>
      break;
    buf[i++] = c;
 25c:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 260:	e1a05004 	mov	r5, r4
 264:	e353000a 	cmp	r3, #10
 268:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 26c:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 270:	0a00000a 	beq	2a0 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 274:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 278:	e0854002 	add	r4, r5, r2
 27c:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 280:	e3a00000 	mov	r0, #0
 284:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 288:	bafffff0 	blt	250 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 28c:	e3a03000 	mov	r3, #0
 290:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 294:	e1a00008 	mov	r0, r8
 298:	e24bd018 	sub	sp, fp, #24
 29c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a0:	e1a05004 	mov	r5, r4
 2a4:	eafffff8 	b	28c <gets+0x5c>

000002a8 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 2a8:	e92d4830 	push	{r4, r5, fp, lr}
 2ac:	e1a05001 	mov	r5, r1
 2b0:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b4:	e3a01000 	mov	r1, #0
 2b8:	eb0000a0 	bl	540 <open>
  if(fd < 0)
 2bc:	e2504000 	subs	r4, r0, #0
    return -1;
 2c0:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 2c4:	ba000004 	blt	2dc <stat+0x34>
    return -1;
  r = fstat(fd, st);
 2c8:	e1a01005 	mov	r1, r5
 2cc:	eb0000c2 	bl	5dc <fstat>
 2d0:	e1a05000 	mov	r5, r0
  close(fd);
 2d4:	e1a00004 	mov	r0, r4
 2d8:	eb000071 	bl	4a4 <close>
  return r;
}
 2dc:	e1a00005 	mov	r0, r5
 2e0:	e8bd8830 	pop	{r4, r5, fp, pc}

000002e4 <atoi>:

int
atoi(const char *s)
{
 2e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2e8:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ec:	e5d03000 	ldrb	r3, [r0]
 2f0:	e2432030 	sub	r2, r3, #48	; 0x30
 2f4:	e6ef2072 	uxtb	r2, r2
 2f8:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 2fc:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 300:	8a000009 	bhi	32c <atoi+0x48>
 304:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 308:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 30c:	e0800100 	add	r0, r0, r0, lsl #2
 310:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 314:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 318:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 31c:	e2431030 	sub	r1, r3, #48	; 0x30
 320:	e6ef1071 	uxtb	r1, r1
 324:	e3510009 	cmp	r1, #9
 328:	9afffff7 	bls	30c <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 32c:	e28bd000 	add	sp, fp, #0
 330:	e8bd0800 	pop	{fp}
 334:	e12fff1e 	bx	lr

00000338 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 338:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 33c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 340:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 344:	da000005 	ble	360 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 348:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 34c:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 350:	e4d1c001 	ldrb	ip, [r1], #1
 354:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 358:	e1530002 	cmp	r3, r2
 35c:	1afffffb 	bne	350 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 360:	e28bd000 	add	sp, fp, #0
 364:	e8bd0800 	pop	{fp}
 368:	e12fff1e 	bx	lr

0000036c <fork>:
 36c:	e92d4000 	push	{lr}
 370:	e92d0008 	push	{r3}
 374:	e92d0004 	push	{r2}
 378:	e92d0002 	push	{r1}
 37c:	e92d0001 	push	{r0}
 380:	e3a00001 	mov	r0, #1
 384:	ef000040 	svc	0x00000040
 388:	e8bd0002 	pop	{r1}
 38c:	e8bd0002 	pop	{r1}
 390:	e8bd0004 	pop	{r2}
 394:	e8bd0008 	pop	{r3}
 398:	e8bd4000 	pop	{lr}
 39c:	e12fff1e 	bx	lr

000003a0 <exit>:
 3a0:	e92d4000 	push	{lr}
 3a4:	e92d0008 	push	{r3}
 3a8:	e92d0004 	push	{r2}
 3ac:	e92d0002 	push	{r1}
 3b0:	e92d0001 	push	{r0}
 3b4:	e3a00002 	mov	r0, #2
 3b8:	ef000040 	svc	0x00000040
 3bc:	e8bd0002 	pop	{r1}
 3c0:	e8bd0002 	pop	{r1}
 3c4:	e8bd0004 	pop	{r2}
 3c8:	e8bd0008 	pop	{r3}
 3cc:	e8bd4000 	pop	{lr}
 3d0:	e12fff1e 	bx	lr

000003d4 <wait>:
 3d4:	e92d4000 	push	{lr}
 3d8:	e92d0008 	push	{r3}
 3dc:	e92d0004 	push	{r2}
 3e0:	e92d0002 	push	{r1}
 3e4:	e92d0001 	push	{r0}
 3e8:	e3a00003 	mov	r0, #3
 3ec:	ef000040 	svc	0x00000040
 3f0:	e8bd0002 	pop	{r1}
 3f4:	e8bd0002 	pop	{r1}
 3f8:	e8bd0004 	pop	{r2}
 3fc:	e8bd0008 	pop	{r3}
 400:	e8bd4000 	pop	{lr}
 404:	e12fff1e 	bx	lr

00000408 <pipe>:
 408:	e92d4000 	push	{lr}
 40c:	e92d0008 	push	{r3}
 410:	e92d0004 	push	{r2}
 414:	e92d0002 	push	{r1}
 418:	e92d0001 	push	{r0}
 41c:	e3a00004 	mov	r0, #4
 420:	ef000040 	svc	0x00000040
 424:	e8bd0002 	pop	{r1}
 428:	e8bd0002 	pop	{r1}
 42c:	e8bd0004 	pop	{r2}
 430:	e8bd0008 	pop	{r3}
 434:	e8bd4000 	pop	{lr}
 438:	e12fff1e 	bx	lr

0000043c <read>:
 43c:	e92d4000 	push	{lr}
 440:	e92d0008 	push	{r3}
 444:	e92d0004 	push	{r2}
 448:	e92d0002 	push	{r1}
 44c:	e92d0001 	push	{r0}
 450:	e3a00005 	mov	r0, #5
 454:	ef000040 	svc	0x00000040
 458:	e8bd0002 	pop	{r1}
 45c:	e8bd0002 	pop	{r1}
 460:	e8bd0004 	pop	{r2}
 464:	e8bd0008 	pop	{r3}
 468:	e8bd4000 	pop	{lr}
 46c:	e12fff1e 	bx	lr

00000470 <write>:
 470:	e92d4000 	push	{lr}
 474:	e92d0008 	push	{r3}
 478:	e92d0004 	push	{r2}
 47c:	e92d0002 	push	{r1}
 480:	e92d0001 	push	{r0}
 484:	e3a00010 	mov	r0, #16
 488:	ef000040 	svc	0x00000040
 48c:	e8bd0002 	pop	{r1}
 490:	e8bd0002 	pop	{r1}
 494:	e8bd0004 	pop	{r2}
 498:	e8bd0008 	pop	{r3}
 49c:	e8bd4000 	pop	{lr}
 4a0:	e12fff1e 	bx	lr

000004a4 <close>:
 4a4:	e92d4000 	push	{lr}
 4a8:	e92d0008 	push	{r3}
 4ac:	e92d0004 	push	{r2}
 4b0:	e92d0002 	push	{r1}
 4b4:	e92d0001 	push	{r0}
 4b8:	e3a00015 	mov	r0, #21
 4bc:	ef000040 	svc	0x00000040
 4c0:	e8bd0002 	pop	{r1}
 4c4:	e8bd0002 	pop	{r1}
 4c8:	e8bd0004 	pop	{r2}
 4cc:	e8bd0008 	pop	{r3}
 4d0:	e8bd4000 	pop	{lr}
 4d4:	e12fff1e 	bx	lr

000004d8 <kill>:
 4d8:	e92d4000 	push	{lr}
 4dc:	e92d0008 	push	{r3}
 4e0:	e92d0004 	push	{r2}
 4e4:	e92d0002 	push	{r1}
 4e8:	e92d0001 	push	{r0}
 4ec:	e3a00006 	mov	r0, #6
 4f0:	ef000040 	svc	0x00000040
 4f4:	e8bd0002 	pop	{r1}
 4f8:	e8bd0002 	pop	{r1}
 4fc:	e8bd0004 	pop	{r2}
 500:	e8bd0008 	pop	{r3}
 504:	e8bd4000 	pop	{lr}
 508:	e12fff1e 	bx	lr

0000050c <exec>:
 50c:	e92d4000 	push	{lr}
 510:	e92d0008 	push	{r3}
 514:	e92d0004 	push	{r2}
 518:	e92d0002 	push	{r1}
 51c:	e92d0001 	push	{r0}
 520:	e3a00007 	mov	r0, #7
 524:	ef000040 	svc	0x00000040
 528:	e8bd0002 	pop	{r1}
 52c:	e8bd0002 	pop	{r1}
 530:	e8bd0004 	pop	{r2}
 534:	e8bd0008 	pop	{r3}
 538:	e8bd4000 	pop	{lr}
 53c:	e12fff1e 	bx	lr

00000540 <open>:
 540:	e92d4000 	push	{lr}
 544:	e92d0008 	push	{r3}
 548:	e92d0004 	push	{r2}
 54c:	e92d0002 	push	{r1}
 550:	e92d0001 	push	{r0}
 554:	e3a0000f 	mov	r0, #15
 558:	ef000040 	svc	0x00000040
 55c:	e8bd0002 	pop	{r1}
 560:	e8bd0002 	pop	{r1}
 564:	e8bd0004 	pop	{r2}
 568:	e8bd0008 	pop	{r3}
 56c:	e8bd4000 	pop	{lr}
 570:	e12fff1e 	bx	lr

00000574 <mknod>:
 574:	e92d4000 	push	{lr}
 578:	e92d0008 	push	{r3}
 57c:	e92d0004 	push	{r2}
 580:	e92d0002 	push	{r1}
 584:	e92d0001 	push	{r0}
 588:	e3a00011 	mov	r0, #17
 58c:	ef000040 	svc	0x00000040
 590:	e8bd0002 	pop	{r1}
 594:	e8bd0002 	pop	{r1}
 598:	e8bd0004 	pop	{r2}
 59c:	e8bd0008 	pop	{r3}
 5a0:	e8bd4000 	pop	{lr}
 5a4:	e12fff1e 	bx	lr

000005a8 <unlink>:
 5a8:	e92d4000 	push	{lr}
 5ac:	e92d0008 	push	{r3}
 5b0:	e92d0004 	push	{r2}
 5b4:	e92d0002 	push	{r1}
 5b8:	e92d0001 	push	{r0}
 5bc:	e3a00012 	mov	r0, #18
 5c0:	ef000040 	svc	0x00000040
 5c4:	e8bd0002 	pop	{r1}
 5c8:	e8bd0002 	pop	{r1}
 5cc:	e8bd0004 	pop	{r2}
 5d0:	e8bd0008 	pop	{r3}
 5d4:	e8bd4000 	pop	{lr}
 5d8:	e12fff1e 	bx	lr

000005dc <fstat>:
 5dc:	e92d4000 	push	{lr}
 5e0:	e92d0008 	push	{r3}
 5e4:	e92d0004 	push	{r2}
 5e8:	e92d0002 	push	{r1}
 5ec:	e92d0001 	push	{r0}
 5f0:	e3a00008 	mov	r0, #8
 5f4:	ef000040 	svc	0x00000040
 5f8:	e8bd0002 	pop	{r1}
 5fc:	e8bd0002 	pop	{r1}
 600:	e8bd0004 	pop	{r2}
 604:	e8bd0008 	pop	{r3}
 608:	e8bd4000 	pop	{lr}
 60c:	e12fff1e 	bx	lr

00000610 <link>:
 610:	e92d4000 	push	{lr}
 614:	e92d0008 	push	{r3}
 618:	e92d0004 	push	{r2}
 61c:	e92d0002 	push	{r1}
 620:	e92d0001 	push	{r0}
 624:	e3a00013 	mov	r0, #19
 628:	ef000040 	svc	0x00000040
 62c:	e8bd0002 	pop	{r1}
 630:	e8bd0002 	pop	{r1}
 634:	e8bd0004 	pop	{r2}
 638:	e8bd0008 	pop	{r3}
 63c:	e8bd4000 	pop	{lr}
 640:	e12fff1e 	bx	lr

00000644 <mkdir>:
 644:	e92d4000 	push	{lr}
 648:	e92d0008 	push	{r3}
 64c:	e92d0004 	push	{r2}
 650:	e92d0002 	push	{r1}
 654:	e92d0001 	push	{r0}
 658:	e3a00014 	mov	r0, #20
 65c:	ef000040 	svc	0x00000040
 660:	e8bd0002 	pop	{r1}
 664:	e8bd0002 	pop	{r1}
 668:	e8bd0004 	pop	{r2}
 66c:	e8bd0008 	pop	{r3}
 670:	e8bd4000 	pop	{lr}
 674:	e12fff1e 	bx	lr

00000678 <chdir>:
 678:	e92d4000 	push	{lr}
 67c:	e92d0008 	push	{r3}
 680:	e92d0004 	push	{r2}
 684:	e92d0002 	push	{r1}
 688:	e92d0001 	push	{r0}
 68c:	e3a00009 	mov	r0, #9
 690:	ef000040 	svc	0x00000040
 694:	e8bd0002 	pop	{r1}
 698:	e8bd0002 	pop	{r1}
 69c:	e8bd0004 	pop	{r2}
 6a0:	e8bd0008 	pop	{r3}
 6a4:	e8bd4000 	pop	{lr}
 6a8:	e12fff1e 	bx	lr

000006ac <dup>:
 6ac:	e92d4000 	push	{lr}
 6b0:	e92d0008 	push	{r3}
 6b4:	e92d0004 	push	{r2}
 6b8:	e92d0002 	push	{r1}
 6bc:	e92d0001 	push	{r0}
 6c0:	e3a0000a 	mov	r0, #10
 6c4:	ef000040 	svc	0x00000040
 6c8:	e8bd0002 	pop	{r1}
 6cc:	e8bd0002 	pop	{r1}
 6d0:	e8bd0004 	pop	{r2}
 6d4:	e8bd0008 	pop	{r3}
 6d8:	e8bd4000 	pop	{lr}
 6dc:	e12fff1e 	bx	lr

000006e0 <getpid>:
 6e0:	e92d4000 	push	{lr}
 6e4:	e92d0008 	push	{r3}
 6e8:	e92d0004 	push	{r2}
 6ec:	e92d0002 	push	{r1}
 6f0:	e92d0001 	push	{r0}
 6f4:	e3a0000b 	mov	r0, #11
 6f8:	ef000040 	svc	0x00000040
 6fc:	e8bd0002 	pop	{r1}
 700:	e8bd0002 	pop	{r1}
 704:	e8bd0004 	pop	{r2}
 708:	e8bd0008 	pop	{r3}
 70c:	e8bd4000 	pop	{lr}
 710:	e12fff1e 	bx	lr

00000714 <sbrk>:
 714:	e92d4000 	push	{lr}
 718:	e92d0008 	push	{r3}
 71c:	e92d0004 	push	{r2}
 720:	e92d0002 	push	{r1}
 724:	e92d0001 	push	{r0}
 728:	e3a0000c 	mov	r0, #12
 72c:	ef000040 	svc	0x00000040
 730:	e8bd0002 	pop	{r1}
 734:	e8bd0002 	pop	{r1}
 738:	e8bd0004 	pop	{r2}
 73c:	e8bd0008 	pop	{r3}
 740:	e8bd4000 	pop	{lr}
 744:	e12fff1e 	bx	lr

00000748 <sleep>:
 748:	e92d4000 	push	{lr}
 74c:	e92d0008 	push	{r3}
 750:	e92d0004 	push	{r2}
 754:	e92d0002 	push	{r1}
 758:	e92d0001 	push	{r0}
 75c:	e3a0000d 	mov	r0, #13
 760:	ef000040 	svc	0x00000040
 764:	e8bd0002 	pop	{r1}
 768:	e8bd0002 	pop	{r1}
 76c:	e8bd0004 	pop	{r2}
 770:	e8bd0008 	pop	{r3}
 774:	e8bd4000 	pop	{lr}
 778:	e12fff1e 	bx	lr

0000077c <uptime>:
 77c:	e92d4000 	push	{lr}
 780:	e92d0008 	push	{r3}
 784:	e92d0004 	push	{r2}
 788:	e92d0002 	push	{r1}
 78c:	e92d0001 	push	{r0}
 790:	e3a0000e 	mov	r0, #14
 794:	ef000040 	svc	0x00000040
 798:	e8bd0002 	pop	{r1}
 79c:	e8bd0002 	pop	{r1}
 7a0:	e8bd0004 	pop	{r2}
 7a4:	e8bd0008 	pop	{r3}
 7a8:	e8bd4000 	pop	{lr}
 7ac:	e12fff1e 	bx	lr
