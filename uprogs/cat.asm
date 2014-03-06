
_cat:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
  }
}

int
main(int argc, char *argv[])
{
   4:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
   8:	e1a07000 	mov	r7, r0
   c:	e28db01c 	add	fp, sp, #28
    exit();
  }
}

int
main(int argc, char *argv[])
  10:	c2814004 	addgt	r4, r1, #4
  14:	c3a05001 	movgt	r5, #1
{
  int fd, i;

  if(argc <= 1){
  18:	da000012 	ble	68 <main+0x68>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  1c:	e5940000 	ldr	r0, [r4]
  20:	e3a01000 	mov	r1, #0
  24:	eb000137 	bl	508 <open>
  28:	e1a06004 	mov	r6, r4
  2c:	e2844004 	add	r4, r4, #4
  30:	e2508000 	subs	r8, r0, #0
  34:	ba000006 	blt	54 <main+0x54>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  38:	eb00000e 	bl	78 <cat>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  3c:	e2855001 	add	r5, r5, #1
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    close(fd);
  40:	e1a00008 	mov	r0, r8
  44:	eb000108 	bl	46c <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  48:	e1550007 	cmp	r5, r7
  4c:	1afffff2 	bne	1c <main+0x1c>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
  50:	eb0000c4 	bl	368 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
  54:	e3a00001 	mov	r0, #1
  58:	e59f1014 	ldr	r1, [pc, #20]	; 74 <main+0x74>
  5c:	e5962000 	ldr	r2, [r6]
  60:	eb000213 	bl	8b4 <printf>
      exit();
  64:	eb0000bf 	bl	368 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
  68:	e3a00000 	mov	r0, #0
  6c:	eb000001 	bl	78 <cat>
    exit();
  70:	eb0000bc 	bl	368 <exit>
  74:	00000bb0 	.word	0x00000bb0

00000078 <cat>:

char buf[512];

void
cat(int fd)
{
  78:	e92d4818 	push	{r3, r4, fp, lr}
  7c:	e1a04000 	mov	r4, r0
  80:	e28db00c 	add	fp, sp, #12
  int n;
  while((n = read(fd, buf, sizeof(buf))) > 0)
  84:	ea000002 	b	94 <cat+0x1c>
    write(1, buf, n);
  88:	e3a00001 	mov	r0, #1
  8c:	e59f102c 	ldr	r1, [pc, #44]	; c0 <cat+0x48>
  90:	eb0000e8 	bl	438 <write>

void
cat(int fd)
{
  int n;
  while((n = read(fd, buf, sizeof(buf))) > 0)
  94:	e3a02c02 	mov	r2, #512	; 0x200
  98:	e1a00004 	mov	r0, r4
  9c:	e59f101c 	ldr	r1, [pc, #28]	; c0 <cat+0x48>
  a0:	eb0000d7 	bl	404 <read>
  a4:	e2502000 	subs	r2, r0, #0
  a8:	cafffff6 	bgt	88 <cat+0x10>
    write(1, buf, n);
  if(n < 0){
  ac:	08bd8818 	popeq	{r3, r4, fp, pc}
    printf(1, "cat: read error\n");
  b0:	e3a00001 	mov	r0, #1
  b4:	e59f1008 	ldr	r1, [pc, #8]	; c4 <cat+0x4c>
  b8:	eb0001fd 	bl	8b4 <printf>
    exit();
  bc:	eb0000a9 	bl	368 <exit>
  c0:	00000bf0 	.word	0x00000bf0
  c4:	00000b9c 	.word	0x00000b9c

000000c8 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  cc:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  d0:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  d4:	e4d13001 	ldrb	r3, [r1], #1
  d8:	e3530000 	cmp	r3, #0
  dc:	e4c23001 	strb	r3, [r2], #1
  e0:	1afffffb 	bne	d4 <strcpy+0xc>
    ;
  return os;
}
  e4:	e28bd000 	add	sp, fp, #0
  e8:	e8bd0800 	pop	{fp}
  ec:	e12fff1e 	bx	lr

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f4:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  f8:	e5d03000 	ldrb	r3, [r0]
  fc:	e5d12000 	ldrb	r2, [r1]
 100:	e3530000 	cmp	r3, #0
 104:	1a000004 	bne	11c <strcmp+0x2c>
 108:	ea000005 	b	124 <strcmp+0x34>
 10c:	e5f03001 	ldrb	r3, [r0, #1]!
 110:	e3530000 	cmp	r3, #0
 114:	0a000006 	beq	134 <strcmp+0x44>
 118:	e5f12001 	ldrb	r2, [r1, #1]!
 11c:	e1530002 	cmp	r3, r2
 120:	0afffff9 	beq	10c <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 124:	e0620003 	rsb	r0, r2, r3
 128:	e28bd000 	add	sp, fp, #0
 12c:	e8bd0800 	pop	{fp}
 130:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 134:	e5d12001 	ldrb	r2, [r1, #1]
 138:	eafffff9 	b	124 <strcmp+0x34>

0000013c <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 13c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 140:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 144:	e5d03000 	ldrb	r3, [r0]
 148:	e3530000 	cmp	r3, #0
 14c:	01a00003 	moveq	r0, r3
 150:	0a000006 	beq	170 <strlen+0x34>
 154:	e1a02000 	mov	r2, r0
 158:	e3a03000 	mov	r3, #0
 15c:	e5f21001 	ldrb	r1, [r2, #1]!
 160:	e2833001 	add	r3, r3, #1
 164:	e1a00003 	mov	r0, r3
 168:	e3510000 	cmp	r1, #0
 16c:	1afffffa 	bne	15c <strlen+0x20>
    ;
  return n;
}
 170:	e28bd000 	add	sp, fp, #0
 174:	e8bd0800 	pop	{fp}
 178:	e12fff1e 	bx	lr

0000017c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 17c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 180:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 184:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 188:	0a000006 	beq	1a8 <memset+0x2c>
 18c:	e6ef1071 	uxtb	r1, r1
 190:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 194:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 198:	e2533001 	subs	r3, r3, #1
 19c:	e4cc1001 	strb	r1, [ip], #1
 1a0:	1afffffc 	bne	198 <memset+0x1c>
 1a4:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 1a8:	e28bd000 	add	sp, fp, #0
 1ac:	e8bd0800 	pop	{fp}
 1b0:	e12fff1e 	bx	lr

000001b4 <strchr>:

char*
strchr(const char *s, char c)
{
 1b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1b8:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1bc:	e5d03000 	ldrb	r3, [r0]
 1c0:	e3530000 	cmp	r3, #0
 1c4:	1a000004 	bne	1dc <strchr+0x28>
 1c8:	ea000008 	b	1f0 <strchr+0x3c>
 1cc:	e5d03001 	ldrb	r3, [r0, #1]
 1d0:	e2800001 	add	r0, r0, #1
 1d4:	e3530000 	cmp	r3, #0
 1d8:	0a000004 	beq	1f0 <strchr+0x3c>
    if(*s == c)
 1dc:	e1530001 	cmp	r3, r1
 1e0:	1afffff9 	bne	1cc <strchr+0x18>
      return (char*)s;
  return 0;
}
 1e4:	e28bd000 	add	sp, fp, #0
 1e8:	e8bd0800 	pop	{fp}
 1ec:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 1f0:	e1a00003 	mov	r0, r3
 1f4:	eafffffa 	b	1e4 <strchr+0x30>

000001f8 <gets>:
}

char*
gets(char *buf, int max)
{
 1f8:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1fc:	e28db018 	add	fp, sp, #24
 200:	e24dd00c 	sub	sp, sp, #12
 204:	e1a08000 	mov	r8, r0
 208:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20c:	e1a06000 	mov	r6, r0
 210:	e3a05000 	mov	r5, #0
 214:	ea000008 	b	23c <gets+0x44>
    cc = read(0, &c, 1);
 218:	eb000079 	bl	404 <read>
    if(cc < 1)
 21c:	e3500000 	cmp	r0, #0
 220:	da00000b 	ble	254 <gets+0x5c>
      break;
    buf[i++] = c;
 224:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 228:	e1a05004 	mov	r5, r4
 22c:	e353000a 	cmp	r3, #10
 230:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 234:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 238:	0a00000a 	beq	268 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 23c:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 240:	e0854002 	add	r4, r5, r2
 244:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 248:	e3a00000 	mov	r0, #0
 24c:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 250:	bafffff0 	blt	218 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 254:	e3a03000 	mov	r3, #0
 258:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 25c:	e1a00008 	mov	r0, r8
 260:	e24bd018 	sub	sp, fp, #24
 264:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 268:	e1a05004 	mov	r5, r4
 26c:	eafffff8 	b	254 <gets+0x5c>

00000270 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 270:	e92d4830 	push	{r4, r5, fp, lr}
 274:	e1a05001 	mov	r5, r1
 278:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 27c:	e3a01000 	mov	r1, #0
 280:	eb0000a0 	bl	508 <open>
  if(fd < 0)
 284:	e2504000 	subs	r4, r0, #0
    return -1;
 288:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 28c:	ba000004 	blt	2a4 <stat+0x34>
    return -1;
  r = fstat(fd, st);
 290:	e1a01005 	mov	r1, r5
 294:	eb0000c2 	bl	5a4 <fstat>
 298:	e1a05000 	mov	r5, r0
  close(fd);
 29c:	e1a00004 	mov	r0, r4
 2a0:	eb000071 	bl	46c <close>
  return r;
}
 2a4:	e1a00005 	mov	r0, r5
 2a8:	e8bd8830 	pop	{r4, r5, fp, pc}

000002ac <atoi>:

int
atoi(const char *s)
{
 2ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b0:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b4:	e5d03000 	ldrb	r3, [r0]
 2b8:	e2432030 	sub	r2, r3, #48	; 0x30
 2bc:	e6ef2072 	uxtb	r2, r2
 2c0:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 2c4:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 2c8:	8a000009 	bhi	2f4 <atoi+0x48>
 2cc:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 2d0:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 2d4:	e0800100 	add	r0, r0, r0, lsl #2
 2d8:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2dc:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 2e0:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e4:	e2431030 	sub	r1, r3, #48	; 0x30
 2e8:	e6ef1071 	uxtb	r1, r1
 2ec:	e3510009 	cmp	r1, #9
 2f0:	9afffff7 	bls	2d4 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 2f4:	e28bd000 	add	sp, fp, #0
 2f8:	e8bd0800 	pop	{fp}
 2fc:	e12fff1e 	bx	lr

00000300 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 300:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 304:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 308:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30c:	da000005 	ble	328 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 310:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 314:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 318:	e4d1c001 	ldrb	ip, [r1], #1
 31c:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 320:	e1530002 	cmp	r3, r2
 324:	1afffffb 	bne	318 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 328:	e28bd000 	add	sp, fp, #0
 32c:	e8bd0800 	pop	{fp}
 330:	e12fff1e 	bx	lr

00000334 <fork>:
 334:	e92d4000 	push	{lr}
 338:	e92d0008 	push	{r3}
 33c:	e92d0004 	push	{r2}
 340:	e92d0002 	push	{r1}
 344:	e92d0001 	push	{r0}
 348:	e3a00001 	mov	r0, #1
 34c:	ef000040 	svc	0x00000040
 350:	e8bd0002 	pop	{r1}
 354:	e8bd0002 	pop	{r1}
 358:	e8bd0004 	pop	{r2}
 35c:	e8bd0008 	pop	{r3}
 360:	e8bd4000 	pop	{lr}
 364:	e12fff1e 	bx	lr

00000368 <exit>:
 368:	e92d4000 	push	{lr}
 36c:	e92d0008 	push	{r3}
 370:	e92d0004 	push	{r2}
 374:	e92d0002 	push	{r1}
 378:	e92d0001 	push	{r0}
 37c:	e3a00002 	mov	r0, #2
 380:	ef000040 	svc	0x00000040
 384:	e8bd0002 	pop	{r1}
 388:	e8bd0002 	pop	{r1}
 38c:	e8bd0004 	pop	{r2}
 390:	e8bd0008 	pop	{r3}
 394:	e8bd4000 	pop	{lr}
 398:	e12fff1e 	bx	lr

0000039c <wait>:
 39c:	e92d4000 	push	{lr}
 3a0:	e92d0008 	push	{r3}
 3a4:	e92d0004 	push	{r2}
 3a8:	e92d0002 	push	{r1}
 3ac:	e92d0001 	push	{r0}
 3b0:	e3a00003 	mov	r0, #3
 3b4:	ef000040 	svc	0x00000040
 3b8:	e8bd0002 	pop	{r1}
 3bc:	e8bd0002 	pop	{r1}
 3c0:	e8bd0004 	pop	{r2}
 3c4:	e8bd0008 	pop	{r3}
 3c8:	e8bd4000 	pop	{lr}
 3cc:	e12fff1e 	bx	lr

000003d0 <pipe>:
 3d0:	e92d4000 	push	{lr}
 3d4:	e92d0008 	push	{r3}
 3d8:	e92d0004 	push	{r2}
 3dc:	e92d0002 	push	{r1}
 3e0:	e92d0001 	push	{r0}
 3e4:	e3a00004 	mov	r0, #4
 3e8:	ef000040 	svc	0x00000040
 3ec:	e8bd0002 	pop	{r1}
 3f0:	e8bd0002 	pop	{r1}
 3f4:	e8bd0004 	pop	{r2}
 3f8:	e8bd0008 	pop	{r3}
 3fc:	e8bd4000 	pop	{lr}
 400:	e12fff1e 	bx	lr

00000404 <read>:
 404:	e92d4000 	push	{lr}
 408:	e92d0008 	push	{r3}
 40c:	e92d0004 	push	{r2}
 410:	e92d0002 	push	{r1}
 414:	e92d0001 	push	{r0}
 418:	e3a00005 	mov	r0, #5
 41c:	ef000040 	svc	0x00000040
 420:	e8bd0002 	pop	{r1}
 424:	e8bd0002 	pop	{r1}
 428:	e8bd0004 	pop	{r2}
 42c:	e8bd0008 	pop	{r3}
 430:	e8bd4000 	pop	{lr}
 434:	e12fff1e 	bx	lr

00000438 <write>:
 438:	e92d4000 	push	{lr}
 43c:	e92d0008 	push	{r3}
 440:	e92d0004 	push	{r2}
 444:	e92d0002 	push	{r1}
 448:	e92d0001 	push	{r0}
 44c:	e3a00010 	mov	r0, #16
 450:	ef000040 	svc	0x00000040
 454:	e8bd0002 	pop	{r1}
 458:	e8bd0002 	pop	{r1}
 45c:	e8bd0004 	pop	{r2}
 460:	e8bd0008 	pop	{r3}
 464:	e8bd4000 	pop	{lr}
 468:	e12fff1e 	bx	lr

0000046c <close>:
 46c:	e92d4000 	push	{lr}
 470:	e92d0008 	push	{r3}
 474:	e92d0004 	push	{r2}
 478:	e92d0002 	push	{r1}
 47c:	e92d0001 	push	{r0}
 480:	e3a00015 	mov	r0, #21
 484:	ef000040 	svc	0x00000040
 488:	e8bd0002 	pop	{r1}
 48c:	e8bd0002 	pop	{r1}
 490:	e8bd0004 	pop	{r2}
 494:	e8bd0008 	pop	{r3}
 498:	e8bd4000 	pop	{lr}
 49c:	e12fff1e 	bx	lr

000004a0 <kill>:
 4a0:	e92d4000 	push	{lr}
 4a4:	e92d0008 	push	{r3}
 4a8:	e92d0004 	push	{r2}
 4ac:	e92d0002 	push	{r1}
 4b0:	e92d0001 	push	{r0}
 4b4:	e3a00006 	mov	r0, #6
 4b8:	ef000040 	svc	0x00000040
 4bc:	e8bd0002 	pop	{r1}
 4c0:	e8bd0002 	pop	{r1}
 4c4:	e8bd0004 	pop	{r2}
 4c8:	e8bd0008 	pop	{r3}
 4cc:	e8bd4000 	pop	{lr}
 4d0:	e12fff1e 	bx	lr

000004d4 <exec>:
 4d4:	e92d4000 	push	{lr}
 4d8:	e92d0008 	push	{r3}
 4dc:	e92d0004 	push	{r2}
 4e0:	e92d0002 	push	{r1}
 4e4:	e92d0001 	push	{r0}
 4e8:	e3a00007 	mov	r0, #7
 4ec:	ef000040 	svc	0x00000040
 4f0:	e8bd0002 	pop	{r1}
 4f4:	e8bd0002 	pop	{r1}
 4f8:	e8bd0004 	pop	{r2}
 4fc:	e8bd0008 	pop	{r3}
 500:	e8bd4000 	pop	{lr}
 504:	e12fff1e 	bx	lr

00000508 <open>:
 508:	e92d4000 	push	{lr}
 50c:	e92d0008 	push	{r3}
 510:	e92d0004 	push	{r2}
 514:	e92d0002 	push	{r1}
 518:	e92d0001 	push	{r0}
 51c:	e3a0000f 	mov	r0, #15
 520:	ef000040 	svc	0x00000040
 524:	e8bd0002 	pop	{r1}
 528:	e8bd0002 	pop	{r1}
 52c:	e8bd0004 	pop	{r2}
 530:	e8bd0008 	pop	{r3}
 534:	e8bd4000 	pop	{lr}
 538:	e12fff1e 	bx	lr

0000053c <mknod>:
 53c:	e92d4000 	push	{lr}
 540:	e92d0008 	push	{r3}
 544:	e92d0004 	push	{r2}
 548:	e92d0002 	push	{r1}
 54c:	e92d0001 	push	{r0}
 550:	e3a00011 	mov	r0, #17
 554:	ef000040 	svc	0x00000040
 558:	e8bd0002 	pop	{r1}
 55c:	e8bd0002 	pop	{r1}
 560:	e8bd0004 	pop	{r2}
 564:	e8bd0008 	pop	{r3}
 568:	e8bd4000 	pop	{lr}
 56c:	e12fff1e 	bx	lr

00000570 <unlink>:
 570:	e92d4000 	push	{lr}
 574:	e92d0008 	push	{r3}
 578:	e92d0004 	push	{r2}
 57c:	e92d0002 	push	{r1}
 580:	e92d0001 	push	{r0}
 584:	e3a00012 	mov	r0, #18
 588:	ef000040 	svc	0x00000040
 58c:	e8bd0002 	pop	{r1}
 590:	e8bd0002 	pop	{r1}
 594:	e8bd0004 	pop	{r2}
 598:	e8bd0008 	pop	{r3}
 59c:	e8bd4000 	pop	{lr}
 5a0:	e12fff1e 	bx	lr

000005a4 <fstat>:
 5a4:	e92d4000 	push	{lr}
 5a8:	e92d0008 	push	{r3}
 5ac:	e92d0004 	push	{r2}
 5b0:	e92d0002 	push	{r1}
 5b4:	e92d0001 	push	{r0}
 5b8:	e3a00008 	mov	r0, #8
 5bc:	ef000040 	svc	0x00000040
 5c0:	e8bd0002 	pop	{r1}
 5c4:	e8bd0002 	pop	{r1}
 5c8:	e8bd0004 	pop	{r2}
 5cc:	e8bd0008 	pop	{r3}
 5d0:	e8bd4000 	pop	{lr}
 5d4:	e12fff1e 	bx	lr

000005d8 <link>:
 5d8:	e92d4000 	push	{lr}
 5dc:	e92d0008 	push	{r3}
 5e0:	e92d0004 	push	{r2}
 5e4:	e92d0002 	push	{r1}
 5e8:	e92d0001 	push	{r0}
 5ec:	e3a00013 	mov	r0, #19
 5f0:	ef000040 	svc	0x00000040
 5f4:	e8bd0002 	pop	{r1}
 5f8:	e8bd0002 	pop	{r1}
 5fc:	e8bd0004 	pop	{r2}
 600:	e8bd0008 	pop	{r3}
 604:	e8bd4000 	pop	{lr}
 608:	e12fff1e 	bx	lr

0000060c <mkdir>:
 60c:	e92d4000 	push	{lr}
 610:	e92d0008 	push	{r3}
 614:	e92d0004 	push	{r2}
 618:	e92d0002 	push	{r1}
 61c:	e92d0001 	push	{r0}
 620:	e3a00014 	mov	r0, #20
 624:	ef000040 	svc	0x00000040
 628:	e8bd0002 	pop	{r1}
 62c:	e8bd0002 	pop	{r1}
 630:	e8bd0004 	pop	{r2}
 634:	e8bd0008 	pop	{r3}
 638:	e8bd4000 	pop	{lr}
 63c:	e12fff1e 	bx	lr

00000640 <chdir>:
 640:	e92d4000 	push	{lr}
 644:	e92d0008 	push	{r3}
 648:	e92d0004 	push	{r2}
 64c:	e92d0002 	push	{r1}
 650:	e92d0001 	push	{r0}
 654:	e3a00009 	mov	r0, #9
 658:	ef000040 	svc	0x00000040
 65c:	e8bd0002 	pop	{r1}
 660:	e8bd0002 	pop	{r1}
 664:	e8bd0004 	pop	{r2}
 668:	e8bd0008 	pop	{r3}
 66c:	e8bd4000 	pop	{lr}
 670:	e12fff1e 	bx	lr

00000674 <dup>:
 674:	e92d4000 	push	{lr}
 678:	e92d0008 	push	{r3}
 67c:	e92d0004 	push	{r2}
 680:	e92d0002 	push	{r1}
 684:	e92d0001 	push	{r0}
 688:	e3a0000a 	mov	r0, #10
 68c:	ef000040 	svc	0x00000040
 690:	e8bd0002 	pop	{r1}
 694:	e8bd0002 	pop	{r1}
 698:	e8bd0004 	pop	{r2}
 69c:	e8bd0008 	pop	{r3}
 6a0:	e8bd4000 	pop	{lr}
 6a4:	e12fff1e 	bx	lr

000006a8 <getpid>:
 6a8:	e92d4000 	push	{lr}
 6ac:	e92d0008 	push	{r3}
 6b0:	e92d0004 	push	{r2}
 6b4:	e92d0002 	push	{r1}
 6b8:	e92d0001 	push	{r0}
 6bc:	e3a0000b 	mov	r0, #11
 6c0:	ef000040 	svc	0x00000040
 6c4:	e8bd0002 	pop	{r1}
 6c8:	e8bd0002 	pop	{r1}
 6cc:	e8bd0004 	pop	{r2}
 6d0:	e8bd0008 	pop	{r3}
 6d4:	e8bd4000 	pop	{lr}
 6d8:	e12fff1e 	bx	lr

000006dc <sbrk>:
 6dc:	e92d4000 	push	{lr}
 6e0:	e92d0008 	push	{r3}
 6e4:	e92d0004 	push	{r2}
 6e8:	e92d0002 	push	{r1}
 6ec:	e92d0001 	push	{r0}
 6f0:	e3a0000c 	mov	r0, #12
 6f4:	ef000040 	svc	0x00000040
 6f8:	e8bd0002 	pop	{r1}
 6fc:	e8bd0002 	pop	{r1}
 700:	e8bd0004 	pop	{r2}
 704:	e8bd0008 	pop	{r3}
 708:	e8bd4000 	pop	{lr}
 70c:	e12fff1e 	bx	lr

00000710 <sleep>:
 710:	e92d4000 	push	{lr}
 714:	e92d0008 	push	{r3}
 718:	e92d0004 	push	{r2}
 71c:	e92d0002 	push	{r1}
 720:	e92d0001 	push	{r0}
 724:	e3a0000d 	mov	r0, #13
 728:	ef000040 	svc	0x00000040
 72c:	e8bd0002 	pop	{r1}
 730:	e8bd0002 	pop	{r1}
 734:	e8bd0004 	pop	{r2}
 738:	e8bd0008 	pop	{r3}
 73c:	e8bd4000 	pop	{lr}
 740:	e12fff1e 	bx	lr

00000744 <uptime>:
 744:	e92d4000 	push	{lr}
 748:	e92d0008 	push	{r3}
 74c:	e92d0004 	push	{r2}
 750:	e92d0002 	push	{r1}
 754:	e92d0001 	push	{r0}
 758:	e3a0000e 	mov	r0, #14
 75c:	ef000040 	svc	0x00000040
 760:	e8bd0002 	pop	{r1}
 764:	e8bd0002 	pop	{r1}
 768:	e8bd0004 	pop	{r2}
 76c:	e8bd0008 	pop	{r3}
 770:	e8bd4000 	pop	{lr}
 774:	e12fff1e 	bx	lr

00000778 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 778:	e92d4800 	push	{fp, lr}
 77c:	e28db004 	add	fp, sp, #4
 780:	e24b3004 	sub	r3, fp, #4
 784:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 788:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 78c:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 790:	e1a01003 	mov	r1, r3
 794:	ebffff27 	bl	438 <write>
}
 798:	e24bd004 	sub	sp, fp, #4
 79c:	e8bd8800 	pop	{fp, pc}

000007a0 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7a0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 7a4:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7a8:	e1a00fa1 	lsr	r0, r1, #31
 7ac:	e3530000 	cmp	r3, #0
 7b0:	03a03000 	moveq	r3, #0
 7b4:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7b8:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7bc:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7c0:	e24dd014 	sub	sp, sp, #20
 7c4:	e59f909c 	ldr	r9, [pc, #156]	; 868 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7c8:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 7cc:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 7d0:	e3a0a000 	mov	sl, #0
 7d4:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 7d8:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7dc:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 7e0:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7e4:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 7e8:	e1a0e031 	lsr	lr, r1, r0
 7ec:	e20ee001 	and	lr, lr, #1
 7f0:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 7f4:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 7f8:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 7fc:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 800:	e2500001 	subs	r0, r0, #1
 804:	2afffff7 	bcs	7e8 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 808:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 80c:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 810:	e0601001 	rsb	r1, r0, r1
 814:	e28a5001 	add	r5, sl, #1
 818:	e7d91001 	ldrb	r1, [r9, r1]
 81c:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 820:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 824:	11a0a005 	movne	sl, r5
 828:	1affffeb 	bne	7dc <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 82c:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 830:	124b2024 	subne	r2, fp, #36	; 0x24
 834:	10823005 	addne	r3, r2, r5
 838:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 83c:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 840:	13a0202d 	movne	r2, #45	; 0x2d
 844:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 848:	e7d61005 	ldrb	r1, [r6, r5]
 84c:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 850:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 854:	ebffffc7 	bl	778 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 858:	e3750001 	cmn	r5, #1
 85c:	1afffff9 	bne	848 <printint+0xa8>
    putc(fd, buf[i]);
}
 860:	e24bd020 	sub	sp, fp, #32
 864:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 868:	00000bc8 	.word	0x00000bc8

0000086c <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 86c:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 870:	e92d0830 	push	{r4, r5, fp}
 874:	e1a02000 	mov	r2, r0
 878:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 87c:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 880:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 884:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 888:	e1a04c32 	lsr	r4, r2, ip
 88c:	e2044001 	and	r4, r4, #1
 890:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 894:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 898:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 89c:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8a0:	e25cc001 	subs	ip, ip, #1
 8a4:	2afffff7 	bcs	888 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 8a8:	e24bd008 	sub	sp, fp, #8
 8ac:	e8bd0830 	pop	{r4, r5, fp}
 8b0:	e12fff1e 	bx	lr

000008b4 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8b4:	e92d000e 	push	{r1, r2, r3}
 8b8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8bc:	e28db020 	add	fp, sp, #32
 8c0:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8c4:	e59b4004 	ldr	r4, [fp, #4]
 8c8:	e5d48000 	ldrb	r8, [r4]
 8cc:	e3580000 	cmp	r8, #0
 8d0:	0a000027 	beq	974 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 8d4:	e59f712c 	ldr	r7, [pc, #300]	; a08 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 8d8:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8dc:	e3a0a000 	mov	sl, #0
 8e0:	ea000008 	b	908 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8e4:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 8e8:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8ec:	0a000002 	beq	8fc <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 8f0:	e1a00005 	mov	r0, r5
 8f4:	e1a01008 	mov	r1, r8
 8f8:	ebffff9e 	bl	778 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8fc:	e5f48001 	ldrb	r8, [r4, #1]!
 900:	e3580000 	cmp	r8, #0
 904:	0a00001a 	beq	974 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 908:	e35a0000 	cmp	sl, #0
 90c:	0afffff4 	beq	8e4 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 910:	e35a0025 	cmp	sl, #37	; 0x25
 914:	1afffff8 	bne	8fc <printf+0x48>
      if(c == 'd'){
 918:	e3580064 	cmp	r8, #100	; 0x64
 91c:	0a00002c 	beq	9d4 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 920:	e3580078 	cmp	r8, #120	; 0x78
 924:	13580070 	cmpne	r8, #112	; 0x70
 928:	13a09000 	movne	r9, #0
 92c:	03a09001 	moveq	r9, #1
 930:	0a000013 	beq	984 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 934:	e3580073 	cmp	r8, #115	; 0x73
 938:	0a000018 	beq	9a0 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 93c:	e3580063 	cmp	r8, #99	; 0x63
 940:	0a00002a 	beq	9f0 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 944:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 948:	e1a0100a 	mov	r1, sl
 94c:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 950:	0a000002 	beq	960 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 954:	ebffff87 	bl	778 <putc>
        putc(fd, c);
 958:	e1a00005 	mov	r0, r5
 95c:	e1a01008 	mov	r1, r8
 960:	ebffff84 	bl	778 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 964:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 968:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 96c:	e3580000 	cmp	r8, #0
 970:	1affffe4 	bne	908 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 974:	e24bd020 	sub	sp, fp, #32
 978:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 97c:	e28dd00c 	add	sp, sp, #12
 980:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 984:	e1a00005 	mov	r0, r5
 988:	e4961004 	ldr	r1, [r6], #4
 98c:	e3a02010 	mov	r2, #16
 990:	e3a03000 	mov	r3, #0
 994:	ebffff81 	bl	7a0 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 998:	e3a0a000 	mov	sl, #0
 99c:	eaffffd6 	b	8fc <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 9a0:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 9a4:	e3580000 	cmp	r8, #0
 9a8:	01a08007 	moveq	r8, r7
        while(*s != 0){
 9ac:	e5d81000 	ldrb	r1, [r8]
 9b0:	e3510000 	cmp	r1, #0
 9b4:	0a000004 	beq	9cc <printf+0x118>
          putc(fd, *s);
 9b8:	e1a00005 	mov	r0, r5
 9bc:	ebffff6d 	bl	778 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 9c0:	e5f81001 	ldrb	r1, [r8, #1]!
 9c4:	e3510000 	cmp	r1, #0
 9c8:	1afffffa 	bne	9b8 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9cc:	e1a0a001 	mov	sl, r1
 9d0:	eaffffc9 	b	8fc <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 9d4:	e1a00005 	mov	r0, r5
 9d8:	e4961004 	ldr	r1, [r6], #4
 9dc:	e3a0200a 	mov	r2, #10
 9e0:	e3a03001 	mov	r3, #1
 9e4:	ebffff6d 	bl	7a0 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9e8:	e3a0a000 	mov	sl, #0
 9ec:	eaffffc2 	b	8fc <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 9f0:	e4961004 	ldr	r1, [r6], #4
 9f4:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9f8:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 9fc:	e6ef1071 	uxtb	r1, r1
 a00:	ebffff5c 	bl	778 <putc>
 a04:	eaffffbc 	b	8fc <printf+0x48>
 a08:	00000bdc 	.word	0x00000bdc

00000a0c <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a0c:	e59f3098 	ldr	r3, [pc, #152]	; aac <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a10:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a14:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a18:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 a1c:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a20:	e152000c 	cmp	r2, ip
 a24:	e5921000 	ldr	r1, [r2]
 a28:	2a000001 	bcs	a34 <free+0x28>
 a2c:	e15c0001 	cmp	ip, r1
 a30:	3a000007 	bcc	a54 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a34:	e1520001 	cmp	r2, r1
 a38:	3a000003 	bcc	a4c <free+0x40>
 a3c:	e152000c 	cmp	r2, ip
 a40:	3a000003 	bcc	a54 <free+0x48>
 a44:	e15c0001 	cmp	ip, r1
 a48:	3a000001 	bcc	a54 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a4c:	e1a02001 	mov	r2, r1
 a50:	eafffff2 	b	a20 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a54:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a58:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a5c:	e08c5184 	add	r5, ip, r4, lsl #3
 a60:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 a64:	05911004 	ldreq	r1, [r1, #4]
 a68:	00814004 	addeq	r4, r1, r4
 a6c:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a70:	05921000 	ldreq	r1, [r2]
 a74:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 a78:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 a7c:	e5921004 	ldr	r1, [r2, #4]
 a80:	e0824181 	add	r4, r2, r1, lsl #3
 a84:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a88:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a8c:	0510c004 	ldreq	ip, [r0, #-4]
 a90:	008c1001 	addeq	r1, ip, r1
 a94:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 a98:	05101008 	ldreq	r1, [r0, #-8]
 a9c:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 aa0:	e24bd008 	sub	sp, fp, #8
 aa4:	e8bd0830 	pop	{r4, r5, fp}
 aa8:	e12fff1e 	bx	lr
 aac:	00000be4 	.word	0x00000be4

00000ab0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ab0:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab4:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 ab8:	e59f50d4 	ldr	r5, [pc, #212]	; b94 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 abc:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 ac0:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 ac4:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac8:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 acc:	e3530000 	cmp	r3, #0
 ad0:	0a00002b 	beq	b84 <malloc+0xd4>
 ad4:	e5930000 	ldr	r0, [r3]
 ad8:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 adc:	e1520004 	cmp	r2, r4
 ae0:	2a00001b 	bcs	b54 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 ae4:	e59f80ac 	ldr	r8, [pc, #172]	; b98 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 ae8:	e1a07184 	lsl	r7, r4, #3
 aec:	ea000003 	b	b00 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 af4:	e5902004 	ldr	r2, [r0, #4]
 af8:	e1540002 	cmp	r4, r2
 afc:	9a000014 	bls	b54 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b00:	e5952000 	ldr	r2, [r5]
 b04:	e1a03000 	mov	r3, r0
 b08:	e1500002 	cmp	r0, r2
 b0c:	1afffff7 	bne	af0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b10:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b14:	81a00007 	movhi	r0, r7
 b18:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b1c:	81a06004 	movhi	r6, r4
 b20:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b24:	ebfffeec 	bl	6dc <sbrk>
 b28:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b2c:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 b30:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 b34:	0a000010 	beq	b7c <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b38:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 b3c:	ebffffb2 	bl	a0c <free>
  return freep;
 b40:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b44:	e3530000 	cmp	r3, #0
 b48:	1affffe8 	bne	af0 <malloc+0x40>
        return 0;
 b4c:	e1a00003 	mov	r0, r3
  }
}
 b50:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b54:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b58:	10642002 	rsbne	r2, r4, r2
 b5c:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b60:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b64:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b68:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b6c:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 b70:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 b74:	e2800008 	add	r0, r0, #8
 b78:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 b7c:	e3a00000 	mov	r0, #0
 b80:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b84:	e2850004 	add	r0, r5, #4
 b88:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 b8c:	e9850009 	stmib	r5, {r0, r3}
 b90:	eaffffd3 	b	ae4 <malloc+0x34>
 b94:	00000be4 	.word	0x00000be4
 b98:	00000fff 	.word	0x00000fff
