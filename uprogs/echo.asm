
_echo:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
   0:	e3500001 	cmp	r0, #1
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   4:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
   8:	e1a06000 	mov	r6, r0
   c:	e28db014 	add	fp, sp, #20
  int i;

  for(i = 1; i < argc; i++)
  10:	da000011 	ble	5c <main+0x5c>
  14:	e3a04001 	mov	r4, #1
  18:	e1a05001 	mov	r5, r1
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1c:	e2844001 	add	r4, r4, #1
  20:	e1540006 	cmp	r4, r6
  24:	e5b52004 	ldr	r2, [r5, #4]!
  28:	e3a00001 	mov	r0, #1
  2c:	e59f102c 	ldr	r1, [pc, #44]	; 60 <main+0x60>
  30:	0a000007 	beq	54 <main+0x54>
  34:	e59f3028 	ldr	r3, [pc, #40]	; 64 <main+0x64>
  38:	e2844001 	add	r4, r4, #1
  3c:	eb000205 	bl	858 <printf>
  40:	e1540006 	cmp	r4, r6
  44:	e5b52004 	ldr	r2, [r5, #4]!
  48:	e3a00001 	mov	r0, #1
  4c:	e59f100c 	ldr	r1, [pc, #12]	; 60 <main+0x60>
  50:	1afffff7 	bne	34 <main+0x34>
  54:	e59f300c 	ldr	r3, [pc, #12]	; 68 <main+0x68>
  58:	eb0001fe 	bl	858 <printf>
  exit();
  5c:	eb0000aa 	bl	30c <exit>
  60:	00000b40 	.word	0x00000b40
  64:	00000b48 	.word	0x00000b48
  68:	00000b4c 	.word	0x00000b4c

0000006c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  70:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  74:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  78:	e4d13001 	ldrb	r3, [r1], #1
  7c:	e3530000 	cmp	r3, #0
  80:	e4c23001 	strb	r3, [r2], #1
  84:	1afffffb 	bne	78 <strcpy+0xc>
    ;
  return os;
}
  88:	e28bd000 	add	sp, fp, #0
  8c:	e8bd0800 	pop	{fp}
  90:	e12fff1e 	bx	lr

00000094 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  94:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  98:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  9c:	e5d03000 	ldrb	r3, [r0]
  a0:	e5d12000 	ldrb	r2, [r1]
  a4:	e3530000 	cmp	r3, #0
  a8:	1a000004 	bne	c0 <strcmp+0x2c>
  ac:	ea000005 	b	c8 <strcmp+0x34>
  b0:	e5f03001 	ldrb	r3, [r0, #1]!
  b4:	e3530000 	cmp	r3, #0
  b8:	0a000006 	beq	d8 <strcmp+0x44>
  bc:	e5f12001 	ldrb	r2, [r1, #1]!
  c0:	e1530002 	cmp	r3, r2
  c4:	0afffff9 	beq	b0 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  c8:	e0620003 	rsb	r0, r2, r3
  cc:	e28bd000 	add	sp, fp, #0
  d0:	e8bd0800 	pop	{fp}
  d4:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d8:	e5d12001 	ldrb	r2, [r1, #1]
  dc:	eafffff9 	b	c8 <strcmp+0x34>

000000e0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  e4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  e8:	e5d03000 	ldrb	r3, [r0]
  ec:	e3530000 	cmp	r3, #0
  f0:	01a00003 	moveq	r0, r3
  f4:	0a000006 	beq	114 <strlen+0x34>
  f8:	e1a02000 	mov	r2, r0
  fc:	e3a03000 	mov	r3, #0
 100:	e5f21001 	ldrb	r1, [r2, #1]!
 104:	e2833001 	add	r3, r3, #1
 108:	e1a00003 	mov	r0, r3
 10c:	e3510000 	cmp	r1, #0
 110:	1afffffa 	bne	100 <strlen+0x20>
    ;
  return n;
}
 114:	e28bd000 	add	sp, fp, #0
 118:	e8bd0800 	pop	{fp}
 11c:	e12fff1e 	bx	lr

00000120 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 120:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 124:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 128:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 12c:	0a000006 	beq	14c <memset+0x2c>
 130:	e6ef1071 	uxtb	r1, r1
 134:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 138:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 13c:	e2533001 	subs	r3, r3, #1
 140:	e4cc1001 	strb	r1, [ip], #1
 144:	1afffffc 	bne	13c <memset+0x1c>
 148:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 14c:	e28bd000 	add	sp, fp, #0
 150:	e8bd0800 	pop	{fp}
 154:	e12fff1e 	bx	lr

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 15c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 160:	e5d03000 	ldrb	r3, [r0]
 164:	e3530000 	cmp	r3, #0
 168:	1a000004 	bne	180 <strchr+0x28>
 16c:	ea000008 	b	194 <strchr+0x3c>
 170:	e5d03001 	ldrb	r3, [r0, #1]
 174:	e2800001 	add	r0, r0, #1
 178:	e3530000 	cmp	r3, #0
 17c:	0a000004 	beq	194 <strchr+0x3c>
    if(*s == c)
 180:	e1530001 	cmp	r3, r1
 184:	1afffff9 	bne	170 <strchr+0x18>
      return (char*)s;
  return 0;
}
 188:	e28bd000 	add	sp, fp, #0
 18c:	e8bd0800 	pop	{fp}
 190:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 194:	e1a00003 	mov	r0, r3
 198:	eafffffa 	b	188 <strchr+0x30>

0000019c <gets>:
}

char*
gets(char *buf, int max)
{
 19c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1a0:	e28db018 	add	fp, sp, #24
 1a4:	e24dd00c 	sub	sp, sp, #12
 1a8:	e1a08000 	mov	r8, r0
 1ac:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b0:	e1a06000 	mov	r6, r0
 1b4:	e3a05000 	mov	r5, #0
 1b8:	ea000008 	b	1e0 <gets+0x44>
    cc = read(0, &c, 1);
 1bc:	eb000079 	bl	3a8 <read>
    if(cc < 1)
 1c0:	e3500000 	cmp	r0, #0
 1c4:	da00000b 	ble	1f8 <gets+0x5c>
      break;
    buf[i++] = c;
 1c8:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 1cc:	e1a05004 	mov	r5, r4
 1d0:	e353000a 	cmp	r3, #10
 1d4:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1d8:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 1dc:	0a00000a 	beq	20c <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e0:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e4:	e0854002 	add	r4, r5, r2
 1e8:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1ec:	e3a00000 	mov	r0, #0
 1f0:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f4:	bafffff0 	blt	1bc <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f8:	e3a03000 	mov	r3, #0
 1fc:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 200:	e1a00008 	mov	r0, r8
 204:	e24bd018 	sub	sp, fp, #24
 208:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20c:	e1a05004 	mov	r5, r4
 210:	eafffff8 	b	1f8 <gets+0x5c>

00000214 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 214:	e92d4830 	push	{r4, r5, fp, lr}
 218:	e1a05001 	mov	r5, r1
 21c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 220:	e3a01000 	mov	r1, #0
 224:	eb0000a0 	bl	4ac <open>
  if(fd < 0)
 228:	e2504000 	subs	r4, r0, #0
    return -1;
 22c:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 230:	ba000004 	blt	248 <stat+0x34>
    return -1;
  r = fstat(fd, st);
 234:	e1a01005 	mov	r1, r5
 238:	eb0000c2 	bl	548 <fstat>
 23c:	e1a05000 	mov	r5, r0
  close(fd);
 240:	e1a00004 	mov	r0, r4
 244:	eb000071 	bl	410 <close>
  return r;
}
 248:	e1a00005 	mov	r0, r5
 24c:	e8bd8830 	pop	{r4, r5, fp, pc}

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 254:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 258:	e5d03000 	ldrb	r3, [r0]
 25c:	e2432030 	sub	r2, r3, #48	; 0x30
 260:	e6ef2072 	uxtb	r2, r2
 264:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 268:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 26c:	8a000009 	bhi	298 <atoi+0x48>
 270:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 274:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 278:	e0800100 	add	r0, r0, r0, lsl #2
 27c:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 280:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 284:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 288:	e2431030 	sub	r1, r3, #48	; 0x30
 28c:	e6ef1071 	uxtb	r1, r1
 290:	e3510009 	cmp	r1, #9
 294:	9afffff7 	bls	278 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 298:	e28bd000 	add	sp, fp, #0
 29c:	e8bd0800 	pop	{fp}
 2a0:	e12fff1e 	bx	lr

000002a4 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a4:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2ac:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b0:	da000005 	ble	2cc <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 2b4:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 2b8:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 2bc:	e4d1c001 	ldrb	ip, [r1], #1
 2c0:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c4:	e1530002 	cmp	r3, r2
 2c8:	1afffffb 	bne	2bc <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2cc:	e28bd000 	add	sp, fp, #0
 2d0:	e8bd0800 	pop	{fp}
 2d4:	e12fff1e 	bx	lr

000002d8 <fork>:
 2d8:	e92d4000 	push	{lr}
 2dc:	e92d0008 	push	{r3}
 2e0:	e92d0004 	push	{r2}
 2e4:	e92d0002 	push	{r1}
 2e8:	e92d0001 	push	{r0}
 2ec:	e3a00001 	mov	r0, #1
 2f0:	ef000040 	svc	0x00000040
 2f4:	e8bd0002 	pop	{r1}
 2f8:	e8bd0002 	pop	{r1}
 2fc:	e8bd0004 	pop	{r2}
 300:	e8bd0008 	pop	{r3}
 304:	e8bd4000 	pop	{lr}
 308:	e12fff1e 	bx	lr

0000030c <exit>:
 30c:	e92d4000 	push	{lr}
 310:	e92d0008 	push	{r3}
 314:	e92d0004 	push	{r2}
 318:	e92d0002 	push	{r1}
 31c:	e92d0001 	push	{r0}
 320:	e3a00002 	mov	r0, #2
 324:	ef000040 	svc	0x00000040
 328:	e8bd0002 	pop	{r1}
 32c:	e8bd0002 	pop	{r1}
 330:	e8bd0004 	pop	{r2}
 334:	e8bd0008 	pop	{r3}
 338:	e8bd4000 	pop	{lr}
 33c:	e12fff1e 	bx	lr

00000340 <wait>:
 340:	e92d4000 	push	{lr}
 344:	e92d0008 	push	{r3}
 348:	e92d0004 	push	{r2}
 34c:	e92d0002 	push	{r1}
 350:	e92d0001 	push	{r0}
 354:	e3a00003 	mov	r0, #3
 358:	ef000040 	svc	0x00000040
 35c:	e8bd0002 	pop	{r1}
 360:	e8bd0002 	pop	{r1}
 364:	e8bd0004 	pop	{r2}
 368:	e8bd0008 	pop	{r3}
 36c:	e8bd4000 	pop	{lr}
 370:	e12fff1e 	bx	lr

00000374 <pipe>:
 374:	e92d4000 	push	{lr}
 378:	e92d0008 	push	{r3}
 37c:	e92d0004 	push	{r2}
 380:	e92d0002 	push	{r1}
 384:	e92d0001 	push	{r0}
 388:	e3a00004 	mov	r0, #4
 38c:	ef000040 	svc	0x00000040
 390:	e8bd0002 	pop	{r1}
 394:	e8bd0002 	pop	{r1}
 398:	e8bd0004 	pop	{r2}
 39c:	e8bd0008 	pop	{r3}
 3a0:	e8bd4000 	pop	{lr}
 3a4:	e12fff1e 	bx	lr

000003a8 <read>:
 3a8:	e92d4000 	push	{lr}
 3ac:	e92d0008 	push	{r3}
 3b0:	e92d0004 	push	{r2}
 3b4:	e92d0002 	push	{r1}
 3b8:	e92d0001 	push	{r0}
 3bc:	e3a00005 	mov	r0, #5
 3c0:	ef000040 	svc	0x00000040
 3c4:	e8bd0002 	pop	{r1}
 3c8:	e8bd0002 	pop	{r1}
 3cc:	e8bd0004 	pop	{r2}
 3d0:	e8bd0008 	pop	{r3}
 3d4:	e8bd4000 	pop	{lr}
 3d8:	e12fff1e 	bx	lr

000003dc <write>:
 3dc:	e92d4000 	push	{lr}
 3e0:	e92d0008 	push	{r3}
 3e4:	e92d0004 	push	{r2}
 3e8:	e92d0002 	push	{r1}
 3ec:	e92d0001 	push	{r0}
 3f0:	e3a00010 	mov	r0, #16
 3f4:	ef000040 	svc	0x00000040
 3f8:	e8bd0002 	pop	{r1}
 3fc:	e8bd0002 	pop	{r1}
 400:	e8bd0004 	pop	{r2}
 404:	e8bd0008 	pop	{r3}
 408:	e8bd4000 	pop	{lr}
 40c:	e12fff1e 	bx	lr

00000410 <close>:
 410:	e92d4000 	push	{lr}
 414:	e92d0008 	push	{r3}
 418:	e92d0004 	push	{r2}
 41c:	e92d0002 	push	{r1}
 420:	e92d0001 	push	{r0}
 424:	e3a00015 	mov	r0, #21
 428:	ef000040 	svc	0x00000040
 42c:	e8bd0002 	pop	{r1}
 430:	e8bd0002 	pop	{r1}
 434:	e8bd0004 	pop	{r2}
 438:	e8bd0008 	pop	{r3}
 43c:	e8bd4000 	pop	{lr}
 440:	e12fff1e 	bx	lr

00000444 <kill>:
 444:	e92d4000 	push	{lr}
 448:	e92d0008 	push	{r3}
 44c:	e92d0004 	push	{r2}
 450:	e92d0002 	push	{r1}
 454:	e92d0001 	push	{r0}
 458:	e3a00006 	mov	r0, #6
 45c:	ef000040 	svc	0x00000040
 460:	e8bd0002 	pop	{r1}
 464:	e8bd0002 	pop	{r1}
 468:	e8bd0004 	pop	{r2}
 46c:	e8bd0008 	pop	{r3}
 470:	e8bd4000 	pop	{lr}
 474:	e12fff1e 	bx	lr

00000478 <exec>:
 478:	e92d4000 	push	{lr}
 47c:	e92d0008 	push	{r3}
 480:	e92d0004 	push	{r2}
 484:	e92d0002 	push	{r1}
 488:	e92d0001 	push	{r0}
 48c:	e3a00007 	mov	r0, #7
 490:	ef000040 	svc	0x00000040
 494:	e8bd0002 	pop	{r1}
 498:	e8bd0002 	pop	{r1}
 49c:	e8bd0004 	pop	{r2}
 4a0:	e8bd0008 	pop	{r3}
 4a4:	e8bd4000 	pop	{lr}
 4a8:	e12fff1e 	bx	lr

000004ac <open>:
 4ac:	e92d4000 	push	{lr}
 4b0:	e92d0008 	push	{r3}
 4b4:	e92d0004 	push	{r2}
 4b8:	e92d0002 	push	{r1}
 4bc:	e92d0001 	push	{r0}
 4c0:	e3a0000f 	mov	r0, #15
 4c4:	ef000040 	svc	0x00000040
 4c8:	e8bd0002 	pop	{r1}
 4cc:	e8bd0002 	pop	{r1}
 4d0:	e8bd0004 	pop	{r2}
 4d4:	e8bd0008 	pop	{r3}
 4d8:	e8bd4000 	pop	{lr}
 4dc:	e12fff1e 	bx	lr

000004e0 <mknod>:
 4e0:	e92d4000 	push	{lr}
 4e4:	e92d0008 	push	{r3}
 4e8:	e92d0004 	push	{r2}
 4ec:	e92d0002 	push	{r1}
 4f0:	e92d0001 	push	{r0}
 4f4:	e3a00011 	mov	r0, #17
 4f8:	ef000040 	svc	0x00000040
 4fc:	e8bd0002 	pop	{r1}
 500:	e8bd0002 	pop	{r1}
 504:	e8bd0004 	pop	{r2}
 508:	e8bd0008 	pop	{r3}
 50c:	e8bd4000 	pop	{lr}
 510:	e12fff1e 	bx	lr

00000514 <unlink>:
 514:	e92d4000 	push	{lr}
 518:	e92d0008 	push	{r3}
 51c:	e92d0004 	push	{r2}
 520:	e92d0002 	push	{r1}
 524:	e92d0001 	push	{r0}
 528:	e3a00012 	mov	r0, #18
 52c:	ef000040 	svc	0x00000040
 530:	e8bd0002 	pop	{r1}
 534:	e8bd0002 	pop	{r1}
 538:	e8bd0004 	pop	{r2}
 53c:	e8bd0008 	pop	{r3}
 540:	e8bd4000 	pop	{lr}
 544:	e12fff1e 	bx	lr

00000548 <fstat>:
 548:	e92d4000 	push	{lr}
 54c:	e92d0008 	push	{r3}
 550:	e92d0004 	push	{r2}
 554:	e92d0002 	push	{r1}
 558:	e92d0001 	push	{r0}
 55c:	e3a00008 	mov	r0, #8
 560:	ef000040 	svc	0x00000040
 564:	e8bd0002 	pop	{r1}
 568:	e8bd0002 	pop	{r1}
 56c:	e8bd0004 	pop	{r2}
 570:	e8bd0008 	pop	{r3}
 574:	e8bd4000 	pop	{lr}
 578:	e12fff1e 	bx	lr

0000057c <link>:
 57c:	e92d4000 	push	{lr}
 580:	e92d0008 	push	{r3}
 584:	e92d0004 	push	{r2}
 588:	e92d0002 	push	{r1}
 58c:	e92d0001 	push	{r0}
 590:	e3a00013 	mov	r0, #19
 594:	ef000040 	svc	0x00000040
 598:	e8bd0002 	pop	{r1}
 59c:	e8bd0002 	pop	{r1}
 5a0:	e8bd0004 	pop	{r2}
 5a4:	e8bd0008 	pop	{r3}
 5a8:	e8bd4000 	pop	{lr}
 5ac:	e12fff1e 	bx	lr

000005b0 <mkdir>:
 5b0:	e92d4000 	push	{lr}
 5b4:	e92d0008 	push	{r3}
 5b8:	e92d0004 	push	{r2}
 5bc:	e92d0002 	push	{r1}
 5c0:	e92d0001 	push	{r0}
 5c4:	e3a00014 	mov	r0, #20
 5c8:	ef000040 	svc	0x00000040
 5cc:	e8bd0002 	pop	{r1}
 5d0:	e8bd0002 	pop	{r1}
 5d4:	e8bd0004 	pop	{r2}
 5d8:	e8bd0008 	pop	{r3}
 5dc:	e8bd4000 	pop	{lr}
 5e0:	e12fff1e 	bx	lr

000005e4 <chdir>:
 5e4:	e92d4000 	push	{lr}
 5e8:	e92d0008 	push	{r3}
 5ec:	e92d0004 	push	{r2}
 5f0:	e92d0002 	push	{r1}
 5f4:	e92d0001 	push	{r0}
 5f8:	e3a00009 	mov	r0, #9
 5fc:	ef000040 	svc	0x00000040
 600:	e8bd0002 	pop	{r1}
 604:	e8bd0002 	pop	{r1}
 608:	e8bd0004 	pop	{r2}
 60c:	e8bd0008 	pop	{r3}
 610:	e8bd4000 	pop	{lr}
 614:	e12fff1e 	bx	lr

00000618 <dup>:
 618:	e92d4000 	push	{lr}
 61c:	e92d0008 	push	{r3}
 620:	e92d0004 	push	{r2}
 624:	e92d0002 	push	{r1}
 628:	e92d0001 	push	{r0}
 62c:	e3a0000a 	mov	r0, #10
 630:	ef000040 	svc	0x00000040
 634:	e8bd0002 	pop	{r1}
 638:	e8bd0002 	pop	{r1}
 63c:	e8bd0004 	pop	{r2}
 640:	e8bd0008 	pop	{r3}
 644:	e8bd4000 	pop	{lr}
 648:	e12fff1e 	bx	lr

0000064c <getpid>:
 64c:	e92d4000 	push	{lr}
 650:	e92d0008 	push	{r3}
 654:	e92d0004 	push	{r2}
 658:	e92d0002 	push	{r1}
 65c:	e92d0001 	push	{r0}
 660:	e3a0000b 	mov	r0, #11
 664:	ef000040 	svc	0x00000040
 668:	e8bd0002 	pop	{r1}
 66c:	e8bd0002 	pop	{r1}
 670:	e8bd0004 	pop	{r2}
 674:	e8bd0008 	pop	{r3}
 678:	e8bd4000 	pop	{lr}
 67c:	e12fff1e 	bx	lr

00000680 <sbrk>:
 680:	e92d4000 	push	{lr}
 684:	e92d0008 	push	{r3}
 688:	e92d0004 	push	{r2}
 68c:	e92d0002 	push	{r1}
 690:	e92d0001 	push	{r0}
 694:	e3a0000c 	mov	r0, #12
 698:	ef000040 	svc	0x00000040
 69c:	e8bd0002 	pop	{r1}
 6a0:	e8bd0002 	pop	{r1}
 6a4:	e8bd0004 	pop	{r2}
 6a8:	e8bd0008 	pop	{r3}
 6ac:	e8bd4000 	pop	{lr}
 6b0:	e12fff1e 	bx	lr

000006b4 <sleep>:
 6b4:	e92d4000 	push	{lr}
 6b8:	e92d0008 	push	{r3}
 6bc:	e92d0004 	push	{r2}
 6c0:	e92d0002 	push	{r1}
 6c4:	e92d0001 	push	{r0}
 6c8:	e3a0000d 	mov	r0, #13
 6cc:	ef000040 	svc	0x00000040
 6d0:	e8bd0002 	pop	{r1}
 6d4:	e8bd0002 	pop	{r1}
 6d8:	e8bd0004 	pop	{r2}
 6dc:	e8bd0008 	pop	{r3}
 6e0:	e8bd4000 	pop	{lr}
 6e4:	e12fff1e 	bx	lr

000006e8 <uptime>:
 6e8:	e92d4000 	push	{lr}
 6ec:	e92d0008 	push	{r3}
 6f0:	e92d0004 	push	{r2}
 6f4:	e92d0002 	push	{r1}
 6f8:	e92d0001 	push	{r0}
 6fc:	e3a0000e 	mov	r0, #14
 700:	ef000040 	svc	0x00000040
 704:	e8bd0002 	pop	{r1}
 708:	e8bd0002 	pop	{r1}
 70c:	e8bd0004 	pop	{r2}
 710:	e8bd0008 	pop	{r3}
 714:	e8bd4000 	pop	{lr}
 718:	e12fff1e 	bx	lr

0000071c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 71c:	e92d4800 	push	{fp, lr}
 720:	e28db004 	add	fp, sp, #4
 724:	e24b3004 	sub	r3, fp, #4
 728:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 72c:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 730:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 734:	e1a01003 	mov	r1, r3
 738:	ebffff27 	bl	3dc <write>
}
 73c:	e24bd004 	sub	sp, fp, #4
 740:	e8bd8800 	pop	{fp, pc}

00000744 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 744:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 748:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 74c:	e1a00fa1 	lsr	r0, r1, #31
 750:	e3530000 	cmp	r3, #0
 754:	03a03000 	moveq	r3, #0
 758:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 75c:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 760:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 764:	e24dd014 	sub	sp, sp, #20
 768:	e59f909c 	ldr	r9, [pc, #156]	; 80c <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 76c:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 770:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 774:	e3a0a000 	mov	sl, #0
 778:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 77c:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 780:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 784:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 788:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 78c:	e1a0e031 	lsr	lr, r1, r0
 790:	e20ee001 	and	lr, lr, #1
 794:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 798:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 79c:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 7a0:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 7a4:	e2500001 	subs	r0, r0, #1
 7a8:	2afffff7 	bcs	78c <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7ac:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 7b0:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7b4:	e0601001 	rsb	r1, r0, r1
 7b8:	e28a5001 	add	r5, sl, #1
 7bc:	e7d91001 	ldrb	r1, [r9, r1]
 7c0:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 7c4:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7c8:	11a0a005 	movne	sl, r5
 7cc:	1affffeb 	bne	780 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 7d0:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 7d4:	124b2024 	subne	r2, fp, #36	; 0x24
 7d8:	10823005 	addne	r3, r2, r5
 7dc:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 7e0:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 7e4:	13a0202d 	movne	r2, #45	; 0x2d
 7e8:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7ec:	e7d61005 	ldrb	r1, [r6, r5]
 7f0:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7f4:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 7f8:	ebffffc7 	bl	71c <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7fc:	e3750001 	cmn	r5, #1
 800:	1afffff9 	bne	7ec <printint+0xa8>
    putc(fd, buf[i]);
}
 804:	e24bd020 	sub	sp, fp, #32
 808:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 80c:	00000b50 	.word	0x00000b50

00000810 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 810:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 814:	e92d0830 	push	{r4, r5, fp}
 818:	e1a02000 	mov	r2, r0
 81c:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 820:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 824:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 828:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 82c:	e1a04c32 	lsr	r4, r2, ip
 830:	e2044001 	and	r4, r4, #1
 834:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 838:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 83c:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 840:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 844:	e25cc001 	subs	ip, ip, #1
 848:	2afffff7 	bcs	82c <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 84c:	e24bd008 	sub	sp, fp, #8
 850:	e8bd0830 	pop	{r4, r5, fp}
 854:	e12fff1e 	bx	lr

00000858 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 858:	e92d000e 	push	{r1, r2, r3}
 85c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 860:	e28db020 	add	fp, sp, #32
 864:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 868:	e59b4004 	ldr	r4, [fp, #4]
 86c:	e5d48000 	ldrb	r8, [r4]
 870:	e3580000 	cmp	r8, #0
 874:	0a000027 	beq	918 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 878:	e59f712c 	ldr	r7, [pc, #300]	; 9ac <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 87c:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 880:	e3a0a000 	mov	sl, #0
 884:	ea000008 	b	8ac <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 888:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 88c:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 890:	0a000002 	beq	8a0 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 894:	e1a00005 	mov	r0, r5
 898:	e1a01008 	mov	r1, r8
 89c:	ebffff9e 	bl	71c <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8a0:	e5f48001 	ldrb	r8, [r4, #1]!
 8a4:	e3580000 	cmp	r8, #0
 8a8:	0a00001a 	beq	918 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 8ac:	e35a0000 	cmp	sl, #0
 8b0:	0afffff4 	beq	888 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8b4:	e35a0025 	cmp	sl, #37	; 0x25
 8b8:	1afffff8 	bne	8a0 <printf+0x48>
      if(c == 'd'){
 8bc:	e3580064 	cmp	r8, #100	; 0x64
 8c0:	0a00002c 	beq	978 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8c4:	e3580078 	cmp	r8, #120	; 0x78
 8c8:	13580070 	cmpne	r8, #112	; 0x70
 8cc:	13a09000 	movne	r9, #0
 8d0:	03a09001 	moveq	r9, #1
 8d4:	0a000013 	beq	928 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8d8:	e3580073 	cmp	r8, #115	; 0x73
 8dc:	0a000018 	beq	944 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8e0:	e3580063 	cmp	r8, #99	; 0x63
 8e4:	0a00002a 	beq	994 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8e8:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 8ec:	e1a0100a 	mov	r1, sl
 8f0:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8f4:	0a000002 	beq	904 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8f8:	ebffff87 	bl	71c <putc>
        putc(fd, c);
 8fc:	e1a00005 	mov	r0, r5
 900:	e1a01008 	mov	r1, r8
 904:	ebffff84 	bl	71c <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 908:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 90c:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 910:	e3580000 	cmp	r8, #0
 914:	1affffe4 	bne	8ac <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 918:	e24bd020 	sub	sp, fp, #32
 91c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 920:	e28dd00c 	add	sp, sp, #12
 924:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 928:	e1a00005 	mov	r0, r5
 92c:	e4961004 	ldr	r1, [r6], #4
 930:	e3a02010 	mov	r2, #16
 934:	e3a03000 	mov	r3, #0
 938:	ebffff81 	bl	744 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 93c:	e3a0a000 	mov	sl, #0
 940:	eaffffd6 	b	8a0 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 944:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 948:	e3580000 	cmp	r8, #0
 94c:	01a08007 	moveq	r8, r7
        while(*s != 0){
 950:	e5d81000 	ldrb	r1, [r8]
 954:	e3510000 	cmp	r1, #0
 958:	0a000004 	beq	970 <printf+0x118>
          putc(fd, *s);
 95c:	e1a00005 	mov	r0, r5
 960:	ebffff6d 	bl	71c <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 964:	e5f81001 	ldrb	r1, [r8, #1]!
 968:	e3510000 	cmp	r1, #0
 96c:	1afffffa 	bne	95c <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 970:	e1a0a001 	mov	sl, r1
 974:	eaffffc9 	b	8a0 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 978:	e1a00005 	mov	r0, r5
 97c:	e4961004 	ldr	r1, [r6], #4
 980:	e3a0200a 	mov	r2, #10
 984:	e3a03001 	mov	r3, #1
 988:	ebffff6d 	bl	744 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 98c:	e3a0a000 	mov	sl, #0
 990:	eaffffc2 	b	8a0 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 994:	e4961004 	ldr	r1, [r6], #4
 998:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 99c:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 9a0:	e6ef1071 	uxtb	r1, r1
 9a4:	ebffff5c 	bl	71c <putc>
 9a8:	eaffffbc 	b	8a0 <printf+0x48>
 9ac:	00000b64 	.word	0x00000b64

000009b0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9b0:	e59f3098 	ldr	r3, [pc, #152]	; a50 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9b4:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9b8:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9bc:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c0:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c4:	e152000c 	cmp	r2, ip
 9c8:	e5921000 	ldr	r1, [r2]
 9cc:	2a000001 	bcs	9d8 <free+0x28>
 9d0:	e15c0001 	cmp	ip, r1
 9d4:	3a000007 	bcc	9f8 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d8:	e1520001 	cmp	r2, r1
 9dc:	3a000003 	bcc	9f0 <free+0x40>
 9e0:	e152000c 	cmp	r2, ip
 9e4:	3a000003 	bcc	9f8 <free+0x48>
 9e8:	e15c0001 	cmp	ip, r1
 9ec:	3a000001 	bcc	9f8 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f0:	e1a02001 	mov	r2, r1
 9f4:	eafffff2 	b	9c4 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9f8:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9fc:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a00:	e08c5184 	add	r5, ip, r4, lsl #3
 a04:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 a08:	05911004 	ldreq	r1, [r1, #4]
 a0c:	00814004 	addeq	r4, r1, r4
 a10:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a14:	05921000 	ldreq	r1, [r2]
 a18:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 a1c:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 a20:	e5921004 	ldr	r1, [r2, #4]
 a24:	e0824181 	add	r4, r2, r1, lsl #3
 a28:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a2c:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a30:	0510c004 	ldreq	ip, [r0, #-4]
 a34:	008c1001 	addeq	r1, ip, r1
 a38:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 a3c:	05101008 	ldreq	r1, [r0, #-8]
 a40:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a44:	e24bd008 	sub	sp, fp, #8
 a48:	e8bd0830 	pop	{r4, r5, fp}
 a4c:	e12fff1e 	bx	lr
 a50:	00000b6c 	.word	0x00000b6c

00000a54 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a54:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a58:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 a5c:	e59f50d4 	ldr	r5, [pc, #212]	; b38 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a60:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 a64:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a68:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a6c:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a70:	e3530000 	cmp	r3, #0
 a74:	0a00002b 	beq	b28 <malloc+0xd4>
 a78:	e5930000 	ldr	r0, [r3]
 a7c:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a80:	e1520004 	cmp	r2, r4
 a84:	2a00001b 	bcs	af8 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a88:	e59f80ac 	ldr	r8, [pc, #172]	; b3c <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 a8c:	e1a07184 	lsl	r7, r4, #3
 a90:	ea000003 	b	aa4 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a94:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 a98:	e5902004 	ldr	r2, [r0, #4]
 a9c:	e1540002 	cmp	r4, r2
 aa0:	9a000014 	bls	af8 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aa4:	e5952000 	ldr	r2, [r5]
 aa8:	e1a03000 	mov	r3, r0
 aac:	e1500002 	cmp	r0, r2
 ab0:	1afffff7 	bne	a94 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 ab4:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 ab8:	81a00007 	movhi	r0, r7
 abc:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 ac0:	81a06004 	movhi	r6, r4
 ac4:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 ac8:	ebfffeec 	bl	680 <sbrk>
 acc:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ad0:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 ad4:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 ad8:	0a000010 	beq	b20 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 adc:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 ae0:	ebffffb2 	bl	9b0 <free>
  return freep;
 ae4:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 ae8:	e3530000 	cmp	r3, #0
 aec:	1affffe8 	bne	a94 <malloc+0x40>
        return 0;
 af0:	e1a00003 	mov	r0, r3
  }
}
 af4:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 af8:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 afc:	10642002 	rsbne	r2, r4, r2
 b00:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b04:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b08:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b0c:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b10:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 b14:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 b18:	e2800008 	add	r0, r0, #8
 b1c:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 b20:	e3a00000 	mov	r0, #0
 b24:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b28:	e2850004 	add	r0, r5, #4
 b2c:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 b30:	e9850009 	stmib	r5, {r0, r3}
 b34:	eaffffd3 	b	a88 <malloc+0x34>
 b38:	00000b6c 	.word	0x00000b6c
 b3c:	00000fff 	.word	0x00000fff
