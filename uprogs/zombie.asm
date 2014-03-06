
_zombie:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	e92d4800 	push	{fp, lr}
   4:	e28db004 	add	fp, sp, #4
  if(fork() > 0){
   8:	eb0000a8 	bl	2b0 <fork>
   c:	e3500000 	cmp	r0, #0
  10:	da000005 	ble	2c <main+0x2c>
    sleep(5);  // Let child exit before parent.
  14:	e3a00005 	mov	r0, #5
  18:	eb00019b 	bl	68c <sleep>
    printf(2, "Parent exits!\n");
  1c:	e3a00002 	mov	r0, #2
  20:	e59f1014 	ldr	r1, [pc, #20]	; 3c <main+0x3c>
  24:	eb000201 	bl	830 <printf>
    exit();
  28:	eb0000ad 	bl	2e4 <exit>
  }
  printf(2, "Child exits!\n");
  2c:	e3a00002 	mov	r0, #2
  30:	e59f1008 	ldr	r1, [pc, #8]	; 40 <main+0x40>
  34:	eb0001fd 	bl	830 <printf>
  exit();
  38:	eb0000a9 	bl	2e4 <exit>
  3c:	00000b18 	.word	0x00000b18
  40:	00000b28 	.word	0x00000b28

00000044 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  44:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  48:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  4c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  50:	e4d13001 	ldrb	r3, [r1], #1
  54:	e3530000 	cmp	r3, #0
  58:	e4c23001 	strb	r3, [r2], #1
  5c:	1afffffb 	bne	50 <strcpy+0xc>
    ;
  return os;
}
  60:	e28bd000 	add	sp, fp, #0
  64:	e8bd0800 	pop	{fp}
  68:	e12fff1e 	bx	lr

0000006c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  70:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  74:	e5d03000 	ldrb	r3, [r0]
  78:	e5d12000 	ldrb	r2, [r1]
  7c:	e3530000 	cmp	r3, #0
  80:	1a000004 	bne	98 <strcmp+0x2c>
  84:	ea000005 	b	a0 <strcmp+0x34>
  88:	e5f03001 	ldrb	r3, [r0, #1]!
  8c:	e3530000 	cmp	r3, #0
  90:	0a000006 	beq	b0 <strcmp+0x44>
  94:	e5f12001 	ldrb	r2, [r1, #1]!
  98:	e1530002 	cmp	r3, r2
  9c:	0afffff9 	beq	88 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  a0:	e0620003 	rsb	r0, r2, r3
  a4:	e28bd000 	add	sp, fp, #0
  a8:	e8bd0800 	pop	{fp}
  ac:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b0:	e5d12001 	ldrb	r2, [r1, #1]
  b4:	eafffff9 	b	a0 <strcmp+0x34>

000000b8 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  bc:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  c0:	e5d03000 	ldrb	r3, [r0]
  c4:	e3530000 	cmp	r3, #0
  c8:	01a00003 	moveq	r0, r3
  cc:	0a000006 	beq	ec <strlen+0x34>
  d0:	e1a02000 	mov	r2, r0
  d4:	e3a03000 	mov	r3, #0
  d8:	e5f21001 	ldrb	r1, [r2, #1]!
  dc:	e2833001 	add	r3, r3, #1
  e0:	e1a00003 	mov	r0, r3
  e4:	e3510000 	cmp	r1, #0
  e8:	1afffffa 	bne	d8 <strlen+0x20>
    ;
  return n;
}
  ec:	e28bd000 	add	sp, fp, #0
  f0:	e8bd0800 	pop	{fp}
  f4:	e12fff1e 	bx	lr

000000f8 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
  f8:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
  fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 100:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 104:	0a000006 	beq	124 <memset+0x2c>
 108:	e6ef1071 	uxtb	r1, r1
 10c:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 110:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 114:	e2533001 	subs	r3, r3, #1
 118:	e4cc1001 	strb	r1, [ip], #1
 11c:	1afffffc 	bne	114 <memset+0x1c>
 120:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 124:	e28bd000 	add	sp, fp, #0
 128:	e8bd0800 	pop	{fp}
 12c:	e12fff1e 	bx	lr

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 134:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 138:	e5d03000 	ldrb	r3, [r0]
 13c:	e3530000 	cmp	r3, #0
 140:	1a000004 	bne	158 <strchr+0x28>
 144:	ea000008 	b	16c <strchr+0x3c>
 148:	e5d03001 	ldrb	r3, [r0, #1]
 14c:	e2800001 	add	r0, r0, #1
 150:	e3530000 	cmp	r3, #0
 154:	0a000004 	beq	16c <strchr+0x3c>
    if(*s == c)
 158:	e1530001 	cmp	r3, r1
 15c:	1afffff9 	bne	148 <strchr+0x18>
      return (char*)s;
  return 0;
}
 160:	e28bd000 	add	sp, fp, #0
 164:	e8bd0800 	pop	{fp}
 168:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 16c:	e1a00003 	mov	r0, r3
 170:	eafffffa 	b	160 <strchr+0x30>

00000174 <gets>:
}

char*
gets(char *buf, int max)
{
 174:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 178:	e28db018 	add	fp, sp, #24
 17c:	e24dd00c 	sub	sp, sp, #12
 180:	e1a08000 	mov	r8, r0
 184:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 188:	e1a06000 	mov	r6, r0
 18c:	e3a05000 	mov	r5, #0
 190:	ea000008 	b	1b8 <gets+0x44>
    cc = read(0, &c, 1);
 194:	eb000079 	bl	380 <read>
    if(cc < 1)
 198:	e3500000 	cmp	r0, #0
 19c:	da00000b 	ble	1d0 <gets+0x5c>
      break;
    buf[i++] = c;
 1a0:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 1a4:	e1a05004 	mov	r5, r4
 1a8:	e353000a 	cmp	r3, #10
 1ac:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1b0:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 1b4:	0a00000a 	beq	1e4 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1b8:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1bc:	e0854002 	add	r4, r5, r2
 1c0:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1c4:	e3a00000 	mov	r0, #0
 1c8:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	bafffff0 	blt	194 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d0:	e3a03000 	mov	r3, #0
 1d4:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 1d8:	e1a00008 	mov	r0, r8
 1dc:	e24bd018 	sub	sp, fp, #24
 1e0:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e4:	e1a05004 	mov	r5, r4
 1e8:	eafffff8 	b	1d0 <gets+0x5c>

000001ec <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1ec:	e92d4830 	push	{r4, r5, fp, lr}
 1f0:	e1a05001 	mov	r5, r1
 1f4:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f8:	e3a01000 	mov	r1, #0
 1fc:	eb0000a0 	bl	484 <open>
  if(fd < 0)
 200:	e2504000 	subs	r4, r0, #0
    return -1;
 204:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 208:	ba000004 	blt	220 <stat+0x34>
    return -1;
  r = fstat(fd, st);
 20c:	e1a01005 	mov	r1, r5
 210:	eb0000c2 	bl	520 <fstat>
 214:	e1a05000 	mov	r5, r0
  close(fd);
 218:	e1a00004 	mov	r0, r4
 21c:	eb000071 	bl	3e8 <close>
  return r;
}
 220:	e1a00005 	mov	r0, r5
 224:	e8bd8830 	pop	{r4, r5, fp, pc}

00000228 <atoi>:

int
atoi(const char *s)
{
 228:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 22c:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 230:	e5d03000 	ldrb	r3, [r0]
 234:	e2432030 	sub	r2, r3, #48	; 0x30
 238:	e6ef2072 	uxtb	r2, r2
 23c:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 240:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 244:	8a000009 	bhi	270 <atoi+0x48>
 248:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 24c:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 250:	e0800100 	add	r0, r0, r0, lsl #2
 254:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 258:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 25c:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 260:	e2431030 	sub	r1, r3, #48	; 0x30
 264:	e6ef1071 	uxtb	r1, r1
 268:	e3510009 	cmp	r1, #9
 26c:	9afffff7 	bls	250 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 270:	e28bd000 	add	sp, fp, #0
 274:	e8bd0800 	pop	{fp}
 278:	e12fff1e 	bx	lr

0000027c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 280:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 284:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 288:	da000005 	ble	2a4 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 28c:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 290:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 294:	e4d1c001 	ldrb	ip, [r1], #1
 298:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29c:	e1530002 	cmp	r3, r2
 2a0:	1afffffb 	bne	294 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2a4:	e28bd000 	add	sp, fp, #0
 2a8:	e8bd0800 	pop	{fp}
 2ac:	e12fff1e 	bx	lr

000002b0 <fork>:
 2b0:	e92d4000 	push	{lr}
 2b4:	e92d0008 	push	{r3}
 2b8:	e92d0004 	push	{r2}
 2bc:	e92d0002 	push	{r1}
 2c0:	e92d0001 	push	{r0}
 2c4:	e3a00001 	mov	r0, #1
 2c8:	ef000040 	svc	0x00000040
 2cc:	e8bd0002 	pop	{r1}
 2d0:	e8bd0002 	pop	{r1}
 2d4:	e8bd0004 	pop	{r2}
 2d8:	e8bd0008 	pop	{r3}
 2dc:	e8bd4000 	pop	{lr}
 2e0:	e12fff1e 	bx	lr

000002e4 <exit>:
 2e4:	e92d4000 	push	{lr}
 2e8:	e92d0008 	push	{r3}
 2ec:	e92d0004 	push	{r2}
 2f0:	e92d0002 	push	{r1}
 2f4:	e92d0001 	push	{r0}
 2f8:	e3a00002 	mov	r0, #2
 2fc:	ef000040 	svc	0x00000040
 300:	e8bd0002 	pop	{r1}
 304:	e8bd0002 	pop	{r1}
 308:	e8bd0004 	pop	{r2}
 30c:	e8bd0008 	pop	{r3}
 310:	e8bd4000 	pop	{lr}
 314:	e12fff1e 	bx	lr

00000318 <wait>:
 318:	e92d4000 	push	{lr}
 31c:	e92d0008 	push	{r3}
 320:	e92d0004 	push	{r2}
 324:	e92d0002 	push	{r1}
 328:	e92d0001 	push	{r0}
 32c:	e3a00003 	mov	r0, #3
 330:	ef000040 	svc	0x00000040
 334:	e8bd0002 	pop	{r1}
 338:	e8bd0002 	pop	{r1}
 33c:	e8bd0004 	pop	{r2}
 340:	e8bd0008 	pop	{r3}
 344:	e8bd4000 	pop	{lr}
 348:	e12fff1e 	bx	lr

0000034c <pipe>:
 34c:	e92d4000 	push	{lr}
 350:	e92d0008 	push	{r3}
 354:	e92d0004 	push	{r2}
 358:	e92d0002 	push	{r1}
 35c:	e92d0001 	push	{r0}
 360:	e3a00004 	mov	r0, #4
 364:	ef000040 	svc	0x00000040
 368:	e8bd0002 	pop	{r1}
 36c:	e8bd0002 	pop	{r1}
 370:	e8bd0004 	pop	{r2}
 374:	e8bd0008 	pop	{r3}
 378:	e8bd4000 	pop	{lr}
 37c:	e12fff1e 	bx	lr

00000380 <read>:
 380:	e92d4000 	push	{lr}
 384:	e92d0008 	push	{r3}
 388:	e92d0004 	push	{r2}
 38c:	e92d0002 	push	{r1}
 390:	e92d0001 	push	{r0}
 394:	e3a00005 	mov	r0, #5
 398:	ef000040 	svc	0x00000040
 39c:	e8bd0002 	pop	{r1}
 3a0:	e8bd0002 	pop	{r1}
 3a4:	e8bd0004 	pop	{r2}
 3a8:	e8bd0008 	pop	{r3}
 3ac:	e8bd4000 	pop	{lr}
 3b0:	e12fff1e 	bx	lr

000003b4 <write>:
 3b4:	e92d4000 	push	{lr}
 3b8:	e92d0008 	push	{r3}
 3bc:	e92d0004 	push	{r2}
 3c0:	e92d0002 	push	{r1}
 3c4:	e92d0001 	push	{r0}
 3c8:	e3a00010 	mov	r0, #16
 3cc:	ef000040 	svc	0x00000040
 3d0:	e8bd0002 	pop	{r1}
 3d4:	e8bd0002 	pop	{r1}
 3d8:	e8bd0004 	pop	{r2}
 3dc:	e8bd0008 	pop	{r3}
 3e0:	e8bd4000 	pop	{lr}
 3e4:	e12fff1e 	bx	lr

000003e8 <close>:
 3e8:	e92d4000 	push	{lr}
 3ec:	e92d0008 	push	{r3}
 3f0:	e92d0004 	push	{r2}
 3f4:	e92d0002 	push	{r1}
 3f8:	e92d0001 	push	{r0}
 3fc:	e3a00015 	mov	r0, #21
 400:	ef000040 	svc	0x00000040
 404:	e8bd0002 	pop	{r1}
 408:	e8bd0002 	pop	{r1}
 40c:	e8bd0004 	pop	{r2}
 410:	e8bd0008 	pop	{r3}
 414:	e8bd4000 	pop	{lr}
 418:	e12fff1e 	bx	lr

0000041c <kill>:
 41c:	e92d4000 	push	{lr}
 420:	e92d0008 	push	{r3}
 424:	e92d0004 	push	{r2}
 428:	e92d0002 	push	{r1}
 42c:	e92d0001 	push	{r0}
 430:	e3a00006 	mov	r0, #6
 434:	ef000040 	svc	0x00000040
 438:	e8bd0002 	pop	{r1}
 43c:	e8bd0002 	pop	{r1}
 440:	e8bd0004 	pop	{r2}
 444:	e8bd0008 	pop	{r3}
 448:	e8bd4000 	pop	{lr}
 44c:	e12fff1e 	bx	lr

00000450 <exec>:
 450:	e92d4000 	push	{lr}
 454:	e92d0008 	push	{r3}
 458:	e92d0004 	push	{r2}
 45c:	e92d0002 	push	{r1}
 460:	e92d0001 	push	{r0}
 464:	e3a00007 	mov	r0, #7
 468:	ef000040 	svc	0x00000040
 46c:	e8bd0002 	pop	{r1}
 470:	e8bd0002 	pop	{r1}
 474:	e8bd0004 	pop	{r2}
 478:	e8bd0008 	pop	{r3}
 47c:	e8bd4000 	pop	{lr}
 480:	e12fff1e 	bx	lr

00000484 <open>:
 484:	e92d4000 	push	{lr}
 488:	e92d0008 	push	{r3}
 48c:	e92d0004 	push	{r2}
 490:	e92d0002 	push	{r1}
 494:	e92d0001 	push	{r0}
 498:	e3a0000f 	mov	r0, #15
 49c:	ef000040 	svc	0x00000040
 4a0:	e8bd0002 	pop	{r1}
 4a4:	e8bd0002 	pop	{r1}
 4a8:	e8bd0004 	pop	{r2}
 4ac:	e8bd0008 	pop	{r3}
 4b0:	e8bd4000 	pop	{lr}
 4b4:	e12fff1e 	bx	lr

000004b8 <mknod>:
 4b8:	e92d4000 	push	{lr}
 4bc:	e92d0008 	push	{r3}
 4c0:	e92d0004 	push	{r2}
 4c4:	e92d0002 	push	{r1}
 4c8:	e92d0001 	push	{r0}
 4cc:	e3a00011 	mov	r0, #17
 4d0:	ef000040 	svc	0x00000040
 4d4:	e8bd0002 	pop	{r1}
 4d8:	e8bd0002 	pop	{r1}
 4dc:	e8bd0004 	pop	{r2}
 4e0:	e8bd0008 	pop	{r3}
 4e4:	e8bd4000 	pop	{lr}
 4e8:	e12fff1e 	bx	lr

000004ec <unlink>:
 4ec:	e92d4000 	push	{lr}
 4f0:	e92d0008 	push	{r3}
 4f4:	e92d0004 	push	{r2}
 4f8:	e92d0002 	push	{r1}
 4fc:	e92d0001 	push	{r0}
 500:	e3a00012 	mov	r0, #18
 504:	ef000040 	svc	0x00000040
 508:	e8bd0002 	pop	{r1}
 50c:	e8bd0002 	pop	{r1}
 510:	e8bd0004 	pop	{r2}
 514:	e8bd0008 	pop	{r3}
 518:	e8bd4000 	pop	{lr}
 51c:	e12fff1e 	bx	lr

00000520 <fstat>:
 520:	e92d4000 	push	{lr}
 524:	e92d0008 	push	{r3}
 528:	e92d0004 	push	{r2}
 52c:	e92d0002 	push	{r1}
 530:	e92d0001 	push	{r0}
 534:	e3a00008 	mov	r0, #8
 538:	ef000040 	svc	0x00000040
 53c:	e8bd0002 	pop	{r1}
 540:	e8bd0002 	pop	{r1}
 544:	e8bd0004 	pop	{r2}
 548:	e8bd0008 	pop	{r3}
 54c:	e8bd4000 	pop	{lr}
 550:	e12fff1e 	bx	lr

00000554 <link>:
 554:	e92d4000 	push	{lr}
 558:	e92d0008 	push	{r3}
 55c:	e92d0004 	push	{r2}
 560:	e92d0002 	push	{r1}
 564:	e92d0001 	push	{r0}
 568:	e3a00013 	mov	r0, #19
 56c:	ef000040 	svc	0x00000040
 570:	e8bd0002 	pop	{r1}
 574:	e8bd0002 	pop	{r1}
 578:	e8bd0004 	pop	{r2}
 57c:	e8bd0008 	pop	{r3}
 580:	e8bd4000 	pop	{lr}
 584:	e12fff1e 	bx	lr

00000588 <mkdir>:
 588:	e92d4000 	push	{lr}
 58c:	e92d0008 	push	{r3}
 590:	e92d0004 	push	{r2}
 594:	e92d0002 	push	{r1}
 598:	e92d0001 	push	{r0}
 59c:	e3a00014 	mov	r0, #20
 5a0:	ef000040 	svc	0x00000040
 5a4:	e8bd0002 	pop	{r1}
 5a8:	e8bd0002 	pop	{r1}
 5ac:	e8bd0004 	pop	{r2}
 5b0:	e8bd0008 	pop	{r3}
 5b4:	e8bd4000 	pop	{lr}
 5b8:	e12fff1e 	bx	lr

000005bc <chdir>:
 5bc:	e92d4000 	push	{lr}
 5c0:	e92d0008 	push	{r3}
 5c4:	e92d0004 	push	{r2}
 5c8:	e92d0002 	push	{r1}
 5cc:	e92d0001 	push	{r0}
 5d0:	e3a00009 	mov	r0, #9
 5d4:	ef000040 	svc	0x00000040
 5d8:	e8bd0002 	pop	{r1}
 5dc:	e8bd0002 	pop	{r1}
 5e0:	e8bd0004 	pop	{r2}
 5e4:	e8bd0008 	pop	{r3}
 5e8:	e8bd4000 	pop	{lr}
 5ec:	e12fff1e 	bx	lr

000005f0 <dup>:
 5f0:	e92d4000 	push	{lr}
 5f4:	e92d0008 	push	{r3}
 5f8:	e92d0004 	push	{r2}
 5fc:	e92d0002 	push	{r1}
 600:	e92d0001 	push	{r0}
 604:	e3a0000a 	mov	r0, #10
 608:	ef000040 	svc	0x00000040
 60c:	e8bd0002 	pop	{r1}
 610:	e8bd0002 	pop	{r1}
 614:	e8bd0004 	pop	{r2}
 618:	e8bd0008 	pop	{r3}
 61c:	e8bd4000 	pop	{lr}
 620:	e12fff1e 	bx	lr

00000624 <getpid>:
 624:	e92d4000 	push	{lr}
 628:	e92d0008 	push	{r3}
 62c:	e92d0004 	push	{r2}
 630:	e92d0002 	push	{r1}
 634:	e92d0001 	push	{r0}
 638:	e3a0000b 	mov	r0, #11
 63c:	ef000040 	svc	0x00000040
 640:	e8bd0002 	pop	{r1}
 644:	e8bd0002 	pop	{r1}
 648:	e8bd0004 	pop	{r2}
 64c:	e8bd0008 	pop	{r3}
 650:	e8bd4000 	pop	{lr}
 654:	e12fff1e 	bx	lr

00000658 <sbrk>:
 658:	e92d4000 	push	{lr}
 65c:	e92d0008 	push	{r3}
 660:	e92d0004 	push	{r2}
 664:	e92d0002 	push	{r1}
 668:	e92d0001 	push	{r0}
 66c:	e3a0000c 	mov	r0, #12
 670:	ef000040 	svc	0x00000040
 674:	e8bd0002 	pop	{r1}
 678:	e8bd0002 	pop	{r1}
 67c:	e8bd0004 	pop	{r2}
 680:	e8bd0008 	pop	{r3}
 684:	e8bd4000 	pop	{lr}
 688:	e12fff1e 	bx	lr

0000068c <sleep>:
 68c:	e92d4000 	push	{lr}
 690:	e92d0008 	push	{r3}
 694:	e92d0004 	push	{r2}
 698:	e92d0002 	push	{r1}
 69c:	e92d0001 	push	{r0}
 6a0:	e3a0000d 	mov	r0, #13
 6a4:	ef000040 	svc	0x00000040
 6a8:	e8bd0002 	pop	{r1}
 6ac:	e8bd0002 	pop	{r1}
 6b0:	e8bd0004 	pop	{r2}
 6b4:	e8bd0008 	pop	{r3}
 6b8:	e8bd4000 	pop	{lr}
 6bc:	e12fff1e 	bx	lr

000006c0 <uptime>:
 6c0:	e92d4000 	push	{lr}
 6c4:	e92d0008 	push	{r3}
 6c8:	e92d0004 	push	{r2}
 6cc:	e92d0002 	push	{r1}
 6d0:	e92d0001 	push	{r0}
 6d4:	e3a0000e 	mov	r0, #14
 6d8:	ef000040 	svc	0x00000040
 6dc:	e8bd0002 	pop	{r1}
 6e0:	e8bd0002 	pop	{r1}
 6e4:	e8bd0004 	pop	{r2}
 6e8:	e8bd0008 	pop	{r3}
 6ec:	e8bd4000 	pop	{lr}
 6f0:	e12fff1e 	bx	lr

000006f4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6f4:	e92d4800 	push	{fp, lr}
 6f8:	e28db004 	add	fp, sp, #4
 6fc:	e24b3004 	sub	r3, fp, #4
 700:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 704:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 708:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 70c:	e1a01003 	mov	r1, r3
 710:	ebffff27 	bl	3b4 <write>
}
 714:	e24bd004 	sub	sp, fp, #4
 718:	e8bd8800 	pop	{fp, pc}

0000071c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 71c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 720:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 724:	e1a00fa1 	lsr	r0, r1, #31
 728:	e3530000 	cmp	r3, #0
 72c:	03a03000 	moveq	r3, #0
 730:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 734:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 738:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 73c:	e24dd014 	sub	sp, sp, #20
 740:	e59f909c 	ldr	r9, [pc, #156]	; 7e4 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 744:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 748:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 74c:	e3a0a000 	mov	sl, #0
 750:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 754:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 758:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 75c:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 760:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 764:	e1a0e031 	lsr	lr, r1, r0
 768:	e20ee001 	and	lr, lr, #1
 76c:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 770:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 774:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 778:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 77c:	e2500001 	subs	r0, r0, #1
 780:	2afffff7 	bcs	764 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 784:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 788:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 78c:	e0601001 	rsb	r1, r0, r1
 790:	e28a5001 	add	r5, sl, #1
 794:	e7d91001 	ldrb	r1, [r9, r1]
 798:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 79c:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7a0:	11a0a005 	movne	sl, r5
 7a4:	1affffeb 	bne	758 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 7a8:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 7ac:	124b2024 	subne	r2, fp, #36	; 0x24
 7b0:	10823005 	addne	r3, r2, r5
 7b4:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 7b8:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 7bc:	13a0202d 	movne	r2, #45	; 0x2d
 7c0:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7c4:	e7d61005 	ldrb	r1, [r6, r5]
 7c8:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7cc:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 7d0:	ebffffc7 	bl	6f4 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7d4:	e3750001 	cmn	r5, #1
 7d8:	1afffff9 	bne	7c4 <printint+0xa8>
    putc(fd, buf[i]);
}
 7dc:	e24bd020 	sub	sp, fp, #32
 7e0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 7e4:	00000b38 	.word	0x00000b38

000007e8 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7e8:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 7ec:	e92d0830 	push	{r4, r5, fp}
 7f0:	e1a02000 	mov	r2, r0
 7f4:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 7f8:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7fc:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 800:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 804:	e1a04c32 	lsr	r4, r2, ip
 808:	e2044001 	and	r4, r4, #1
 80c:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 810:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 814:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 818:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 81c:	e25cc001 	subs	ip, ip, #1
 820:	2afffff7 	bcs	804 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 824:	e24bd008 	sub	sp, fp, #8
 828:	e8bd0830 	pop	{r4, r5, fp}
 82c:	e12fff1e 	bx	lr

00000830 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 830:	e92d000e 	push	{r1, r2, r3}
 834:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 838:	e28db020 	add	fp, sp, #32
 83c:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 840:	e59b4004 	ldr	r4, [fp, #4]
 844:	e5d48000 	ldrb	r8, [r4]
 848:	e3580000 	cmp	r8, #0
 84c:	0a000027 	beq	8f0 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 850:	e59f712c 	ldr	r7, [pc, #300]	; 984 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 854:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 858:	e3a0a000 	mov	sl, #0
 85c:	ea000008 	b	884 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 860:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 864:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 868:	0a000002 	beq	878 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 86c:	e1a00005 	mov	r0, r5
 870:	e1a01008 	mov	r1, r8
 874:	ebffff9e 	bl	6f4 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 878:	e5f48001 	ldrb	r8, [r4, #1]!
 87c:	e3580000 	cmp	r8, #0
 880:	0a00001a 	beq	8f0 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 884:	e35a0000 	cmp	sl, #0
 888:	0afffff4 	beq	860 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 88c:	e35a0025 	cmp	sl, #37	; 0x25
 890:	1afffff8 	bne	878 <printf+0x48>
      if(c == 'd'){
 894:	e3580064 	cmp	r8, #100	; 0x64
 898:	0a00002c 	beq	950 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 89c:	e3580078 	cmp	r8, #120	; 0x78
 8a0:	13580070 	cmpne	r8, #112	; 0x70
 8a4:	13a09000 	movne	r9, #0
 8a8:	03a09001 	moveq	r9, #1
 8ac:	0a000013 	beq	900 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8b0:	e3580073 	cmp	r8, #115	; 0x73
 8b4:	0a000018 	beq	91c <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8b8:	e3580063 	cmp	r8, #99	; 0x63
 8bc:	0a00002a 	beq	96c <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8c0:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 8c4:	e1a0100a 	mov	r1, sl
 8c8:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8cc:	0a000002 	beq	8dc <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8d0:	ebffff87 	bl	6f4 <putc>
        putc(fd, c);
 8d4:	e1a00005 	mov	r0, r5
 8d8:	e1a01008 	mov	r1, r8
 8dc:	ebffff84 	bl	6f4 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8e0:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8e4:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8e8:	e3580000 	cmp	r8, #0
 8ec:	1affffe4 	bne	884 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8f0:	e24bd020 	sub	sp, fp, #32
 8f4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8f8:	e28dd00c 	add	sp, sp, #12
 8fc:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 900:	e1a00005 	mov	r0, r5
 904:	e4961004 	ldr	r1, [r6], #4
 908:	e3a02010 	mov	r2, #16
 90c:	e3a03000 	mov	r3, #0
 910:	ebffff81 	bl	71c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 914:	e3a0a000 	mov	sl, #0
 918:	eaffffd6 	b	878 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 91c:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 920:	e3580000 	cmp	r8, #0
 924:	01a08007 	moveq	r8, r7
        while(*s != 0){
 928:	e5d81000 	ldrb	r1, [r8]
 92c:	e3510000 	cmp	r1, #0
 930:	0a000004 	beq	948 <printf+0x118>
          putc(fd, *s);
 934:	e1a00005 	mov	r0, r5
 938:	ebffff6d 	bl	6f4 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 93c:	e5f81001 	ldrb	r1, [r8, #1]!
 940:	e3510000 	cmp	r1, #0
 944:	1afffffa 	bne	934 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 948:	e1a0a001 	mov	sl, r1
 94c:	eaffffc9 	b	878 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 950:	e1a00005 	mov	r0, r5
 954:	e4961004 	ldr	r1, [r6], #4
 958:	e3a0200a 	mov	r2, #10
 95c:	e3a03001 	mov	r3, #1
 960:	ebffff6d 	bl	71c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 964:	e3a0a000 	mov	sl, #0
 968:	eaffffc2 	b	878 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 96c:	e4961004 	ldr	r1, [r6], #4
 970:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 974:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 978:	e6ef1071 	uxtb	r1, r1
 97c:	ebffff5c 	bl	6f4 <putc>
 980:	eaffffbc 	b	878 <printf+0x48>
 984:	00000b4c 	.word	0x00000b4c

00000988 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 988:	e59f3098 	ldr	r3, [pc, #152]	; a28 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 98c:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 990:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 994:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 998:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 99c:	e152000c 	cmp	r2, ip
 9a0:	e5921000 	ldr	r1, [r2]
 9a4:	2a000001 	bcs	9b0 <free+0x28>
 9a8:	e15c0001 	cmp	ip, r1
 9ac:	3a000007 	bcc	9d0 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b0:	e1520001 	cmp	r2, r1
 9b4:	3a000003 	bcc	9c8 <free+0x40>
 9b8:	e152000c 	cmp	r2, ip
 9bc:	3a000003 	bcc	9d0 <free+0x48>
 9c0:	e15c0001 	cmp	ip, r1
 9c4:	3a000001 	bcc	9d0 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c8:	e1a02001 	mov	r2, r1
 9cc:	eafffff2 	b	99c <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9d0:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9d4:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9d8:	e08c5184 	add	r5, ip, r4, lsl #3
 9dc:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 9e0:	05911004 	ldreq	r1, [r1, #4]
 9e4:	00814004 	addeq	r4, r1, r4
 9e8:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 9ec:	05921000 	ldreq	r1, [r2]
 9f0:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 9f4:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 9f8:	e5921004 	ldr	r1, [r2, #4]
 9fc:	e0824181 	add	r4, r2, r1, lsl #3
 a00:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a04:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a08:	0510c004 	ldreq	ip, [r0, #-4]
 a0c:	008c1001 	addeq	r1, ip, r1
 a10:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 a14:	05101008 	ldreq	r1, [r0, #-8]
 a18:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a1c:	e24bd008 	sub	sp, fp, #8
 a20:	e8bd0830 	pop	{r4, r5, fp}
 a24:	e12fff1e 	bx	lr
 a28:	00000b54 	.word	0x00000b54

00000a2c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a2c:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a30:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 a34:	e59f50d4 	ldr	r5, [pc, #212]	; b10 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a38:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 a3c:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a40:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a44:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a48:	e3530000 	cmp	r3, #0
 a4c:	0a00002b 	beq	b00 <malloc+0xd4>
 a50:	e5930000 	ldr	r0, [r3]
 a54:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a58:	e1520004 	cmp	r2, r4
 a5c:	2a00001b 	bcs	ad0 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a60:	e59f80ac 	ldr	r8, [pc, #172]	; b14 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 a64:	e1a07184 	lsl	r7, r4, #3
 a68:	ea000003 	b	a7c <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a6c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 a70:	e5902004 	ldr	r2, [r0, #4]
 a74:	e1540002 	cmp	r4, r2
 a78:	9a000014 	bls	ad0 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a7c:	e5952000 	ldr	r2, [r5]
 a80:	e1a03000 	mov	r3, r0
 a84:	e1500002 	cmp	r0, r2
 a88:	1afffff7 	bne	a6c <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a8c:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a90:	81a00007 	movhi	r0, r7
 a94:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a98:	81a06004 	movhi	r6, r4
 a9c:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 aa0:	ebfffeec 	bl	658 <sbrk>
 aa4:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 aa8:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 aac:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 ab0:	0a000010 	beq	af8 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 ab4:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 ab8:	ebffffb2 	bl	988 <free>
  return freep;
 abc:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 ac0:	e3530000 	cmp	r3, #0
 ac4:	1affffe8 	bne	a6c <malloc+0x40>
        return 0;
 ac8:	e1a00003 	mov	r0, r3
  }
}
 acc:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ad0:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ad4:	10642002 	rsbne	r2, r4, r2
 ad8:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 adc:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 ae0:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 ae4:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 ae8:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 aec:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 af0:	e2800008 	add	r0, r0, #8
 af4:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 af8:	e3a00000 	mov	r0, #0
 afc:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b00:	e2850004 	add	r0, r5, #4
 b04:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 b08:	e9850009 	stmib	r5, {r0, r3}
 b0c:	eaffffd3 	b	a60 <malloc+0x34>
 b10:	00000b54 	.word	0x00000b54
 b14:	00000fff 	.word	0x00000fff
