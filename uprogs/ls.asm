
_ls:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
   0:	e3500001 	cmp	r0, #1
  close(fd);
}

int
main(int argc, char *argv[])
{
   4:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
   8:	e1a04000 	mov	r4, r0
   c:	e28db014 	add	fp, sp, #20
  int i;

  if(argc < 2){
    ls(".");
    exit();
  10:	c1a06001 	movgt	r6, r1
int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
  14:	c3a05001 	movgt	r5, #1
  18:	da000005 	ble	34 <main+0x34>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  1c:	e5b60004 	ldr	r0, [r6, #4]!

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
  20:	e2855001 	add	r5, r5, #1
    ls(argv[i]);
  24:	eb000030 	bl	ec <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
  28:	e1550004 	cmp	r5, r4
  2c:	1afffffa 	bne	1c <main+0x1c>
    ls(argv[i]);
  exit();
  30:	eb00013e 	bl	530 <exit>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    ls(".");
  34:	e59f0004 	ldr	r0, [pc, #4]	; 40 <main+0x40>
  38:	eb00002b 	bl	ec <ls>
    exit();
  3c:	eb00013b 	bl	530 <exit>
  40:	00000db0 	.word	0x00000db0

00000044 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
  44:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
  48:	e28db014 	add	fp, sp, #20
  4c:	e1a05000 	mov	r5, r0
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  50:	eb0000ab 	bl	304 <strlen>
  54:	e0954000 	adds	r4, r5, r0
  58:	2a00000a 	bcs	88 <fmtname+0x44>
  5c:	e7d53000 	ldrb	r3, [r5, r0]
  60:	e353002f 	cmp	r3, #47	; 0x2f
  64:	0a000007 	beq	88 <fmtname+0x44>
  68:	e1a03004 	mov	r3, r4
  6c:	ea000002 	b	7c <fmtname+0x38>
  70:	e5732001 	ldrb	r2, [r3, #-1]!
  74:	e352002f 	cmp	r2, #47	; 0x2f
  78:	0a000002 	beq	88 <fmtname+0x44>
  7c:	e2444001 	sub	r4, r4, #1
  80:	e1550004 	cmp	r5, r4
  84:	9afffff9 	bls	70 <fmtname+0x2c>
    ;
  p++;
  88:	e2844001 	add	r4, r4, #1
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  8c:	e1a00004 	mov	r0, r4
  90:	eb00009b 	bl	304 <strlen>
  94:	e350000d 	cmp	r0, #13
  98:	8a000010 	bhi	e0 <fmtname+0x9c>
    return p;
  memmove(buf, p, strlen(p));
  9c:	e1a00004 	mov	r0, r4
  a0:	eb000097 	bl	304 <strlen>
  a4:	e59f503c 	ldr	r5, [pc, #60]	; e8 <fmtname+0xa4>
  a8:	e1a01004 	mov	r1, r4
  ac:	e1a02000 	mov	r2, r0
  b0:	e1a00005 	mov	r0, r5
  b4:	eb000103 	bl	4c8 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  b8:	e1a00004 	mov	r0, r4
  bc:	eb000090 	bl	304 <strlen>
  c0:	e1a06000 	mov	r6, r0
  c4:	e1a00004 	mov	r0, r4
  c8:	eb00008d 	bl	304 <strlen>
  cc:	e3a01020 	mov	r1, #32
  return buf;
  d0:	e1a04005 	mov	r4, r5
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  d4:	e260200e 	rsb	r2, r0, #14
  d8:	e0850006 	add	r0, r5, r6
  dc:	eb000098 	bl	344 <memset>
  return buf;
}
  e0:	e1a00004 	mov	r0, r4
  e4:	e8bd8878 	pop	{r3, r4, r5, r6, fp, pc}
  e8:	00000dd0 	.word	0x00000dd0

000000ec <ls>:

void
ls(char *path)
{
  ec:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  f0:	e28db018 	add	fp, sp, #24
  f4:	e24ddf8d 	sub	sp, sp, #564	; 0x234
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  f8:	e3a01000 	mov	r1, #0
  return buf;
}

void
ls(char *path)
{
  fc:	e1a06000 	mov	r6, r0
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
 100:	eb000172 	bl	6d0 <open>
 104:	e2504000 	subs	r4, r0, #0
 108:	ba00004b 	blt	23c <ls+0x150>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }
  
  if(fstat(fd, &st) < 0){
 10c:	e24b1040 	sub	r1, fp, #64	; 0x40
 110:	eb000195 	bl	76c <fstat>
 114:	e3500000 	cmp	r0, #0
 118:	ba000051 	blt	264 <ls+0x178>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }
  
  switch(st.type){
 11c:	e15b54f0 	ldrsh	r5, [fp, #-64]	; 0xffffffc0
 120:	e3550001 	cmp	r5, #1
 124:	0a000011 	beq	170 <ls+0x84>
 128:	e3550002 	cmp	r5, #2
 12c:	0a000003 	beq	140 <ls+0x54>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 130:	e1a00004 	mov	r0, r4
 134:	eb00013e 	bl	634 <close>
}
 138:	e24bd018 	sub	sp, fp, #24
 13c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
    return;
  }
  
  switch(st.type){
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 140:	e1a00006 	mov	r0, r6
 144:	ebffffbe 	bl	44 <fmtname>
 148:	e51bc038 	ldr	ip, [fp, #-56]	; 0x38
 14c:	e15b34f0 	ldrsh	r3, [fp, #-64]	; 0xffffffc0
 150:	e58dc000 	str	ip, [sp]
 154:	e51bc030 	ldr	ip, [fp, #-48]	; 0x30
 158:	e59f1120 	ldr	r1, [pc, #288]	; 280 <ls+0x194>
 15c:	e58dc004 	str	ip, [sp, #4]
 160:	e1a02000 	mov	r2, r0
 164:	e3a00001 	mov	r0, #1
 168:	eb000243 	bl	a7c <printf>
    break;
 16c:	eaffffef 	b	130 <ls+0x44>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 170:	e1a00006 	mov	r0, r6
 174:	eb000062 	bl	304 <strlen>
 178:	e2800010 	add	r0, r0, #16
 17c:	e3500c02 	cmp	r0, #512	; 0x200
 180:	8a000029 	bhi	22c <ls+0x140>
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
 184:	e24b5d09 	sub	r5, fp, #576	; 0x240
 188:	e1a01006 	mov	r1, r6
 18c:	e1a00005 	mov	r0, r5
 190:	eb00003e 	bl	290 <strcpy>
    p = buf+strlen(buf);
 194:	e1a00005 	mov	r0, r5
 198:	eb000059 	bl	304 <strlen>
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
 19c:	e3a08000 	mov	r8, #0
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
 1a0:	e3a0302f 	mov	r3, #47	; 0x2f
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
 1a4:	e0856000 	add	r6, r5, r0
    *p++ = '/';
 1a8:	e2867001 	add	r7, r6, #1
 1ac:	e7c53000 	strb	r3, [r5, r0]
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1b0:	e24b102c 	sub	r1, fp, #44	; 0x2c
 1b4:	e1a00004 	mov	r0, r4
 1b8:	e3a02010 	mov	r2, #16
 1bc:	eb000102 	bl	5cc <read>
 1c0:	e3500010 	cmp	r0, #16
 1c4:	1affffd9 	bne	130 <ls+0x44>
      if(de.inum == 0)
 1c8:	e15b32bc 	ldrh	r3, [fp, #-44]	; 0xffffffd4
 1cc:	e3530000 	cmp	r3, #0
 1d0:	0afffff6 	beq	1b0 <ls+0xc4>
        continue;
      memmove(p, de.name, DIRSIZ);
 1d4:	e3a0200e 	mov	r2, #14
 1d8:	e24b102a 	sub	r1, fp, #42	; 0x2a
 1dc:	e1a00007 	mov	r0, r7
 1e0:	eb0000b8 	bl	4c8 <memmove>
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
 1e4:	e24b1040 	sub	r1, fp, #64	; 0x40
 1e8:	e1a00005 	mov	r0, r5
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
 1ec:	e5c6800f 	strb	r8, [r6, #15]
      if(stat(buf, &st) < 0){
 1f0:	eb000090 	bl	438 <stat>
 1f4:	e3500000 	cmp	r0, #0
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 1f8:	e1a00005 	mov	r0, r5
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
 1fc:	ba000013 	blt	250 <ls+0x164>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 200:	ebffff8f 	bl	44 <fmtname>
 204:	e51bc038 	ldr	ip, [fp, #-56]	; 0x38
 208:	e15b34f0 	ldrsh	r3, [fp, #-64]	; 0xffffffc0
 20c:	e58dc000 	str	ip, [sp]
 210:	e51bc030 	ldr	ip, [fp, #-48]	; 0x30
 214:	e59f1064 	ldr	r1, [pc, #100]	; 280 <ls+0x194>
 218:	e58dc004 	str	ip, [sp, #4]
 21c:	e1a02000 	mov	r2, r0
 220:	e3a00001 	mov	r0, #1
 224:	eb000214 	bl	a7c <printf>
 228:	eaffffe0 	b	1b0 <ls+0xc4>
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
 22c:	e1a00005 	mov	r0, r5
 230:	e59f104c 	ldr	r1, [pc, #76]	; 284 <ls+0x198>
 234:	eb000210 	bl	a7c <printf>
      break;
 238:	eaffffbc 	b	130 <ls+0x44>
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
    printf(2, "ls: cannot open %s\n", path);
 23c:	e3a00002 	mov	r0, #2
 240:	e59f1040 	ldr	r1, [pc, #64]	; 288 <ls+0x19c>
 244:	e1a02006 	mov	r2, r6
 248:	eb00020b 	bl	a7c <printf>
    return;
 24c:	eaffffb9 	b	138 <ls+0x4c>
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
 250:	e3a00001 	mov	r0, #1
 254:	e59f1030 	ldr	r1, [pc, #48]	; 28c <ls+0x1a0>
 258:	e1a02005 	mov	r2, r5
 25c:	eb000206 	bl	a7c <printf>
        continue;
 260:	eaffffd2 	b	1b0 <ls+0xc4>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }
  
  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
 264:	e59f1020 	ldr	r1, [pc, #32]	; 28c <ls+0x1a0>
 268:	e1a02006 	mov	r2, r6
 26c:	e3a00002 	mov	r0, #2
 270:	eb000201 	bl	a7c <printf>
    close(fd);
 274:	e1a00004 	mov	r0, r4
 278:	eb0000ed 	bl	634 <close>
    return;
 27c:	eaffffad 	b	138 <ls+0x4c>
 280:	00000d8c 	.word	0x00000d8c
 284:	00000d9c 	.word	0x00000d9c
 288:	00000d64 	.word	0x00000d64
 28c:	00000d78 	.word	0x00000d78

00000290 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 290:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 294:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 298:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 29c:	e4d13001 	ldrb	r3, [r1], #1
 2a0:	e3530000 	cmp	r3, #0
 2a4:	e4c23001 	strb	r3, [r2], #1
 2a8:	1afffffb 	bne	29c <strcpy+0xc>
    ;
  return os;
}
 2ac:	e28bd000 	add	sp, fp, #0
 2b0:	e8bd0800 	pop	{fp}
 2b4:	e12fff1e 	bx	lr

000002b8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2bc:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 2c0:	e5d03000 	ldrb	r3, [r0]
 2c4:	e5d12000 	ldrb	r2, [r1]
 2c8:	e3530000 	cmp	r3, #0
 2cc:	1a000004 	bne	2e4 <strcmp+0x2c>
 2d0:	ea000005 	b	2ec <strcmp+0x34>
 2d4:	e5f03001 	ldrb	r3, [r0, #1]!
 2d8:	e3530000 	cmp	r3, #0
 2dc:	0a000006 	beq	2fc <strcmp+0x44>
 2e0:	e5f12001 	ldrb	r2, [r1, #1]!
 2e4:	e1530002 	cmp	r3, r2
 2e8:	0afffff9 	beq	2d4 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 2ec:	e0620003 	rsb	r0, r2, r3
 2f0:	e28bd000 	add	sp, fp, #0
 2f4:	e8bd0800 	pop	{fp}
 2f8:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2fc:	e5d12001 	ldrb	r2, [r1, #1]
 300:	eafffff9 	b	2ec <strcmp+0x34>

00000304 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 304:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 308:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 30c:	e5d03000 	ldrb	r3, [r0]
 310:	e3530000 	cmp	r3, #0
 314:	01a00003 	moveq	r0, r3
 318:	0a000006 	beq	338 <strlen+0x34>
 31c:	e1a02000 	mov	r2, r0
 320:	e3a03000 	mov	r3, #0
 324:	e5f21001 	ldrb	r1, [r2, #1]!
 328:	e2833001 	add	r3, r3, #1
 32c:	e1a00003 	mov	r0, r3
 330:	e3510000 	cmp	r1, #0
 334:	1afffffa 	bne	324 <strlen+0x20>
    ;
  return n;
}
 338:	e28bd000 	add	sp, fp, #0
 33c:	e8bd0800 	pop	{fp}
 340:	e12fff1e 	bx	lr

00000344 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 344:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 348:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 34c:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 350:	0a000006 	beq	370 <memset+0x2c>
 354:	e6ef1071 	uxtb	r1, r1
 358:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 35c:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 360:	e2533001 	subs	r3, r3, #1
 364:	e4cc1001 	strb	r1, [ip], #1
 368:	1afffffc 	bne	360 <memset+0x1c>
 36c:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 370:	e28bd000 	add	sp, fp, #0
 374:	e8bd0800 	pop	{fp}
 378:	e12fff1e 	bx	lr

0000037c <strchr>:

char*
strchr(const char *s, char c)
{
 37c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 380:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 384:	e5d03000 	ldrb	r3, [r0]
 388:	e3530000 	cmp	r3, #0
 38c:	1a000004 	bne	3a4 <strchr+0x28>
 390:	ea000008 	b	3b8 <strchr+0x3c>
 394:	e5d03001 	ldrb	r3, [r0, #1]
 398:	e2800001 	add	r0, r0, #1
 39c:	e3530000 	cmp	r3, #0
 3a0:	0a000004 	beq	3b8 <strchr+0x3c>
    if(*s == c)
 3a4:	e1530001 	cmp	r3, r1
 3a8:	1afffff9 	bne	394 <strchr+0x18>
      return (char*)s;
  return 0;
}
 3ac:	e28bd000 	add	sp, fp, #0
 3b0:	e8bd0800 	pop	{fp}
 3b4:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 3b8:	e1a00003 	mov	r0, r3
 3bc:	eafffffa 	b	3ac <strchr+0x30>

000003c0 <gets>:
}

char*
gets(char *buf, int max)
{
 3c0:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 3c4:	e28db018 	add	fp, sp, #24
 3c8:	e24dd00c 	sub	sp, sp, #12
 3cc:	e1a08000 	mov	r8, r0
 3d0:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d4:	e1a06000 	mov	r6, r0
 3d8:	e3a05000 	mov	r5, #0
 3dc:	ea000008 	b	404 <gets+0x44>
    cc = read(0, &c, 1);
 3e0:	eb000079 	bl	5cc <read>
    if(cc < 1)
 3e4:	e3500000 	cmp	r0, #0
 3e8:	da00000b 	ble	41c <gets+0x5c>
      break;
    buf[i++] = c;
 3ec:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 3f0:	e1a05004 	mov	r5, r4
 3f4:	e353000a 	cmp	r3, #10
 3f8:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 3fc:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 400:	0a00000a 	beq	430 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 404:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 408:	e0854002 	add	r4, r5, r2
 40c:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 410:	e3a00000 	mov	r0, #0
 414:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 418:	bafffff0 	blt	3e0 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 41c:	e3a03000 	mov	r3, #0
 420:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 424:	e1a00008 	mov	r0, r8
 428:	e24bd018 	sub	sp, fp, #24
 42c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 430:	e1a05004 	mov	r5, r4
 434:	eafffff8 	b	41c <gets+0x5c>

00000438 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 438:	e92d4830 	push	{r4, r5, fp, lr}
 43c:	e1a05001 	mov	r5, r1
 440:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 444:	e3a01000 	mov	r1, #0
 448:	eb0000a0 	bl	6d0 <open>
  if(fd < 0)
 44c:	e2504000 	subs	r4, r0, #0
    return -1;
 450:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 454:	ba000004 	blt	46c <stat+0x34>
    return -1;
  r = fstat(fd, st);
 458:	e1a01005 	mov	r1, r5
 45c:	eb0000c2 	bl	76c <fstat>
 460:	e1a05000 	mov	r5, r0
  close(fd);
 464:	e1a00004 	mov	r0, r4
 468:	eb000071 	bl	634 <close>
  return r;
}
 46c:	e1a00005 	mov	r0, r5
 470:	e8bd8830 	pop	{r4, r5, fp, pc}

00000474 <atoi>:

int
atoi(const char *s)
{
 474:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 478:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 47c:	e5d03000 	ldrb	r3, [r0]
 480:	e2432030 	sub	r2, r3, #48	; 0x30
 484:	e6ef2072 	uxtb	r2, r2
 488:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 48c:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 490:	8a000009 	bhi	4bc <atoi+0x48>
 494:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 498:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 49c:	e0800100 	add	r0, r0, r0, lsl #2
 4a0:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4a4:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 4a8:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4ac:	e2431030 	sub	r1, r3, #48	; 0x30
 4b0:	e6ef1071 	uxtb	r1, r1
 4b4:	e3510009 	cmp	r1, #9
 4b8:	9afffff7 	bls	49c <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 4bc:	e28bd000 	add	sp, fp, #0
 4c0:	e8bd0800 	pop	{fp}
 4c4:	e12fff1e 	bx	lr

000004c8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4c8:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 4cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 4d0:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4d4:	da000005 	ble	4f0 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 4d8:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 4dc:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 4e0:	e4d1c001 	ldrb	ip, [r1], #1
 4e4:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4e8:	e1530002 	cmp	r3, r2
 4ec:	1afffffb 	bne	4e0 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 4f0:	e28bd000 	add	sp, fp, #0
 4f4:	e8bd0800 	pop	{fp}
 4f8:	e12fff1e 	bx	lr

000004fc <fork>:
 4fc:	e92d4000 	push	{lr}
 500:	e92d0008 	push	{r3}
 504:	e92d0004 	push	{r2}
 508:	e92d0002 	push	{r1}
 50c:	e92d0001 	push	{r0}
 510:	e3a00001 	mov	r0, #1
 514:	ef000040 	svc	0x00000040
 518:	e8bd0002 	pop	{r1}
 51c:	e8bd0002 	pop	{r1}
 520:	e8bd0004 	pop	{r2}
 524:	e8bd0008 	pop	{r3}
 528:	e8bd4000 	pop	{lr}
 52c:	e12fff1e 	bx	lr

00000530 <exit>:
 530:	e92d4000 	push	{lr}
 534:	e92d0008 	push	{r3}
 538:	e92d0004 	push	{r2}
 53c:	e92d0002 	push	{r1}
 540:	e92d0001 	push	{r0}
 544:	e3a00002 	mov	r0, #2
 548:	ef000040 	svc	0x00000040
 54c:	e8bd0002 	pop	{r1}
 550:	e8bd0002 	pop	{r1}
 554:	e8bd0004 	pop	{r2}
 558:	e8bd0008 	pop	{r3}
 55c:	e8bd4000 	pop	{lr}
 560:	e12fff1e 	bx	lr

00000564 <wait>:
 564:	e92d4000 	push	{lr}
 568:	e92d0008 	push	{r3}
 56c:	e92d0004 	push	{r2}
 570:	e92d0002 	push	{r1}
 574:	e92d0001 	push	{r0}
 578:	e3a00003 	mov	r0, #3
 57c:	ef000040 	svc	0x00000040
 580:	e8bd0002 	pop	{r1}
 584:	e8bd0002 	pop	{r1}
 588:	e8bd0004 	pop	{r2}
 58c:	e8bd0008 	pop	{r3}
 590:	e8bd4000 	pop	{lr}
 594:	e12fff1e 	bx	lr

00000598 <pipe>:
 598:	e92d4000 	push	{lr}
 59c:	e92d0008 	push	{r3}
 5a0:	e92d0004 	push	{r2}
 5a4:	e92d0002 	push	{r1}
 5a8:	e92d0001 	push	{r0}
 5ac:	e3a00004 	mov	r0, #4
 5b0:	ef000040 	svc	0x00000040
 5b4:	e8bd0002 	pop	{r1}
 5b8:	e8bd0002 	pop	{r1}
 5bc:	e8bd0004 	pop	{r2}
 5c0:	e8bd0008 	pop	{r3}
 5c4:	e8bd4000 	pop	{lr}
 5c8:	e12fff1e 	bx	lr

000005cc <read>:
 5cc:	e92d4000 	push	{lr}
 5d0:	e92d0008 	push	{r3}
 5d4:	e92d0004 	push	{r2}
 5d8:	e92d0002 	push	{r1}
 5dc:	e92d0001 	push	{r0}
 5e0:	e3a00005 	mov	r0, #5
 5e4:	ef000040 	svc	0x00000040
 5e8:	e8bd0002 	pop	{r1}
 5ec:	e8bd0002 	pop	{r1}
 5f0:	e8bd0004 	pop	{r2}
 5f4:	e8bd0008 	pop	{r3}
 5f8:	e8bd4000 	pop	{lr}
 5fc:	e12fff1e 	bx	lr

00000600 <write>:
 600:	e92d4000 	push	{lr}
 604:	e92d0008 	push	{r3}
 608:	e92d0004 	push	{r2}
 60c:	e92d0002 	push	{r1}
 610:	e92d0001 	push	{r0}
 614:	e3a00010 	mov	r0, #16
 618:	ef000040 	svc	0x00000040
 61c:	e8bd0002 	pop	{r1}
 620:	e8bd0002 	pop	{r1}
 624:	e8bd0004 	pop	{r2}
 628:	e8bd0008 	pop	{r3}
 62c:	e8bd4000 	pop	{lr}
 630:	e12fff1e 	bx	lr

00000634 <close>:
 634:	e92d4000 	push	{lr}
 638:	e92d0008 	push	{r3}
 63c:	e92d0004 	push	{r2}
 640:	e92d0002 	push	{r1}
 644:	e92d0001 	push	{r0}
 648:	e3a00015 	mov	r0, #21
 64c:	ef000040 	svc	0x00000040
 650:	e8bd0002 	pop	{r1}
 654:	e8bd0002 	pop	{r1}
 658:	e8bd0004 	pop	{r2}
 65c:	e8bd0008 	pop	{r3}
 660:	e8bd4000 	pop	{lr}
 664:	e12fff1e 	bx	lr

00000668 <kill>:
 668:	e92d4000 	push	{lr}
 66c:	e92d0008 	push	{r3}
 670:	e92d0004 	push	{r2}
 674:	e92d0002 	push	{r1}
 678:	e92d0001 	push	{r0}
 67c:	e3a00006 	mov	r0, #6
 680:	ef000040 	svc	0x00000040
 684:	e8bd0002 	pop	{r1}
 688:	e8bd0002 	pop	{r1}
 68c:	e8bd0004 	pop	{r2}
 690:	e8bd0008 	pop	{r3}
 694:	e8bd4000 	pop	{lr}
 698:	e12fff1e 	bx	lr

0000069c <exec>:
 69c:	e92d4000 	push	{lr}
 6a0:	e92d0008 	push	{r3}
 6a4:	e92d0004 	push	{r2}
 6a8:	e92d0002 	push	{r1}
 6ac:	e92d0001 	push	{r0}
 6b0:	e3a00007 	mov	r0, #7
 6b4:	ef000040 	svc	0x00000040
 6b8:	e8bd0002 	pop	{r1}
 6bc:	e8bd0002 	pop	{r1}
 6c0:	e8bd0004 	pop	{r2}
 6c4:	e8bd0008 	pop	{r3}
 6c8:	e8bd4000 	pop	{lr}
 6cc:	e12fff1e 	bx	lr

000006d0 <open>:
 6d0:	e92d4000 	push	{lr}
 6d4:	e92d0008 	push	{r3}
 6d8:	e92d0004 	push	{r2}
 6dc:	e92d0002 	push	{r1}
 6e0:	e92d0001 	push	{r0}
 6e4:	e3a0000f 	mov	r0, #15
 6e8:	ef000040 	svc	0x00000040
 6ec:	e8bd0002 	pop	{r1}
 6f0:	e8bd0002 	pop	{r1}
 6f4:	e8bd0004 	pop	{r2}
 6f8:	e8bd0008 	pop	{r3}
 6fc:	e8bd4000 	pop	{lr}
 700:	e12fff1e 	bx	lr

00000704 <mknod>:
 704:	e92d4000 	push	{lr}
 708:	e92d0008 	push	{r3}
 70c:	e92d0004 	push	{r2}
 710:	e92d0002 	push	{r1}
 714:	e92d0001 	push	{r0}
 718:	e3a00011 	mov	r0, #17
 71c:	ef000040 	svc	0x00000040
 720:	e8bd0002 	pop	{r1}
 724:	e8bd0002 	pop	{r1}
 728:	e8bd0004 	pop	{r2}
 72c:	e8bd0008 	pop	{r3}
 730:	e8bd4000 	pop	{lr}
 734:	e12fff1e 	bx	lr

00000738 <unlink>:
 738:	e92d4000 	push	{lr}
 73c:	e92d0008 	push	{r3}
 740:	e92d0004 	push	{r2}
 744:	e92d0002 	push	{r1}
 748:	e92d0001 	push	{r0}
 74c:	e3a00012 	mov	r0, #18
 750:	ef000040 	svc	0x00000040
 754:	e8bd0002 	pop	{r1}
 758:	e8bd0002 	pop	{r1}
 75c:	e8bd0004 	pop	{r2}
 760:	e8bd0008 	pop	{r3}
 764:	e8bd4000 	pop	{lr}
 768:	e12fff1e 	bx	lr

0000076c <fstat>:
 76c:	e92d4000 	push	{lr}
 770:	e92d0008 	push	{r3}
 774:	e92d0004 	push	{r2}
 778:	e92d0002 	push	{r1}
 77c:	e92d0001 	push	{r0}
 780:	e3a00008 	mov	r0, #8
 784:	ef000040 	svc	0x00000040
 788:	e8bd0002 	pop	{r1}
 78c:	e8bd0002 	pop	{r1}
 790:	e8bd0004 	pop	{r2}
 794:	e8bd0008 	pop	{r3}
 798:	e8bd4000 	pop	{lr}
 79c:	e12fff1e 	bx	lr

000007a0 <link>:
 7a0:	e92d4000 	push	{lr}
 7a4:	e92d0008 	push	{r3}
 7a8:	e92d0004 	push	{r2}
 7ac:	e92d0002 	push	{r1}
 7b0:	e92d0001 	push	{r0}
 7b4:	e3a00013 	mov	r0, #19
 7b8:	ef000040 	svc	0x00000040
 7bc:	e8bd0002 	pop	{r1}
 7c0:	e8bd0002 	pop	{r1}
 7c4:	e8bd0004 	pop	{r2}
 7c8:	e8bd0008 	pop	{r3}
 7cc:	e8bd4000 	pop	{lr}
 7d0:	e12fff1e 	bx	lr

000007d4 <mkdir>:
 7d4:	e92d4000 	push	{lr}
 7d8:	e92d0008 	push	{r3}
 7dc:	e92d0004 	push	{r2}
 7e0:	e92d0002 	push	{r1}
 7e4:	e92d0001 	push	{r0}
 7e8:	e3a00014 	mov	r0, #20
 7ec:	ef000040 	svc	0x00000040
 7f0:	e8bd0002 	pop	{r1}
 7f4:	e8bd0002 	pop	{r1}
 7f8:	e8bd0004 	pop	{r2}
 7fc:	e8bd0008 	pop	{r3}
 800:	e8bd4000 	pop	{lr}
 804:	e12fff1e 	bx	lr

00000808 <chdir>:
 808:	e92d4000 	push	{lr}
 80c:	e92d0008 	push	{r3}
 810:	e92d0004 	push	{r2}
 814:	e92d0002 	push	{r1}
 818:	e92d0001 	push	{r0}
 81c:	e3a00009 	mov	r0, #9
 820:	ef000040 	svc	0x00000040
 824:	e8bd0002 	pop	{r1}
 828:	e8bd0002 	pop	{r1}
 82c:	e8bd0004 	pop	{r2}
 830:	e8bd0008 	pop	{r3}
 834:	e8bd4000 	pop	{lr}
 838:	e12fff1e 	bx	lr

0000083c <dup>:
 83c:	e92d4000 	push	{lr}
 840:	e92d0008 	push	{r3}
 844:	e92d0004 	push	{r2}
 848:	e92d0002 	push	{r1}
 84c:	e92d0001 	push	{r0}
 850:	e3a0000a 	mov	r0, #10
 854:	ef000040 	svc	0x00000040
 858:	e8bd0002 	pop	{r1}
 85c:	e8bd0002 	pop	{r1}
 860:	e8bd0004 	pop	{r2}
 864:	e8bd0008 	pop	{r3}
 868:	e8bd4000 	pop	{lr}
 86c:	e12fff1e 	bx	lr

00000870 <getpid>:
 870:	e92d4000 	push	{lr}
 874:	e92d0008 	push	{r3}
 878:	e92d0004 	push	{r2}
 87c:	e92d0002 	push	{r1}
 880:	e92d0001 	push	{r0}
 884:	e3a0000b 	mov	r0, #11
 888:	ef000040 	svc	0x00000040
 88c:	e8bd0002 	pop	{r1}
 890:	e8bd0002 	pop	{r1}
 894:	e8bd0004 	pop	{r2}
 898:	e8bd0008 	pop	{r3}
 89c:	e8bd4000 	pop	{lr}
 8a0:	e12fff1e 	bx	lr

000008a4 <sbrk>:
 8a4:	e92d4000 	push	{lr}
 8a8:	e92d0008 	push	{r3}
 8ac:	e92d0004 	push	{r2}
 8b0:	e92d0002 	push	{r1}
 8b4:	e92d0001 	push	{r0}
 8b8:	e3a0000c 	mov	r0, #12
 8bc:	ef000040 	svc	0x00000040
 8c0:	e8bd0002 	pop	{r1}
 8c4:	e8bd0002 	pop	{r1}
 8c8:	e8bd0004 	pop	{r2}
 8cc:	e8bd0008 	pop	{r3}
 8d0:	e8bd4000 	pop	{lr}
 8d4:	e12fff1e 	bx	lr

000008d8 <sleep>:
 8d8:	e92d4000 	push	{lr}
 8dc:	e92d0008 	push	{r3}
 8e0:	e92d0004 	push	{r2}
 8e4:	e92d0002 	push	{r1}
 8e8:	e92d0001 	push	{r0}
 8ec:	e3a0000d 	mov	r0, #13
 8f0:	ef000040 	svc	0x00000040
 8f4:	e8bd0002 	pop	{r1}
 8f8:	e8bd0002 	pop	{r1}
 8fc:	e8bd0004 	pop	{r2}
 900:	e8bd0008 	pop	{r3}
 904:	e8bd4000 	pop	{lr}
 908:	e12fff1e 	bx	lr

0000090c <uptime>:
 90c:	e92d4000 	push	{lr}
 910:	e92d0008 	push	{r3}
 914:	e92d0004 	push	{r2}
 918:	e92d0002 	push	{r1}
 91c:	e92d0001 	push	{r0}
 920:	e3a0000e 	mov	r0, #14
 924:	ef000040 	svc	0x00000040
 928:	e8bd0002 	pop	{r1}
 92c:	e8bd0002 	pop	{r1}
 930:	e8bd0004 	pop	{r2}
 934:	e8bd0008 	pop	{r3}
 938:	e8bd4000 	pop	{lr}
 93c:	e12fff1e 	bx	lr

00000940 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 940:	e92d4800 	push	{fp, lr}
 944:	e28db004 	add	fp, sp, #4
 948:	e24b3004 	sub	r3, fp, #4
 94c:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 950:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 954:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 958:	e1a01003 	mov	r1, r3
 95c:	ebffff27 	bl	600 <write>
}
 960:	e24bd004 	sub	sp, fp, #4
 964:	e8bd8800 	pop	{fp, pc}

00000968 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 968:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 96c:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 970:	e1a00fa1 	lsr	r0, r1, #31
 974:	e3530000 	cmp	r3, #0
 978:	03a03000 	moveq	r3, #0
 97c:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 980:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 984:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 988:	e24dd014 	sub	sp, sp, #20
 98c:	e59f909c 	ldr	r9, [pc, #156]	; a30 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 990:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 994:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 998:	e3a0a000 	mov	sl, #0
 99c:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 9a0:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 9a4:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 9a8:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 9ac:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 9b0:	e1a0e031 	lsr	lr, r1, r0
 9b4:	e20ee001 	and	lr, lr, #1
 9b8:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 9bc:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 9c0:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 9c4:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 9c8:	e2500001 	subs	r0, r0, #1
 9cc:	2afffff7 	bcs	9b0 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 9d0:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 9d4:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 9d8:	e0601001 	rsb	r1, r0, r1
 9dc:	e28a5001 	add	r5, sl, #1
 9e0:	e7d91001 	ldrb	r1, [r9, r1]
 9e4:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 9e8:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 9ec:	11a0a005 	movne	sl, r5
 9f0:	1affffeb 	bne	9a4 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 9f4:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 9f8:	124b2024 	subne	r2, fp, #36	; 0x24
 9fc:	10823005 	addne	r3, r2, r5
 a00:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 a04:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 a08:	13a0202d 	movne	r2, #45	; 0x2d
 a0c:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 a10:	e7d61005 	ldrb	r1, [r6, r5]
 a14:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 a18:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 a1c:	ebffffc7 	bl	940 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 a20:	e3750001 	cmn	r5, #1
 a24:	1afffff9 	bne	a10 <printint+0xa8>
    putc(fd, buf[i]);
}
 a28:	e24bd020 	sub	sp, fp, #32
 a2c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 a30:	00000db4 	.word	0x00000db4

00000a34 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 a34:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 a38:	e92d0830 	push	{r4, r5, fp}
 a3c:	e1a02000 	mov	r2, r0
 a40:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 a44:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 a48:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 a4c:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 a50:	e1a04c32 	lsr	r4, r2, ip
 a54:	e2044001 	and	r4, r4, #1
 a58:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 a5c:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 a60:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 a64:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 a68:	e25cc001 	subs	ip, ip, #1
 a6c:	2afffff7 	bcs	a50 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 a70:	e24bd008 	sub	sp, fp, #8
 a74:	e8bd0830 	pop	{r4, r5, fp}
 a78:	e12fff1e 	bx	lr

00000a7c <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 a7c:	e92d000e 	push	{r1, r2, r3}
 a80:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 a84:	e28db020 	add	fp, sp, #32
 a88:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a8c:	e59b4004 	ldr	r4, [fp, #4]
 a90:	e5d48000 	ldrb	r8, [r4]
 a94:	e3580000 	cmp	r8, #0
 a98:	0a000027 	beq	b3c <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 a9c:	e59f712c 	ldr	r7, [pc, #300]	; bd0 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 aa0:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 aa4:	e3a0a000 	mov	sl, #0
 aa8:	ea000008 	b	ad0 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 aac:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 ab0:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 ab4:	0a000002 	beq	ac4 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 ab8:	e1a00005 	mov	r0, r5
 abc:	e1a01008 	mov	r1, r8
 ac0:	ebffff9e 	bl	940 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ac4:	e5f48001 	ldrb	r8, [r4, #1]!
 ac8:	e3580000 	cmp	r8, #0
 acc:	0a00001a 	beq	b3c <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 ad0:	e35a0000 	cmp	sl, #0
 ad4:	0afffff4 	beq	aac <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 ad8:	e35a0025 	cmp	sl, #37	; 0x25
 adc:	1afffff8 	bne	ac4 <printf+0x48>
      if(c == 'd'){
 ae0:	e3580064 	cmp	r8, #100	; 0x64
 ae4:	0a00002c 	beq	b9c <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 ae8:	e3580078 	cmp	r8, #120	; 0x78
 aec:	13580070 	cmpne	r8, #112	; 0x70
 af0:	13a09000 	movne	r9, #0
 af4:	03a09001 	moveq	r9, #1
 af8:	0a000013 	beq	b4c <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 afc:	e3580073 	cmp	r8, #115	; 0x73
 b00:	0a000018 	beq	b68 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b04:	e3580063 	cmp	r8, #99	; 0x63
 b08:	0a00002a 	beq	bb8 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b0c:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 b10:	e1a0100a 	mov	r1, sl
 b14:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b18:	0a000002 	beq	b28 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 b1c:	ebffff87 	bl	940 <putc>
        putc(fd, c);
 b20:	e1a00005 	mov	r0, r5
 b24:	e1a01008 	mov	r1, r8
 b28:	ebffff84 	bl	940 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b2c:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 b30:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b34:	e3580000 	cmp	r8, #0
 b38:	1affffe4 	bne	ad0 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 b3c:	e24bd020 	sub	sp, fp, #32
 b40:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 b44:	e28dd00c 	add	sp, sp, #12
 b48:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 b4c:	e1a00005 	mov	r0, r5
 b50:	e4961004 	ldr	r1, [r6], #4
 b54:	e3a02010 	mov	r2, #16
 b58:	e3a03000 	mov	r3, #0
 b5c:	ebffff81 	bl	968 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 b60:	e3a0a000 	mov	sl, #0
 b64:	eaffffd6 	b	ac4 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 b68:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 b6c:	e3580000 	cmp	r8, #0
 b70:	01a08007 	moveq	r8, r7
        while(*s != 0){
 b74:	e5d81000 	ldrb	r1, [r8]
 b78:	e3510000 	cmp	r1, #0
 b7c:	0a000004 	beq	b94 <printf+0x118>
          putc(fd, *s);
 b80:	e1a00005 	mov	r0, r5
 b84:	ebffff6d 	bl	940 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 b88:	e5f81001 	ldrb	r1, [r8, #1]!
 b8c:	e3510000 	cmp	r1, #0
 b90:	1afffffa 	bne	b80 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 b94:	e1a0a001 	mov	sl, r1
 b98:	eaffffc9 	b	ac4 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 b9c:	e1a00005 	mov	r0, r5
 ba0:	e4961004 	ldr	r1, [r6], #4
 ba4:	e3a0200a 	mov	r2, #10
 ba8:	e3a03001 	mov	r3, #1
 bac:	ebffff6d 	bl	968 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 bb0:	e3a0a000 	mov	sl, #0
 bb4:	eaffffc2 	b	ac4 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 bb8:	e4961004 	ldr	r1, [r6], #4
 bbc:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 bc0:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 bc4:	e6ef1071 	uxtb	r1, r1
 bc8:	ebffff5c 	bl	940 <putc>
 bcc:	eaffffbc 	b	ac4 <printf+0x48>
 bd0:	00000dc8 	.word	0x00000dc8

00000bd4 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bd4:	e59f3098 	ldr	r3, [pc, #152]	; c74 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 bd8:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 bdc:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 be0:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 be4:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 be8:	e152000c 	cmp	r2, ip
 bec:	e5921000 	ldr	r1, [r2]
 bf0:	2a000001 	bcs	bfc <free+0x28>
 bf4:	e15c0001 	cmp	ip, r1
 bf8:	3a000007 	bcc	c1c <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bfc:	e1520001 	cmp	r2, r1
 c00:	3a000003 	bcc	c14 <free+0x40>
 c04:	e152000c 	cmp	r2, ip
 c08:	3a000003 	bcc	c1c <free+0x48>
 c0c:	e15c0001 	cmp	ip, r1
 c10:	3a000001 	bcc	c1c <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 c14:	e1a02001 	mov	r2, r1
 c18:	eafffff2 	b	be8 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 c1c:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 c20:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 c24:	e08c5184 	add	r5, ip, r4, lsl #3
 c28:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 c2c:	05911004 	ldreq	r1, [r1, #4]
 c30:	00814004 	addeq	r4, r1, r4
 c34:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 c38:	05921000 	ldreq	r1, [r2]
 c3c:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 c40:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 c44:	e5921004 	ldr	r1, [r2, #4]
 c48:	e0824181 	add	r4, r2, r1, lsl #3
 c4c:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 c50:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 c54:	0510c004 	ldreq	ip, [r0, #-4]
 c58:	008c1001 	addeq	r1, ip, r1
 c5c:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 c60:	05101008 	ldreq	r1, [r0, #-8]
 c64:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 c68:	e24bd008 	sub	sp, fp, #8
 c6c:	e8bd0830 	pop	{r4, r5, fp}
 c70:	e12fff1e 	bx	lr
 c74:	00000de0 	.word	0x00000de0

00000c78 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c78:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c7c:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 c80:	e59f50d4 	ldr	r5, [pc, #212]	; d5c <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c84:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 c88:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 c8c:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c90:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 c94:	e3530000 	cmp	r3, #0
 c98:	0a00002b 	beq	d4c <malloc+0xd4>
 c9c:	e5930000 	ldr	r0, [r3]
 ca0:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ca4:	e1520004 	cmp	r2, r4
 ca8:	2a00001b 	bcs	d1c <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 cac:	e59f80ac 	ldr	r8, [pc, #172]	; d60 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 cb0:	e1a07184 	lsl	r7, r4, #3
 cb4:	ea000003 	b	cc8 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cb8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 cbc:	e5902004 	ldr	r2, [r0, #4]
 cc0:	e1540002 	cmp	r4, r2
 cc4:	9a000014 	bls	d1c <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 cc8:	e5952000 	ldr	r2, [r5]
 ccc:	e1a03000 	mov	r3, r0
 cd0:	e1500002 	cmp	r0, r2
 cd4:	1afffff7 	bne	cb8 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 cd8:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 cdc:	81a00007 	movhi	r0, r7
 ce0:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 ce4:	81a06004 	movhi	r6, r4
 ce8:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 cec:	ebfffeec 	bl	8a4 <sbrk>
 cf0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 cf4:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 cf8:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 cfc:	0a000010 	beq	d44 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 d00:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 d04:	ebffffb2 	bl	bd4 <free>
  return freep;
 d08:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 d0c:	e3530000 	cmp	r3, #0
 d10:	1affffe8 	bne	cb8 <malloc+0x40>
        return 0;
 d14:	e1a00003 	mov	r0, r3
  }
}
 d18:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 d1c:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 d20:	10642002 	rsbne	r2, r4, r2
 d24:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 d28:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 d2c:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 d30:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 d34:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 d38:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 d3c:	e2800008 	add	r0, r0, #8
 d40:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 d44:	e3a00000 	mov	r0, #0
 d48:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 d4c:	e2850004 	add	r0, r5, #4
 d50:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 d54:	e9850009 	stmib	r5, {r0, r3}
 d58:	eaffffd3 	b	cac <malloc+0x34>
 d5c:	00000de0 	.word	0x00000de0
 d60:	00000fff 	.word	0x00000fff
