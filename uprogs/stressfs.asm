
_stressfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	e92d4830 	push	{r4, r5, fp, lr}
   4:	e28db00c 	add	fp, sp, #12
  int fd, i;
  char path[] = "stressfs0";
   8:	e59f20ec 	ldr	r2, [pc, #236]	; fc <main+0xfc>
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   c:	e24dde21 	sub	sp, sp, #528	; 0x210
  int fd, i;
  char path[] = "stressfs0";
  10:	e24b3018 	sub	r3, fp, #24
  14:	e8920007 	ldm	r2, {r0, r1, r2}
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  18:	e3a04000 	mov	r4, #0

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
  1c:	e8a30003 	stmia	r3!, {r0, r1}
  char data[512];

  printf(1, "stressfs starting\n");
  20:	e3a00001 	mov	r0, #1
  24:	e59f10d4 	ldr	r1, [pc, #212]	; 100 <main+0x100>

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
  28:	e1c320b0 	strh	r2, [r3]
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	eb000232 	bl	8fc <printf>
  memset(data, 'a', sizeof(data));
  30:	e24b0f86 	sub	r0, fp, #536	; 0x218
  34:	e3a01061 	mov	r1, #97	; 0x61
  38:	e3a02c02 	mov	r2, #512	; 0x200
  3c:	eb000060 	bl	1c4 <memset>

  for(i = 0; i < 4; i++)
    if(fork() > 0)
  40:	eb0000cd 	bl	37c <fork>
  44:	e3500000 	cmp	r0, #0
  48:	ca000029 	bgt	f4 <main+0xf4>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  4c:	e2844001 	add	r4, r4, #1
  50:	e3540004 	cmp	r4, #4
  54:	1afffff9 	bne	40 <main+0x40>
  58:	e1a05004 	mov	r5, r4
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  5c:	e1a02004 	mov	r2, r4
  60:	e3a00001 	mov	r0, #1
  64:	e59f1098 	ldr	r1, [pc, #152]	; 104 <main+0x104>
  68:	eb000223 	bl	8fc <printf>

  path[8] += i;
  6c:	e55b3010 	ldrb	r3, [fp, #-16]
  fd = open(path, O_CREATE | O_RDWR);
  70:	e24b0018 	sub	r0, fp, #24
  74:	e59f108c 	ldr	r1, [pc, #140]	; 108 <main+0x108>
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);

  path[8] += i;
  78:	e0855003 	add	r5, r5, r3
  7c:	e54b5010 	strb	r5, [fp, #-16]
  fd = open(path, O_CREATE | O_RDWR);
  80:	eb000132 	bl	550 <open>
  84:	e3a04014 	mov	r4, #20
  88:	e1a05000 	mov	r5, r0
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  8c:	e1a00005 	mov	r0, r5
  90:	e24b1f86 	sub	r1, fp, #536	; 0x218
  94:	e3a02c02 	mov	r2, #512	; 0x200
  98:	eb0000f8 	bl	480 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  9c:	e2544001 	subs	r4, r4, #1
  a0:	1afffff9 	bne	8c <main+0x8c>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  a4:	e1a00005 	mov	r0, r5
  a8:	eb000101 	bl	4b4 <close>

  printf(1, "read\n");
  ac:	e3a00001 	mov	r0, #1
  b0:	e59f1054 	ldr	r1, [pc, #84]	; 10c <main+0x10c>
  b4:	eb000210 	bl	8fc <printf>

  fd = open(path, O_RDONLY);
  b8:	e1a01004 	mov	r1, r4
  bc:	e24b0018 	sub	r0, fp, #24
  c0:	eb000122 	bl	550 <open>
  c4:	e3a04014 	mov	r4, #20
  c8:	e1a05000 	mov	r5, r0
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
  cc:	e1a00005 	mov	r0, r5
  d0:	e24b1f86 	sub	r1, fp, #536	; 0x218
  d4:	e3a02c02 	mov	r2, #512	; 0x200
  d8:	eb0000db 	bl	44c <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
  dc:	e2544001 	subs	r4, r4, #1
  e0:	1afffff9 	bne	cc <main+0xcc>
    read(fd, data, sizeof(data));
  close(fd);
  e4:	e1a00005 	mov	r0, r5
  e8:	eb0000f1 	bl	4b4 <close>

  wait();
  ec:	eb0000bc 	bl	3e4 <wait>
  
  exit();
  f0:	eb0000ae 	bl	3b0 <exit>

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
    if(fork() > 0)
  f4:	e6ef5074 	uxtb	r5, r4
  f8:	eaffffd7 	b	5c <main+0x5c>
  fc:	00000c0c 	.word	0x00000c0c
 100:	00000be4 	.word	0x00000be4
 104:	00000bf8 	.word	0x00000bf8
 108:	00000202 	.word	0x00000202
 10c:	00000c04 	.word	0x00000c04

00000110 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 110:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 114:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 118:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 11c:	e4d13001 	ldrb	r3, [r1], #1
 120:	e3530000 	cmp	r3, #0
 124:	e4c23001 	strb	r3, [r2], #1
 128:	1afffffb 	bne	11c <strcpy+0xc>
    ;
  return os;
}
 12c:	e28bd000 	add	sp, fp, #0
 130:	e8bd0800 	pop	{fp}
 134:	e12fff1e 	bx	lr

00000138 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 138:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 13c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 140:	e5d03000 	ldrb	r3, [r0]
 144:	e5d12000 	ldrb	r2, [r1]
 148:	e3530000 	cmp	r3, #0
 14c:	1a000004 	bne	164 <strcmp+0x2c>
 150:	ea000005 	b	16c <strcmp+0x34>
 154:	e5f03001 	ldrb	r3, [r0, #1]!
 158:	e3530000 	cmp	r3, #0
 15c:	0a000006 	beq	17c <strcmp+0x44>
 160:	e5f12001 	ldrb	r2, [r1, #1]!
 164:	e1530002 	cmp	r3, r2
 168:	0afffff9 	beq	154 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 16c:	e0620003 	rsb	r0, r2, r3
 170:	e28bd000 	add	sp, fp, #0
 174:	e8bd0800 	pop	{fp}
 178:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17c:	e5d12001 	ldrb	r2, [r1, #1]
 180:	eafffff9 	b	16c <strcmp+0x34>

00000184 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 184:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 188:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 18c:	e5d03000 	ldrb	r3, [r0]
 190:	e3530000 	cmp	r3, #0
 194:	01a00003 	moveq	r0, r3
 198:	0a000006 	beq	1b8 <strlen+0x34>
 19c:	e1a02000 	mov	r2, r0
 1a0:	e3a03000 	mov	r3, #0
 1a4:	e5f21001 	ldrb	r1, [r2, #1]!
 1a8:	e2833001 	add	r3, r3, #1
 1ac:	e1a00003 	mov	r0, r3
 1b0:	e3510000 	cmp	r1, #0
 1b4:	1afffffa 	bne	1a4 <strlen+0x20>
    ;
  return n;
}
 1b8:	e28bd000 	add	sp, fp, #0
 1bc:	e8bd0800 	pop	{fp}
 1c0:	e12fff1e 	bx	lr

000001c4 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1c4:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 1c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1cc:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1d0:	0a000006 	beq	1f0 <memset+0x2c>
 1d4:	e6ef1071 	uxtb	r1, r1
 1d8:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 1dc:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1e0:	e2533001 	subs	r3, r3, #1
 1e4:	e4cc1001 	strb	r1, [ip], #1
 1e8:	1afffffc 	bne	1e0 <memset+0x1c>
 1ec:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 1f0:	e28bd000 	add	sp, fp, #0
 1f4:	e8bd0800 	pop	{fp}
 1f8:	e12fff1e 	bx	lr

000001fc <strchr>:

char*
strchr(const char *s, char c)
{
 1fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 200:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 204:	e5d03000 	ldrb	r3, [r0]
 208:	e3530000 	cmp	r3, #0
 20c:	1a000004 	bne	224 <strchr+0x28>
 210:	ea000008 	b	238 <strchr+0x3c>
 214:	e5d03001 	ldrb	r3, [r0, #1]
 218:	e2800001 	add	r0, r0, #1
 21c:	e3530000 	cmp	r3, #0
 220:	0a000004 	beq	238 <strchr+0x3c>
    if(*s == c)
 224:	e1530001 	cmp	r3, r1
 228:	1afffff9 	bne	214 <strchr+0x18>
      return (char*)s;
  return 0;
}
 22c:	e28bd000 	add	sp, fp, #0
 230:	e8bd0800 	pop	{fp}
 234:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 238:	e1a00003 	mov	r0, r3
 23c:	eafffffa 	b	22c <strchr+0x30>

00000240 <gets>:
}

char*
gets(char *buf, int max)
{
 240:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 244:	e28db018 	add	fp, sp, #24
 248:	e24dd00c 	sub	sp, sp, #12
 24c:	e1a08000 	mov	r8, r0
 250:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 254:	e1a06000 	mov	r6, r0
 258:	e3a05000 	mov	r5, #0
 25c:	ea000008 	b	284 <gets+0x44>
    cc = read(0, &c, 1);
 260:	eb000079 	bl	44c <read>
    if(cc < 1)
 264:	e3500000 	cmp	r0, #0
 268:	da00000b 	ble	29c <gets+0x5c>
      break;
    buf[i++] = c;
 26c:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 270:	e1a05004 	mov	r5, r4
 274:	e353000a 	cmp	r3, #10
 278:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 27c:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 280:	0a00000a 	beq	2b0 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 284:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 288:	e0854002 	add	r4, r5, r2
 28c:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 290:	e3a00000 	mov	r0, #0
 294:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 298:	bafffff0 	blt	260 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 29c:	e3a03000 	mov	r3, #0
 2a0:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 2a4:	e1a00008 	mov	r0, r8
 2a8:	e24bd018 	sub	sp, fp, #24
 2ac:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b0:	e1a05004 	mov	r5, r4
 2b4:	eafffff8 	b	29c <gets+0x5c>

000002b8 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 2b8:	e92d4830 	push	{r4, r5, fp, lr}
 2bc:	e1a05001 	mov	r5, r1
 2c0:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c4:	e3a01000 	mov	r1, #0
 2c8:	eb0000a0 	bl	550 <open>
  if(fd < 0)
 2cc:	e2504000 	subs	r4, r0, #0
    return -1;
 2d0:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 2d4:	ba000004 	blt	2ec <stat+0x34>
    return -1;
  r = fstat(fd, st);
 2d8:	e1a01005 	mov	r1, r5
 2dc:	eb0000c2 	bl	5ec <fstat>
 2e0:	e1a05000 	mov	r5, r0
  close(fd);
 2e4:	e1a00004 	mov	r0, r4
 2e8:	eb000071 	bl	4b4 <close>
  return r;
}
 2ec:	e1a00005 	mov	r0, r5
 2f0:	e8bd8830 	pop	{r4, r5, fp, pc}

000002f4 <atoi>:

int
atoi(const char *s)
{
 2f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2f8:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2fc:	e5d03000 	ldrb	r3, [r0]
 300:	e2432030 	sub	r2, r3, #48	; 0x30
 304:	e6ef2072 	uxtb	r2, r2
 308:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 30c:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 310:	8a000009 	bhi	33c <atoi+0x48>
 314:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 318:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 31c:	e0800100 	add	r0, r0, r0, lsl #2
 320:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 324:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 328:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 32c:	e2431030 	sub	r1, r3, #48	; 0x30
 330:	e6ef1071 	uxtb	r1, r1
 334:	e3510009 	cmp	r1, #9
 338:	9afffff7 	bls	31c <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 33c:	e28bd000 	add	sp, fp, #0
 340:	e8bd0800 	pop	{fp}
 344:	e12fff1e 	bx	lr

00000348 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 348:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 34c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 350:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 354:	da000005 	ble	370 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 358:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 35c:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 360:	e4d1c001 	ldrb	ip, [r1], #1
 364:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 368:	e1530002 	cmp	r3, r2
 36c:	1afffffb 	bne	360 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 370:	e28bd000 	add	sp, fp, #0
 374:	e8bd0800 	pop	{fp}
 378:	e12fff1e 	bx	lr

0000037c <fork>:
 37c:	e92d4000 	push	{lr}
 380:	e92d0008 	push	{r3}
 384:	e92d0004 	push	{r2}
 388:	e92d0002 	push	{r1}
 38c:	e92d0001 	push	{r0}
 390:	e3a00001 	mov	r0, #1
 394:	ef000040 	svc	0x00000040
 398:	e8bd0002 	pop	{r1}
 39c:	e8bd0002 	pop	{r1}
 3a0:	e8bd0004 	pop	{r2}
 3a4:	e8bd0008 	pop	{r3}
 3a8:	e8bd4000 	pop	{lr}
 3ac:	e12fff1e 	bx	lr

000003b0 <exit>:
 3b0:	e92d4000 	push	{lr}
 3b4:	e92d0008 	push	{r3}
 3b8:	e92d0004 	push	{r2}
 3bc:	e92d0002 	push	{r1}
 3c0:	e92d0001 	push	{r0}
 3c4:	e3a00002 	mov	r0, #2
 3c8:	ef000040 	svc	0x00000040
 3cc:	e8bd0002 	pop	{r1}
 3d0:	e8bd0002 	pop	{r1}
 3d4:	e8bd0004 	pop	{r2}
 3d8:	e8bd0008 	pop	{r3}
 3dc:	e8bd4000 	pop	{lr}
 3e0:	e12fff1e 	bx	lr

000003e4 <wait>:
 3e4:	e92d4000 	push	{lr}
 3e8:	e92d0008 	push	{r3}
 3ec:	e92d0004 	push	{r2}
 3f0:	e92d0002 	push	{r1}
 3f4:	e92d0001 	push	{r0}
 3f8:	e3a00003 	mov	r0, #3
 3fc:	ef000040 	svc	0x00000040
 400:	e8bd0002 	pop	{r1}
 404:	e8bd0002 	pop	{r1}
 408:	e8bd0004 	pop	{r2}
 40c:	e8bd0008 	pop	{r3}
 410:	e8bd4000 	pop	{lr}
 414:	e12fff1e 	bx	lr

00000418 <pipe>:
 418:	e92d4000 	push	{lr}
 41c:	e92d0008 	push	{r3}
 420:	e92d0004 	push	{r2}
 424:	e92d0002 	push	{r1}
 428:	e92d0001 	push	{r0}
 42c:	e3a00004 	mov	r0, #4
 430:	ef000040 	svc	0x00000040
 434:	e8bd0002 	pop	{r1}
 438:	e8bd0002 	pop	{r1}
 43c:	e8bd0004 	pop	{r2}
 440:	e8bd0008 	pop	{r3}
 444:	e8bd4000 	pop	{lr}
 448:	e12fff1e 	bx	lr

0000044c <read>:
 44c:	e92d4000 	push	{lr}
 450:	e92d0008 	push	{r3}
 454:	e92d0004 	push	{r2}
 458:	e92d0002 	push	{r1}
 45c:	e92d0001 	push	{r0}
 460:	e3a00005 	mov	r0, #5
 464:	ef000040 	svc	0x00000040
 468:	e8bd0002 	pop	{r1}
 46c:	e8bd0002 	pop	{r1}
 470:	e8bd0004 	pop	{r2}
 474:	e8bd0008 	pop	{r3}
 478:	e8bd4000 	pop	{lr}
 47c:	e12fff1e 	bx	lr

00000480 <write>:
 480:	e92d4000 	push	{lr}
 484:	e92d0008 	push	{r3}
 488:	e92d0004 	push	{r2}
 48c:	e92d0002 	push	{r1}
 490:	e92d0001 	push	{r0}
 494:	e3a00010 	mov	r0, #16
 498:	ef000040 	svc	0x00000040
 49c:	e8bd0002 	pop	{r1}
 4a0:	e8bd0002 	pop	{r1}
 4a4:	e8bd0004 	pop	{r2}
 4a8:	e8bd0008 	pop	{r3}
 4ac:	e8bd4000 	pop	{lr}
 4b0:	e12fff1e 	bx	lr

000004b4 <close>:
 4b4:	e92d4000 	push	{lr}
 4b8:	e92d0008 	push	{r3}
 4bc:	e92d0004 	push	{r2}
 4c0:	e92d0002 	push	{r1}
 4c4:	e92d0001 	push	{r0}
 4c8:	e3a00015 	mov	r0, #21
 4cc:	ef000040 	svc	0x00000040
 4d0:	e8bd0002 	pop	{r1}
 4d4:	e8bd0002 	pop	{r1}
 4d8:	e8bd0004 	pop	{r2}
 4dc:	e8bd0008 	pop	{r3}
 4e0:	e8bd4000 	pop	{lr}
 4e4:	e12fff1e 	bx	lr

000004e8 <kill>:
 4e8:	e92d4000 	push	{lr}
 4ec:	e92d0008 	push	{r3}
 4f0:	e92d0004 	push	{r2}
 4f4:	e92d0002 	push	{r1}
 4f8:	e92d0001 	push	{r0}
 4fc:	e3a00006 	mov	r0, #6
 500:	ef000040 	svc	0x00000040
 504:	e8bd0002 	pop	{r1}
 508:	e8bd0002 	pop	{r1}
 50c:	e8bd0004 	pop	{r2}
 510:	e8bd0008 	pop	{r3}
 514:	e8bd4000 	pop	{lr}
 518:	e12fff1e 	bx	lr

0000051c <exec>:
 51c:	e92d4000 	push	{lr}
 520:	e92d0008 	push	{r3}
 524:	e92d0004 	push	{r2}
 528:	e92d0002 	push	{r1}
 52c:	e92d0001 	push	{r0}
 530:	e3a00007 	mov	r0, #7
 534:	ef000040 	svc	0x00000040
 538:	e8bd0002 	pop	{r1}
 53c:	e8bd0002 	pop	{r1}
 540:	e8bd0004 	pop	{r2}
 544:	e8bd0008 	pop	{r3}
 548:	e8bd4000 	pop	{lr}
 54c:	e12fff1e 	bx	lr

00000550 <open>:
 550:	e92d4000 	push	{lr}
 554:	e92d0008 	push	{r3}
 558:	e92d0004 	push	{r2}
 55c:	e92d0002 	push	{r1}
 560:	e92d0001 	push	{r0}
 564:	e3a0000f 	mov	r0, #15
 568:	ef000040 	svc	0x00000040
 56c:	e8bd0002 	pop	{r1}
 570:	e8bd0002 	pop	{r1}
 574:	e8bd0004 	pop	{r2}
 578:	e8bd0008 	pop	{r3}
 57c:	e8bd4000 	pop	{lr}
 580:	e12fff1e 	bx	lr

00000584 <mknod>:
 584:	e92d4000 	push	{lr}
 588:	e92d0008 	push	{r3}
 58c:	e92d0004 	push	{r2}
 590:	e92d0002 	push	{r1}
 594:	e92d0001 	push	{r0}
 598:	e3a00011 	mov	r0, #17
 59c:	ef000040 	svc	0x00000040
 5a0:	e8bd0002 	pop	{r1}
 5a4:	e8bd0002 	pop	{r1}
 5a8:	e8bd0004 	pop	{r2}
 5ac:	e8bd0008 	pop	{r3}
 5b0:	e8bd4000 	pop	{lr}
 5b4:	e12fff1e 	bx	lr

000005b8 <unlink>:
 5b8:	e92d4000 	push	{lr}
 5bc:	e92d0008 	push	{r3}
 5c0:	e92d0004 	push	{r2}
 5c4:	e92d0002 	push	{r1}
 5c8:	e92d0001 	push	{r0}
 5cc:	e3a00012 	mov	r0, #18
 5d0:	ef000040 	svc	0x00000040
 5d4:	e8bd0002 	pop	{r1}
 5d8:	e8bd0002 	pop	{r1}
 5dc:	e8bd0004 	pop	{r2}
 5e0:	e8bd0008 	pop	{r3}
 5e4:	e8bd4000 	pop	{lr}
 5e8:	e12fff1e 	bx	lr

000005ec <fstat>:
 5ec:	e92d4000 	push	{lr}
 5f0:	e92d0008 	push	{r3}
 5f4:	e92d0004 	push	{r2}
 5f8:	e92d0002 	push	{r1}
 5fc:	e92d0001 	push	{r0}
 600:	e3a00008 	mov	r0, #8
 604:	ef000040 	svc	0x00000040
 608:	e8bd0002 	pop	{r1}
 60c:	e8bd0002 	pop	{r1}
 610:	e8bd0004 	pop	{r2}
 614:	e8bd0008 	pop	{r3}
 618:	e8bd4000 	pop	{lr}
 61c:	e12fff1e 	bx	lr

00000620 <link>:
 620:	e92d4000 	push	{lr}
 624:	e92d0008 	push	{r3}
 628:	e92d0004 	push	{r2}
 62c:	e92d0002 	push	{r1}
 630:	e92d0001 	push	{r0}
 634:	e3a00013 	mov	r0, #19
 638:	ef000040 	svc	0x00000040
 63c:	e8bd0002 	pop	{r1}
 640:	e8bd0002 	pop	{r1}
 644:	e8bd0004 	pop	{r2}
 648:	e8bd0008 	pop	{r3}
 64c:	e8bd4000 	pop	{lr}
 650:	e12fff1e 	bx	lr

00000654 <mkdir>:
 654:	e92d4000 	push	{lr}
 658:	e92d0008 	push	{r3}
 65c:	e92d0004 	push	{r2}
 660:	e92d0002 	push	{r1}
 664:	e92d0001 	push	{r0}
 668:	e3a00014 	mov	r0, #20
 66c:	ef000040 	svc	0x00000040
 670:	e8bd0002 	pop	{r1}
 674:	e8bd0002 	pop	{r1}
 678:	e8bd0004 	pop	{r2}
 67c:	e8bd0008 	pop	{r3}
 680:	e8bd4000 	pop	{lr}
 684:	e12fff1e 	bx	lr

00000688 <chdir>:
 688:	e92d4000 	push	{lr}
 68c:	e92d0008 	push	{r3}
 690:	e92d0004 	push	{r2}
 694:	e92d0002 	push	{r1}
 698:	e92d0001 	push	{r0}
 69c:	e3a00009 	mov	r0, #9
 6a0:	ef000040 	svc	0x00000040
 6a4:	e8bd0002 	pop	{r1}
 6a8:	e8bd0002 	pop	{r1}
 6ac:	e8bd0004 	pop	{r2}
 6b0:	e8bd0008 	pop	{r3}
 6b4:	e8bd4000 	pop	{lr}
 6b8:	e12fff1e 	bx	lr

000006bc <dup>:
 6bc:	e92d4000 	push	{lr}
 6c0:	e92d0008 	push	{r3}
 6c4:	e92d0004 	push	{r2}
 6c8:	e92d0002 	push	{r1}
 6cc:	e92d0001 	push	{r0}
 6d0:	e3a0000a 	mov	r0, #10
 6d4:	ef000040 	svc	0x00000040
 6d8:	e8bd0002 	pop	{r1}
 6dc:	e8bd0002 	pop	{r1}
 6e0:	e8bd0004 	pop	{r2}
 6e4:	e8bd0008 	pop	{r3}
 6e8:	e8bd4000 	pop	{lr}
 6ec:	e12fff1e 	bx	lr

000006f0 <getpid>:
 6f0:	e92d4000 	push	{lr}
 6f4:	e92d0008 	push	{r3}
 6f8:	e92d0004 	push	{r2}
 6fc:	e92d0002 	push	{r1}
 700:	e92d0001 	push	{r0}
 704:	e3a0000b 	mov	r0, #11
 708:	ef000040 	svc	0x00000040
 70c:	e8bd0002 	pop	{r1}
 710:	e8bd0002 	pop	{r1}
 714:	e8bd0004 	pop	{r2}
 718:	e8bd0008 	pop	{r3}
 71c:	e8bd4000 	pop	{lr}
 720:	e12fff1e 	bx	lr

00000724 <sbrk>:
 724:	e92d4000 	push	{lr}
 728:	e92d0008 	push	{r3}
 72c:	e92d0004 	push	{r2}
 730:	e92d0002 	push	{r1}
 734:	e92d0001 	push	{r0}
 738:	e3a0000c 	mov	r0, #12
 73c:	ef000040 	svc	0x00000040
 740:	e8bd0002 	pop	{r1}
 744:	e8bd0002 	pop	{r1}
 748:	e8bd0004 	pop	{r2}
 74c:	e8bd0008 	pop	{r3}
 750:	e8bd4000 	pop	{lr}
 754:	e12fff1e 	bx	lr

00000758 <sleep>:
 758:	e92d4000 	push	{lr}
 75c:	e92d0008 	push	{r3}
 760:	e92d0004 	push	{r2}
 764:	e92d0002 	push	{r1}
 768:	e92d0001 	push	{r0}
 76c:	e3a0000d 	mov	r0, #13
 770:	ef000040 	svc	0x00000040
 774:	e8bd0002 	pop	{r1}
 778:	e8bd0002 	pop	{r1}
 77c:	e8bd0004 	pop	{r2}
 780:	e8bd0008 	pop	{r3}
 784:	e8bd4000 	pop	{lr}
 788:	e12fff1e 	bx	lr

0000078c <uptime>:
 78c:	e92d4000 	push	{lr}
 790:	e92d0008 	push	{r3}
 794:	e92d0004 	push	{r2}
 798:	e92d0002 	push	{r1}
 79c:	e92d0001 	push	{r0}
 7a0:	e3a0000e 	mov	r0, #14
 7a4:	ef000040 	svc	0x00000040
 7a8:	e8bd0002 	pop	{r1}
 7ac:	e8bd0002 	pop	{r1}
 7b0:	e8bd0004 	pop	{r2}
 7b4:	e8bd0008 	pop	{r3}
 7b8:	e8bd4000 	pop	{lr}
 7bc:	e12fff1e 	bx	lr

000007c0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7c0:	e92d4800 	push	{fp, lr}
 7c4:	e28db004 	add	fp, sp, #4
 7c8:	e24b3004 	sub	r3, fp, #4
 7cc:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 7d0:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7d4:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 7d8:	e1a01003 	mov	r1, r3
 7dc:	ebffff27 	bl	480 <write>
}
 7e0:	e24bd004 	sub	sp, fp, #4
 7e4:	e8bd8800 	pop	{fp, pc}

000007e8 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7e8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 7ec:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7f0:	e1a00fa1 	lsr	r0, r1, #31
 7f4:	e3530000 	cmp	r3, #0
 7f8:	03a03000 	moveq	r3, #0
 7fc:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 800:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 804:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 808:	e24dd014 	sub	sp, sp, #20
 80c:	e59f909c 	ldr	r9, [pc, #156]	; 8b0 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 810:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 814:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 818:	e3a0a000 	mov	sl, #0
 81c:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 820:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 824:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 828:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 82c:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 830:	e1a0e031 	lsr	lr, r1, r0
 834:	e20ee001 	and	lr, lr, #1
 838:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 83c:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 840:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 844:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 848:	e2500001 	subs	r0, r0, #1
 84c:	2afffff7 	bcs	830 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 850:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 854:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 858:	e0601001 	rsb	r1, r0, r1
 85c:	e28a5001 	add	r5, sl, #1
 860:	e7d91001 	ldrb	r1, [r9, r1]
 864:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 868:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 86c:	11a0a005 	movne	sl, r5
 870:	1affffeb 	bne	824 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 874:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 878:	124b2024 	subne	r2, fp, #36	; 0x24
 87c:	10823005 	addne	r3, r2, r5
 880:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 884:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 888:	13a0202d 	movne	r2, #45	; 0x2d
 88c:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 890:	e7d61005 	ldrb	r1, [r6, r5]
 894:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 898:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 89c:	ebffffc7 	bl	7c0 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 8a0:	e3750001 	cmn	r5, #1
 8a4:	1afffff9 	bne	890 <printint+0xa8>
    putc(fd, buf[i]);
}
 8a8:	e24bd020 	sub	sp, fp, #32
 8ac:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8b0:	00000c18 	.word	0x00000c18

000008b4 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 8b4:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 8b8:	e92d0830 	push	{r4, r5, fp}
 8bc:	e1a02000 	mov	r2, r0
 8c0:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8c4:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 8c8:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 8cc:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 8d0:	e1a04c32 	lsr	r4, r2, ip
 8d4:	e2044001 	and	r4, r4, #1
 8d8:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 8dc:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 8e0:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 8e4:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8e8:	e25cc001 	subs	ip, ip, #1
 8ec:	2afffff7 	bcs	8d0 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 8f0:	e24bd008 	sub	sp, fp, #8
 8f4:	e8bd0830 	pop	{r4, r5, fp}
 8f8:	e12fff1e 	bx	lr

000008fc <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8fc:	e92d000e 	push	{r1, r2, r3}
 900:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 904:	e28db020 	add	fp, sp, #32
 908:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 90c:	e59b4004 	ldr	r4, [fp, #4]
 910:	e5d48000 	ldrb	r8, [r4]
 914:	e3580000 	cmp	r8, #0
 918:	0a000027 	beq	9bc <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 91c:	e59f712c 	ldr	r7, [pc, #300]	; a50 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 920:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 924:	e3a0a000 	mov	sl, #0
 928:	ea000008 	b	950 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 92c:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 930:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 934:	0a000002 	beq	944 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 938:	e1a00005 	mov	r0, r5
 93c:	e1a01008 	mov	r1, r8
 940:	ebffff9e 	bl	7c0 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 944:	e5f48001 	ldrb	r8, [r4, #1]!
 948:	e3580000 	cmp	r8, #0
 94c:	0a00001a 	beq	9bc <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 950:	e35a0000 	cmp	sl, #0
 954:	0afffff4 	beq	92c <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 958:	e35a0025 	cmp	sl, #37	; 0x25
 95c:	1afffff8 	bne	944 <printf+0x48>
      if(c == 'd'){
 960:	e3580064 	cmp	r8, #100	; 0x64
 964:	0a00002c 	beq	a1c <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 968:	e3580078 	cmp	r8, #120	; 0x78
 96c:	13580070 	cmpne	r8, #112	; 0x70
 970:	13a09000 	movne	r9, #0
 974:	03a09001 	moveq	r9, #1
 978:	0a000013 	beq	9cc <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 97c:	e3580073 	cmp	r8, #115	; 0x73
 980:	0a000018 	beq	9e8 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 984:	e3580063 	cmp	r8, #99	; 0x63
 988:	0a00002a 	beq	a38 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 98c:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 990:	e1a0100a 	mov	r1, sl
 994:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 998:	0a000002 	beq	9a8 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 99c:	ebffff87 	bl	7c0 <putc>
        putc(fd, c);
 9a0:	e1a00005 	mov	r0, r5
 9a4:	e1a01008 	mov	r1, r8
 9a8:	ebffff84 	bl	7c0 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9ac:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9b0:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9b4:	e3580000 	cmp	r8, #0
 9b8:	1affffe4 	bne	950 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9bc:	e24bd020 	sub	sp, fp, #32
 9c0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 9c4:	e28dd00c 	add	sp, sp, #12
 9c8:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 9cc:	e1a00005 	mov	r0, r5
 9d0:	e4961004 	ldr	r1, [r6], #4
 9d4:	e3a02010 	mov	r2, #16
 9d8:	e3a03000 	mov	r3, #0
 9dc:	ebffff81 	bl	7e8 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9e0:	e3a0a000 	mov	sl, #0
 9e4:	eaffffd6 	b	944 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 9e8:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 9ec:	e3580000 	cmp	r8, #0
 9f0:	01a08007 	moveq	r8, r7
        while(*s != 0){
 9f4:	e5d81000 	ldrb	r1, [r8]
 9f8:	e3510000 	cmp	r1, #0
 9fc:	0a000004 	beq	a14 <printf+0x118>
          putc(fd, *s);
 a00:	e1a00005 	mov	r0, r5
 a04:	ebffff6d 	bl	7c0 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 a08:	e5f81001 	ldrb	r1, [r8, #1]!
 a0c:	e3510000 	cmp	r1, #0
 a10:	1afffffa 	bne	a00 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a14:	e1a0a001 	mov	sl, r1
 a18:	eaffffc9 	b	944 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a1c:	e1a00005 	mov	r0, r5
 a20:	e4961004 	ldr	r1, [r6], #4
 a24:	e3a0200a 	mov	r2, #10
 a28:	e3a03001 	mov	r3, #1
 a2c:	ebffff6d 	bl	7e8 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a30:	e3a0a000 	mov	sl, #0
 a34:	eaffffc2 	b	944 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 a38:	e4961004 	ldr	r1, [r6], #4
 a3c:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a40:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 a44:	e6ef1071 	uxtb	r1, r1
 a48:	ebffff5c 	bl	7c0 <putc>
 a4c:	eaffffbc 	b	944 <printf+0x48>
 a50:	00000c2c 	.word	0x00000c2c

00000a54 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a54:	e59f3098 	ldr	r3, [pc, #152]	; af4 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a58:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a5c:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a60:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 a64:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a68:	e152000c 	cmp	r2, ip
 a6c:	e5921000 	ldr	r1, [r2]
 a70:	2a000001 	bcs	a7c <free+0x28>
 a74:	e15c0001 	cmp	ip, r1
 a78:	3a000007 	bcc	a9c <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a7c:	e1520001 	cmp	r2, r1
 a80:	3a000003 	bcc	a94 <free+0x40>
 a84:	e152000c 	cmp	r2, ip
 a88:	3a000003 	bcc	a9c <free+0x48>
 a8c:	e15c0001 	cmp	ip, r1
 a90:	3a000001 	bcc	a9c <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a94:	e1a02001 	mov	r2, r1
 a98:	eafffff2 	b	a68 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a9c:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 aa0:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 aa4:	e08c5184 	add	r5, ip, r4, lsl #3
 aa8:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 aac:	05911004 	ldreq	r1, [r1, #4]
 ab0:	00814004 	addeq	r4, r1, r4
 ab4:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 ab8:	05921000 	ldreq	r1, [r2]
 abc:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 ac0:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 ac4:	e5921004 	ldr	r1, [r2, #4]
 ac8:	e0824181 	add	r4, r2, r1, lsl #3
 acc:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 ad0:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 ad4:	0510c004 	ldreq	ip, [r0, #-4]
 ad8:	008c1001 	addeq	r1, ip, r1
 adc:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 ae0:	05101008 	ldreq	r1, [r0, #-8]
 ae4:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 ae8:	e24bd008 	sub	sp, fp, #8
 aec:	e8bd0830 	pop	{r4, r5, fp}
 af0:	e12fff1e 	bx	lr
 af4:	00000c34 	.word	0x00000c34

00000af8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 af8:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 afc:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 b00:	e59f50d4 	ldr	r5, [pc, #212]	; bdc <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b04:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 b08:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b0c:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b10:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b14:	e3530000 	cmp	r3, #0
 b18:	0a00002b 	beq	bcc <malloc+0xd4>
 b1c:	e5930000 	ldr	r0, [r3]
 b20:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b24:	e1520004 	cmp	r2, r4
 b28:	2a00001b 	bcs	b9c <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b2c:	e59f80ac 	ldr	r8, [pc, #172]	; be0 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b30:	e1a07184 	lsl	r7, r4, #3
 b34:	ea000003 	b	b48 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b38:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b3c:	e5902004 	ldr	r2, [r0, #4]
 b40:	e1540002 	cmp	r4, r2
 b44:	9a000014 	bls	b9c <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b48:	e5952000 	ldr	r2, [r5]
 b4c:	e1a03000 	mov	r3, r0
 b50:	e1500002 	cmp	r0, r2
 b54:	1afffff7 	bne	b38 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b58:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b5c:	81a00007 	movhi	r0, r7
 b60:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b64:	81a06004 	movhi	r6, r4
 b68:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b6c:	ebfffeec 	bl	724 <sbrk>
 b70:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b74:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 b78:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 b7c:	0a000010 	beq	bc4 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b80:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 b84:	ebffffb2 	bl	a54 <free>
  return freep;
 b88:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b8c:	e3530000 	cmp	r3, #0
 b90:	1affffe8 	bne	b38 <malloc+0x40>
        return 0;
 b94:	e1a00003 	mov	r0, r3
  }
}
 b98:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b9c:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ba0:	10642002 	rsbne	r2, r4, r2
 ba4:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 ba8:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 bac:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 bb0:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 bb4:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 bb8:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 bbc:	e2800008 	add	r0, r0, #8
 bc0:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 bc4:	e3a00000 	mov	r0, #0
 bc8:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 bcc:	e2850004 	add	r0, r5, #4
 bd0:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 bd4:	e9850009 	stmib	r5, {r0, r3}
 bd8:	eaffffd3 	b	b2c <malloc+0x34>
 bdc:	00000c34 	.word	0x00000c34
 be0:	00000fff 	.word	0x00000fff
