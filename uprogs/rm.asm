
_rm:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
   0:	e3500001 	cmp	r0, #1
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	e1a05000 	mov	r5, r0
   c:	e28db014 	add	fp, sp, #20
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
  10:	c2816004 	addgt	r6, r1, #4
  14:	c3a07001 	movgt	r7, #1
{
  int i;

  if(argc < 2){
  18:	da00000e 	ble	58 <main+0x58>
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  1c:	e1a04006 	mov	r4, r6
  20:	e2866004 	add	r6, r6, #4
  24:	e5940000 	ldr	r0, [r4]
  28:	eb00013a 	bl	518 <unlink>
  2c:	e3500000 	cmp	r0, #0
  30:	ba000003 	blt	44 <main+0x44>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  34:	e2877001 	add	r7, r7, #1
  38:	e1570005 	cmp	r7, r5
  3c:	1afffff6 	bne	1c <main+0x1c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  40:	eb0000b2 	bl	310 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
      printf(2, "rm: %s failed to delete\n", argv[i]);
  44:	e3a00002 	mov	r0, #2
  48:	e59f1018 	ldr	r1, [pc, #24]	; 68 <main+0x68>
  4c:	e5942000 	ldr	r2, [r4]
  50:	eb000201 	bl	85c <printf>
      break;
    }
  }

  exit();
  54:	eb0000ad 	bl	310 <exit>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: rm files...\n");
  58:	e3a00002 	mov	r0, #2
  5c:	e59f1008 	ldr	r1, [pc, #8]	; 6c <main+0x6c>
  60:	eb0001fd 	bl	85c <printf>
    exit();
  64:	eb0000a9 	bl	310 <exit>
  68:	00000b58 	.word	0x00000b58
  6c:	00000b44 	.word	0x00000b44

00000070 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  74:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  78:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7c:	e4d13001 	ldrb	r3, [r1], #1
  80:	e3530000 	cmp	r3, #0
  84:	e4c23001 	strb	r3, [r2], #1
  88:	1afffffb 	bne	7c <strcpy+0xc>
    ;
  return os;
}
  8c:	e28bd000 	add	sp, fp, #0
  90:	e8bd0800 	pop	{fp}
  94:	e12fff1e 	bx	lr

00000098 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  98:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  9c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  a0:	e5d03000 	ldrb	r3, [r0]
  a4:	e5d12000 	ldrb	r2, [r1]
  a8:	e3530000 	cmp	r3, #0
  ac:	1a000004 	bne	c4 <strcmp+0x2c>
  b0:	ea000005 	b	cc <strcmp+0x34>
  b4:	e5f03001 	ldrb	r3, [r0, #1]!
  b8:	e3530000 	cmp	r3, #0
  bc:	0a000006 	beq	dc <strcmp+0x44>
  c0:	e5f12001 	ldrb	r2, [r1, #1]!
  c4:	e1530002 	cmp	r3, r2
  c8:	0afffff9 	beq	b4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  cc:	e0620003 	rsb	r0, r2, r3
  d0:	e28bd000 	add	sp, fp, #0
  d4:	e8bd0800 	pop	{fp}
  d8:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  dc:	e5d12001 	ldrb	r2, [r1, #1]
  e0:	eafffff9 	b	cc <strcmp+0x34>

000000e4 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  e8:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  ec:	e5d03000 	ldrb	r3, [r0]
  f0:	e3530000 	cmp	r3, #0
  f4:	01a00003 	moveq	r0, r3
  f8:	0a000006 	beq	118 <strlen+0x34>
  fc:	e1a02000 	mov	r2, r0
 100:	e3a03000 	mov	r3, #0
 104:	e5f21001 	ldrb	r1, [r2, #1]!
 108:	e2833001 	add	r3, r3, #1
 10c:	e1a00003 	mov	r0, r3
 110:	e3510000 	cmp	r1, #0
 114:	1afffffa 	bne	104 <strlen+0x20>
    ;
  return n;
}
 118:	e28bd000 	add	sp, fp, #0
 11c:	e8bd0800 	pop	{fp}
 120:	e12fff1e 	bx	lr

00000124 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 124:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 128:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 12c:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 130:	0a000006 	beq	150 <memset+0x2c>
 134:	e6ef1071 	uxtb	r1, r1
 138:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 13c:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 140:	e2533001 	subs	r3, r3, #1
 144:	e4cc1001 	strb	r1, [ip], #1
 148:	1afffffc 	bne	140 <memset+0x1c>
 14c:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 150:	e28bd000 	add	sp, fp, #0
 154:	e8bd0800 	pop	{fp}
 158:	e12fff1e 	bx	lr

0000015c <strchr>:

char*
strchr(const char *s, char c)
{
 15c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 160:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 164:	e5d03000 	ldrb	r3, [r0]
 168:	e3530000 	cmp	r3, #0
 16c:	1a000004 	bne	184 <strchr+0x28>
 170:	ea000008 	b	198 <strchr+0x3c>
 174:	e5d03001 	ldrb	r3, [r0, #1]
 178:	e2800001 	add	r0, r0, #1
 17c:	e3530000 	cmp	r3, #0
 180:	0a000004 	beq	198 <strchr+0x3c>
    if(*s == c)
 184:	e1530001 	cmp	r3, r1
 188:	1afffff9 	bne	174 <strchr+0x18>
      return (char*)s;
  return 0;
}
 18c:	e28bd000 	add	sp, fp, #0
 190:	e8bd0800 	pop	{fp}
 194:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 198:	e1a00003 	mov	r0, r3
 19c:	eafffffa 	b	18c <strchr+0x30>

000001a0 <gets>:
}

char*
gets(char *buf, int max)
{
 1a0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1a4:	e28db018 	add	fp, sp, #24
 1a8:	e24dd00c 	sub	sp, sp, #12
 1ac:	e1a08000 	mov	r8, r0
 1b0:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b4:	e1a06000 	mov	r6, r0
 1b8:	e3a05000 	mov	r5, #0
 1bc:	ea000008 	b	1e4 <gets+0x44>
    cc = read(0, &c, 1);
 1c0:	eb000079 	bl	3ac <read>
    if(cc < 1)
 1c4:	e3500000 	cmp	r0, #0
 1c8:	da00000b 	ble	1fc <gets+0x5c>
      break;
    buf[i++] = c;
 1cc:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 1d0:	e1a05004 	mov	r5, r4
 1d4:	e353000a 	cmp	r3, #10
 1d8:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1dc:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 1e0:	0a00000a 	beq	210 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e4:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e8:	e0854002 	add	r4, r5, r2
 1ec:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1f0:	e3a00000 	mov	r0, #0
 1f4:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f8:	bafffff0 	blt	1c0 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1fc:	e3a03000 	mov	r3, #0
 200:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 204:	e1a00008 	mov	r0, r8
 208:	e24bd018 	sub	sp, fp, #24
 20c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 210:	e1a05004 	mov	r5, r4
 214:	eafffff8 	b	1fc <gets+0x5c>

00000218 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 218:	e92d4830 	push	{r4, r5, fp, lr}
 21c:	e1a05001 	mov	r5, r1
 220:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 224:	e3a01000 	mov	r1, #0
 228:	eb0000a0 	bl	4b0 <open>
  if(fd < 0)
 22c:	e2504000 	subs	r4, r0, #0
    return -1;
 230:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 234:	ba000004 	blt	24c <stat+0x34>
    return -1;
  r = fstat(fd, st);
 238:	e1a01005 	mov	r1, r5
 23c:	eb0000c2 	bl	54c <fstat>
 240:	e1a05000 	mov	r5, r0
  close(fd);
 244:	e1a00004 	mov	r0, r4
 248:	eb000071 	bl	414 <close>
  return r;
}
 24c:	e1a00005 	mov	r0, r5
 250:	e8bd8830 	pop	{r4, r5, fp, pc}

00000254 <atoi>:

int
atoi(const char *s)
{
 254:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 258:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25c:	e5d03000 	ldrb	r3, [r0]
 260:	e2432030 	sub	r2, r3, #48	; 0x30
 264:	e6ef2072 	uxtb	r2, r2
 268:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 26c:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 270:	8a000009 	bhi	29c <atoi+0x48>
 274:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 278:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 27c:	e0800100 	add	r0, r0, r0, lsl #2
 280:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 284:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 288:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 28c:	e2431030 	sub	r1, r3, #48	; 0x30
 290:	e6ef1071 	uxtb	r1, r1
 294:	e3510009 	cmp	r1, #9
 298:	9afffff7 	bls	27c <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 29c:	e28bd000 	add	sp, fp, #0
 2a0:	e8bd0800 	pop	{fp}
 2a4:	e12fff1e 	bx	lr

000002a8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a8:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b0:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b4:	da000005 	ble	2d0 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 2b8:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 2bc:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 2c0:	e4d1c001 	ldrb	ip, [r1], #1
 2c4:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c8:	e1530002 	cmp	r3, r2
 2cc:	1afffffb 	bne	2c0 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2d0:	e28bd000 	add	sp, fp, #0
 2d4:	e8bd0800 	pop	{fp}
 2d8:	e12fff1e 	bx	lr

000002dc <fork>:
 2dc:	e92d4000 	push	{lr}
 2e0:	e92d0008 	push	{r3}
 2e4:	e92d0004 	push	{r2}
 2e8:	e92d0002 	push	{r1}
 2ec:	e92d0001 	push	{r0}
 2f0:	e3a00001 	mov	r0, #1
 2f4:	ef000040 	svc	0x00000040
 2f8:	e8bd0002 	pop	{r1}
 2fc:	e8bd0002 	pop	{r1}
 300:	e8bd0004 	pop	{r2}
 304:	e8bd0008 	pop	{r3}
 308:	e8bd4000 	pop	{lr}
 30c:	e12fff1e 	bx	lr

00000310 <exit>:
 310:	e92d4000 	push	{lr}
 314:	e92d0008 	push	{r3}
 318:	e92d0004 	push	{r2}
 31c:	e92d0002 	push	{r1}
 320:	e92d0001 	push	{r0}
 324:	e3a00002 	mov	r0, #2
 328:	ef000040 	svc	0x00000040
 32c:	e8bd0002 	pop	{r1}
 330:	e8bd0002 	pop	{r1}
 334:	e8bd0004 	pop	{r2}
 338:	e8bd0008 	pop	{r3}
 33c:	e8bd4000 	pop	{lr}
 340:	e12fff1e 	bx	lr

00000344 <wait>:
 344:	e92d4000 	push	{lr}
 348:	e92d0008 	push	{r3}
 34c:	e92d0004 	push	{r2}
 350:	e92d0002 	push	{r1}
 354:	e92d0001 	push	{r0}
 358:	e3a00003 	mov	r0, #3
 35c:	ef000040 	svc	0x00000040
 360:	e8bd0002 	pop	{r1}
 364:	e8bd0002 	pop	{r1}
 368:	e8bd0004 	pop	{r2}
 36c:	e8bd0008 	pop	{r3}
 370:	e8bd4000 	pop	{lr}
 374:	e12fff1e 	bx	lr

00000378 <pipe>:
 378:	e92d4000 	push	{lr}
 37c:	e92d0008 	push	{r3}
 380:	e92d0004 	push	{r2}
 384:	e92d0002 	push	{r1}
 388:	e92d0001 	push	{r0}
 38c:	e3a00004 	mov	r0, #4
 390:	ef000040 	svc	0x00000040
 394:	e8bd0002 	pop	{r1}
 398:	e8bd0002 	pop	{r1}
 39c:	e8bd0004 	pop	{r2}
 3a0:	e8bd0008 	pop	{r3}
 3a4:	e8bd4000 	pop	{lr}
 3a8:	e12fff1e 	bx	lr

000003ac <read>:
 3ac:	e92d4000 	push	{lr}
 3b0:	e92d0008 	push	{r3}
 3b4:	e92d0004 	push	{r2}
 3b8:	e92d0002 	push	{r1}
 3bc:	e92d0001 	push	{r0}
 3c0:	e3a00005 	mov	r0, #5
 3c4:	ef000040 	svc	0x00000040
 3c8:	e8bd0002 	pop	{r1}
 3cc:	e8bd0002 	pop	{r1}
 3d0:	e8bd0004 	pop	{r2}
 3d4:	e8bd0008 	pop	{r3}
 3d8:	e8bd4000 	pop	{lr}
 3dc:	e12fff1e 	bx	lr

000003e0 <write>:
 3e0:	e92d4000 	push	{lr}
 3e4:	e92d0008 	push	{r3}
 3e8:	e92d0004 	push	{r2}
 3ec:	e92d0002 	push	{r1}
 3f0:	e92d0001 	push	{r0}
 3f4:	e3a00010 	mov	r0, #16
 3f8:	ef000040 	svc	0x00000040
 3fc:	e8bd0002 	pop	{r1}
 400:	e8bd0002 	pop	{r1}
 404:	e8bd0004 	pop	{r2}
 408:	e8bd0008 	pop	{r3}
 40c:	e8bd4000 	pop	{lr}
 410:	e12fff1e 	bx	lr

00000414 <close>:
 414:	e92d4000 	push	{lr}
 418:	e92d0008 	push	{r3}
 41c:	e92d0004 	push	{r2}
 420:	e92d0002 	push	{r1}
 424:	e92d0001 	push	{r0}
 428:	e3a00015 	mov	r0, #21
 42c:	ef000040 	svc	0x00000040
 430:	e8bd0002 	pop	{r1}
 434:	e8bd0002 	pop	{r1}
 438:	e8bd0004 	pop	{r2}
 43c:	e8bd0008 	pop	{r3}
 440:	e8bd4000 	pop	{lr}
 444:	e12fff1e 	bx	lr

00000448 <kill>:
 448:	e92d4000 	push	{lr}
 44c:	e92d0008 	push	{r3}
 450:	e92d0004 	push	{r2}
 454:	e92d0002 	push	{r1}
 458:	e92d0001 	push	{r0}
 45c:	e3a00006 	mov	r0, #6
 460:	ef000040 	svc	0x00000040
 464:	e8bd0002 	pop	{r1}
 468:	e8bd0002 	pop	{r1}
 46c:	e8bd0004 	pop	{r2}
 470:	e8bd0008 	pop	{r3}
 474:	e8bd4000 	pop	{lr}
 478:	e12fff1e 	bx	lr

0000047c <exec>:
 47c:	e92d4000 	push	{lr}
 480:	e92d0008 	push	{r3}
 484:	e92d0004 	push	{r2}
 488:	e92d0002 	push	{r1}
 48c:	e92d0001 	push	{r0}
 490:	e3a00007 	mov	r0, #7
 494:	ef000040 	svc	0x00000040
 498:	e8bd0002 	pop	{r1}
 49c:	e8bd0002 	pop	{r1}
 4a0:	e8bd0004 	pop	{r2}
 4a4:	e8bd0008 	pop	{r3}
 4a8:	e8bd4000 	pop	{lr}
 4ac:	e12fff1e 	bx	lr

000004b0 <open>:
 4b0:	e92d4000 	push	{lr}
 4b4:	e92d0008 	push	{r3}
 4b8:	e92d0004 	push	{r2}
 4bc:	e92d0002 	push	{r1}
 4c0:	e92d0001 	push	{r0}
 4c4:	e3a0000f 	mov	r0, #15
 4c8:	ef000040 	svc	0x00000040
 4cc:	e8bd0002 	pop	{r1}
 4d0:	e8bd0002 	pop	{r1}
 4d4:	e8bd0004 	pop	{r2}
 4d8:	e8bd0008 	pop	{r3}
 4dc:	e8bd4000 	pop	{lr}
 4e0:	e12fff1e 	bx	lr

000004e4 <mknod>:
 4e4:	e92d4000 	push	{lr}
 4e8:	e92d0008 	push	{r3}
 4ec:	e92d0004 	push	{r2}
 4f0:	e92d0002 	push	{r1}
 4f4:	e92d0001 	push	{r0}
 4f8:	e3a00011 	mov	r0, #17
 4fc:	ef000040 	svc	0x00000040
 500:	e8bd0002 	pop	{r1}
 504:	e8bd0002 	pop	{r1}
 508:	e8bd0004 	pop	{r2}
 50c:	e8bd0008 	pop	{r3}
 510:	e8bd4000 	pop	{lr}
 514:	e12fff1e 	bx	lr

00000518 <unlink>:
 518:	e92d4000 	push	{lr}
 51c:	e92d0008 	push	{r3}
 520:	e92d0004 	push	{r2}
 524:	e92d0002 	push	{r1}
 528:	e92d0001 	push	{r0}
 52c:	e3a00012 	mov	r0, #18
 530:	ef000040 	svc	0x00000040
 534:	e8bd0002 	pop	{r1}
 538:	e8bd0002 	pop	{r1}
 53c:	e8bd0004 	pop	{r2}
 540:	e8bd0008 	pop	{r3}
 544:	e8bd4000 	pop	{lr}
 548:	e12fff1e 	bx	lr

0000054c <fstat>:
 54c:	e92d4000 	push	{lr}
 550:	e92d0008 	push	{r3}
 554:	e92d0004 	push	{r2}
 558:	e92d0002 	push	{r1}
 55c:	e92d0001 	push	{r0}
 560:	e3a00008 	mov	r0, #8
 564:	ef000040 	svc	0x00000040
 568:	e8bd0002 	pop	{r1}
 56c:	e8bd0002 	pop	{r1}
 570:	e8bd0004 	pop	{r2}
 574:	e8bd0008 	pop	{r3}
 578:	e8bd4000 	pop	{lr}
 57c:	e12fff1e 	bx	lr

00000580 <link>:
 580:	e92d4000 	push	{lr}
 584:	e92d0008 	push	{r3}
 588:	e92d0004 	push	{r2}
 58c:	e92d0002 	push	{r1}
 590:	e92d0001 	push	{r0}
 594:	e3a00013 	mov	r0, #19
 598:	ef000040 	svc	0x00000040
 59c:	e8bd0002 	pop	{r1}
 5a0:	e8bd0002 	pop	{r1}
 5a4:	e8bd0004 	pop	{r2}
 5a8:	e8bd0008 	pop	{r3}
 5ac:	e8bd4000 	pop	{lr}
 5b0:	e12fff1e 	bx	lr

000005b4 <mkdir>:
 5b4:	e92d4000 	push	{lr}
 5b8:	e92d0008 	push	{r3}
 5bc:	e92d0004 	push	{r2}
 5c0:	e92d0002 	push	{r1}
 5c4:	e92d0001 	push	{r0}
 5c8:	e3a00014 	mov	r0, #20
 5cc:	ef000040 	svc	0x00000040
 5d0:	e8bd0002 	pop	{r1}
 5d4:	e8bd0002 	pop	{r1}
 5d8:	e8bd0004 	pop	{r2}
 5dc:	e8bd0008 	pop	{r3}
 5e0:	e8bd4000 	pop	{lr}
 5e4:	e12fff1e 	bx	lr

000005e8 <chdir>:
 5e8:	e92d4000 	push	{lr}
 5ec:	e92d0008 	push	{r3}
 5f0:	e92d0004 	push	{r2}
 5f4:	e92d0002 	push	{r1}
 5f8:	e92d0001 	push	{r0}
 5fc:	e3a00009 	mov	r0, #9
 600:	ef000040 	svc	0x00000040
 604:	e8bd0002 	pop	{r1}
 608:	e8bd0002 	pop	{r1}
 60c:	e8bd0004 	pop	{r2}
 610:	e8bd0008 	pop	{r3}
 614:	e8bd4000 	pop	{lr}
 618:	e12fff1e 	bx	lr

0000061c <dup>:
 61c:	e92d4000 	push	{lr}
 620:	e92d0008 	push	{r3}
 624:	e92d0004 	push	{r2}
 628:	e92d0002 	push	{r1}
 62c:	e92d0001 	push	{r0}
 630:	e3a0000a 	mov	r0, #10
 634:	ef000040 	svc	0x00000040
 638:	e8bd0002 	pop	{r1}
 63c:	e8bd0002 	pop	{r1}
 640:	e8bd0004 	pop	{r2}
 644:	e8bd0008 	pop	{r3}
 648:	e8bd4000 	pop	{lr}
 64c:	e12fff1e 	bx	lr

00000650 <getpid>:
 650:	e92d4000 	push	{lr}
 654:	e92d0008 	push	{r3}
 658:	e92d0004 	push	{r2}
 65c:	e92d0002 	push	{r1}
 660:	e92d0001 	push	{r0}
 664:	e3a0000b 	mov	r0, #11
 668:	ef000040 	svc	0x00000040
 66c:	e8bd0002 	pop	{r1}
 670:	e8bd0002 	pop	{r1}
 674:	e8bd0004 	pop	{r2}
 678:	e8bd0008 	pop	{r3}
 67c:	e8bd4000 	pop	{lr}
 680:	e12fff1e 	bx	lr

00000684 <sbrk>:
 684:	e92d4000 	push	{lr}
 688:	e92d0008 	push	{r3}
 68c:	e92d0004 	push	{r2}
 690:	e92d0002 	push	{r1}
 694:	e92d0001 	push	{r0}
 698:	e3a0000c 	mov	r0, #12
 69c:	ef000040 	svc	0x00000040
 6a0:	e8bd0002 	pop	{r1}
 6a4:	e8bd0002 	pop	{r1}
 6a8:	e8bd0004 	pop	{r2}
 6ac:	e8bd0008 	pop	{r3}
 6b0:	e8bd4000 	pop	{lr}
 6b4:	e12fff1e 	bx	lr

000006b8 <sleep>:
 6b8:	e92d4000 	push	{lr}
 6bc:	e92d0008 	push	{r3}
 6c0:	e92d0004 	push	{r2}
 6c4:	e92d0002 	push	{r1}
 6c8:	e92d0001 	push	{r0}
 6cc:	e3a0000d 	mov	r0, #13
 6d0:	ef000040 	svc	0x00000040
 6d4:	e8bd0002 	pop	{r1}
 6d8:	e8bd0002 	pop	{r1}
 6dc:	e8bd0004 	pop	{r2}
 6e0:	e8bd0008 	pop	{r3}
 6e4:	e8bd4000 	pop	{lr}
 6e8:	e12fff1e 	bx	lr

000006ec <uptime>:
 6ec:	e92d4000 	push	{lr}
 6f0:	e92d0008 	push	{r3}
 6f4:	e92d0004 	push	{r2}
 6f8:	e92d0002 	push	{r1}
 6fc:	e92d0001 	push	{r0}
 700:	e3a0000e 	mov	r0, #14
 704:	ef000040 	svc	0x00000040
 708:	e8bd0002 	pop	{r1}
 70c:	e8bd0002 	pop	{r1}
 710:	e8bd0004 	pop	{r2}
 714:	e8bd0008 	pop	{r3}
 718:	e8bd4000 	pop	{lr}
 71c:	e12fff1e 	bx	lr

00000720 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 720:	e92d4800 	push	{fp, lr}
 724:	e28db004 	add	fp, sp, #4
 728:	e24b3004 	sub	r3, fp, #4
 72c:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 730:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 734:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 738:	e1a01003 	mov	r1, r3
 73c:	ebffff27 	bl	3e0 <write>
}
 740:	e24bd004 	sub	sp, fp, #4
 744:	e8bd8800 	pop	{fp, pc}

00000748 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 748:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 74c:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 750:	e1a00fa1 	lsr	r0, r1, #31
 754:	e3530000 	cmp	r3, #0
 758:	03a03000 	moveq	r3, #0
 75c:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 760:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 764:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 768:	e24dd014 	sub	sp, sp, #20
 76c:	e59f909c 	ldr	r9, [pc, #156]	; 810 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 770:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 774:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 778:	e3a0a000 	mov	sl, #0
 77c:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 780:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 784:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 788:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 78c:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 790:	e1a0e031 	lsr	lr, r1, r0
 794:	e20ee001 	and	lr, lr, #1
 798:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 79c:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 7a0:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 7a4:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 7a8:	e2500001 	subs	r0, r0, #1
 7ac:	2afffff7 	bcs	790 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7b0:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 7b4:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7b8:	e0601001 	rsb	r1, r0, r1
 7bc:	e28a5001 	add	r5, sl, #1
 7c0:	e7d91001 	ldrb	r1, [r9, r1]
 7c4:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 7c8:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7cc:	11a0a005 	movne	sl, r5
 7d0:	1affffeb 	bne	784 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 7d4:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 7d8:	124b2024 	subne	r2, fp, #36	; 0x24
 7dc:	10823005 	addne	r3, r2, r5
 7e0:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 7e4:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 7e8:	13a0202d 	movne	r2, #45	; 0x2d
 7ec:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7f0:	e7d61005 	ldrb	r1, [r6, r5]
 7f4:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7f8:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 7fc:	ebffffc7 	bl	720 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 800:	e3750001 	cmn	r5, #1
 804:	1afffff9 	bne	7f0 <printint+0xa8>
    putc(fd, buf[i]);
}
 808:	e24bd020 	sub	sp, fp, #32
 80c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 810:	00000b74 	.word	0x00000b74

00000814 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 814:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 818:	e92d0830 	push	{r4, r5, fp}
 81c:	e1a02000 	mov	r2, r0
 820:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 824:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 828:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 82c:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 830:	e1a04c32 	lsr	r4, r2, ip
 834:	e2044001 	and	r4, r4, #1
 838:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 83c:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 840:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 844:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 848:	e25cc001 	subs	ip, ip, #1
 84c:	2afffff7 	bcs	830 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 850:	e24bd008 	sub	sp, fp, #8
 854:	e8bd0830 	pop	{r4, r5, fp}
 858:	e12fff1e 	bx	lr

0000085c <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 85c:	e92d000e 	push	{r1, r2, r3}
 860:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 864:	e28db020 	add	fp, sp, #32
 868:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 86c:	e59b4004 	ldr	r4, [fp, #4]
 870:	e5d48000 	ldrb	r8, [r4]
 874:	e3580000 	cmp	r8, #0
 878:	0a000027 	beq	91c <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 87c:	e59f712c 	ldr	r7, [pc, #300]	; 9b0 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 880:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 884:	e3a0a000 	mov	sl, #0
 888:	ea000008 	b	8b0 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 88c:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 890:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 894:	0a000002 	beq	8a4 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 898:	e1a00005 	mov	r0, r5
 89c:	e1a01008 	mov	r1, r8
 8a0:	ebffff9e 	bl	720 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8a4:	e5f48001 	ldrb	r8, [r4, #1]!
 8a8:	e3580000 	cmp	r8, #0
 8ac:	0a00001a 	beq	91c <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 8b0:	e35a0000 	cmp	sl, #0
 8b4:	0afffff4 	beq	88c <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8b8:	e35a0025 	cmp	sl, #37	; 0x25
 8bc:	1afffff8 	bne	8a4 <printf+0x48>
      if(c == 'd'){
 8c0:	e3580064 	cmp	r8, #100	; 0x64
 8c4:	0a00002c 	beq	97c <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8c8:	e3580078 	cmp	r8, #120	; 0x78
 8cc:	13580070 	cmpne	r8, #112	; 0x70
 8d0:	13a09000 	movne	r9, #0
 8d4:	03a09001 	moveq	r9, #1
 8d8:	0a000013 	beq	92c <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8dc:	e3580073 	cmp	r8, #115	; 0x73
 8e0:	0a000018 	beq	948 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8e4:	e3580063 	cmp	r8, #99	; 0x63
 8e8:	0a00002a 	beq	998 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8ec:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 8f0:	e1a0100a 	mov	r1, sl
 8f4:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8f8:	0a000002 	beq	908 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8fc:	ebffff87 	bl	720 <putc>
        putc(fd, c);
 900:	e1a00005 	mov	r0, r5
 904:	e1a01008 	mov	r1, r8
 908:	ebffff84 	bl	720 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 90c:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 910:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 914:	e3580000 	cmp	r8, #0
 918:	1affffe4 	bne	8b0 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 91c:	e24bd020 	sub	sp, fp, #32
 920:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 924:	e28dd00c 	add	sp, sp, #12
 928:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 92c:	e1a00005 	mov	r0, r5
 930:	e4961004 	ldr	r1, [r6], #4
 934:	e3a02010 	mov	r2, #16
 938:	e3a03000 	mov	r3, #0
 93c:	ebffff81 	bl	748 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 940:	e3a0a000 	mov	sl, #0
 944:	eaffffd6 	b	8a4 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 948:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 94c:	e3580000 	cmp	r8, #0
 950:	01a08007 	moveq	r8, r7
        while(*s != 0){
 954:	e5d81000 	ldrb	r1, [r8]
 958:	e3510000 	cmp	r1, #0
 95c:	0a000004 	beq	974 <printf+0x118>
          putc(fd, *s);
 960:	e1a00005 	mov	r0, r5
 964:	ebffff6d 	bl	720 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 968:	e5f81001 	ldrb	r1, [r8, #1]!
 96c:	e3510000 	cmp	r1, #0
 970:	1afffffa 	bne	960 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 974:	e1a0a001 	mov	sl, r1
 978:	eaffffc9 	b	8a4 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 97c:	e1a00005 	mov	r0, r5
 980:	e4961004 	ldr	r1, [r6], #4
 984:	e3a0200a 	mov	r2, #10
 988:	e3a03001 	mov	r3, #1
 98c:	ebffff6d 	bl	748 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 990:	e3a0a000 	mov	sl, #0
 994:	eaffffc2 	b	8a4 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 998:	e4961004 	ldr	r1, [r6], #4
 99c:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9a0:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 9a4:	e6ef1071 	uxtb	r1, r1
 9a8:	ebffff5c 	bl	720 <putc>
 9ac:	eaffffbc 	b	8a4 <printf+0x48>
 9b0:	00000b88 	.word	0x00000b88

000009b4 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9b4:	e59f3098 	ldr	r3, [pc, #152]	; a54 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9b8:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9bc:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c0:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c4:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c8:	e152000c 	cmp	r2, ip
 9cc:	e5921000 	ldr	r1, [r2]
 9d0:	2a000001 	bcs	9dc <free+0x28>
 9d4:	e15c0001 	cmp	ip, r1
 9d8:	3a000007 	bcc	9fc <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9dc:	e1520001 	cmp	r2, r1
 9e0:	3a000003 	bcc	9f4 <free+0x40>
 9e4:	e152000c 	cmp	r2, ip
 9e8:	3a000003 	bcc	9fc <free+0x48>
 9ec:	e15c0001 	cmp	ip, r1
 9f0:	3a000001 	bcc	9fc <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f4:	e1a02001 	mov	r2, r1
 9f8:	eafffff2 	b	9c8 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9fc:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a00:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a04:	e08c5184 	add	r5, ip, r4, lsl #3
 a08:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 a0c:	05911004 	ldreq	r1, [r1, #4]
 a10:	00814004 	addeq	r4, r1, r4
 a14:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a18:	05921000 	ldreq	r1, [r2]
 a1c:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 a20:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 a24:	e5921004 	ldr	r1, [r2, #4]
 a28:	e0824181 	add	r4, r2, r1, lsl #3
 a2c:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a30:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a34:	0510c004 	ldreq	ip, [r0, #-4]
 a38:	008c1001 	addeq	r1, ip, r1
 a3c:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 a40:	05101008 	ldreq	r1, [r0, #-8]
 a44:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a48:	e24bd008 	sub	sp, fp, #8
 a4c:	e8bd0830 	pop	{r4, r5, fp}
 a50:	e12fff1e 	bx	lr
 a54:	00000b90 	.word	0x00000b90

00000a58 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a58:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a5c:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 a60:	e59f50d4 	ldr	r5, [pc, #212]	; b3c <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a64:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 a68:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a6c:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a70:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a74:	e3530000 	cmp	r3, #0
 a78:	0a00002b 	beq	b2c <malloc+0xd4>
 a7c:	e5930000 	ldr	r0, [r3]
 a80:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a84:	e1520004 	cmp	r2, r4
 a88:	2a00001b 	bcs	afc <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a8c:	e59f80ac 	ldr	r8, [pc, #172]	; b40 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 a90:	e1a07184 	lsl	r7, r4, #3
 a94:	ea000003 	b	aa8 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a98:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 a9c:	e5902004 	ldr	r2, [r0, #4]
 aa0:	e1540002 	cmp	r4, r2
 aa4:	9a000014 	bls	afc <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aa8:	e5952000 	ldr	r2, [r5]
 aac:	e1a03000 	mov	r3, r0
 ab0:	e1500002 	cmp	r0, r2
 ab4:	1afffff7 	bne	a98 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 ab8:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 abc:	81a00007 	movhi	r0, r7
 ac0:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 ac4:	81a06004 	movhi	r6, r4
 ac8:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 acc:	ebfffeec 	bl	684 <sbrk>
 ad0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ad4:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 ad8:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 adc:	0a000010 	beq	b24 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 ae0:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 ae4:	ebffffb2 	bl	9b4 <free>
  return freep;
 ae8:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 aec:	e3530000 	cmp	r3, #0
 af0:	1affffe8 	bne	a98 <malloc+0x40>
        return 0;
 af4:	e1a00003 	mov	r0, r3
  }
}
 af8:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 afc:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b00:	10642002 	rsbne	r2, r4, r2
 b04:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b08:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b0c:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b10:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b14:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 b18:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 b1c:	e2800008 	add	r0, r0, #8
 b20:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 b24:	e3a00000 	mov	r0, #0
 b28:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b2c:	e2850004 	add	r0, r5, #4
 b30:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 b34:	e9850009 	stmib	r5, {r0, r3}
 b38:	eaffffd3 	b	a8c <malloc+0x34>
 b3c:	00000b90 	.word	0x00000b90
 b40:	00000fff 	.word	0x00000fff
