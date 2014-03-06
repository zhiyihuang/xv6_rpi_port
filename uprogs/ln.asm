
_ln:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int
main(int argc, char *argv[])
{
  if(argc != 3){
   0:	e3500003 	cmp	r0, #3
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   4:	e92d4818 	push	{r3, r4, fp, lr}
   8:	e1a04001 	mov	r4, r1
   c:	e28db00c 	add	fp, sp, #12
  if(argc != 3){
  10:	0a000003 	beq	24 <main+0x24>
    printf(2, "Usage: ln old new\n");
  14:	e3a00002 	mov	r0, #2
  18:	e59f102c 	ldr	r1, [pc, #44]	; 4c <main+0x4c>
  1c:	eb000207 	bl	840 <printf>
    exit();
  20:	eb0000b3 	bl	2f4 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  24:	e9910003 	ldmib	r1, {r0, r1}
  28:	eb00014d 	bl	564 <link>
  2c:	e3500000 	cmp	r0, #0
  30:	ba000000 	blt	38 <main+0x38>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  34:	eb0000ae 	bl	2f4 <exit>
  if(argc != 3){
    printf(2, "Usage: ln old new\n");
    exit();
  }
  if(link(argv[1], argv[2]) < 0)
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  38:	e3a00002 	mov	r0, #2
  3c:	e59f100c 	ldr	r1, [pc, #12]	; 50 <main+0x50>
  40:	e994000c 	ldmib	r4, {r2, r3}
  44:	eb0001fd 	bl	840 <printf>
  exit();
  48:	eb0000a9 	bl	2f4 <exit>
  4c:	00000b28 	.word	0x00000b28
  50:	00000b3c 	.word	0x00000b3c

00000054 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  54:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  58:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  5c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  60:	e4d13001 	ldrb	r3, [r1], #1
  64:	e3530000 	cmp	r3, #0
  68:	e4c23001 	strb	r3, [r2], #1
  6c:	1afffffb 	bne	60 <strcpy+0xc>
    ;
  return os;
}
  70:	e28bd000 	add	sp, fp, #0
  74:	e8bd0800 	pop	{fp}
  78:	e12fff1e 	bx	lr

0000007c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  80:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  84:	e5d03000 	ldrb	r3, [r0]
  88:	e5d12000 	ldrb	r2, [r1]
  8c:	e3530000 	cmp	r3, #0
  90:	1a000004 	bne	a8 <strcmp+0x2c>
  94:	ea000005 	b	b0 <strcmp+0x34>
  98:	e5f03001 	ldrb	r3, [r0, #1]!
  9c:	e3530000 	cmp	r3, #0
  a0:	0a000006 	beq	c0 <strcmp+0x44>
  a4:	e5f12001 	ldrb	r2, [r1, #1]!
  a8:	e1530002 	cmp	r3, r2
  ac:	0afffff9 	beq	98 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  b0:	e0620003 	rsb	r0, r2, r3
  b4:	e28bd000 	add	sp, fp, #0
  b8:	e8bd0800 	pop	{fp}
  bc:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c0:	e5d12001 	ldrb	r2, [r1, #1]
  c4:	eafffff9 	b	b0 <strcmp+0x34>

000000c8 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  cc:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  d0:	e5d03000 	ldrb	r3, [r0]
  d4:	e3530000 	cmp	r3, #0
  d8:	01a00003 	moveq	r0, r3
  dc:	0a000006 	beq	fc <strlen+0x34>
  e0:	e1a02000 	mov	r2, r0
  e4:	e3a03000 	mov	r3, #0
  e8:	e5f21001 	ldrb	r1, [r2, #1]!
  ec:	e2833001 	add	r3, r3, #1
  f0:	e1a00003 	mov	r0, r3
  f4:	e3510000 	cmp	r1, #0
  f8:	1afffffa 	bne	e8 <strlen+0x20>
    ;
  return n;
}
  fc:	e28bd000 	add	sp, fp, #0
 100:	e8bd0800 	pop	{fp}
 104:	e12fff1e 	bx	lr

00000108 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 108:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 110:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 114:	0a000006 	beq	134 <memset+0x2c>
 118:	e6ef1071 	uxtb	r1, r1
 11c:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 120:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 124:	e2533001 	subs	r3, r3, #1
 128:	e4cc1001 	strb	r1, [ip], #1
 12c:	1afffffc 	bne	124 <memset+0x1c>
 130:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 134:	e28bd000 	add	sp, fp, #0
 138:	e8bd0800 	pop	{fp}
 13c:	e12fff1e 	bx	lr

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 144:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 148:	e5d03000 	ldrb	r3, [r0]
 14c:	e3530000 	cmp	r3, #0
 150:	1a000004 	bne	168 <strchr+0x28>
 154:	ea000008 	b	17c <strchr+0x3c>
 158:	e5d03001 	ldrb	r3, [r0, #1]
 15c:	e2800001 	add	r0, r0, #1
 160:	e3530000 	cmp	r3, #0
 164:	0a000004 	beq	17c <strchr+0x3c>
    if(*s == c)
 168:	e1530001 	cmp	r3, r1
 16c:	1afffff9 	bne	158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 170:	e28bd000 	add	sp, fp, #0
 174:	e8bd0800 	pop	{fp}
 178:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 17c:	e1a00003 	mov	r0, r3
 180:	eafffffa 	b	170 <strchr+0x30>

00000184 <gets>:
}

char*
gets(char *buf, int max)
{
 184:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 188:	e28db018 	add	fp, sp, #24
 18c:	e24dd00c 	sub	sp, sp, #12
 190:	e1a08000 	mov	r8, r0
 194:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 198:	e1a06000 	mov	r6, r0
 19c:	e3a05000 	mov	r5, #0
 1a0:	ea000008 	b	1c8 <gets+0x44>
    cc = read(0, &c, 1);
 1a4:	eb000079 	bl	390 <read>
    if(cc < 1)
 1a8:	e3500000 	cmp	r0, #0
 1ac:	da00000b 	ble	1e0 <gets+0x5c>
      break;
    buf[i++] = c;
 1b0:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 1b4:	e1a05004 	mov	r5, r4
 1b8:	e353000a 	cmp	r3, #10
 1bc:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1c0:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 1c4:	0a00000a 	beq	1f4 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1c8:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	e0854002 	add	r4, r5, r2
 1d0:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1d4:	e3a00000 	mov	r0, #0
 1d8:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1dc:	bafffff0 	blt	1a4 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1e0:	e3a03000 	mov	r3, #0
 1e4:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 1e8:	e1a00008 	mov	r0, r8
 1ec:	e24bd018 	sub	sp, fp, #24
 1f0:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f4:	e1a05004 	mov	r5, r4
 1f8:	eafffff8 	b	1e0 <gets+0x5c>

000001fc <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1fc:	e92d4830 	push	{r4, r5, fp, lr}
 200:	e1a05001 	mov	r5, r1
 204:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 208:	e3a01000 	mov	r1, #0
 20c:	eb0000a0 	bl	494 <open>
  if(fd < 0)
 210:	e2504000 	subs	r4, r0, #0
    return -1;
 214:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 218:	ba000004 	blt	230 <stat+0x34>
    return -1;
  r = fstat(fd, st);
 21c:	e1a01005 	mov	r1, r5
 220:	eb0000c2 	bl	530 <fstat>
 224:	e1a05000 	mov	r5, r0
  close(fd);
 228:	e1a00004 	mov	r0, r4
 22c:	eb000071 	bl	3f8 <close>
  return r;
}
 230:	e1a00005 	mov	r0, r5
 234:	e8bd8830 	pop	{r4, r5, fp, pc}

00000238 <atoi>:

int
atoi(const char *s)
{
 238:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 23c:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 240:	e5d03000 	ldrb	r3, [r0]
 244:	e2432030 	sub	r2, r3, #48	; 0x30
 248:	e6ef2072 	uxtb	r2, r2
 24c:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 250:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 254:	8a000009 	bhi	280 <atoi+0x48>
 258:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 25c:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 260:	e0800100 	add	r0, r0, r0, lsl #2
 264:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 268:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 26c:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 270:	e2431030 	sub	r1, r3, #48	; 0x30
 274:	e6ef1071 	uxtb	r1, r1
 278:	e3510009 	cmp	r1, #9
 27c:	9afffff7 	bls	260 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 280:	e28bd000 	add	sp, fp, #0
 284:	e8bd0800 	pop	{fp}
 288:	e12fff1e 	bx	lr

0000028c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 290:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 294:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 298:	da000005 	ble	2b4 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 29c:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 2a0:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 2a4:	e4d1c001 	ldrb	ip, [r1], #1
 2a8:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ac:	e1530002 	cmp	r3, r2
 2b0:	1afffffb 	bne	2a4 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2b4:	e28bd000 	add	sp, fp, #0
 2b8:	e8bd0800 	pop	{fp}
 2bc:	e12fff1e 	bx	lr

000002c0 <fork>:
 2c0:	e92d4000 	push	{lr}
 2c4:	e92d0008 	push	{r3}
 2c8:	e92d0004 	push	{r2}
 2cc:	e92d0002 	push	{r1}
 2d0:	e92d0001 	push	{r0}
 2d4:	e3a00001 	mov	r0, #1
 2d8:	ef000040 	svc	0x00000040
 2dc:	e8bd0002 	pop	{r1}
 2e0:	e8bd0002 	pop	{r1}
 2e4:	e8bd0004 	pop	{r2}
 2e8:	e8bd0008 	pop	{r3}
 2ec:	e8bd4000 	pop	{lr}
 2f0:	e12fff1e 	bx	lr

000002f4 <exit>:
 2f4:	e92d4000 	push	{lr}
 2f8:	e92d0008 	push	{r3}
 2fc:	e92d0004 	push	{r2}
 300:	e92d0002 	push	{r1}
 304:	e92d0001 	push	{r0}
 308:	e3a00002 	mov	r0, #2
 30c:	ef000040 	svc	0x00000040
 310:	e8bd0002 	pop	{r1}
 314:	e8bd0002 	pop	{r1}
 318:	e8bd0004 	pop	{r2}
 31c:	e8bd0008 	pop	{r3}
 320:	e8bd4000 	pop	{lr}
 324:	e12fff1e 	bx	lr

00000328 <wait>:
 328:	e92d4000 	push	{lr}
 32c:	e92d0008 	push	{r3}
 330:	e92d0004 	push	{r2}
 334:	e92d0002 	push	{r1}
 338:	e92d0001 	push	{r0}
 33c:	e3a00003 	mov	r0, #3
 340:	ef000040 	svc	0x00000040
 344:	e8bd0002 	pop	{r1}
 348:	e8bd0002 	pop	{r1}
 34c:	e8bd0004 	pop	{r2}
 350:	e8bd0008 	pop	{r3}
 354:	e8bd4000 	pop	{lr}
 358:	e12fff1e 	bx	lr

0000035c <pipe>:
 35c:	e92d4000 	push	{lr}
 360:	e92d0008 	push	{r3}
 364:	e92d0004 	push	{r2}
 368:	e92d0002 	push	{r1}
 36c:	e92d0001 	push	{r0}
 370:	e3a00004 	mov	r0, #4
 374:	ef000040 	svc	0x00000040
 378:	e8bd0002 	pop	{r1}
 37c:	e8bd0002 	pop	{r1}
 380:	e8bd0004 	pop	{r2}
 384:	e8bd0008 	pop	{r3}
 388:	e8bd4000 	pop	{lr}
 38c:	e12fff1e 	bx	lr

00000390 <read>:
 390:	e92d4000 	push	{lr}
 394:	e92d0008 	push	{r3}
 398:	e92d0004 	push	{r2}
 39c:	e92d0002 	push	{r1}
 3a0:	e92d0001 	push	{r0}
 3a4:	e3a00005 	mov	r0, #5
 3a8:	ef000040 	svc	0x00000040
 3ac:	e8bd0002 	pop	{r1}
 3b0:	e8bd0002 	pop	{r1}
 3b4:	e8bd0004 	pop	{r2}
 3b8:	e8bd0008 	pop	{r3}
 3bc:	e8bd4000 	pop	{lr}
 3c0:	e12fff1e 	bx	lr

000003c4 <write>:
 3c4:	e92d4000 	push	{lr}
 3c8:	e92d0008 	push	{r3}
 3cc:	e92d0004 	push	{r2}
 3d0:	e92d0002 	push	{r1}
 3d4:	e92d0001 	push	{r0}
 3d8:	e3a00010 	mov	r0, #16
 3dc:	ef000040 	svc	0x00000040
 3e0:	e8bd0002 	pop	{r1}
 3e4:	e8bd0002 	pop	{r1}
 3e8:	e8bd0004 	pop	{r2}
 3ec:	e8bd0008 	pop	{r3}
 3f0:	e8bd4000 	pop	{lr}
 3f4:	e12fff1e 	bx	lr

000003f8 <close>:
 3f8:	e92d4000 	push	{lr}
 3fc:	e92d0008 	push	{r3}
 400:	e92d0004 	push	{r2}
 404:	e92d0002 	push	{r1}
 408:	e92d0001 	push	{r0}
 40c:	e3a00015 	mov	r0, #21
 410:	ef000040 	svc	0x00000040
 414:	e8bd0002 	pop	{r1}
 418:	e8bd0002 	pop	{r1}
 41c:	e8bd0004 	pop	{r2}
 420:	e8bd0008 	pop	{r3}
 424:	e8bd4000 	pop	{lr}
 428:	e12fff1e 	bx	lr

0000042c <kill>:
 42c:	e92d4000 	push	{lr}
 430:	e92d0008 	push	{r3}
 434:	e92d0004 	push	{r2}
 438:	e92d0002 	push	{r1}
 43c:	e92d0001 	push	{r0}
 440:	e3a00006 	mov	r0, #6
 444:	ef000040 	svc	0x00000040
 448:	e8bd0002 	pop	{r1}
 44c:	e8bd0002 	pop	{r1}
 450:	e8bd0004 	pop	{r2}
 454:	e8bd0008 	pop	{r3}
 458:	e8bd4000 	pop	{lr}
 45c:	e12fff1e 	bx	lr

00000460 <exec>:
 460:	e92d4000 	push	{lr}
 464:	e92d0008 	push	{r3}
 468:	e92d0004 	push	{r2}
 46c:	e92d0002 	push	{r1}
 470:	e92d0001 	push	{r0}
 474:	e3a00007 	mov	r0, #7
 478:	ef000040 	svc	0x00000040
 47c:	e8bd0002 	pop	{r1}
 480:	e8bd0002 	pop	{r1}
 484:	e8bd0004 	pop	{r2}
 488:	e8bd0008 	pop	{r3}
 48c:	e8bd4000 	pop	{lr}
 490:	e12fff1e 	bx	lr

00000494 <open>:
 494:	e92d4000 	push	{lr}
 498:	e92d0008 	push	{r3}
 49c:	e92d0004 	push	{r2}
 4a0:	e92d0002 	push	{r1}
 4a4:	e92d0001 	push	{r0}
 4a8:	e3a0000f 	mov	r0, #15
 4ac:	ef000040 	svc	0x00000040
 4b0:	e8bd0002 	pop	{r1}
 4b4:	e8bd0002 	pop	{r1}
 4b8:	e8bd0004 	pop	{r2}
 4bc:	e8bd0008 	pop	{r3}
 4c0:	e8bd4000 	pop	{lr}
 4c4:	e12fff1e 	bx	lr

000004c8 <mknod>:
 4c8:	e92d4000 	push	{lr}
 4cc:	e92d0008 	push	{r3}
 4d0:	e92d0004 	push	{r2}
 4d4:	e92d0002 	push	{r1}
 4d8:	e92d0001 	push	{r0}
 4dc:	e3a00011 	mov	r0, #17
 4e0:	ef000040 	svc	0x00000040
 4e4:	e8bd0002 	pop	{r1}
 4e8:	e8bd0002 	pop	{r1}
 4ec:	e8bd0004 	pop	{r2}
 4f0:	e8bd0008 	pop	{r3}
 4f4:	e8bd4000 	pop	{lr}
 4f8:	e12fff1e 	bx	lr

000004fc <unlink>:
 4fc:	e92d4000 	push	{lr}
 500:	e92d0008 	push	{r3}
 504:	e92d0004 	push	{r2}
 508:	e92d0002 	push	{r1}
 50c:	e92d0001 	push	{r0}
 510:	e3a00012 	mov	r0, #18
 514:	ef000040 	svc	0x00000040
 518:	e8bd0002 	pop	{r1}
 51c:	e8bd0002 	pop	{r1}
 520:	e8bd0004 	pop	{r2}
 524:	e8bd0008 	pop	{r3}
 528:	e8bd4000 	pop	{lr}
 52c:	e12fff1e 	bx	lr

00000530 <fstat>:
 530:	e92d4000 	push	{lr}
 534:	e92d0008 	push	{r3}
 538:	e92d0004 	push	{r2}
 53c:	e92d0002 	push	{r1}
 540:	e92d0001 	push	{r0}
 544:	e3a00008 	mov	r0, #8
 548:	ef000040 	svc	0x00000040
 54c:	e8bd0002 	pop	{r1}
 550:	e8bd0002 	pop	{r1}
 554:	e8bd0004 	pop	{r2}
 558:	e8bd0008 	pop	{r3}
 55c:	e8bd4000 	pop	{lr}
 560:	e12fff1e 	bx	lr

00000564 <link>:
 564:	e92d4000 	push	{lr}
 568:	e92d0008 	push	{r3}
 56c:	e92d0004 	push	{r2}
 570:	e92d0002 	push	{r1}
 574:	e92d0001 	push	{r0}
 578:	e3a00013 	mov	r0, #19
 57c:	ef000040 	svc	0x00000040
 580:	e8bd0002 	pop	{r1}
 584:	e8bd0002 	pop	{r1}
 588:	e8bd0004 	pop	{r2}
 58c:	e8bd0008 	pop	{r3}
 590:	e8bd4000 	pop	{lr}
 594:	e12fff1e 	bx	lr

00000598 <mkdir>:
 598:	e92d4000 	push	{lr}
 59c:	e92d0008 	push	{r3}
 5a0:	e92d0004 	push	{r2}
 5a4:	e92d0002 	push	{r1}
 5a8:	e92d0001 	push	{r0}
 5ac:	e3a00014 	mov	r0, #20
 5b0:	ef000040 	svc	0x00000040
 5b4:	e8bd0002 	pop	{r1}
 5b8:	e8bd0002 	pop	{r1}
 5bc:	e8bd0004 	pop	{r2}
 5c0:	e8bd0008 	pop	{r3}
 5c4:	e8bd4000 	pop	{lr}
 5c8:	e12fff1e 	bx	lr

000005cc <chdir>:
 5cc:	e92d4000 	push	{lr}
 5d0:	e92d0008 	push	{r3}
 5d4:	e92d0004 	push	{r2}
 5d8:	e92d0002 	push	{r1}
 5dc:	e92d0001 	push	{r0}
 5e0:	e3a00009 	mov	r0, #9
 5e4:	ef000040 	svc	0x00000040
 5e8:	e8bd0002 	pop	{r1}
 5ec:	e8bd0002 	pop	{r1}
 5f0:	e8bd0004 	pop	{r2}
 5f4:	e8bd0008 	pop	{r3}
 5f8:	e8bd4000 	pop	{lr}
 5fc:	e12fff1e 	bx	lr

00000600 <dup>:
 600:	e92d4000 	push	{lr}
 604:	e92d0008 	push	{r3}
 608:	e92d0004 	push	{r2}
 60c:	e92d0002 	push	{r1}
 610:	e92d0001 	push	{r0}
 614:	e3a0000a 	mov	r0, #10
 618:	ef000040 	svc	0x00000040
 61c:	e8bd0002 	pop	{r1}
 620:	e8bd0002 	pop	{r1}
 624:	e8bd0004 	pop	{r2}
 628:	e8bd0008 	pop	{r3}
 62c:	e8bd4000 	pop	{lr}
 630:	e12fff1e 	bx	lr

00000634 <getpid>:
 634:	e92d4000 	push	{lr}
 638:	e92d0008 	push	{r3}
 63c:	e92d0004 	push	{r2}
 640:	e92d0002 	push	{r1}
 644:	e92d0001 	push	{r0}
 648:	e3a0000b 	mov	r0, #11
 64c:	ef000040 	svc	0x00000040
 650:	e8bd0002 	pop	{r1}
 654:	e8bd0002 	pop	{r1}
 658:	e8bd0004 	pop	{r2}
 65c:	e8bd0008 	pop	{r3}
 660:	e8bd4000 	pop	{lr}
 664:	e12fff1e 	bx	lr

00000668 <sbrk>:
 668:	e92d4000 	push	{lr}
 66c:	e92d0008 	push	{r3}
 670:	e92d0004 	push	{r2}
 674:	e92d0002 	push	{r1}
 678:	e92d0001 	push	{r0}
 67c:	e3a0000c 	mov	r0, #12
 680:	ef000040 	svc	0x00000040
 684:	e8bd0002 	pop	{r1}
 688:	e8bd0002 	pop	{r1}
 68c:	e8bd0004 	pop	{r2}
 690:	e8bd0008 	pop	{r3}
 694:	e8bd4000 	pop	{lr}
 698:	e12fff1e 	bx	lr

0000069c <sleep>:
 69c:	e92d4000 	push	{lr}
 6a0:	e92d0008 	push	{r3}
 6a4:	e92d0004 	push	{r2}
 6a8:	e92d0002 	push	{r1}
 6ac:	e92d0001 	push	{r0}
 6b0:	e3a0000d 	mov	r0, #13
 6b4:	ef000040 	svc	0x00000040
 6b8:	e8bd0002 	pop	{r1}
 6bc:	e8bd0002 	pop	{r1}
 6c0:	e8bd0004 	pop	{r2}
 6c4:	e8bd0008 	pop	{r3}
 6c8:	e8bd4000 	pop	{lr}
 6cc:	e12fff1e 	bx	lr

000006d0 <uptime>:
 6d0:	e92d4000 	push	{lr}
 6d4:	e92d0008 	push	{r3}
 6d8:	e92d0004 	push	{r2}
 6dc:	e92d0002 	push	{r1}
 6e0:	e92d0001 	push	{r0}
 6e4:	e3a0000e 	mov	r0, #14
 6e8:	ef000040 	svc	0x00000040
 6ec:	e8bd0002 	pop	{r1}
 6f0:	e8bd0002 	pop	{r1}
 6f4:	e8bd0004 	pop	{r2}
 6f8:	e8bd0008 	pop	{r3}
 6fc:	e8bd4000 	pop	{lr}
 700:	e12fff1e 	bx	lr

00000704 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 704:	e92d4800 	push	{fp, lr}
 708:	e28db004 	add	fp, sp, #4
 70c:	e24b3004 	sub	r3, fp, #4
 710:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 714:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 718:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 71c:	e1a01003 	mov	r1, r3
 720:	ebffff27 	bl	3c4 <write>
}
 724:	e24bd004 	sub	sp, fp, #4
 728:	e8bd8800 	pop	{fp, pc}

0000072c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 72c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 730:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 734:	e1a00fa1 	lsr	r0, r1, #31
 738:	e3530000 	cmp	r3, #0
 73c:	03a03000 	moveq	r3, #0
 740:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 744:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 748:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 74c:	e24dd014 	sub	sp, sp, #20
 750:	e59f909c 	ldr	r9, [pc, #156]	; 7f4 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 754:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 758:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 75c:	e3a0a000 	mov	sl, #0
 760:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 764:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 768:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 76c:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 770:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 774:	e1a0e031 	lsr	lr, r1, r0
 778:	e20ee001 	and	lr, lr, #1
 77c:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 780:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 784:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 788:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 78c:	e2500001 	subs	r0, r0, #1
 790:	2afffff7 	bcs	774 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 794:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 798:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 79c:	e0601001 	rsb	r1, r0, r1
 7a0:	e28a5001 	add	r5, sl, #1
 7a4:	e7d91001 	ldrb	r1, [r9, r1]
 7a8:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 7ac:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7b0:	11a0a005 	movne	sl, r5
 7b4:	1affffeb 	bne	768 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 7b8:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 7bc:	124b2024 	subne	r2, fp, #36	; 0x24
 7c0:	10823005 	addne	r3, r2, r5
 7c4:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 7c8:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 7cc:	13a0202d 	movne	r2, #45	; 0x2d
 7d0:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7d4:	e7d61005 	ldrb	r1, [r6, r5]
 7d8:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7dc:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 7e0:	ebffffc7 	bl	704 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7e4:	e3750001 	cmn	r5, #1
 7e8:	1afffff9 	bne	7d4 <printint+0xa8>
    putc(fd, buf[i]);
}
 7ec:	e24bd020 	sub	sp, fp, #32
 7f0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 7f4:	00000b50 	.word	0x00000b50

000007f8 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7f8:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 7fc:	e92d0830 	push	{r4, r5, fp}
 800:	e1a02000 	mov	r2, r0
 804:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 808:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 80c:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 810:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 814:	e1a04c32 	lsr	r4, r2, ip
 818:	e2044001 	and	r4, r4, #1
 81c:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 820:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 824:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 828:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 82c:	e25cc001 	subs	ip, ip, #1
 830:	2afffff7 	bcs	814 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 834:	e24bd008 	sub	sp, fp, #8
 838:	e8bd0830 	pop	{r4, r5, fp}
 83c:	e12fff1e 	bx	lr

00000840 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 840:	e92d000e 	push	{r1, r2, r3}
 844:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 848:	e28db020 	add	fp, sp, #32
 84c:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 850:	e59b4004 	ldr	r4, [fp, #4]
 854:	e5d48000 	ldrb	r8, [r4]
 858:	e3580000 	cmp	r8, #0
 85c:	0a000027 	beq	900 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 860:	e59f712c 	ldr	r7, [pc, #300]	; 994 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 864:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 868:	e3a0a000 	mov	sl, #0
 86c:	ea000008 	b	894 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 870:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 874:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 878:	0a000002 	beq	888 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 87c:	e1a00005 	mov	r0, r5
 880:	e1a01008 	mov	r1, r8
 884:	ebffff9e 	bl	704 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 888:	e5f48001 	ldrb	r8, [r4, #1]!
 88c:	e3580000 	cmp	r8, #0
 890:	0a00001a 	beq	900 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 894:	e35a0000 	cmp	sl, #0
 898:	0afffff4 	beq	870 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 89c:	e35a0025 	cmp	sl, #37	; 0x25
 8a0:	1afffff8 	bne	888 <printf+0x48>
      if(c == 'd'){
 8a4:	e3580064 	cmp	r8, #100	; 0x64
 8a8:	0a00002c 	beq	960 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8ac:	e3580078 	cmp	r8, #120	; 0x78
 8b0:	13580070 	cmpne	r8, #112	; 0x70
 8b4:	13a09000 	movne	r9, #0
 8b8:	03a09001 	moveq	r9, #1
 8bc:	0a000013 	beq	910 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8c0:	e3580073 	cmp	r8, #115	; 0x73
 8c4:	0a000018 	beq	92c <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8c8:	e3580063 	cmp	r8, #99	; 0x63
 8cc:	0a00002a 	beq	97c <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8d0:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 8d4:	e1a0100a 	mov	r1, sl
 8d8:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8dc:	0a000002 	beq	8ec <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8e0:	ebffff87 	bl	704 <putc>
        putc(fd, c);
 8e4:	e1a00005 	mov	r0, r5
 8e8:	e1a01008 	mov	r1, r8
 8ec:	ebffff84 	bl	704 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f0:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8f4:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f8:	e3580000 	cmp	r8, #0
 8fc:	1affffe4 	bne	894 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 900:	e24bd020 	sub	sp, fp, #32
 904:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 908:	e28dd00c 	add	sp, sp, #12
 90c:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 910:	e1a00005 	mov	r0, r5
 914:	e4961004 	ldr	r1, [r6], #4
 918:	e3a02010 	mov	r2, #16
 91c:	e3a03000 	mov	r3, #0
 920:	ebffff81 	bl	72c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 924:	e3a0a000 	mov	sl, #0
 928:	eaffffd6 	b	888 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 92c:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 930:	e3580000 	cmp	r8, #0
 934:	01a08007 	moveq	r8, r7
        while(*s != 0){
 938:	e5d81000 	ldrb	r1, [r8]
 93c:	e3510000 	cmp	r1, #0
 940:	0a000004 	beq	958 <printf+0x118>
          putc(fd, *s);
 944:	e1a00005 	mov	r0, r5
 948:	ebffff6d 	bl	704 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 94c:	e5f81001 	ldrb	r1, [r8, #1]!
 950:	e3510000 	cmp	r1, #0
 954:	1afffffa 	bne	944 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 958:	e1a0a001 	mov	sl, r1
 95c:	eaffffc9 	b	888 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 960:	e1a00005 	mov	r0, r5
 964:	e4961004 	ldr	r1, [r6], #4
 968:	e3a0200a 	mov	r2, #10
 96c:	e3a03001 	mov	r3, #1
 970:	ebffff6d 	bl	72c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 974:	e3a0a000 	mov	sl, #0
 978:	eaffffc2 	b	888 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 97c:	e4961004 	ldr	r1, [r6], #4
 980:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 984:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 988:	e6ef1071 	uxtb	r1, r1
 98c:	ebffff5c 	bl	704 <putc>
 990:	eaffffbc 	b	888 <printf+0x48>
 994:	00000b64 	.word	0x00000b64

00000998 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 998:	e59f3098 	ldr	r3, [pc, #152]	; a38 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 99c:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9a0:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a4:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 9a8:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ac:	e152000c 	cmp	r2, ip
 9b0:	e5921000 	ldr	r1, [r2]
 9b4:	2a000001 	bcs	9c0 <free+0x28>
 9b8:	e15c0001 	cmp	ip, r1
 9bc:	3a000007 	bcc	9e0 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9c0:	e1520001 	cmp	r2, r1
 9c4:	3a000003 	bcc	9d8 <free+0x40>
 9c8:	e152000c 	cmp	r2, ip
 9cc:	3a000003 	bcc	9e0 <free+0x48>
 9d0:	e15c0001 	cmp	ip, r1
 9d4:	3a000001 	bcc	9e0 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d8:	e1a02001 	mov	r2, r1
 9dc:	eafffff2 	b	9ac <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9e0:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9e4:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9e8:	e08c5184 	add	r5, ip, r4, lsl #3
 9ec:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 9f0:	05911004 	ldreq	r1, [r1, #4]
 9f4:	00814004 	addeq	r4, r1, r4
 9f8:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 9fc:	05921000 	ldreq	r1, [r2]
 a00:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 a04:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 a08:	e5921004 	ldr	r1, [r2, #4]
 a0c:	e0824181 	add	r4, r2, r1, lsl #3
 a10:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a14:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a18:	0510c004 	ldreq	ip, [r0, #-4]
 a1c:	008c1001 	addeq	r1, ip, r1
 a20:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 a24:	05101008 	ldreq	r1, [r0, #-8]
 a28:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a2c:	e24bd008 	sub	sp, fp, #8
 a30:	e8bd0830 	pop	{r4, r5, fp}
 a34:	e12fff1e 	bx	lr
 a38:	00000b6c 	.word	0x00000b6c

00000a3c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a3c:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a40:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 a44:	e59f50d4 	ldr	r5, [pc, #212]	; b20 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a48:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 a4c:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a50:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a54:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a58:	e3530000 	cmp	r3, #0
 a5c:	0a00002b 	beq	b10 <malloc+0xd4>
 a60:	e5930000 	ldr	r0, [r3]
 a64:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a68:	e1520004 	cmp	r2, r4
 a6c:	2a00001b 	bcs	ae0 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a70:	e59f80ac 	ldr	r8, [pc, #172]	; b24 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 a74:	e1a07184 	lsl	r7, r4, #3
 a78:	ea000003 	b	a8c <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a7c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 a80:	e5902004 	ldr	r2, [r0, #4]
 a84:	e1540002 	cmp	r4, r2
 a88:	9a000014 	bls	ae0 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a8c:	e5952000 	ldr	r2, [r5]
 a90:	e1a03000 	mov	r3, r0
 a94:	e1500002 	cmp	r0, r2
 a98:	1afffff7 	bne	a7c <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a9c:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 aa0:	81a00007 	movhi	r0, r7
 aa4:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 aa8:	81a06004 	movhi	r6, r4
 aac:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 ab0:	ebfffeec 	bl	668 <sbrk>
 ab4:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ab8:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 abc:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 ac0:	0a000010 	beq	b08 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 ac4:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 ac8:	ebffffb2 	bl	998 <free>
  return freep;
 acc:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 ad0:	e3530000 	cmp	r3, #0
 ad4:	1affffe8 	bne	a7c <malloc+0x40>
        return 0;
 ad8:	e1a00003 	mov	r0, r3
  }
}
 adc:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ae0:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ae4:	10642002 	rsbne	r2, r4, r2
 ae8:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 aec:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 af0:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 af4:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 af8:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 afc:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 b00:	e2800008 	add	r0, r0, #8
 b04:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 b08:	e3a00000 	mov	r0, #0
 b0c:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b10:	e2850004 	add	r0, r5, #4
 b14:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 b18:	e9850009 	stmib	r5, {r0, r3}
 b1c:	eaffffd3 	b	a70 <malloc+0x34>
 b20:	00000b6c 	.word	0x00000b6c
 b24:	00000fff 	.word	0x00000fff
