
_init:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	e92d4818 	push	{r3, r4, fp, lr}
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   4:	e3a01002 	mov	r1, #2

char *argv[] = { "sh", 0 };

int
main(void)
{
   8:	e28db00c 	add	fp, sp, #12
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   c:	e59f00a4 	ldr	r0, [pc, #164]	; b8 <main+0xb8>
  10:	eb00013f 	bl	514 <open>
  14:	e3500000 	cmp	r0, #0
  18:	ba00001e 	blt	98 <main+0x98>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  1c:	e3a00000 	mov	r0, #0
  20:	eb000196 	bl	680 <dup>
  dup(0);  // stderr
  24:	e3a00000 	mov	r0, #0
  28:	eb000194 	bl	680 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  2c:	e3a00001 	mov	r0, #1
  30:	e59f1084 	ldr	r1, [pc, #132]	; bc <main+0xbc>
  34:	eb000221 	bl	8c0 <printf>
    pid = fork();
  38:	eb0000c0 	bl	340 <fork>
    if(pid < 0){
  3c:	e2504000 	subs	r4, r0, #0
  40:	ba000009 	blt	6c <main+0x6c>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  44:	0a00000c 	beq	7c <main+0x7c>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  48:	eb0000d6 	bl	3a8 <wait>
  4c:	e3500000 	cmp	r0, #0
  50:	bafffff5 	blt	2c <main+0x2c>
  54:	e1500004 	cmp	r0, r4
  58:	0afffff3 	beq	2c <main+0x2c>
      printf(1, "zombie!\n");
  5c:	e3a00001 	mov	r0, #1
  60:	e59f1058 	ldr	r1, [pc, #88]	; c0 <main+0xc0>
  64:	eb000215 	bl	8c0 <printf>
  68:	eafffff6 	b	48 <main+0x48>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  6c:	e3a00001 	mov	r0, #1
  70:	e59f104c 	ldr	r1, [pc, #76]	; c4 <main+0xc4>
  74:	eb000211 	bl	8c0 <printf>
      exit();
  78:	eb0000bd 	bl	374 <exit>
    }
    if(pid == 0){
      exec("sh", argv);
  7c:	e59f1044 	ldr	r1, [pc, #68]	; c8 <main+0xc8>
  80:	e59f0044 	ldr	r0, [pc, #68]	; cc <main+0xcc>
  84:	eb000115 	bl	4e0 <exec>
      printf(1, "init: exec sh failed\n");
  88:	e3a00001 	mov	r0, #1
  8c:	e59f103c 	ldr	r1, [pc, #60]	; d0 <main+0xd0>
  90:	eb00020a 	bl	8c0 <printf>
      exit();
  94:	eb0000b6 	bl	374 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
  98:	e3a01001 	mov	r1, #1
  9c:	e1a02001 	mov	r2, r1
  a0:	e59f0010 	ldr	r0, [pc, #16]	; b8 <main+0xb8>
  a4:	eb000127 	bl	548 <mknod>
    open("console", O_RDWR);
  a8:	e3a01002 	mov	r1, #2
  ac:	e59f0004 	ldr	r0, [pc, #4]	; b8 <main+0xb8>
  b0:	eb000117 	bl	514 <open>
  b4:	eaffffd8 	b	1c <main+0x1c>
  b8:	00000ba8 	.word	0x00000ba8
  bc:	00000bb0 	.word	0x00000bb0
  c0:	00000bf4 	.word	0x00000bf4
  c4:	00000bc4 	.word	0x00000bc4
  c8:	00000c1c 	.word	0x00000c1c
  cc:	00000bd8 	.word	0x00000bd8
  d0:	00000bdc 	.word	0x00000bdc

000000d4 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  d8:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  dc:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e0:	e4d13001 	ldrb	r3, [r1], #1
  e4:	e3530000 	cmp	r3, #0
  e8:	e4c23001 	strb	r3, [r2], #1
  ec:	1afffffb 	bne	e0 <strcpy+0xc>
    ;
  return os;
}
  f0:	e28bd000 	add	sp, fp, #0
  f4:	e8bd0800 	pop	{fp}
  f8:	e12fff1e 	bx	lr

000000fc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 100:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 104:	e5d03000 	ldrb	r3, [r0]
 108:	e5d12000 	ldrb	r2, [r1]
 10c:	e3530000 	cmp	r3, #0
 110:	1a000004 	bne	128 <strcmp+0x2c>
 114:	ea000005 	b	130 <strcmp+0x34>
 118:	e5f03001 	ldrb	r3, [r0, #1]!
 11c:	e3530000 	cmp	r3, #0
 120:	0a000006 	beq	140 <strcmp+0x44>
 124:	e5f12001 	ldrb	r2, [r1, #1]!
 128:	e1530002 	cmp	r3, r2
 12c:	0afffff9 	beq	118 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 130:	e0620003 	rsb	r0, r2, r3
 134:	e28bd000 	add	sp, fp, #0
 138:	e8bd0800 	pop	{fp}
 13c:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 140:	e5d12001 	ldrb	r2, [r1, #1]
 144:	eafffff9 	b	130 <strcmp+0x34>

00000148 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 148:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 14c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 150:	e5d03000 	ldrb	r3, [r0]
 154:	e3530000 	cmp	r3, #0
 158:	01a00003 	moveq	r0, r3
 15c:	0a000006 	beq	17c <strlen+0x34>
 160:	e1a02000 	mov	r2, r0
 164:	e3a03000 	mov	r3, #0
 168:	e5f21001 	ldrb	r1, [r2, #1]!
 16c:	e2833001 	add	r3, r3, #1
 170:	e1a00003 	mov	r0, r3
 174:	e3510000 	cmp	r1, #0
 178:	1afffffa 	bne	168 <strlen+0x20>
    ;
  return n;
}
 17c:	e28bd000 	add	sp, fp, #0
 180:	e8bd0800 	pop	{fp}
 184:	e12fff1e 	bx	lr

00000188 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 188:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 18c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 190:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 194:	0a000006 	beq	1b4 <memset+0x2c>
 198:	e6ef1071 	uxtb	r1, r1
 19c:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 1a0:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1a4:	e2533001 	subs	r3, r3, #1
 1a8:	e4cc1001 	strb	r1, [ip], #1
 1ac:	1afffffc 	bne	1a4 <memset+0x1c>
 1b0:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 1b4:	e28bd000 	add	sp, fp, #0
 1b8:	e8bd0800 	pop	{fp}
 1bc:	e12fff1e 	bx	lr

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1c4:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1c8:	e5d03000 	ldrb	r3, [r0]
 1cc:	e3530000 	cmp	r3, #0
 1d0:	1a000004 	bne	1e8 <strchr+0x28>
 1d4:	ea000008 	b	1fc <strchr+0x3c>
 1d8:	e5d03001 	ldrb	r3, [r0, #1]
 1dc:	e2800001 	add	r0, r0, #1
 1e0:	e3530000 	cmp	r3, #0
 1e4:	0a000004 	beq	1fc <strchr+0x3c>
    if(*s == c)
 1e8:	e1530001 	cmp	r3, r1
 1ec:	1afffff9 	bne	1d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f0:	e28bd000 	add	sp, fp, #0
 1f4:	e8bd0800 	pop	{fp}
 1f8:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 1fc:	e1a00003 	mov	r0, r3
 200:	eafffffa 	b	1f0 <strchr+0x30>

00000204 <gets>:
}

char*
gets(char *buf, int max)
{
 204:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 208:	e28db018 	add	fp, sp, #24
 20c:	e24dd00c 	sub	sp, sp, #12
 210:	e1a08000 	mov	r8, r0
 214:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 218:	e1a06000 	mov	r6, r0
 21c:	e3a05000 	mov	r5, #0
 220:	ea000008 	b	248 <gets+0x44>
    cc = read(0, &c, 1);
 224:	eb000079 	bl	410 <read>
    if(cc < 1)
 228:	e3500000 	cmp	r0, #0
 22c:	da00000b 	ble	260 <gets+0x5c>
      break;
    buf[i++] = c;
 230:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 234:	e1a05004 	mov	r5, r4
 238:	e353000a 	cmp	r3, #10
 23c:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 240:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 244:	0a00000a 	beq	274 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 248:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 24c:	e0854002 	add	r4, r5, r2
 250:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 254:	e3a00000 	mov	r0, #0
 258:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 25c:	bafffff0 	blt	224 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 260:	e3a03000 	mov	r3, #0
 264:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 268:	e1a00008 	mov	r0, r8
 26c:	e24bd018 	sub	sp, fp, #24
 270:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 274:	e1a05004 	mov	r5, r4
 278:	eafffff8 	b	260 <gets+0x5c>

0000027c <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 27c:	e92d4830 	push	{r4, r5, fp, lr}
 280:	e1a05001 	mov	r5, r1
 284:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 288:	e3a01000 	mov	r1, #0
 28c:	eb0000a0 	bl	514 <open>
  if(fd < 0)
 290:	e2504000 	subs	r4, r0, #0
    return -1;
 294:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 298:	ba000004 	blt	2b0 <stat+0x34>
    return -1;
  r = fstat(fd, st);
 29c:	e1a01005 	mov	r1, r5
 2a0:	eb0000c2 	bl	5b0 <fstat>
 2a4:	e1a05000 	mov	r5, r0
  close(fd);
 2a8:	e1a00004 	mov	r0, r4
 2ac:	eb000071 	bl	478 <close>
  return r;
}
 2b0:	e1a00005 	mov	r0, r5
 2b4:	e8bd8830 	pop	{r4, r5, fp, pc}

000002b8 <atoi>:

int
atoi(const char *s)
{
 2b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2bc:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c0:	e5d03000 	ldrb	r3, [r0]
 2c4:	e2432030 	sub	r2, r3, #48	; 0x30
 2c8:	e6ef2072 	uxtb	r2, r2
 2cc:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 2d0:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 2d4:	8a000009 	bhi	300 <atoi+0x48>
 2d8:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 2dc:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 2e0:	e0800100 	add	r0, r0, r0, lsl #2
 2e4:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e8:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 2ec:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f0:	e2431030 	sub	r1, r3, #48	; 0x30
 2f4:	e6ef1071 	uxtb	r1, r1
 2f8:	e3510009 	cmp	r1, #9
 2fc:	9afffff7 	bls	2e0 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 300:	e28bd000 	add	sp, fp, #0
 304:	e8bd0800 	pop	{fp}
 308:	e12fff1e 	bx	lr

0000030c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 310:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 314:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 318:	da000005 	ble	334 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 31c:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 320:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 324:	e4d1c001 	ldrb	ip, [r1], #1
 328:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32c:	e1530002 	cmp	r3, r2
 330:	1afffffb 	bne	324 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 334:	e28bd000 	add	sp, fp, #0
 338:	e8bd0800 	pop	{fp}
 33c:	e12fff1e 	bx	lr

00000340 <fork>:
 340:	e92d4000 	push	{lr}
 344:	e92d0008 	push	{r3}
 348:	e92d0004 	push	{r2}
 34c:	e92d0002 	push	{r1}
 350:	e92d0001 	push	{r0}
 354:	e3a00001 	mov	r0, #1
 358:	ef000040 	svc	0x00000040
 35c:	e8bd0002 	pop	{r1}
 360:	e8bd0002 	pop	{r1}
 364:	e8bd0004 	pop	{r2}
 368:	e8bd0008 	pop	{r3}
 36c:	e8bd4000 	pop	{lr}
 370:	e12fff1e 	bx	lr

00000374 <exit>:
 374:	e92d4000 	push	{lr}
 378:	e92d0008 	push	{r3}
 37c:	e92d0004 	push	{r2}
 380:	e92d0002 	push	{r1}
 384:	e92d0001 	push	{r0}
 388:	e3a00002 	mov	r0, #2
 38c:	ef000040 	svc	0x00000040
 390:	e8bd0002 	pop	{r1}
 394:	e8bd0002 	pop	{r1}
 398:	e8bd0004 	pop	{r2}
 39c:	e8bd0008 	pop	{r3}
 3a0:	e8bd4000 	pop	{lr}
 3a4:	e12fff1e 	bx	lr

000003a8 <wait>:
 3a8:	e92d4000 	push	{lr}
 3ac:	e92d0008 	push	{r3}
 3b0:	e92d0004 	push	{r2}
 3b4:	e92d0002 	push	{r1}
 3b8:	e92d0001 	push	{r0}
 3bc:	e3a00003 	mov	r0, #3
 3c0:	ef000040 	svc	0x00000040
 3c4:	e8bd0002 	pop	{r1}
 3c8:	e8bd0002 	pop	{r1}
 3cc:	e8bd0004 	pop	{r2}
 3d0:	e8bd0008 	pop	{r3}
 3d4:	e8bd4000 	pop	{lr}
 3d8:	e12fff1e 	bx	lr

000003dc <pipe>:
 3dc:	e92d4000 	push	{lr}
 3e0:	e92d0008 	push	{r3}
 3e4:	e92d0004 	push	{r2}
 3e8:	e92d0002 	push	{r1}
 3ec:	e92d0001 	push	{r0}
 3f0:	e3a00004 	mov	r0, #4
 3f4:	ef000040 	svc	0x00000040
 3f8:	e8bd0002 	pop	{r1}
 3fc:	e8bd0002 	pop	{r1}
 400:	e8bd0004 	pop	{r2}
 404:	e8bd0008 	pop	{r3}
 408:	e8bd4000 	pop	{lr}
 40c:	e12fff1e 	bx	lr

00000410 <read>:
 410:	e92d4000 	push	{lr}
 414:	e92d0008 	push	{r3}
 418:	e92d0004 	push	{r2}
 41c:	e92d0002 	push	{r1}
 420:	e92d0001 	push	{r0}
 424:	e3a00005 	mov	r0, #5
 428:	ef000040 	svc	0x00000040
 42c:	e8bd0002 	pop	{r1}
 430:	e8bd0002 	pop	{r1}
 434:	e8bd0004 	pop	{r2}
 438:	e8bd0008 	pop	{r3}
 43c:	e8bd4000 	pop	{lr}
 440:	e12fff1e 	bx	lr

00000444 <write>:
 444:	e92d4000 	push	{lr}
 448:	e92d0008 	push	{r3}
 44c:	e92d0004 	push	{r2}
 450:	e92d0002 	push	{r1}
 454:	e92d0001 	push	{r0}
 458:	e3a00010 	mov	r0, #16
 45c:	ef000040 	svc	0x00000040
 460:	e8bd0002 	pop	{r1}
 464:	e8bd0002 	pop	{r1}
 468:	e8bd0004 	pop	{r2}
 46c:	e8bd0008 	pop	{r3}
 470:	e8bd4000 	pop	{lr}
 474:	e12fff1e 	bx	lr

00000478 <close>:
 478:	e92d4000 	push	{lr}
 47c:	e92d0008 	push	{r3}
 480:	e92d0004 	push	{r2}
 484:	e92d0002 	push	{r1}
 488:	e92d0001 	push	{r0}
 48c:	e3a00015 	mov	r0, #21
 490:	ef000040 	svc	0x00000040
 494:	e8bd0002 	pop	{r1}
 498:	e8bd0002 	pop	{r1}
 49c:	e8bd0004 	pop	{r2}
 4a0:	e8bd0008 	pop	{r3}
 4a4:	e8bd4000 	pop	{lr}
 4a8:	e12fff1e 	bx	lr

000004ac <kill>:
 4ac:	e92d4000 	push	{lr}
 4b0:	e92d0008 	push	{r3}
 4b4:	e92d0004 	push	{r2}
 4b8:	e92d0002 	push	{r1}
 4bc:	e92d0001 	push	{r0}
 4c0:	e3a00006 	mov	r0, #6
 4c4:	ef000040 	svc	0x00000040
 4c8:	e8bd0002 	pop	{r1}
 4cc:	e8bd0002 	pop	{r1}
 4d0:	e8bd0004 	pop	{r2}
 4d4:	e8bd0008 	pop	{r3}
 4d8:	e8bd4000 	pop	{lr}
 4dc:	e12fff1e 	bx	lr

000004e0 <exec>:
 4e0:	e92d4000 	push	{lr}
 4e4:	e92d0008 	push	{r3}
 4e8:	e92d0004 	push	{r2}
 4ec:	e92d0002 	push	{r1}
 4f0:	e92d0001 	push	{r0}
 4f4:	e3a00007 	mov	r0, #7
 4f8:	ef000040 	svc	0x00000040
 4fc:	e8bd0002 	pop	{r1}
 500:	e8bd0002 	pop	{r1}
 504:	e8bd0004 	pop	{r2}
 508:	e8bd0008 	pop	{r3}
 50c:	e8bd4000 	pop	{lr}
 510:	e12fff1e 	bx	lr

00000514 <open>:
 514:	e92d4000 	push	{lr}
 518:	e92d0008 	push	{r3}
 51c:	e92d0004 	push	{r2}
 520:	e92d0002 	push	{r1}
 524:	e92d0001 	push	{r0}
 528:	e3a0000f 	mov	r0, #15
 52c:	ef000040 	svc	0x00000040
 530:	e8bd0002 	pop	{r1}
 534:	e8bd0002 	pop	{r1}
 538:	e8bd0004 	pop	{r2}
 53c:	e8bd0008 	pop	{r3}
 540:	e8bd4000 	pop	{lr}
 544:	e12fff1e 	bx	lr

00000548 <mknod>:
 548:	e92d4000 	push	{lr}
 54c:	e92d0008 	push	{r3}
 550:	e92d0004 	push	{r2}
 554:	e92d0002 	push	{r1}
 558:	e92d0001 	push	{r0}
 55c:	e3a00011 	mov	r0, #17
 560:	ef000040 	svc	0x00000040
 564:	e8bd0002 	pop	{r1}
 568:	e8bd0002 	pop	{r1}
 56c:	e8bd0004 	pop	{r2}
 570:	e8bd0008 	pop	{r3}
 574:	e8bd4000 	pop	{lr}
 578:	e12fff1e 	bx	lr

0000057c <unlink>:
 57c:	e92d4000 	push	{lr}
 580:	e92d0008 	push	{r3}
 584:	e92d0004 	push	{r2}
 588:	e92d0002 	push	{r1}
 58c:	e92d0001 	push	{r0}
 590:	e3a00012 	mov	r0, #18
 594:	ef000040 	svc	0x00000040
 598:	e8bd0002 	pop	{r1}
 59c:	e8bd0002 	pop	{r1}
 5a0:	e8bd0004 	pop	{r2}
 5a4:	e8bd0008 	pop	{r3}
 5a8:	e8bd4000 	pop	{lr}
 5ac:	e12fff1e 	bx	lr

000005b0 <fstat>:
 5b0:	e92d4000 	push	{lr}
 5b4:	e92d0008 	push	{r3}
 5b8:	e92d0004 	push	{r2}
 5bc:	e92d0002 	push	{r1}
 5c0:	e92d0001 	push	{r0}
 5c4:	e3a00008 	mov	r0, #8
 5c8:	ef000040 	svc	0x00000040
 5cc:	e8bd0002 	pop	{r1}
 5d0:	e8bd0002 	pop	{r1}
 5d4:	e8bd0004 	pop	{r2}
 5d8:	e8bd0008 	pop	{r3}
 5dc:	e8bd4000 	pop	{lr}
 5e0:	e12fff1e 	bx	lr

000005e4 <link>:
 5e4:	e92d4000 	push	{lr}
 5e8:	e92d0008 	push	{r3}
 5ec:	e92d0004 	push	{r2}
 5f0:	e92d0002 	push	{r1}
 5f4:	e92d0001 	push	{r0}
 5f8:	e3a00013 	mov	r0, #19
 5fc:	ef000040 	svc	0x00000040
 600:	e8bd0002 	pop	{r1}
 604:	e8bd0002 	pop	{r1}
 608:	e8bd0004 	pop	{r2}
 60c:	e8bd0008 	pop	{r3}
 610:	e8bd4000 	pop	{lr}
 614:	e12fff1e 	bx	lr

00000618 <mkdir>:
 618:	e92d4000 	push	{lr}
 61c:	e92d0008 	push	{r3}
 620:	e92d0004 	push	{r2}
 624:	e92d0002 	push	{r1}
 628:	e92d0001 	push	{r0}
 62c:	e3a00014 	mov	r0, #20
 630:	ef000040 	svc	0x00000040
 634:	e8bd0002 	pop	{r1}
 638:	e8bd0002 	pop	{r1}
 63c:	e8bd0004 	pop	{r2}
 640:	e8bd0008 	pop	{r3}
 644:	e8bd4000 	pop	{lr}
 648:	e12fff1e 	bx	lr

0000064c <chdir>:
 64c:	e92d4000 	push	{lr}
 650:	e92d0008 	push	{r3}
 654:	e92d0004 	push	{r2}
 658:	e92d0002 	push	{r1}
 65c:	e92d0001 	push	{r0}
 660:	e3a00009 	mov	r0, #9
 664:	ef000040 	svc	0x00000040
 668:	e8bd0002 	pop	{r1}
 66c:	e8bd0002 	pop	{r1}
 670:	e8bd0004 	pop	{r2}
 674:	e8bd0008 	pop	{r3}
 678:	e8bd4000 	pop	{lr}
 67c:	e12fff1e 	bx	lr

00000680 <dup>:
 680:	e92d4000 	push	{lr}
 684:	e92d0008 	push	{r3}
 688:	e92d0004 	push	{r2}
 68c:	e92d0002 	push	{r1}
 690:	e92d0001 	push	{r0}
 694:	e3a0000a 	mov	r0, #10
 698:	ef000040 	svc	0x00000040
 69c:	e8bd0002 	pop	{r1}
 6a0:	e8bd0002 	pop	{r1}
 6a4:	e8bd0004 	pop	{r2}
 6a8:	e8bd0008 	pop	{r3}
 6ac:	e8bd4000 	pop	{lr}
 6b0:	e12fff1e 	bx	lr

000006b4 <getpid>:
 6b4:	e92d4000 	push	{lr}
 6b8:	e92d0008 	push	{r3}
 6bc:	e92d0004 	push	{r2}
 6c0:	e92d0002 	push	{r1}
 6c4:	e92d0001 	push	{r0}
 6c8:	e3a0000b 	mov	r0, #11
 6cc:	ef000040 	svc	0x00000040
 6d0:	e8bd0002 	pop	{r1}
 6d4:	e8bd0002 	pop	{r1}
 6d8:	e8bd0004 	pop	{r2}
 6dc:	e8bd0008 	pop	{r3}
 6e0:	e8bd4000 	pop	{lr}
 6e4:	e12fff1e 	bx	lr

000006e8 <sbrk>:
 6e8:	e92d4000 	push	{lr}
 6ec:	e92d0008 	push	{r3}
 6f0:	e92d0004 	push	{r2}
 6f4:	e92d0002 	push	{r1}
 6f8:	e92d0001 	push	{r0}
 6fc:	e3a0000c 	mov	r0, #12
 700:	ef000040 	svc	0x00000040
 704:	e8bd0002 	pop	{r1}
 708:	e8bd0002 	pop	{r1}
 70c:	e8bd0004 	pop	{r2}
 710:	e8bd0008 	pop	{r3}
 714:	e8bd4000 	pop	{lr}
 718:	e12fff1e 	bx	lr

0000071c <sleep>:
 71c:	e92d4000 	push	{lr}
 720:	e92d0008 	push	{r3}
 724:	e92d0004 	push	{r2}
 728:	e92d0002 	push	{r1}
 72c:	e92d0001 	push	{r0}
 730:	e3a0000d 	mov	r0, #13
 734:	ef000040 	svc	0x00000040
 738:	e8bd0002 	pop	{r1}
 73c:	e8bd0002 	pop	{r1}
 740:	e8bd0004 	pop	{r2}
 744:	e8bd0008 	pop	{r3}
 748:	e8bd4000 	pop	{lr}
 74c:	e12fff1e 	bx	lr

00000750 <uptime>:
 750:	e92d4000 	push	{lr}
 754:	e92d0008 	push	{r3}
 758:	e92d0004 	push	{r2}
 75c:	e92d0002 	push	{r1}
 760:	e92d0001 	push	{r0}
 764:	e3a0000e 	mov	r0, #14
 768:	ef000040 	svc	0x00000040
 76c:	e8bd0002 	pop	{r1}
 770:	e8bd0002 	pop	{r1}
 774:	e8bd0004 	pop	{r2}
 778:	e8bd0008 	pop	{r3}
 77c:	e8bd4000 	pop	{lr}
 780:	e12fff1e 	bx	lr

00000784 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 784:	e92d4800 	push	{fp, lr}
 788:	e28db004 	add	fp, sp, #4
 78c:	e24b3004 	sub	r3, fp, #4
 790:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 794:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 798:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 79c:	e1a01003 	mov	r1, r3
 7a0:	ebffff27 	bl	444 <write>
}
 7a4:	e24bd004 	sub	sp, fp, #4
 7a8:	e8bd8800 	pop	{fp, pc}

000007ac <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7ac:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 7b0:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7b4:	e1a00fa1 	lsr	r0, r1, #31
 7b8:	e3530000 	cmp	r3, #0
 7bc:	03a03000 	moveq	r3, #0
 7c0:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7c4:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7c8:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7cc:	e24dd014 	sub	sp, sp, #20
 7d0:	e59f909c 	ldr	r9, [pc, #156]	; 874 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7d4:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 7d8:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 7dc:	e3a0a000 	mov	sl, #0
 7e0:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 7e4:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7e8:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 7ec:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7f0:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 7f4:	e1a0e031 	lsr	lr, r1, r0
 7f8:	e20ee001 	and	lr, lr, #1
 7fc:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 800:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 804:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 808:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 80c:	e2500001 	subs	r0, r0, #1
 810:	2afffff7 	bcs	7f4 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 814:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 818:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 81c:	e0601001 	rsb	r1, r0, r1
 820:	e28a5001 	add	r5, sl, #1
 824:	e7d91001 	ldrb	r1, [r9, r1]
 828:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 82c:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 830:	11a0a005 	movne	sl, r5
 834:	1affffeb 	bne	7e8 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 838:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 83c:	124b2024 	subne	r2, fp, #36	; 0x24
 840:	10823005 	addne	r3, r2, r5
 844:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 848:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 84c:	13a0202d 	movne	r2, #45	; 0x2d
 850:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 854:	e7d61005 	ldrb	r1, [r6, r5]
 858:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 85c:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 860:	ebffffc7 	bl	784 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 864:	e3750001 	cmn	r5, #1
 868:	1afffff9 	bne	854 <printint+0xa8>
    putc(fd, buf[i]);
}
 86c:	e24bd020 	sub	sp, fp, #32
 870:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 874:	00000c00 	.word	0x00000c00

00000878 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 878:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 87c:	e92d0830 	push	{r4, r5, fp}
 880:	e1a02000 	mov	r2, r0
 884:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 888:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 88c:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 890:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 894:	e1a04c32 	lsr	r4, r2, ip
 898:	e2044001 	and	r4, r4, #1
 89c:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 8a0:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 8a4:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 8a8:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8ac:	e25cc001 	subs	ip, ip, #1
 8b0:	2afffff7 	bcs	894 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 8b4:	e24bd008 	sub	sp, fp, #8
 8b8:	e8bd0830 	pop	{r4, r5, fp}
 8bc:	e12fff1e 	bx	lr

000008c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8c0:	e92d000e 	push	{r1, r2, r3}
 8c4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8c8:	e28db020 	add	fp, sp, #32
 8cc:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8d0:	e59b4004 	ldr	r4, [fp, #4]
 8d4:	e5d48000 	ldrb	r8, [r4]
 8d8:	e3580000 	cmp	r8, #0
 8dc:	0a000027 	beq	980 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 8e0:	e59f712c 	ldr	r7, [pc, #300]	; a14 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 8e4:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8e8:	e3a0a000 	mov	sl, #0
 8ec:	ea000008 	b	914 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8f0:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 8f4:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8f8:	0a000002 	beq	908 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 8fc:	e1a00005 	mov	r0, r5
 900:	e1a01008 	mov	r1, r8
 904:	ebffff9e 	bl	784 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 908:	e5f48001 	ldrb	r8, [r4, #1]!
 90c:	e3580000 	cmp	r8, #0
 910:	0a00001a 	beq	980 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 914:	e35a0000 	cmp	sl, #0
 918:	0afffff4 	beq	8f0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 91c:	e35a0025 	cmp	sl, #37	; 0x25
 920:	1afffff8 	bne	908 <printf+0x48>
      if(c == 'd'){
 924:	e3580064 	cmp	r8, #100	; 0x64
 928:	0a00002c 	beq	9e0 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 92c:	e3580078 	cmp	r8, #120	; 0x78
 930:	13580070 	cmpne	r8, #112	; 0x70
 934:	13a09000 	movne	r9, #0
 938:	03a09001 	moveq	r9, #1
 93c:	0a000013 	beq	990 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 940:	e3580073 	cmp	r8, #115	; 0x73
 944:	0a000018 	beq	9ac <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 948:	e3580063 	cmp	r8, #99	; 0x63
 94c:	0a00002a 	beq	9fc <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 950:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 954:	e1a0100a 	mov	r1, sl
 958:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 95c:	0a000002 	beq	96c <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 960:	ebffff87 	bl	784 <putc>
        putc(fd, c);
 964:	e1a00005 	mov	r0, r5
 968:	e1a01008 	mov	r1, r8
 96c:	ebffff84 	bl	784 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 970:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 974:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 978:	e3580000 	cmp	r8, #0
 97c:	1affffe4 	bne	914 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 980:	e24bd020 	sub	sp, fp, #32
 984:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 988:	e28dd00c 	add	sp, sp, #12
 98c:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 990:	e1a00005 	mov	r0, r5
 994:	e4961004 	ldr	r1, [r6], #4
 998:	e3a02010 	mov	r2, #16
 99c:	e3a03000 	mov	r3, #0
 9a0:	ebffff81 	bl	7ac <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9a4:	e3a0a000 	mov	sl, #0
 9a8:	eaffffd6 	b	908 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 9ac:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 9b0:	e3580000 	cmp	r8, #0
 9b4:	01a08007 	moveq	r8, r7
        while(*s != 0){
 9b8:	e5d81000 	ldrb	r1, [r8]
 9bc:	e3510000 	cmp	r1, #0
 9c0:	0a000004 	beq	9d8 <printf+0x118>
          putc(fd, *s);
 9c4:	e1a00005 	mov	r0, r5
 9c8:	ebffff6d 	bl	784 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 9cc:	e5f81001 	ldrb	r1, [r8, #1]!
 9d0:	e3510000 	cmp	r1, #0
 9d4:	1afffffa 	bne	9c4 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9d8:	e1a0a001 	mov	sl, r1
 9dc:	eaffffc9 	b	908 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 9e0:	e1a00005 	mov	r0, r5
 9e4:	e4961004 	ldr	r1, [r6], #4
 9e8:	e3a0200a 	mov	r2, #10
 9ec:	e3a03001 	mov	r3, #1
 9f0:	ebffff6d 	bl	7ac <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9f4:	e3a0a000 	mov	sl, #0
 9f8:	eaffffc2 	b	908 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 9fc:	e4961004 	ldr	r1, [r6], #4
 a00:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a04:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 a08:	e6ef1071 	uxtb	r1, r1
 a0c:	ebffff5c 	bl	784 <putc>
 a10:	eaffffbc 	b	908 <printf+0x48>
 a14:	00000c14 	.word	0x00000c14

00000a18 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a18:	e59f3098 	ldr	r3, [pc, #152]	; ab8 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a1c:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a20:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a24:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 a28:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a2c:	e152000c 	cmp	r2, ip
 a30:	e5921000 	ldr	r1, [r2]
 a34:	2a000001 	bcs	a40 <free+0x28>
 a38:	e15c0001 	cmp	ip, r1
 a3c:	3a000007 	bcc	a60 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a40:	e1520001 	cmp	r2, r1
 a44:	3a000003 	bcc	a58 <free+0x40>
 a48:	e152000c 	cmp	r2, ip
 a4c:	3a000003 	bcc	a60 <free+0x48>
 a50:	e15c0001 	cmp	ip, r1
 a54:	3a000001 	bcc	a60 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a58:	e1a02001 	mov	r2, r1
 a5c:	eafffff2 	b	a2c <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a60:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a64:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a68:	e08c5184 	add	r5, ip, r4, lsl #3
 a6c:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 a70:	05911004 	ldreq	r1, [r1, #4]
 a74:	00814004 	addeq	r4, r1, r4
 a78:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a7c:	05921000 	ldreq	r1, [r2]
 a80:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 a84:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 a88:	e5921004 	ldr	r1, [r2, #4]
 a8c:	e0824181 	add	r4, r2, r1, lsl #3
 a90:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a94:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a98:	0510c004 	ldreq	ip, [r0, #-4]
 a9c:	008c1001 	addeq	r1, ip, r1
 aa0:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 aa4:	05101008 	ldreq	r1, [r0, #-8]
 aa8:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 aac:	e24bd008 	sub	sp, fp, #8
 ab0:	e8bd0830 	pop	{r4, r5, fp}
 ab4:	e12fff1e 	bx	lr
 ab8:	00000c24 	.word	0x00000c24

00000abc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 abc:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac0:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 ac4:	e59f50d4 	ldr	r5, [pc, #212]	; ba0 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac8:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 acc:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 ad0:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ad4:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ad8:	e3530000 	cmp	r3, #0
 adc:	0a00002b 	beq	b90 <malloc+0xd4>
 ae0:	e5930000 	ldr	r0, [r3]
 ae4:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ae8:	e1520004 	cmp	r2, r4
 aec:	2a00001b 	bcs	b60 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 af0:	e59f80ac 	ldr	r8, [pc, #172]	; ba4 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 af4:	e1a07184 	lsl	r7, r4, #3
 af8:	ea000003 	b	b0c <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 afc:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b00:	e5902004 	ldr	r2, [r0, #4]
 b04:	e1540002 	cmp	r4, r2
 b08:	9a000014 	bls	b60 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b0c:	e5952000 	ldr	r2, [r5]
 b10:	e1a03000 	mov	r3, r0
 b14:	e1500002 	cmp	r0, r2
 b18:	1afffff7 	bne	afc <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b1c:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b20:	81a00007 	movhi	r0, r7
 b24:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b28:	81a06004 	movhi	r6, r4
 b2c:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b30:	ebfffeec 	bl	6e8 <sbrk>
 b34:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b38:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 b3c:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 b40:	0a000010 	beq	b88 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b44:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 b48:	ebffffb2 	bl	a18 <free>
  return freep;
 b4c:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b50:	e3530000 	cmp	r3, #0
 b54:	1affffe8 	bne	afc <malloc+0x40>
        return 0;
 b58:	e1a00003 	mov	r0, r3
  }
}
 b5c:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b60:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b64:	10642002 	rsbne	r2, r4, r2
 b68:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b6c:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b70:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b74:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b78:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 b7c:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 b80:	e2800008 	add	r0, r0, #8
 b84:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 b88:	e3a00000 	mov	r0, #0
 b8c:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b90:	e2850004 	add	r0, r5, #4
 b94:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 b98:	e9850009 	stmib	r5, {r0, r3}
 b9c:	eaffffd3 	b	af0 <malloc+0x34>
 ba0:	00000c24 	.word	0x00000c24
 ba4:	00000fff 	.word	0x00000fff
