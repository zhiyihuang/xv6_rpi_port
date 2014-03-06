
_kill:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
  int i;

  if(argc < 1){
   4:	e2504000 	subs	r4, r0, #0
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   8:	e28db014 	add	fp, sp, #20
  int i;

  if(argc < 1){
   c:	da00000a 	ble	3c <main+0x3c>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  10:	e3540001 	cmp	r4, #1
{
  int i;

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  14:	11a06001 	movne	r6, r1
  }
  for(i=1; i<argc; i++)
  18:	13a05001 	movne	r5, #1
  1c:	0a000005 	beq	38 <main+0x38>
    kill(atoi(argv[i]));
  20:	e5b60004 	ldr	r0, [r6, #4]!
  24:	eb000082 	bl	234 <atoi>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  28:	e2855001 	add	r5, r5, #1
    kill(atoi(argv[i]));
  2c:	eb0000fd 	bl	428 <kill>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  30:	e1550004 	cmp	r5, r4
  34:	1afffff9 	bne	20 <main+0x20>
    kill(atoi(argv[i]));
  exit();
  38:	eb0000ac 	bl	2f0 <exit>
main(int argc, char **argv)
{
  int i;

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
  3c:	e3a00002 	mov	r0, #2
  40:	e59f1004 	ldr	r1, [pc, #4]	; 4c <main+0x4c>
  44:	eb0001fc 	bl	83c <printf>
    exit();
  48:	eb0000a8 	bl	2f0 <exit>
  4c:	00000b24 	.word	0x00000b24

00000050 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  50:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  54:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  58:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  5c:	e4d13001 	ldrb	r3, [r1], #1
  60:	e3530000 	cmp	r3, #0
  64:	e4c23001 	strb	r3, [r2], #1
  68:	1afffffb 	bne	5c <strcpy+0xc>
    ;
  return os;
}
  6c:	e28bd000 	add	sp, fp, #0
  70:	e8bd0800 	pop	{fp}
  74:	e12fff1e 	bx	lr

00000078 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  78:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  7c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  80:	e5d03000 	ldrb	r3, [r0]
  84:	e5d12000 	ldrb	r2, [r1]
  88:	e3530000 	cmp	r3, #0
  8c:	1a000004 	bne	a4 <strcmp+0x2c>
  90:	ea000005 	b	ac <strcmp+0x34>
  94:	e5f03001 	ldrb	r3, [r0, #1]!
  98:	e3530000 	cmp	r3, #0
  9c:	0a000006 	beq	bc <strcmp+0x44>
  a0:	e5f12001 	ldrb	r2, [r1, #1]!
  a4:	e1530002 	cmp	r3, r2
  a8:	0afffff9 	beq	94 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  ac:	e0620003 	rsb	r0, r2, r3
  b0:	e28bd000 	add	sp, fp, #0
  b4:	e8bd0800 	pop	{fp}
  b8:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  bc:	e5d12001 	ldrb	r2, [r1, #1]
  c0:	eafffff9 	b	ac <strcmp+0x34>

000000c4 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  c8:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  cc:	e5d03000 	ldrb	r3, [r0]
  d0:	e3530000 	cmp	r3, #0
  d4:	01a00003 	moveq	r0, r3
  d8:	0a000006 	beq	f8 <strlen+0x34>
  dc:	e1a02000 	mov	r2, r0
  e0:	e3a03000 	mov	r3, #0
  e4:	e5f21001 	ldrb	r1, [r2, #1]!
  e8:	e2833001 	add	r3, r3, #1
  ec:	e1a00003 	mov	r0, r3
  f0:	e3510000 	cmp	r1, #0
  f4:	1afffffa 	bne	e4 <strlen+0x20>
    ;
  return n;
}
  f8:	e28bd000 	add	sp, fp, #0
  fc:	e8bd0800 	pop	{fp}
 100:	e12fff1e 	bx	lr

00000104 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 104:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 108:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 10c:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 110:	0a000006 	beq	130 <memset+0x2c>
 114:	e6ef1071 	uxtb	r1, r1
 118:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 11c:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 120:	e2533001 	subs	r3, r3, #1
 124:	e4cc1001 	strb	r1, [ip], #1
 128:	1afffffc 	bne	120 <memset+0x1c>
 12c:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 130:	e28bd000 	add	sp, fp, #0
 134:	e8bd0800 	pop	{fp}
 138:	e12fff1e 	bx	lr

0000013c <strchr>:

char*
strchr(const char *s, char c)
{
 13c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 140:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 144:	e5d03000 	ldrb	r3, [r0]
 148:	e3530000 	cmp	r3, #0
 14c:	1a000004 	bne	164 <strchr+0x28>
 150:	ea000008 	b	178 <strchr+0x3c>
 154:	e5d03001 	ldrb	r3, [r0, #1]
 158:	e2800001 	add	r0, r0, #1
 15c:	e3530000 	cmp	r3, #0
 160:	0a000004 	beq	178 <strchr+0x3c>
    if(*s == c)
 164:	e1530001 	cmp	r3, r1
 168:	1afffff9 	bne	154 <strchr+0x18>
      return (char*)s;
  return 0;
}
 16c:	e28bd000 	add	sp, fp, #0
 170:	e8bd0800 	pop	{fp}
 174:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 178:	e1a00003 	mov	r0, r3
 17c:	eafffffa 	b	16c <strchr+0x30>

00000180 <gets>:
}

char*
gets(char *buf, int max)
{
 180:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 184:	e28db018 	add	fp, sp, #24
 188:	e24dd00c 	sub	sp, sp, #12
 18c:	e1a08000 	mov	r8, r0
 190:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 194:	e1a06000 	mov	r6, r0
 198:	e3a05000 	mov	r5, #0
 19c:	ea000008 	b	1c4 <gets+0x44>
    cc = read(0, &c, 1);
 1a0:	eb000079 	bl	38c <read>
    if(cc < 1)
 1a4:	e3500000 	cmp	r0, #0
 1a8:	da00000b 	ble	1dc <gets+0x5c>
      break;
    buf[i++] = c;
 1ac:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 1b0:	e1a05004 	mov	r5, r4
 1b4:	e353000a 	cmp	r3, #10
 1b8:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1bc:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 1c0:	0a00000a 	beq	1f0 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1c4:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c8:	e0854002 	add	r4, r5, r2
 1cc:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1d0:	e3a00000 	mov	r0, #0
 1d4:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d8:	bafffff0 	blt	1a0 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1dc:	e3a03000 	mov	r3, #0
 1e0:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 1e4:	e1a00008 	mov	r0, r8
 1e8:	e24bd018 	sub	sp, fp, #24
 1ec:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f0:	e1a05004 	mov	r5, r4
 1f4:	eafffff8 	b	1dc <gets+0x5c>

000001f8 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1f8:	e92d4830 	push	{r4, r5, fp, lr}
 1fc:	e1a05001 	mov	r5, r1
 200:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 204:	e3a01000 	mov	r1, #0
 208:	eb0000a0 	bl	490 <open>
  if(fd < 0)
 20c:	e2504000 	subs	r4, r0, #0
    return -1;
 210:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 214:	ba000004 	blt	22c <stat+0x34>
    return -1;
  r = fstat(fd, st);
 218:	e1a01005 	mov	r1, r5
 21c:	eb0000c2 	bl	52c <fstat>
 220:	e1a05000 	mov	r5, r0
  close(fd);
 224:	e1a00004 	mov	r0, r4
 228:	eb000071 	bl	3f4 <close>
  return r;
}
 22c:	e1a00005 	mov	r0, r5
 230:	e8bd8830 	pop	{r4, r5, fp, pc}

00000234 <atoi>:

int
atoi(const char *s)
{
 234:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 238:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 23c:	e5d03000 	ldrb	r3, [r0]
 240:	e2432030 	sub	r2, r3, #48	; 0x30
 244:	e6ef2072 	uxtb	r2, r2
 248:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 24c:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 250:	8a000009 	bhi	27c <atoi+0x48>
 254:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 258:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 25c:	e0800100 	add	r0, r0, r0, lsl #2
 260:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 264:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 268:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26c:	e2431030 	sub	r1, r3, #48	; 0x30
 270:	e6ef1071 	uxtb	r1, r1
 274:	e3510009 	cmp	r1, #9
 278:	9afffff7 	bls	25c <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 27c:	e28bd000 	add	sp, fp, #0
 280:	e8bd0800 	pop	{fp}
 284:	e12fff1e 	bx	lr

00000288 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 288:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 28c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 290:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 294:	da000005 	ble	2b0 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 298:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 29c:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 2a0:	e4d1c001 	ldrb	ip, [r1], #1
 2a4:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a8:	e1530002 	cmp	r3, r2
 2ac:	1afffffb 	bne	2a0 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2b0:	e28bd000 	add	sp, fp, #0
 2b4:	e8bd0800 	pop	{fp}
 2b8:	e12fff1e 	bx	lr

000002bc <fork>:
 2bc:	e92d4000 	push	{lr}
 2c0:	e92d0008 	push	{r3}
 2c4:	e92d0004 	push	{r2}
 2c8:	e92d0002 	push	{r1}
 2cc:	e92d0001 	push	{r0}
 2d0:	e3a00001 	mov	r0, #1
 2d4:	ef000040 	svc	0x00000040
 2d8:	e8bd0002 	pop	{r1}
 2dc:	e8bd0002 	pop	{r1}
 2e0:	e8bd0004 	pop	{r2}
 2e4:	e8bd0008 	pop	{r3}
 2e8:	e8bd4000 	pop	{lr}
 2ec:	e12fff1e 	bx	lr

000002f0 <exit>:
 2f0:	e92d4000 	push	{lr}
 2f4:	e92d0008 	push	{r3}
 2f8:	e92d0004 	push	{r2}
 2fc:	e92d0002 	push	{r1}
 300:	e92d0001 	push	{r0}
 304:	e3a00002 	mov	r0, #2
 308:	ef000040 	svc	0x00000040
 30c:	e8bd0002 	pop	{r1}
 310:	e8bd0002 	pop	{r1}
 314:	e8bd0004 	pop	{r2}
 318:	e8bd0008 	pop	{r3}
 31c:	e8bd4000 	pop	{lr}
 320:	e12fff1e 	bx	lr

00000324 <wait>:
 324:	e92d4000 	push	{lr}
 328:	e92d0008 	push	{r3}
 32c:	e92d0004 	push	{r2}
 330:	e92d0002 	push	{r1}
 334:	e92d0001 	push	{r0}
 338:	e3a00003 	mov	r0, #3
 33c:	ef000040 	svc	0x00000040
 340:	e8bd0002 	pop	{r1}
 344:	e8bd0002 	pop	{r1}
 348:	e8bd0004 	pop	{r2}
 34c:	e8bd0008 	pop	{r3}
 350:	e8bd4000 	pop	{lr}
 354:	e12fff1e 	bx	lr

00000358 <pipe>:
 358:	e92d4000 	push	{lr}
 35c:	e92d0008 	push	{r3}
 360:	e92d0004 	push	{r2}
 364:	e92d0002 	push	{r1}
 368:	e92d0001 	push	{r0}
 36c:	e3a00004 	mov	r0, #4
 370:	ef000040 	svc	0x00000040
 374:	e8bd0002 	pop	{r1}
 378:	e8bd0002 	pop	{r1}
 37c:	e8bd0004 	pop	{r2}
 380:	e8bd0008 	pop	{r3}
 384:	e8bd4000 	pop	{lr}
 388:	e12fff1e 	bx	lr

0000038c <read>:
 38c:	e92d4000 	push	{lr}
 390:	e92d0008 	push	{r3}
 394:	e92d0004 	push	{r2}
 398:	e92d0002 	push	{r1}
 39c:	e92d0001 	push	{r0}
 3a0:	e3a00005 	mov	r0, #5
 3a4:	ef000040 	svc	0x00000040
 3a8:	e8bd0002 	pop	{r1}
 3ac:	e8bd0002 	pop	{r1}
 3b0:	e8bd0004 	pop	{r2}
 3b4:	e8bd0008 	pop	{r3}
 3b8:	e8bd4000 	pop	{lr}
 3bc:	e12fff1e 	bx	lr

000003c0 <write>:
 3c0:	e92d4000 	push	{lr}
 3c4:	e92d0008 	push	{r3}
 3c8:	e92d0004 	push	{r2}
 3cc:	e92d0002 	push	{r1}
 3d0:	e92d0001 	push	{r0}
 3d4:	e3a00010 	mov	r0, #16
 3d8:	ef000040 	svc	0x00000040
 3dc:	e8bd0002 	pop	{r1}
 3e0:	e8bd0002 	pop	{r1}
 3e4:	e8bd0004 	pop	{r2}
 3e8:	e8bd0008 	pop	{r3}
 3ec:	e8bd4000 	pop	{lr}
 3f0:	e12fff1e 	bx	lr

000003f4 <close>:
 3f4:	e92d4000 	push	{lr}
 3f8:	e92d0008 	push	{r3}
 3fc:	e92d0004 	push	{r2}
 400:	e92d0002 	push	{r1}
 404:	e92d0001 	push	{r0}
 408:	e3a00015 	mov	r0, #21
 40c:	ef000040 	svc	0x00000040
 410:	e8bd0002 	pop	{r1}
 414:	e8bd0002 	pop	{r1}
 418:	e8bd0004 	pop	{r2}
 41c:	e8bd0008 	pop	{r3}
 420:	e8bd4000 	pop	{lr}
 424:	e12fff1e 	bx	lr

00000428 <kill>:
 428:	e92d4000 	push	{lr}
 42c:	e92d0008 	push	{r3}
 430:	e92d0004 	push	{r2}
 434:	e92d0002 	push	{r1}
 438:	e92d0001 	push	{r0}
 43c:	e3a00006 	mov	r0, #6
 440:	ef000040 	svc	0x00000040
 444:	e8bd0002 	pop	{r1}
 448:	e8bd0002 	pop	{r1}
 44c:	e8bd0004 	pop	{r2}
 450:	e8bd0008 	pop	{r3}
 454:	e8bd4000 	pop	{lr}
 458:	e12fff1e 	bx	lr

0000045c <exec>:
 45c:	e92d4000 	push	{lr}
 460:	e92d0008 	push	{r3}
 464:	e92d0004 	push	{r2}
 468:	e92d0002 	push	{r1}
 46c:	e92d0001 	push	{r0}
 470:	e3a00007 	mov	r0, #7
 474:	ef000040 	svc	0x00000040
 478:	e8bd0002 	pop	{r1}
 47c:	e8bd0002 	pop	{r1}
 480:	e8bd0004 	pop	{r2}
 484:	e8bd0008 	pop	{r3}
 488:	e8bd4000 	pop	{lr}
 48c:	e12fff1e 	bx	lr

00000490 <open>:
 490:	e92d4000 	push	{lr}
 494:	e92d0008 	push	{r3}
 498:	e92d0004 	push	{r2}
 49c:	e92d0002 	push	{r1}
 4a0:	e92d0001 	push	{r0}
 4a4:	e3a0000f 	mov	r0, #15
 4a8:	ef000040 	svc	0x00000040
 4ac:	e8bd0002 	pop	{r1}
 4b0:	e8bd0002 	pop	{r1}
 4b4:	e8bd0004 	pop	{r2}
 4b8:	e8bd0008 	pop	{r3}
 4bc:	e8bd4000 	pop	{lr}
 4c0:	e12fff1e 	bx	lr

000004c4 <mknod>:
 4c4:	e92d4000 	push	{lr}
 4c8:	e92d0008 	push	{r3}
 4cc:	e92d0004 	push	{r2}
 4d0:	e92d0002 	push	{r1}
 4d4:	e92d0001 	push	{r0}
 4d8:	e3a00011 	mov	r0, #17
 4dc:	ef000040 	svc	0x00000040
 4e0:	e8bd0002 	pop	{r1}
 4e4:	e8bd0002 	pop	{r1}
 4e8:	e8bd0004 	pop	{r2}
 4ec:	e8bd0008 	pop	{r3}
 4f0:	e8bd4000 	pop	{lr}
 4f4:	e12fff1e 	bx	lr

000004f8 <unlink>:
 4f8:	e92d4000 	push	{lr}
 4fc:	e92d0008 	push	{r3}
 500:	e92d0004 	push	{r2}
 504:	e92d0002 	push	{r1}
 508:	e92d0001 	push	{r0}
 50c:	e3a00012 	mov	r0, #18
 510:	ef000040 	svc	0x00000040
 514:	e8bd0002 	pop	{r1}
 518:	e8bd0002 	pop	{r1}
 51c:	e8bd0004 	pop	{r2}
 520:	e8bd0008 	pop	{r3}
 524:	e8bd4000 	pop	{lr}
 528:	e12fff1e 	bx	lr

0000052c <fstat>:
 52c:	e92d4000 	push	{lr}
 530:	e92d0008 	push	{r3}
 534:	e92d0004 	push	{r2}
 538:	e92d0002 	push	{r1}
 53c:	e92d0001 	push	{r0}
 540:	e3a00008 	mov	r0, #8
 544:	ef000040 	svc	0x00000040
 548:	e8bd0002 	pop	{r1}
 54c:	e8bd0002 	pop	{r1}
 550:	e8bd0004 	pop	{r2}
 554:	e8bd0008 	pop	{r3}
 558:	e8bd4000 	pop	{lr}
 55c:	e12fff1e 	bx	lr

00000560 <link>:
 560:	e92d4000 	push	{lr}
 564:	e92d0008 	push	{r3}
 568:	e92d0004 	push	{r2}
 56c:	e92d0002 	push	{r1}
 570:	e92d0001 	push	{r0}
 574:	e3a00013 	mov	r0, #19
 578:	ef000040 	svc	0x00000040
 57c:	e8bd0002 	pop	{r1}
 580:	e8bd0002 	pop	{r1}
 584:	e8bd0004 	pop	{r2}
 588:	e8bd0008 	pop	{r3}
 58c:	e8bd4000 	pop	{lr}
 590:	e12fff1e 	bx	lr

00000594 <mkdir>:
 594:	e92d4000 	push	{lr}
 598:	e92d0008 	push	{r3}
 59c:	e92d0004 	push	{r2}
 5a0:	e92d0002 	push	{r1}
 5a4:	e92d0001 	push	{r0}
 5a8:	e3a00014 	mov	r0, #20
 5ac:	ef000040 	svc	0x00000040
 5b0:	e8bd0002 	pop	{r1}
 5b4:	e8bd0002 	pop	{r1}
 5b8:	e8bd0004 	pop	{r2}
 5bc:	e8bd0008 	pop	{r3}
 5c0:	e8bd4000 	pop	{lr}
 5c4:	e12fff1e 	bx	lr

000005c8 <chdir>:
 5c8:	e92d4000 	push	{lr}
 5cc:	e92d0008 	push	{r3}
 5d0:	e92d0004 	push	{r2}
 5d4:	e92d0002 	push	{r1}
 5d8:	e92d0001 	push	{r0}
 5dc:	e3a00009 	mov	r0, #9
 5e0:	ef000040 	svc	0x00000040
 5e4:	e8bd0002 	pop	{r1}
 5e8:	e8bd0002 	pop	{r1}
 5ec:	e8bd0004 	pop	{r2}
 5f0:	e8bd0008 	pop	{r3}
 5f4:	e8bd4000 	pop	{lr}
 5f8:	e12fff1e 	bx	lr

000005fc <dup>:
 5fc:	e92d4000 	push	{lr}
 600:	e92d0008 	push	{r3}
 604:	e92d0004 	push	{r2}
 608:	e92d0002 	push	{r1}
 60c:	e92d0001 	push	{r0}
 610:	e3a0000a 	mov	r0, #10
 614:	ef000040 	svc	0x00000040
 618:	e8bd0002 	pop	{r1}
 61c:	e8bd0002 	pop	{r1}
 620:	e8bd0004 	pop	{r2}
 624:	e8bd0008 	pop	{r3}
 628:	e8bd4000 	pop	{lr}
 62c:	e12fff1e 	bx	lr

00000630 <getpid>:
 630:	e92d4000 	push	{lr}
 634:	e92d0008 	push	{r3}
 638:	e92d0004 	push	{r2}
 63c:	e92d0002 	push	{r1}
 640:	e92d0001 	push	{r0}
 644:	e3a0000b 	mov	r0, #11
 648:	ef000040 	svc	0x00000040
 64c:	e8bd0002 	pop	{r1}
 650:	e8bd0002 	pop	{r1}
 654:	e8bd0004 	pop	{r2}
 658:	e8bd0008 	pop	{r3}
 65c:	e8bd4000 	pop	{lr}
 660:	e12fff1e 	bx	lr

00000664 <sbrk>:
 664:	e92d4000 	push	{lr}
 668:	e92d0008 	push	{r3}
 66c:	e92d0004 	push	{r2}
 670:	e92d0002 	push	{r1}
 674:	e92d0001 	push	{r0}
 678:	e3a0000c 	mov	r0, #12
 67c:	ef000040 	svc	0x00000040
 680:	e8bd0002 	pop	{r1}
 684:	e8bd0002 	pop	{r1}
 688:	e8bd0004 	pop	{r2}
 68c:	e8bd0008 	pop	{r3}
 690:	e8bd4000 	pop	{lr}
 694:	e12fff1e 	bx	lr

00000698 <sleep>:
 698:	e92d4000 	push	{lr}
 69c:	e92d0008 	push	{r3}
 6a0:	e92d0004 	push	{r2}
 6a4:	e92d0002 	push	{r1}
 6a8:	e92d0001 	push	{r0}
 6ac:	e3a0000d 	mov	r0, #13
 6b0:	ef000040 	svc	0x00000040
 6b4:	e8bd0002 	pop	{r1}
 6b8:	e8bd0002 	pop	{r1}
 6bc:	e8bd0004 	pop	{r2}
 6c0:	e8bd0008 	pop	{r3}
 6c4:	e8bd4000 	pop	{lr}
 6c8:	e12fff1e 	bx	lr

000006cc <uptime>:
 6cc:	e92d4000 	push	{lr}
 6d0:	e92d0008 	push	{r3}
 6d4:	e92d0004 	push	{r2}
 6d8:	e92d0002 	push	{r1}
 6dc:	e92d0001 	push	{r0}
 6e0:	e3a0000e 	mov	r0, #14
 6e4:	ef000040 	svc	0x00000040
 6e8:	e8bd0002 	pop	{r1}
 6ec:	e8bd0002 	pop	{r1}
 6f0:	e8bd0004 	pop	{r2}
 6f4:	e8bd0008 	pop	{r3}
 6f8:	e8bd4000 	pop	{lr}
 6fc:	e12fff1e 	bx	lr

00000700 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 700:	e92d4800 	push	{fp, lr}
 704:	e28db004 	add	fp, sp, #4
 708:	e24b3004 	sub	r3, fp, #4
 70c:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 710:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 714:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 718:	e1a01003 	mov	r1, r3
 71c:	ebffff27 	bl	3c0 <write>
}
 720:	e24bd004 	sub	sp, fp, #4
 724:	e8bd8800 	pop	{fp, pc}

00000728 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 728:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 72c:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 730:	e1a00fa1 	lsr	r0, r1, #31
 734:	e3530000 	cmp	r3, #0
 738:	03a03000 	moveq	r3, #0
 73c:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 740:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 744:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 748:	e24dd014 	sub	sp, sp, #20
 74c:	e59f909c 	ldr	r9, [pc, #156]	; 7f0 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 750:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 754:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 758:	e3a0a000 	mov	sl, #0
 75c:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 760:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 764:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 768:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 76c:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 770:	e1a0e031 	lsr	lr, r1, r0
 774:	e20ee001 	and	lr, lr, #1
 778:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 77c:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 780:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 784:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 788:	e2500001 	subs	r0, r0, #1
 78c:	2afffff7 	bcs	770 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 790:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 794:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 798:	e0601001 	rsb	r1, r0, r1
 79c:	e28a5001 	add	r5, sl, #1
 7a0:	e7d91001 	ldrb	r1, [r9, r1]
 7a4:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 7a8:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7ac:	11a0a005 	movne	sl, r5
 7b0:	1affffeb 	bne	764 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 7b4:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 7b8:	124b2024 	subne	r2, fp, #36	; 0x24
 7bc:	10823005 	addne	r3, r2, r5
 7c0:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 7c4:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 7c8:	13a0202d 	movne	r2, #45	; 0x2d
 7cc:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7d0:	e7d61005 	ldrb	r1, [r6, r5]
 7d4:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7d8:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 7dc:	ebffffc7 	bl	700 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7e0:	e3750001 	cmn	r5, #1
 7e4:	1afffff9 	bne	7d0 <printint+0xa8>
    putc(fd, buf[i]);
}
 7e8:	e24bd020 	sub	sp, fp, #32
 7ec:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 7f0:	00000b38 	.word	0x00000b38

000007f4 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7f4:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 7f8:	e92d0830 	push	{r4, r5, fp}
 7fc:	e1a02000 	mov	r2, r0
 800:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 804:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 808:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 80c:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 810:	e1a04c32 	lsr	r4, r2, ip
 814:	e2044001 	and	r4, r4, #1
 818:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 81c:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 820:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 824:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 828:	e25cc001 	subs	ip, ip, #1
 82c:	2afffff7 	bcs	810 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 830:	e24bd008 	sub	sp, fp, #8
 834:	e8bd0830 	pop	{r4, r5, fp}
 838:	e12fff1e 	bx	lr

0000083c <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 83c:	e92d000e 	push	{r1, r2, r3}
 840:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 844:	e28db020 	add	fp, sp, #32
 848:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 84c:	e59b4004 	ldr	r4, [fp, #4]
 850:	e5d48000 	ldrb	r8, [r4]
 854:	e3580000 	cmp	r8, #0
 858:	0a000027 	beq	8fc <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 85c:	e59f712c 	ldr	r7, [pc, #300]	; 990 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 860:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 864:	e3a0a000 	mov	sl, #0
 868:	ea000008 	b	890 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 86c:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 870:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 874:	0a000002 	beq	884 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 878:	e1a00005 	mov	r0, r5
 87c:	e1a01008 	mov	r1, r8
 880:	ebffff9e 	bl	700 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 884:	e5f48001 	ldrb	r8, [r4, #1]!
 888:	e3580000 	cmp	r8, #0
 88c:	0a00001a 	beq	8fc <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 890:	e35a0000 	cmp	sl, #0
 894:	0afffff4 	beq	86c <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 898:	e35a0025 	cmp	sl, #37	; 0x25
 89c:	1afffff8 	bne	884 <printf+0x48>
      if(c == 'd'){
 8a0:	e3580064 	cmp	r8, #100	; 0x64
 8a4:	0a00002c 	beq	95c <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8a8:	e3580078 	cmp	r8, #120	; 0x78
 8ac:	13580070 	cmpne	r8, #112	; 0x70
 8b0:	13a09000 	movne	r9, #0
 8b4:	03a09001 	moveq	r9, #1
 8b8:	0a000013 	beq	90c <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8bc:	e3580073 	cmp	r8, #115	; 0x73
 8c0:	0a000018 	beq	928 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8c4:	e3580063 	cmp	r8, #99	; 0x63
 8c8:	0a00002a 	beq	978 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8cc:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 8d0:	e1a0100a 	mov	r1, sl
 8d4:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8d8:	0a000002 	beq	8e8 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8dc:	ebffff87 	bl	700 <putc>
        putc(fd, c);
 8e0:	e1a00005 	mov	r0, r5
 8e4:	e1a01008 	mov	r1, r8
 8e8:	ebffff84 	bl	700 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ec:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8f0:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f4:	e3580000 	cmp	r8, #0
 8f8:	1affffe4 	bne	890 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8fc:	e24bd020 	sub	sp, fp, #32
 900:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 904:	e28dd00c 	add	sp, sp, #12
 908:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 90c:	e1a00005 	mov	r0, r5
 910:	e4961004 	ldr	r1, [r6], #4
 914:	e3a02010 	mov	r2, #16
 918:	e3a03000 	mov	r3, #0
 91c:	ebffff81 	bl	728 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 920:	e3a0a000 	mov	sl, #0
 924:	eaffffd6 	b	884 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 928:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 92c:	e3580000 	cmp	r8, #0
 930:	01a08007 	moveq	r8, r7
        while(*s != 0){
 934:	e5d81000 	ldrb	r1, [r8]
 938:	e3510000 	cmp	r1, #0
 93c:	0a000004 	beq	954 <printf+0x118>
          putc(fd, *s);
 940:	e1a00005 	mov	r0, r5
 944:	ebffff6d 	bl	700 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 948:	e5f81001 	ldrb	r1, [r8, #1]!
 94c:	e3510000 	cmp	r1, #0
 950:	1afffffa 	bne	940 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 954:	e1a0a001 	mov	sl, r1
 958:	eaffffc9 	b	884 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 95c:	e1a00005 	mov	r0, r5
 960:	e4961004 	ldr	r1, [r6], #4
 964:	e3a0200a 	mov	r2, #10
 968:	e3a03001 	mov	r3, #1
 96c:	ebffff6d 	bl	728 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 970:	e3a0a000 	mov	sl, #0
 974:	eaffffc2 	b	884 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 978:	e4961004 	ldr	r1, [r6], #4
 97c:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 980:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 984:	e6ef1071 	uxtb	r1, r1
 988:	ebffff5c 	bl	700 <putc>
 98c:	eaffffbc 	b	884 <printf+0x48>
 990:	00000b4c 	.word	0x00000b4c

00000994 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 994:	e59f3098 	ldr	r3, [pc, #152]	; a34 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 998:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 99c:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a0:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 9a4:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a8:	e152000c 	cmp	r2, ip
 9ac:	e5921000 	ldr	r1, [r2]
 9b0:	2a000001 	bcs	9bc <free+0x28>
 9b4:	e15c0001 	cmp	ip, r1
 9b8:	3a000007 	bcc	9dc <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9bc:	e1520001 	cmp	r2, r1
 9c0:	3a000003 	bcc	9d4 <free+0x40>
 9c4:	e152000c 	cmp	r2, ip
 9c8:	3a000003 	bcc	9dc <free+0x48>
 9cc:	e15c0001 	cmp	ip, r1
 9d0:	3a000001 	bcc	9dc <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d4:	e1a02001 	mov	r2, r1
 9d8:	eafffff2 	b	9a8 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9dc:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 9e0:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9e4:	e08c5184 	add	r5, ip, r4, lsl #3
 9e8:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 9ec:	05911004 	ldreq	r1, [r1, #4]
 9f0:	00814004 	addeq	r4, r1, r4
 9f4:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 9f8:	05921000 	ldreq	r1, [r2]
 9fc:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 a00:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 a04:	e5921004 	ldr	r1, [r2, #4]
 a08:	e0824181 	add	r4, r2, r1, lsl #3
 a0c:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a10:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a14:	0510c004 	ldreq	ip, [r0, #-4]
 a18:	008c1001 	addeq	r1, ip, r1
 a1c:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 a20:	05101008 	ldreq	r1, [r0, #-8]
 a24:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a28:	e24bd008 	sub	sp, fp, #8
 a2c:	e8bd0830 	pop	{r4, r5, fp}
 a30:	e12fff1e 	bx	lr
 a34:	00000b54 	.word	0x00000b54

00000a38 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a38:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a3c:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 a40:	e59f50d4 	ldr	r5, [pc, #212]	; b1c <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a44:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 a48:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a4c:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a50:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a54:	e3530000 	cmp	r3, #0
 a58:	0a00002b 	beq	b0c <malloc+0xd4>
 a5c:	e5930000 	ldr	r0, [r3]
 a60:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a64:	e1520004 	cmp	r2, r4
 a68:	2a00001b 	bcs	adc <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a6c:	e59f80ac 	ldr	r8, [pc, #172]	; b20 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 a70:	e1a07184 	lsl	r7, r4, #3
 a74:	ea000003 	b	a88 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a78:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 a7c:	e5902004 	ldr	r2, [r0, #4]
 a80:	e1540002 	cmp	r4, r2
 a84:	9a000014 	bls	adc <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a88:	e5952000 	ldr	r2, [r5]
 a8c:	e1a03000 	mov	r3, r0
 a90:	e1500002 	cmp	r0, r2
 a94:	1afffff7 	bne	a78 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a98:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a9c:	81a00007 	movhi	r0, r7
 aa0:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 aa4:	81a06004 	movhi	r6, r4
 aa8:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 aac:	ebfffeec 	bl	664 <sbrk>
 ab0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ab4:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 ab8:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 abc:	0a000010 	beq	b04 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 ac0:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 ac4:	ebffffb2 	bl	994 <free>
  return freep;
 ac8:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 acc:	e3530000 	cmp	r3, #0
 ad0:	1affffe8 	bne	a78 <malloc+0x40>
        return 0;
 ad4:	e1a00003 	mov	r0, r3
  }
}
 ad8:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 adc:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ae0:	10642002 	rsbne	r2, r4, r2
 ae4:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 ae8:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 aec:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 af0:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 af4:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 af8:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 afc:	e2800008 	add	r0, r0, #8
 b00:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 b04:	e3a00000 	mov	r0, #0
 b08:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b0c:	e2850004 	add	r0, r5, #4
 b10:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 b14:	e9850009 	stmib	r5, {r0, r3}
 b18:	eaffffd3 	b	a6c <malloc+0x34>
 b1c:	00000b54 	.word	0x00000b54
 b20:	00000fff 	.word	0x00000fff
