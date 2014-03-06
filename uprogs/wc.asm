
_wc:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   4:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
   8:	e1a08000 	mov	r8, r0
   c:	e28db01c 	add	fp, sp, #28
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
  10:	c2814004 	addgt	r4, r1, #4
  14:	c3a05001 	movgt	r5, #1
{
  int fd, i;

  if(argc <= 1){
  18:	da000013 	ble	6c <main+0x6c>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  1c:	e5940000 	ldr	r0, [r4]
  20:	e3a01000 	mov	r1, #0
  24:	eb000164 	bl	5bc <open>
  28:	e1a06004 	mov	r6, r4
  2c:	e2844004 	add	r4, r4, #4
  30:	e2507000 	subs	r7, r0, #0
  34:	ba000007 	blt	58 <main+0x58>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  38:	e5141004 	ldr	r1, [r4, #-4]
  3c:	eb000010 	bl	84 <wc>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  40:	e2855001 	add	r5, r5, #1
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  44:	e1a00007 	mov	r0, r7
  48:	eb000134 	bl	520 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  4c:	e1550008 	cmp	r5, r8
  50:	1afffff1 	bne	1c <main+0x1c>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
  54:	eb0000f0 	bl	41c <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
  58:	e3a00001 	mov	r0, #1
  5c:	e59f1018 	ldr	r1, [pc, #24]	; 7c <main+0x7c>
  60:	e5962000 	ldr	r2, [r6]
  64:	eb00023f 	bl	968 <printf>
      exit();
  68:	eb0000eb 	bl	41c <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
  6c:	e3a00000 	mov	r0, #0
  70:	e59f1008 	ldr	r1, [pc, #8]	; 80 <main+0x80>
  74:	eb000002 	bl	84 <wc>
    exit();
  78:	eb0000e7 	bl	41c <exit>
  7c:	00000c78 	.word	0x00000c78
  80:	00000c74 	.word	0x00000c74

00000084 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
  84:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  88:	e28db020 	add	fp, sp, #32
  8c:	e24dd014 	sub	sp, sp, #20
  90:	e50b0028 	str	r0, [fp, #-40]	; 0x28
  94:	e50b102c 	str	r1, [fp, #-44]	; 0x2c
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  98:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
  9c:	e59f10c8 	ldr	r1, [pc, #200]	; 16c <wc+0xe8>
  a0:	e3a02c02 	mov	r2, #512	; 0x200
  a4:	eb000103 	bl	4b8 <read>
{
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  a8:	e3a05000 	mov	r5, #0
wc(int fd, char *name)
{
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  ac:	e1a04005 	mov	r4, r5
  b0:	e1a07005 	mov	r7, r5
  b4:	e1a06005 	mov	r6, r5
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  b8:	e250a000 	subs	sl, r0, #0
  bc:	da00001c 	ble	134 <wc+0xb0>
  c0:	e59f90a4 	ldr	r9, [pc, #164]	; 16c <wc+0xe8>
  c4:	e3a08000 	mov	r8, #0
  c8:	ea000002 	b	d8 <wc+0x54>
    for(i=0; i<n; i++){
  cc:	e2888001 	add	r8, r8, #1
  d0:	e158000a 	cmp	r8, sl
  d4:	0a00000f 	beq	118 <wc+0x94>
      c++;
      if(buf[i] == '\n')
  d8:	e7d91008 	ldrb	r1, [r9, r8]
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  dc:	e59f008c 	ldr	r0, [pc, #140]	; 170 <wc+0xec>
  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
  e0:	e351000a 	cmp	r1, #10
        l++;
  e4:	02866001 	addeq	r6, r6, #1
      if(strchr(" \r\t\n\v", buf[i]))
  e8:	eb00005e 	bl	268 <strchr>
  ec:	e3500000 	cmp	r0, #0
        inword = 0;
  f0:	13a05000 	movne	r5, #0
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  f4:	1afffff4 	bne	cc <wc+0x48>
        inword = 0;
      else if(!inword){
  f8:	e3550000 	cmp	r5, #0
        w++;
  fc:	02877001 	addeq	r7, r7, #1
        inword = 1;
 100:	03a05001 	moveq	r5, #1
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
 104:	0afffff0 	beq	cc <wc+0x48>
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 108:	e2888001 	add	r8, r8, #1
 10c:	e158000a 	cmp	r8, sl
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
 110:	e3a05001 	mov	r5, #1
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 114:	1affffef 	bne	d8 <wc+0x54>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
 118:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
 11c:	e59f1048 	ldr	r1, [pc, #72]	; 16c <wc+0xe8>
 120:	e3a02c02 	mov	r2, #512	; 0x200
 124:	eb0000e3 	bl	4b8 <read>
#include "user.h"

char buf[512];

void
wc(int fd, char *name)
 128:	e0844008 	add	r4, r4, r8
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
 12c:	e250a000 	subs	sl, r0, #0
 130:	caffffe2 	bgt	c0 <wc+0x3c>
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
 134:	e3a00001 	mov	r0, #1
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
 138:	1a000008 	bne	160 <wc+0xdc>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
 13c:	e51bc02c 	ldr	ip, [fp, #-44]	; 0x2c
 140:	e59f102c 	ldr	r1, [pc, #44]	; 174 <wc+0xf0>
 144:	e1a02006 	mov	r2, r6
 148:	e1a03007 	mov	r3, r7
 14c:	e58d4000 	str	r4, [sp]
 150:	e58dc004 	str	ip, [sp, #4]
 154:	eb000203 	bl	968 <printf>
}
 158:	e24bd020 	sub	sp, fp, #32
 15c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
 160:	e59f1010 	ldr	r1, [pc, #16]	; 178 <wc+0xf4>
 164:	eb0001ff 	bl	968 <printf>
    exit();
 168:	eb0000ab 	bl	41c <exit>
 16c:	00000cb4 	.word	0x00000cb4
 170:	00000c50 	.word	0x00000c50
 174:	00000c68 	.word	0x00000c68
 178:	00000c58 	.word	0x00000c58

0000017c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 17c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 180:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 184:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 188:	e4d13001 	ldrb	r3, [r1], #1
 18c:	e3530000 	cmp	r3, #0
 190:	e4c23001 	strb	r3, [r2], #1
 194:	1afffffb 	bne	188 <strcpy+0xc>
    ;
  return os;
}
 198:	e28bd000 	add	sp, fp, #0
 19c:	e8bd0800 	pop	{fp}
 1a0:	e12fff1e 	bx	lr

000001a4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1a8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 1ac:	e5d03000 	ldrb	r3, [r0]
 1b0:	e5d12000 	ldrb	r2, [r1]
 1b4:	e3530000 	cmp	r3, #0
 1b8:	1a000004 	bne	1d0 <strcmp+0x2c>
 1bc:	ea000005 	b	1d8 <strcmp+0x34>
 1c0:	e5f03001 	ldrb	r3, [r0, #1]!
 1c4:	e3530000 	cmp	r3, #0
 1c8:	0a000006 	beq	1e8 <strcmp+0x44>
 1cc:	e5f12001 	ldrb	r2, [r1, #1]!
 1d0:	e1530002 	cmp	r3, r2
 1d4:	0afffff9 	beq	1c0 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1d8:	e0620003 	rsb	r0, r2, r3
 1dc:	e28bd000 	add	sp, fp, #0
 1e0:	e8bd0800 	pop	{fp}
 1e4:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1e8:	e5d12001 	ldrb	r2, [r1, #1]
 1ec:	eafffff9 	b	1d8 <strcmp+0x34>

000001f0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1f4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 1f8:	e5d03000 	ldrb	r3, [r0]
 1fc:	e3530000 	cmp	r3, #0
 200:	01a00003 	moveq	r0, r3
 204:	0a000006 	beq	224 <strlen+0x34>
 208:	e1a02000 	mov	r2, r0
 20c:	e3a03000 	mov	r3, #0
 210:	e5f21001 	ldrb	r1, [r2, #1]!
 214:	e2833001 	add	r3, r3, #1
 218:	e1a00003 	mov	r0, r3
 21c:	e3510000 	cmp	r1, #0
 220:	1afffffa 	bne	210 <strlen+0x20>
    ;
  return n;
}
 224:	e28bd000 	add	sp, fp, #0
 228:	e8bd0800 	pop	{fp}
 22c:	e12fff1e 	bx	lr

00000230 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 230:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 234:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 238:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 23c:	0a000006 	beq	25c <memset+0x2c>
 240:	e6ef1071 	uxtb	r1, r1
 244:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 248:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 24c:	e2533001 	subs	r3, r3, #1
 250:	e4cc1001 	strb	r1, [ip], #1
 254:	1afffffc 	bne	24c <memset+0x1c>
 258:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 25c:	e28bd000 	add	sp, fp, #0
 260:	e8bd0800 	pop	{fp}
 264:	e12fff1e 	bx	lr

00000268 <strchr>:

char*
strchr(const char *s, char c)
{
 268:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 26c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 270:	e5d03000 	ldrb	r3, [r0]
 274:	e3530000 	cmp	r3, #0
 278:	1a000004 	bne	290 <strchr+0x28>
 27c:	ea000008 	b	2a4 <strchr+0x3c>
 280:	e5d03001 	ldrb	r3, [r0, #1]
 284:	e2800001 	add	r0, r0, #1
 288:	e3530000 	cmp	r3, #0
 28c:	0a000004 	beq	2a4 <strchr+0x3c>
    if(*s == c)
 290:	e1530001 	cmp	r3, r1
 294:	1afffff9 	bne	280 <strchr+0x18>
      return (char*)s;
  return 0;
}
 298:	e28bd000 	add	sp, fp, #0
 29c:	e8bd0800 	pop	{fp}
 2a0:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 2a4:	e1a00003 	mov	r0, r3
 2a8:	eafffffa 	b	298 <strchr+0x30>

000002ac <gets>:
}

char*
gets(char *buf, int max)
{
 2ac:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2b0:	e28db018 	add	fp, sp, #24
 2b4:	e24dd00c 	sub	sp, sp, #12
 2b8:	e1a08000 	mov	r8, r0
 2bc:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c0:	e1a06000 	mov	r6, r0
 2c4:	e3a05000 	mov	r5, #0
 2c8:	ea000008 	b	2f0 <gets+0x44>
    cc = read(0, &c, 1);
 2cc:	eb000079 	bl	4b8 <read>
    if(cc < 1)
 2d0:	e3500000 	cmp	r0, #0
 2d4:	da00000b 	ble	308 <gets+0x5c>
      break;
    buf[i++] = c;
 2d8:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 2dc:	e1a05004 	mov	r5, r4
 2e0:	e353000a 	cmp	r3, #10
 2e4:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2e8:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 2ec:	0a00000a 	beq	31c <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2f0:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f4:	e0854002 	add	r4, r5, r2
 2f8:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 2fc:	e3a00000 	mov	r0, #0
 300:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 304:	bafffff0 	blt	2cc <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 308:	e3a03000 	mov	r3, #0
 30c:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 310:	e1a00008 	mov	r0, r8
 314:	e24bd018 	sub	sp, fp, #24
 318:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 31c:	e1a05004 	mov	r5, r4
 320:	eafffff8 	b	308 <gets+0x5c>

00000324 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 324:	e92d4830 	push	{r4, r5, fp, lr}
 328:	e1a05001 	mov	r5, r1
 32c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 330:	e3a01000 	mov	r1, #0
 334:	eb0000a0 	bl	5bc <open>
  if(fd < 0)
 338:	e2504000 	subs	r4, r0, #0
    return -1;
 33c:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 340:	ba000004 	blt	358 <stat+0x34>
    return -1;
  r = fstat(fd, st);
 344:	e1a01005 	mov	r1, r5
 348:	eb0000c2 	bl	658 <fstat>
 34c:	e1a05000 	mov	r5, r0
  close(fd);
 350:	e1a00004 	mov	r0, r4
 354:	eb000071 	bl	520 <close>
  return r;
}
 358:	e1a00005 	mov	r0, r5
 35c:	e8bd8830 	pop	{r4, r5, fp, pc}

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 364:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 368:	e5d03000 	ldrb	r3, [r0]
 36c:	e2432030 	sub	r2, r3, #48	; 0x30
 370:	e6ef2072 	uxtb	r2, r2
 374:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 378:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 37c:	8a000009 	bhi	3a8 <atoi+0x48>
 380:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 384:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 388:	e0800100 	add	r0, r0, r0, lsl #2
 38c:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 390:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 394:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 398:	e2431030 	sub	r1, r3, #48	; 0x30
 39c:	e6ef1071 	uxtb	r1, r1
 3a0:	e3510009 	cmp	r1, #9
 3a4:	9afffff7 	bls	388 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 3a8:	e28bd000 	add	sp, fp, #0
 3ac:	e8bd0800 	pop	{fp}
 3b0:	e12fff1e 	bx	lr

000003b4 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3b4:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 3b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3bc:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c0:	da000005 	ble	3dc <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 3c4:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 3c8:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 3cc:	e4d1c001 	ldrb	ip, [r1], #1
 3d0:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d4:	e1530002 	cmp	r3, r2
 3d8:	1afffffb 	bne	3cc <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3dc:	e28bd000 	add	sp, fp, #0
 3e0:	e8bd0800 	pop	{fp}
 3e4:	e12fff1e 	bx	lr

000003e8 <fork>:
 3e8:	e92d4000 	push	{lr}
 3ec:	e92d0008 	push	{r3}
 3f0:	e92d0004 	push	{r2}
 3f4:	e92d0002 	push	{r1}
 3f8:	e92d0001 	push	{r0}
 3fc:	e3a00001 	mov	r0, #1
 400:	ef000040 	svc	0x00000040
 404:	e8bd0002 	pop	{r1}
 408:	e8bd0002 	pop	{r1}
 40c:	e8bd0004 	pop	{r2}
 410:	e8bd0008 	pop	{r3}
 414:	e8bd4000 	pop	{lr}
 418:	e12fff1e 	bx	lr

0000041c <exit>:
 41c:	e92d4000 	push	{lr}
 420:	e92d0008 	push	{r3}
 424:	e92d0004 	push	{r2}
 428:	e92d0002 	push	{r1}
 42c:	e92d0001 	push	{r0}
 430:	e3a00002 	mov	r0, #2
 434:	ef000040 	svc	0x00000040
 438:	e8bd0002 	pop	{r1}
 43c:	e8bd0002 	pop	{r1}
 440:	e8bd0004 	pop	{r2}
 444:	e8bd0008 	pop	{r3}
 448:	e8bd4000 	pop	{lr}
 44c:	e12fff1e 	bx	lr

00000450 <wait>:
 450:	e92d4000 	push	{lr}
 454:	e92d0008 	push	{r3}
 458:	e92d0004 	push	{r2}
 45c:	e92d0002 	push	{r1}
 460:	e92d0001 	push	{r0}
 464:	e3a00003 	mov	r0, #3
 468:	ef000040 	svc	0x00000040
 46c:	e8bd0002 	pop	{r1}
 470:	e8bd0002 	pop	{r1}
 474:	e8bd0004 	pop	{r2}
 478:	e8bd0008 	pop	{r3}
 47c:	e8bd4000 	pop	{lr}
 480:	e12fff1e 	bx	lr

00000484 <pipe>:
 484:	e92d4000 	push	{lr}
 488:	e92d0008 	push	{r3}
 48c:	e92d0004 	push	{r2}
 490:	e92d0002 	push	{r1}
 494:	e92d0001 	push	{r0}
 498:	e3a00004 	mov	r0, #4
 49c:	ef000040 	svc	0x00000040
 4a0:	e8bd0002 	pop	{r1}
 4a4:	e8bd0002 	pop	{r1}
 4a8:	e8bd0004 	pop	{r2}
 4ac:	e8bd0008 	pop	{r3}
 4b0:	e8bd4000 	pop	{lr}
 4b4:	e12fff1e 	bx	lr

000004b8 <read>:
 4b8:	e92d4000 	push	{lr}
 4bc:	e92d0008 	push	{r3}
 4c0:	e92d0004 	push	{r2}
 4c4:	e92d0002 	push	{r1}
 4c8:	e92d0001 	push	{r0}
 4cc:	e3a00005 	mov	r0, #5
 4d0:	ef000040 	svc	0x00000040
 4d4:	e8bd0002 	pop	{r1}
 4d8:	e8bd0002 	pop	{r1}
 4dc:	e8bd0004 	pop	{r2}
 4e0:	e8bd0008 	pop	{r3}
 4e4:	e8bd4000 	pop	{lr}
 4e8:	e12fff1e 	bx	lr

000004ec <write>:
 4ec:	e92d4000 	push	{lr}
 4f0:	e92d0008 	push	{r3}
 4f4:	e92d0004 	push	{r2}
 4f8:	e92d0002 	push	{r1}
 4fc:	e92d0001 	push	{r0}
 500:	e3a00010 	mov	r0, #16
 504:	ef000040 	svc	0x00000040
 508:	e8bd0002 	pop	{r1}
 50c:	e8bd0002 	pop	{r1}
 510:	e8bd0004 	pop	{r2}
 514:	e8bd0008 	pop	{r3}
 518:	e8bd4000 	pop	{lr}
 51c:	e12fff1e 	bx	lr

00000520 <close>:
 520:	e92d4000 	push	{lr}
 524:	e92d0008 	push	{r3}
 528:	e92d0004 	push	{r2}
 52c:	e92d0002 	push	{r1}
 530:	e92d0001 	push	{r0}
 534:	e3a00015 	mov	r0, #21
 538:	ef000040 	svc	0x00000040
 53c:	e8bd0002 	pop	{r1}
 540:	e8bd0002 	pop	{r1}
 544:	e8bd0004 	pop	{r2}
 548:	e8bd0008 	pop	{r3}
 54c:	e8bd4000 	pop	{lr}
 550:	e12fff1e 	bx	lr

00000554 <kill>:
 554:	e92d4000 	push	{lr}
 558:	e92d0008 	push	{r3}
 55c:	e92d0004 	push	{r2}
 560:	e92d0002 	push	{r1}
 564:	e92d0001 	push	{r0}
 568:	e3a00006 	mov	r0, #6
 56c:	ef000040 	svc	0x00000040
 570:	e8bd0002 	pop	{r1}
 574:	e8bd0002 	pop	{r1}
 578:	e8bd0004 	pop	{r2}
 57c:	e8bd0008 	pop	{r3}
 580:	e8bd4000 	pop	{lr}
 584:	e12fff1e 	bx	lr

00000588 <exec>:
 588:	e92d4000 	push	{lr}
 58c:	e92d0008 	push	{r3}
 590:	e92d0004 	push	{r2}
 594:	e92d0002 	push	{r1}
 598:	e92d0001 	push	{r0}
 59c:	e3a00007 	mov	r0, #7
 5a0:	ef000040 	svc	0x00000040
 5a4:	e8bd0002 	pop	{r1}
 5a8:	e8bd0002 	pop	{r1}
 5ac:	e8bd0004 	pop	{r2}
 5b0:	e8bd0008 	pop	{r3}
 5b4:	e8bd4000 	pop	{lr}
 5b8:	e12fff1e 	bx	lr

000005bc <open>:
 5bc:	e92d4000 	push	{lr}
 5c0:	e92d0008 	push	{r3}
 5c4:	e92d0004 	push	{r2}
 5c8:	e92d0002 	push	{r1}
 5cc:	e92d0001 	push	{r0}
 5d0:	e3a0000f 	mov	r0, #15
 5d4:	ef000040 	svc	0x00000040
 5d8:	e8bd0002 	pop	{r1}
 5dc:	e8bd0002 	pop	{r1}
 5e0:	e8bd0004 	pop	{r2}
 5e4:	e8bd0008 	pop	{r3}
 5e8:	e8bd4000 	pop	{lr}
 5ec:	e12fff1e 	bx	lr

000005f0 <mknod>:
 5f0:	e92d4000 	push	{lr}
 5f4:	e92d0008 	push	{r3}
 5f8:	e92d0004 	push	{r2}
 5fc:	e92d0002 	push	{r1}
 600:	e92d0001 	push	{r0}
 604:	e3a00011 	mov	r0, #17
 608:	ef000040 	svc	0x00000040
 60c:	e8bd0002 	pop	{r1}
 610:	e8bd0002 	pop	{r1}
 614:	e8bd0004 	pop	{r2}
 618:	e8bd0008 	pop	{r3}
 61c:	e8bd4000 	pop	{lr}
 620:	e12fff1e 	bx	lr

00000624 <unlink>:
 624:	e92d4000 	push	{lr}
 628:	e92d0008 	push	{r3}
 62c:	e92d0004 	push	{r2}
 630:	e92d0002 	push	{r1}
 634:	e92d0001 	push	{r0}
 638:	e3a00012 	mov	r0, #18
 63c:	ef000040 	svc	0x00000040
 640:	e8bd0002 	pop	{r1}
 644:	e8bd0002 	pop	{r1}
 648:	e8bd0004 	pop	{r2}
 64c:	e8bd0008 	pop	{r3}
 650:	e8bd4000 	pop	{lr}
 654:	e12fff1e 	bx	lr

00000658 <fstat>:
 658:	e92d4000 	push	{lr}
 65c:	e92d0008 	push	{r3}
 660:	e92d0004 	push	{r2}
 664:	e92d0002 	push	{r1}
 668:	e92d0001 	push	{r0}
 66c:	e3a00008 	mov	r0, #8
 670:	ef000040 	svc	0x00000040
 674:	e8bd0002 	pop	{r1}
 678:	e8bd0002 	pop	{r1}
 67c:	e8bd0004 	pop	{r2}
 680:	e8bd0008 	pop	{r3}
 684:	e8bd4000 	pop	{lr}
 688:	e12fff1e 	bx	lr

0000068c <link>:
 68c:	e92d4000 	push	{lr}
 690:	e92d0008 	push	{r3}
 694:	e92d0004 	push	{r2}
 698:	e92d0002 	push	{r1}
 69c:	e92d0001 	push	{r0}
 6a0:	e3a00013 	mov	r0, #19
 6a4:	ef000040 	svc	0x00000040
 6a8:	e8bd0002 	pop	{r1}
 6ac:	e8bd0002 	pop	{r1}
 6b0:	e8bd0004 	pop	{r2}
 6b4:	e8bd0008 	pop	{r3}
 6b8:	e8bd4000 	pop	{lr}
 6bc:	e12fff1e 	bx	lr

000006c0 <mkdir>:
 6c0:	e92d4000 	push	{lr}
 6c4:	e92d0008 	push	{r3}
 6c8:	e92d0004 	push	{r2}
 6cc:	e92d0002 	push	{r1}
 6d0:	e92d0001 	push	{r0}
 6d4:	e3a00014 	mov	r0, #20
 6d8:	ef000040 	svc	0x00000040
 6dc:	e8bd0002 	pop	{r1}
 6e0:	e8bd0002 	pop	{r1}
 6e4:	e8bd0004 	pop	{r2}
 6e8:	e8bd0008 	pop	{r3}
 6ec:	e8bd4000 	pop	{lr}
 6f0:	e12fff1e 	bx	lr

000006f4 <chdir>:
 6f4:	e92d4000 	push	{lr}
 6f8:	e92d0008 	push	{r3}
 6fc:	e92d0004 	push	{r2}
 700:	e92d0002 	push	{r1}
 704:	e92d0001 	push	{r0}
 708:	e3a00009 	mov	r0, #9
 70c:	ef000040 	svc	0x00000040
 710:	e8bd0002 	pop	{r1}
 714:	e8bd0002 	pop	{r1}
 718:	e8bd0004 	pop	{r2}
 71c:	e8bd0008 	pop	{r3}
 720:	e8bd4000 	pop	{lr}
 724:	e12fff1e 	bx	lr

00000728 <dup>:
 728:	e92d4000 	push	{lr}
 72c:	e92d0008 	push	{r3}
 730:	e92d0004 	push	{r2}
 734:	e92d0002 	push	{r1}
 738:	e92d0001 	push	{r0}
 73c:	e3a0000a 	mov	r0, #10
 740:	ef000040 	svc	0x00000040
 744:	e8bd0002 	pop	{r1}
 748:	e8bd0002 	pop	{r1}
 74c:	e8bd0004 	pop	{r2}
 750:	e8bd0008 	pop	{r3}
 754:	e8bd4000 	pop	{lr}
 758:	e12fff1e 	bx	lr

0000075c <getpid>:
 75c:	e92d4000 	push	{lr}
 760:	e92d0008 	push	{r3}
 764:	e92d0004 	push	{r2}
 768:	e92d0002 	push	{r1}
 76c:	e92d0001 	push	{r0}
 770:	e3a0000b 	mov	r0, #11
 774:	ef000040 	svc	0x00000040
 778:	e8bd0002 	pop	{r1}
 77c:	e8bd0002 	pop	{r1}
 780:	e8bd0004 	pop	{r2}
 784:	e8bd0008 	pop	{r3}
 788:	e8bd4000 	pop	{lr}
 78c:	e12fff1e 	bx	lr

00000790 <sbrk>:
 790:	e92d4000 	push	{lr}
 794:	e92d0008 	push	{r3}
 798:	e92d0004 	push	{r2}
 79c:	e92d0002 	push	{r1}
 7a0:	e92d0001 	push	{r0}
 7a4:	e3a0000c 	mov	r0, #12
 7a8:	ef000040 	svc	0x00000040
 7ac:	e8bd0002 	pop	{r1}
 7b0:	e8bd0002 	pop	{r1}
 7b4:	e8bd0004 	pop	{r2}
 7b8:	e8bd0008 	pop	{r3}
 7bc:	e8bd4000 	pop	{lr}
 7c0:	e12fff1e 	bx	lr

000007c4 <sleep>:
 7c4:	e92d4000 	push	{lr}
 7c8:	e92d0008 	push	{r3}
 7cc:	e92d0004 	push	{r2}
 7d0:	e92d0002 	push	{r1}
 7d4:	e92d0001 	push	{r0}
 7d8:	e3a0000d 	mov	r0, #13
 7dc:	ef000040 	svc	0x00000040
 7e0:	e8bd0002 	pop	{r1}
 7e4:	e8bd0002 	pop	{r1}
 7e8:	e8bd0004 	pop	{r2}
 7ec:	e8bd0008 	pop	{r3}
 7f0:	e8bd4000 	pop	{lr}
 7f4:	e12fff1e 	bx	lr

000007f8 <uptime>:
 7f8:	e92d4000 	push	{lr}
 7fc:	e92d0008 	push	{r3}
 800:	e92d0004 	push	{r2}
 804:	e92d0002 	push	{r1}
 808:	e92d0001 	push	{r0}
 80c:	e3a0000e 	mov	r0, #14
 810:	ef000040 	svc	0x00000040
 814:	e8bd0002 	pop	{r1}
 818:	e8bd0002 	pop	{r1}
 81c:	e8bd0004 	pop	{r2}
 820:	e8bd0008 	pop	{r3}
 824:	e8bd4000 	pop	{lr}
 828:	e12fff1e 	bx	lr

0000082c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 82c:	e92d4800 	push	{fp, lr}
 830:	e28db004 	add	fp, sp, #4
 834:	e24b3004 	sub	r3, fp, #4
 838:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 83c:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 840:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 844:	e1a01003 	mov	r1, r3
 848:	ebffff27 	bl	4ec <write>
}
 84c:	e24bd004 	sub	sp, fp, #4
 850:	e8bd8800 	pop	{fp, pc}

00000854 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 854:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 858:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 85c:	e1a00fa1 	lsr	r0, r1, #31
 860:	e3530000 	cmp	r3, #0
 864:	03a03000 	moveq	r3, #0
 868:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 86c:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 870:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 874:	e24dd014 	sub	sp, sp, #20
 878:	e59f909c 	ldr	r9, [pc, #156]	; 91c <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 87c:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 880:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 884:	e3a0a000 	mov	sl, #0
 888:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 88c:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 890:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 894:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 898:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 89c:	e1a0e031 	lsr	lr, r1, r0
 8a0:	e20ee001 	and	lr, lr, #1
 8a4:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 8a8:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 8ac:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 8b0:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8b4:	e2500001 	subs	r0, r0, #1
 8b8:	2afffff7 	bcs	89c <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8bc:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 8c0:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8c4:	e0601001 	rsb	r1, r0, r1
 8c8:	e28a5001 	add	r5, sl, #1
 8cc:	e7d91001 	ldrb	r1, [r9, r1]
 8d0:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 8d4:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8d8:	11a0a005 	movne	sl, r5
 8dc:	1affffeb 	bne	890 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 8e0:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 8e4:	124b2024 	subne	r2, fp, #36	; 0x24
 8e8:	10823005 	addne	r3, r2, r5
 8ec:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 8f0:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 8f4:	13a0202d 	movne	r2, #45	; 0x2d
 8f8:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 8fc:	e7d61005 	ldrb	r1, [r6, r5]
 900:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 904:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 908:	ebffffc7 	bl	82c <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 90c:	e3750001 	cmn	r5, #1
 910:	1afffff9 	bne	8fc <printint+0xa8>
    putc(fd, buf[i]);
}
 914:	e24bd020 	sub	sp, fp, #32
 918:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 91c:	00000c8c 	.word	0x00000c8c

00000920 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 920:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 924:	e92d0830 	push	{r4, r5, fp}
 928:	e1a02000 	mov	r2, r0
 92c:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 930:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 934:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 938:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 93c:	e1a04c32 	lsr	r4, r2, ip
 940:	e2044001 	and	r4, r4, #1
 944:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 948:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 94c:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 950:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 954:	e25cc001 	subs	ip, ip, #1
 958:	2afffff7 	bcs	93c <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 95c:	e24bd008 	sub	sp, fp, #8
 960:	e8bd0830 	pop	{r4, r5, fp}
 964:	e12fff1e 	bx	lr

00000968 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 968:	e92d000e 	push	{r1, r2, r3}
 96c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 970:	e28db020 	add	fp, sp, #32
 974:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 978:	e59b4004 	ldr	r4, [fp, #4]
 97c:	e5d48000 	ldrb	r8, [r4]
 980:	e3580000 	cmp	r8, #0
 984:	0a000027 	beq	a28 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 988:	e59f712c 	ldr	r7, [pc, #300]	; abc <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 98c:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 990:	e3a0a000 	mov	sl, #0
 994:	ea000008 	b	9bc <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 998:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 99c:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 9a0:	0a000002 	beq	9b0 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 9a4:	e1a00005 	mov	r0, r5
 9a8:	e1a01008 	mov	r1, r8
 9ac:	ebffff9e 	bl	82c <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9b0:	e5f48001 	ldrb	r8, [r4, #1]!
 9b4:	e3580000 	cmp	r8, #0
 9b8:	0a00001a 	beq	a28 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 9bc:	e35a0000 	cmp	sl, #0
 9c0:	0afffff4 	beq	998 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9c4:	e35a0025 	cmp	sl, #37	; 0x25
 9c8:	1afffff8 	bne	9b0 <printf+0x48>
      if(c == 'd'){
 9cc:	e3580064 	cmp	r8, #100	; 0x64
 9d0:	0a00002c 	beq	a88 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9d4:	e3580078 	cmp	r8, #120	; 0x78
 9d8:	13580070 	cmpne	r8, #112	; 0x70
 9dc:	13a09000 	movne	r9, #0
 9e0:	03a09001 	moveq	r9, #1
 9e4:	0a000013 	beq	a38 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9e8:	e3580073 	cmp	r8, #115	; 0x73
 9ec:	0a000018 	beq	a54 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9f0:	e3580063 	cmp	r8, #99	; 0x63
 9f4:	0a00002a 	beq	aa4 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9f8:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 9fc:	e1a0100a 	mov	r1, sl
 a00:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a04:	0a000002 	beq	a14 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a08:	ebffff87 	bl	82c <putc>
        putc(fd, c);
 a0c:	e1a00005 	mov	r0, r5
 a10:	e1a01008 	mov	r1, r8
 a14:	ebffff84 	bl	82c <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a18:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a1c:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a20:	e3580000 	cmp	r8, #0
 a24:	1affffe4 	bne	9bc <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 a28:	e24bd020 	sub	sp, fp, #32
 a2c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 a30:	e28dd00c 	add	sp, sp, #12
 a34:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 a38:	e1a00005 	mov	r0, r5
 a3c:	e4961004 	ldr	r1, [r6], #4
 a40:	e3a02010 	mov	r2, #16
 a44:	e3a03000 	mov	r3, #0
 a48:	ebffff81 	bl	854 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a4c:	e3a0a000 	mov	sl, #0
 a50:	eaffffd6 	b	9b0 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 a54:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 a58:	e3580000 	cmp	r8, #0
 a5c:	01a08007 	moveq	r8, r7
        while(*s != 0){
 a60:	e5d81000 	ldrb	r1, [r8]
 a64:	e3510000 	cmp	r1, #0
 a68:	0a000004 	beq	a80 <printf+0x118>
          putc(fd, *s);
 a6c:	e1a00005 	mov	r0, r5
 a70:	ebffff6d 	bl	82c <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 a74:	e5f81001 	ldrb	r1, [r8, #1]!
 a78:	e3510000 	cmp	r1, #0
 a7c:	1afffffa 	bne	a6c <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a80:	e1a0a001 	mov	sl, r1
 a84:	eaffffc9 	b	9b0 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a88:	e1a00005 	mov	r0, r5
 a8c:	e4961004 	ldr	r1, [r6], #4
 a90:	e3a0200a 	mov	r2, #10
 a94:	e3a03001 	mov	r3, #1
 a98:	ebffff6d 	bl	854 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a9c:	e3a0a000 	mov	sl, #0
 aa0:	eaffffc2 	b	9b0 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 aa4:	e4961004 	ldr	r1, [r6], #4
 aa8:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 aac:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 ab0:	e6ef1071 	uxtb	r1, r1
 ab4:	ebffff5c 	bl	82c <putc>
 ab8:	eaffffbc 	b	9b0 <printf+0x48>
 abc:	00000ca0 	.word	0x00000ca0

00000ac0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac0:	e59f3098 	ldr	r3, [pc, #152]	; b60 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 ac4:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 ac8:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 acc:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 ad0:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad4:	e152000c 	cmp	r2, ip
 ad8:	e5921000 	ldr	r1, [r2]
 adc:	2a000001 	bcs	ae8 <free+0x28>
 ae0:	e15c0001 	cmp	ip, r1
 ae4:	3a000007 	bcc	b08 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae8:	e1520001 	cmp	r2, r1
 aec:	3a000003 	bcc	b00 <free+0x40>
 af0:	e152000c 	cmp	r2, ip
 af4:	3a000003 	bcc	b08 <free+0x48>
 af8:	e15c0001 	cmp	ip, r1
 afc:	3a000001 	bcc	b08 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 b00:	e1a02001 	mov	r2, r1
 b04:	eafffff2 	b	ad4 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 b08:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b0c:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 b10:	e08c5184 	add	r5, ip, r4, lsl #3
 b14:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 b18:	05911004 	ldreq	r1, [r1, #4]
 b1c:	00814004 	addeq	r4, r1, r4
 b20:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b24:	05921000 	ldreq	r1, [r2]
 b28:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 b2c:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 b30:	e5921004 	ldr	r1, [r2, #4]
 b34:	e0824181 	add	r4, r2, r1, lsl #3
 b38:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b3c:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 b40:	0510c004 	ldreq	ip, [r0, #-4]
 b44:	008c1001 	addeq	r1, ip, r1
 b48:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 b4c:	05101008 	ldreq	r1, [r0, #-8]
 b50:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 b54:	e24bd008 	sub	sp, fp, #8
 b58:	e8bd0830 	pop	{r4, r5, fp}
 b5c:	e12fff1e 	bx	lr
 b60:	00000ca8 	.word	0x00000ca8

00000b64 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b64:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b68:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 b6c:	e59f50d4 	ldr	r5, [pc, #212]	; c48 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b70:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 b74:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b78:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b7c:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b80:	e3530000 	cmp	r3, #0
 b84:	0a00002b 	beq	c38 <malloc+0xd4>
 b88:	e5930000 	ldr	r0, [r3]
 b8c:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b90:	e1520004 	cmp	r2, r4
 b94:	2a00001b 	bcs	c08 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 b98:	e59f80ac 	ldr	r8, [pc, #172]	; c4c <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b9c:	e1a07184 	lsl	r7, r4, #3
 ba0:	ea000003 	b	bb4 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ba4:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ba8:	e5902004 	ldr	r2, [r0, #4]
 bac:	e1540002 	cmp	r4, r2
 bb0:	9a000014 	bls	c08 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bb4:	e5952000 	ldr	r2, [r5]
 bb8:	e1a03000 	mov	r3, r0
 bbc:	e1500002 	cmp	r0, r2
 bc0:	1afffff7 	bne	ba4 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 bc4:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 bc8:	81a00007 	movhi	r0, r7
 bcc:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 bd0:	81a06004 	movhi	r6, r4
 bd4:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 bd8:	ebfffeec 	bl	790 <sbrk>
 bdc:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 be0:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 be4:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 be8:	0a000010 	beq	c30 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 bec:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 bf0:	ebffffb2 	bl	ac0 <free>
  return freep;
 bf4:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 bf8:	e3530000 	cmp	r3, #0
 bfc:	1affffe8 	bne	ba4 <malloc+0x40>
        return 0;
 c00:	e1a00003 	mov	r0, r3
  }
}
 c04:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 c08:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 c0c:	10642002 	rsbne	r2, r4, r2
 c10:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 c14:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 c18:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 c1c:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 c20:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 c24:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 c28:	e2800008 	add	r0, r0, #8
 c2c:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 c30:	e3a00000 	mov	r0, #0
 c34:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c38:	e2850004 	add	r0, r5, #4
 c3c:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 c40:	e9850009 	stmib	r5, {r0, r3}
 c44:	eaffffd3 	b	b98 <malloc+0x34>
 c48:	00000ca8 	.word	0x00000ca8
 c4c:	00000fff 	.word	0x00000fff
