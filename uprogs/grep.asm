
_grep:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
main(int argc, char *argv[])
{
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
  }
}

int
main(int argc, char *argv[])
{
   4:	e92d4df0 	push	{r4, r5, r6, r7, r8, sl, fp, lr}
   8:	e1a08000 	mov	r8, r0
   c:	e28db01c 	add	fp, sp, #28
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
  10:	da00001d 	ble	8c <main+0x8c>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  
  if(argc <= 2){
  14:	e3500002 	cmp	r0, #2
  
  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  18:	e591a004 	ldr	sl, [r1, #4]
    }
  }
}

int
main(int argc, char *argv[])
  1c:	12814008 	addne	r4, r1, #8
  20:	13a05002 	movne	r5, #2
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  
  if(argc <= 2){
  24:	0a000014 	beq	7c <main+0x7c>
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  28:	e5940000 	ldr	r0, [r4]
  2c:	e3a01000 	mov	r1, #0
  30:	eb0001c7 	bl	754 <open>
  34:	e1a07004 	mov	r7, r4
  38:	e2844004 	add	r4, r4, #4
  3c:	e2506000 	subs	r6, r0, #0
  40:	ba000008 	blt	68 <main+0x68>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  44:	e1a01006 	mov	r1, r6
  48:	e1a0000a 	mov	r0, sl
  4c:	eb00006f 	bl	210 <grep>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  50:	e2855001 	add	r5, r5, #1
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
    close(fd);
  54:	e1a00006 	mov	r0, r6
  58:	eb000196 	bl	6b8 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  5c:	e1580005 	cmp	r8, r5
  60:	cafffff0 	bgt	28 <main+0x28>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
  64:	eb000152 	bl	5b4 <exit>
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
  68:	e3a00001 	mov	r0, #1
  6c:	e59f1028 	ldr	r1, [pc, #40]	; 9c <main+0x9c>
  70:	e5972000 	ldr	r2, [r7]
  74:	eb0002a1 	bl	b00 <printf>
      exit();
  78:	eb00014d 	bl	5b4 <exit>
    exit();
  }
  pattern = argv[1];
  
  if(argc <= 2){
    grep(pattern, 0);
  7c:	e1a0000a 	mov	r0, sl
  80:	e3a01000 	mov	r1, #0
  84:	eb000061 	bl	210 <grep>
    exit();
  88:	eb000149 	bl	5b4 <exit>
{
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
  8c:	e3a00002 	mov	r0, #2
  90:	e59f1008 	ldr	r1, [pc, #8]	; a0 <main+0xa0>
  94:	eb000299 	bl	b00 <printf>
    exit();
  98:	eb000145 	bl	5b4 <exit>
  9c:	00000e08 	.word	0x00000e08
  a0:	00000de8 	.word	0x00000de8

000000a4 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  a4:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
  a8:	e1a04000 	mov	r4, r0
  ac:	e28db014 	add	fp, sp, #20
  b0:	e1a05001 	mov	r5, r1
  b4:	e1a06002 	mov	r6, r2
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  b8:	e1a01006 	mov	r1, r6
  bc:	e1a00005 	mov	r0, r5
  c0:	eb00000d 	bl	fc <matchhere>
  c4:	e3500000 	cmp	r0, #0
  c8:	1a000007 	bne	ec <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  cc:	e4d63001 	ldrb	r3, [r6], #1
  d0:	e3530000 	cmp	r3, #0
  d4:	0a000006 	beq	f4 <matchstar+0x50>
  d8:	e1530004 	cmp	r3, r4
  dc:	0afffff5 	beq	b8 <matchstar+0x14>
  e0:	e354002e 	cmp	r4, #46	; 0x2e
  e4:	0afffff3 	beq	b8 <matchstar+0x14>
  e8:	e8bd8878 	pop	{r3, r4, r5, r6, fp, pc}
// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  ec:	e3a00001 	mov	r0, #1
  f0:	e8bd8878 	pop	{r3, r4, r5, r6, fp, pc}
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
  f4:	e1a00003 	mov	r0, r3
}
  f8:	e8bd8878 	pop	{r3, r4, r5, r6, fp, pc}

000000fc <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  fc:	e92d0810 	push	{r4, fp}
 100:	e1a03000 	mov	r3, r0
  if(re[0] == '\0')
 104:	e5d00000 	ldrb	r0, [r0]
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 108:	e28db004 	add	fp, sp, #4
 10c:	e1a02001 	mov	r2, r1
  if(re[0] == '\0')
 110:	e3500000 	cmp	r0, #0
 114:	0a00001c 	beq	18c <matchhere+0x90>
    return 1;
  if(re[1] == '*')
 118:	e5d3c001 	ldrb	ip, [r3, #1]
 11c:	e35c002a 	cmp	ip, #42	; 0x2a
  }while(*text++ != '\0');
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
 120:	12834002 	addne	r4, r3, #2
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
 124:	11a01001 	movne	r1, r1
// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
 128:	1a00000f 	bne	16c <matchhere+0x70>
 12c:	ea00001a 	b	19c <matchhere+0xa0>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 130:	e4d12001 	ldrb	r2, [r1], #1
 134:	e3520000 	cmp	r2, #0
 138:	0a00001b 	beq	1ac <matchhere+0xb0>
 13c:	e350002e 	cmp	r0, #46	; 0x2e
 140:	0a000001 	beq	14c <matchhere+0x50>
 144:	e1500002 	cmp	r0, r2
 148:	1a000019 	bne	1b4 <matchhere+0xb8>
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
 14c:	e5d30001 	ldrb	r0, [r3, #1]
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
 150:	e1a02001 	mov	r2, r1
 154:	e2833001 	add	r3, r3, #1
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
 158:	e3500000 	cmp	r0, #0
 15c:	0a00000a 	beq	18c <matchhere+0x90>
    return 1;
  if(re[1] == '*')
 160:	e4d4c001 	ldrb	ip, [r4], #1
 164:	e35c002a 	cmp	ip, #42	; 0x2a
 168:	0a00000b 	beq	19c <matchhere+0xa0>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
 16c:	e3500024 	cmp	r0, #36	; 0x24
 170:	1affffee 	bne	130 <matchhere+0x34>
 174:	e35c0000 	cmp	ip, #0
 178:	1affffec 	bne	130 <matchhere+0x34>
    return *text == '\0';
 17c:	e5d10000 	ldrb	r0, [r1]
 180:	e2700001 	rsbs	r0, r0, #1
 184:	33a00000 	movcc	r0, #0
 188:	ea000000 	b	190 <matchhere+0x94>

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
 18c:	e3a00001 	mov	r0, #1
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 190:	e24bd004 	sub	sp, fp, #4
 194:	e8bd0810 	pop	{r4, fp}
 198:	e12fff1e 	bx	lr
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
 19c:	e2831002 	add	r1, r3, #2
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 1a0:	e24bd004 	sub	sp, fp, #4
 1a4:	e8bd0810 	pop	{r4, fp}
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
 1a8:	eaffffbd 	b	a4 <matchstar>
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
 1ac:	e1a00002 	mov	r0, r2
 1b0:	eafffff6 	b	190 <matchhere+0x94>
 1b4:	e3a00000 	mov	r0, #0
 1b8:	eafffff4 	b	190 <matchhere+0x94>

000001bc <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1bc:	e92d4830 	push	{r4, r5, fp, lr}
 1c0:	e1a05000 	mov	r5, r0
  if(re[0] == '^')
 1c4:	e5d03000 	ldrb	r3, [r0]
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1c8:	e28db00c 	add	fp, sp, #12
 1cc:	e1a04001 	mov	r4, r1
  if(re[0] == '^')
 1d0:	e353005e 	cmp	r3, #94	; 0x5e
 1d4:	0a00000a 	beq	204 <match+0x48>
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
 1d8:	e1a01004 	mov	r1, r4
 1dc:	e1a00005 	mov	r0, r5
 1e0:	ebffffc5 	bl	fc <matchhere>
 1e4:	e3500000 	cmp	r0, #0
 1e8:	1a000003 	bne	1fc <match+0x40>
      return 1;
  }while(*text++ != '\0');
 1ec:	e4d40001 	ldrb	r0, [r4], #1
 1f0:	e3500000 	cmp	r0, #0
 1f4:	1afffff7 	bne	1d8 <match+0x1c>
 1f8:	e8bd8830 	pop	{r4, r5, fp, pc}
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
 1fc:	e3a00001 	mov	r0, #1
  }while(*text++ != '\0');
  return 0;
}
 200:	e8bd8830 	pop	{r4, r5, fp, pc}

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 204:	e2800001 	add	r0, r0, #1
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
 208:	e8bd4830 	pop	{r4, r5, fp, lr}

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 20c:	eaffffba 	b	fc <matchhere>

00000210 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 210:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  int n, m;
  char *p, *q;
  
  m = 0;
 214:	e3a07000 	mov	r7, #0
 218:	e59fa0f0 	ldr	sl, [pc, #240]	; 310 <grep+0x100>
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 21c:	e28db020 	add	fp, sp, #32
 220:	e1a05000 	mov	r5, r0
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      *q = 0;
 224:	e1a06007 	mov	r6, r7
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 228:	e24dd00c 	sub	sp, sp, #12
 22c:	e50b102c 	str	r1, [fp, #-44]	; 0x2c
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
 230:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
 234:	e08a1007 	add	r1, sl, r7
 238:	e2672b01 	rsb	r2, r7, #1024	; 0x400
 23c:	eb000103 	bl	650 <read>
 240:	e3500000 	cmp	r0, #0
 244:	e50b0028 	str	r0, [fp, #-40]	; 0x28
 248:	da00002e 	ble	308 <grep+0xf8>
 24c:	e59f90bc 	ldr	r9, [pc, #188]	; 310 <grep+0x100>
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 250:	e3a0800a 	mov	r8, #10
 254:	e3a0100a 	mov	r1, #10
 258:	e1a00009 	mov	r0, r9
 25c:	eb000067 	bl	400 <strchr>
      *q = 0;
      if(match(pattern, p)){
 260:	e1a01009 	mov	r1, r9
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 264:	e2504000 	subs	r4, r0, #0
      *q = 0;
      if(match(pattern, p)){
 268:	e1a00005 	mov	r0, r5
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 26c:	0a000011 	beq	2b8 <grep+0xa8>
      *q = 0;
 270:	e5c46000 	strb	r6, [r4]
      if(match(pattern, p)){
 274:	ebffffd0 	bl	1bc <match>
 278:	e3500000 	cmp	r0, #0
 27c:	02849001 	addeq	r9, r4, #1
 280:	0afffff3 	beq	254 <grep+0x44>
        *q = '\n';
 284:	e4c48001 	strb	r8, [r4], #1
        write(1, p, q+1 - p);
 288:	e1a01009 	mov	r1, r9
 28c:	e0692004 	rsb	r2, r9, r4
 290:	e3a00001 	mov	r0, #1
 294:	e1a09004 	mov	r9, r4
 298:	eb0000f9 	bl	684 <write>
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 29c:	e3a0100a 	mov	r1, #10
 2a0:	e1a00009 	mov	r0, r9
 2a4:	eb000055 	bl	400 <strchr>
      *q = 0;
      if(match(pattern, p)){
 2a8:	e1a01009 	mov	r1, r9
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 2ac:	e2504000 	subs	r4, r0, #0
      *q = 0;
      if(match(pattern, p)){
 2b0:	e1a00005 	mov	r0, r5
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 2b4:	1affffed 	bne	270 <grep+0x60>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
 2b8:	e159000a 	cmp	r9, sl
      m = 0;
 2bc:	01a07004 	moveq	r7, r4
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
 2c0:	0affffda 	beq	230 <grep+0x20>
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
 2c4:	e51b3028 	ldr	r3, [fp, #-40]	; 0x28
 2c8:	e0877003 	add	r7, r7, r3
      }
      p = q+1;
    }
    if(p == buf)
      m = 0;
    if(m > 0){
 2cc:	e3570000 	cmp	r7, #0
 2d0:	daffffd6 	ble	230 <grep+0x20>
      m -= p - buf;
 2d4:	e59f2034 	ldr	r2, [pc, #52]	; 310 <grep+0x100>
      memmove(buf, p, m);
 2d8:	e59f0030 	ldr	r0, [pc, #48]	; 310 <grep+0x100>
      p = q+1;
    }
    if(p == buf)
      m = 0;
    if(m > 0){
      m -= p - buf;
 2dc:	e0693002 	rsb	r3, r9, r2
 2e0:	e0877003 	add	r7, r7, r3
      memmove(buf, p, m);
 2e4:	e1a02007 	mov	r2, r7
 2e8:	eb000097 	bl	54c <memmove>
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
 2ec:	e51b002c 	ldr	r0, [fp, #-44]	; 0x2c
 2f0:	e08a1007 	add	r1, sl, r7
 2f4:	e2672b01 	rsb	r2, r7, #1024	; 0x400
 2f8:	eb0000d4 	bl	650 <read>
 2fc:	e3500000 	cmp	r0, #0
 300:	e50b0028 	str	r0, [fp, #-40]	; 0x28
 304:	caffffd0 	bgt	24c <grep+0x3c>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
 308:	e24bd020 	sub	sp, fp, #32
 30c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 310:	00000e48 	.word	0x00000e48

00000314 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 314:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 318:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 31c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 320:	e4d13001 	ldrb	r3, [r1], #1
 324:	e3530000 	cmp	r3, #0
 328:	e4c23001 	strb	r3, [r2], #1
 32c:	1afffffb 	bne	320 <strcpy+0xc>
    ;
  return os;
}
 330:	e28bd000 	add	sp, fp, #0
 334:	e8bd0800 	pop	{fp}
 338:	e12fff1e 	bx	lr

0000033c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 33c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 340:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 344:	e5d03000 	ldrb	r3, [r0]
 348:	e5d12000 	ldrb	r2, [r1]
 34c:	e3530000 	cmp	r3, #0
 350:	1a000004 	bne	368 <strcmp+0x2c>
 354:	ea000005 	b	370 <strcmp+0x34>
 358:	e5f03001 	ldrb	r3, [r0, #1]!
 35c:	e3530000 	cmp	r3, #0
 360:	0a000006 	beq	380 <strcmp+0x44>
 364:	e5f12001 	ldrb	r2, [r1, #1]!
 368:	e1530002 	cmp	r3, r2
 36c:	0afffff9 	beq	358 <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 370:	e0620003 	rsb	r0, r2, r3
 374:	e28bd000 	add	sp, fp, #0
 378:	e8bd0800 	pop	{fp}
 37c:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 380:	e5d12001 	ldrb	r2, [r1, #1]
 384:	eafffff9 	b	370 <strcmp+0x34>

00000388 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 388:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 38c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 390:	e5d03000 	ldrb	r3, [r0]
 394:	e3530000 	cmp	r3, #0
 398:	01a00003 	moveq	r0, r3
 39c:	0a000006 	beq	3bc <strlen+0x34>
 3a0:	e1a02000 	mov	r2, r0
 3a4:	e3a03000 	mov	r3, #0
 3a8:	e5f21001 	ldrb	r1, [r2, #1]!
 3ac:	e2833001 	add	r3, r3, #1
 3b0:	e1a00003 	mov	r0, r3
 3b4:	e3510000 	cmp	r1, #0
 3b8:	1afffffa 	bne	3a8 <strlen+0x20>
    ;
  return n;
}
 3bc:	e28bd000 	add	sp, fp, #0
 3c0:	e8bd0800 	pop	{fp}
 3c4:	e12fff1e 	bx	lr

000003c8 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 3c8:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 3cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3d0:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 3d4:	0a000006 	beq	3f4 <memset+0x2c>
 3d8:	e6ef1071 	uxtb	r1, r1
 3dc:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
 3e0:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 3e4:	e2533001 	subs	r3, r3, #1
 3e8:	e4cc1001 	strb	r1, [ip], #1
 3ec:	1afffffc 	bne	3e4 <memset+0x1c>
 3f0:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
 3f4:	e28bd000 	add	sp, fp, #0
 3f8:	e8bd0800 	pop	{fp}
 3fc:	e12fff1e 	bx	lr

00000400 <strchr>:

char*
strchr(const char *s, char c)
{
 400:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 404:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 408:	e5d03000 	ldrb	r3, [r0]
 40c:	e3530000 	cmp	r3, #0
 410:	1a000004 	bne	428 <strchr+0x28>
 414:	ea000008 	b	43c <strchr+0x3c>
 418:	e5d03001 	ldrb	r3, [r0, #1]
 41c:	e2800001 	add	r0, r0, #1
 420:	e3530000 	cmp	r3, #0
 424:	0a000004 	beq	43c <strchr+0x3c>
    if(*s == c)
 428:	e1530001 	cmp	r3, r1
 42c:	1afffff9 	bne	418 <strchr+0x18>
      return (char*)s;
  return 0;
}
 430:	e28bd000 	add	sp, fp, #0
 434:	e8bd0800 	pop	{fp}
 438:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 43c:	e1a00003 	mov	r0, r3
 440:	eafffffa 	b	430 <strchr+0x30>

00000444 <gets>:
}

char*
gets(char *buf, int max)
{
 444:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 448:	e28db018 	add	fp, sp, #24
 44c:	e24dd00c 	sub	sp, sp, #12
 450:	e1a08000 	mov	r8, r0
 454:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 458:	e1a06000 	mov	r6, r0
 45c:	e3a05000 	mov	r5, #0
 460:	ea000008 	b	488 <gets+0x44>
    cc = read(0, &c, 1);
 464:	eb000079 	bl	650 <read>
    if(cc < 1)
 468:	e3500000 	cmp	r0, #0
 46c:	da00000b 	ble	4a0 <gets+0x5c>
      break;
    buf[i++] = c;
 470:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
 474:	e1a05004 	mov	r5, r4
 478:	e353000a 	cmp	r3, #10
 47c:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 480:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
 484:	0a00000a 	beq	4b4 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 488:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 48c:	e0854002 	add	r4, r5, r2
 490:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 494:	e3a00000 	mov	r0, #0
 498:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 49c:	bafffff0 	blt	464 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4a0:	e3a03000 	mov	r3, #0
 4a4:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 4a8:	e1a00008 	mov	r0, r8
 4ac:	e24bd018 	sub	sp, fp, #24
 4b0:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4b4:	e1a05004 	mov	r5, r4
 4b8:	eafffff8 	b	4a0 <gets+0x5c>

000004bc <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 4bc:	e92d4830 	push	{r4, r5, fp, lr}
 4c0:	e1a05001 	mov	r5, r1
 4c4:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c8:	e3a01000 	mov	r1, #0
 4cc:	eb0000a0 	bl	754 <open>
  if(fd < 0)
 4d0:	e2504000 	subs	r4, r0, #0
    return -1;
 4d4:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 4d8:	ba000004 	blt	4f0 <stat+0x34>
    return -1;
  r = fstat(fd, st);
 4dc:	e1a01005 	mov	r1, r5
 4e0:	eb0000c2 	bl	7f0 <fstat>
 4e4:	e1a05000 	mov	r5, r0
  close(fd);
 4e8:	e1a00004 	mov	r0, r4
 4ec:	eb000071 	bl	6b8 <close>
  return r;
}
 4f0:	e1a00005 	mov	r0, r5
 4f4:	e8bd8830 	pop	{r4, r5, fp, pc}

000004f8 <atoi>:

int
atoi(const char *s)
{
 4f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 4fc:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 500:	e5d03000 	ldrb	r3, [r0]
 504:	e2432030 	sub	r2, r3, #48	; 0x30
 508:	e6ef2072 	uxtb	r2, r2
 50c:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
 510:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
 514:	8a000009 	bhi	540 <atoi+0x48>
 518:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
 51c:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 520:	e0800100 	add	r0, r0, r0, lsl #2
 524:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 528:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
 52c:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 530:	e2431030 	sub	r1, r3, #48	; 0x30
 534:	e6ef1071 	uxtb	r1, r1
 538:	e3510009 	cmp	r1, #9
 53c:	9afffff7 	bls	520 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
 540:	e28bd000 	add	sp, fp, #0
 544:	e8bd0800 	pop	{fp}
 548:	e12fff1e 	bx	lr

0000054c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 54c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 550:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 554:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 558:	da000005 	ble	574 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 55c:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
 560:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 564:	e4d1c001 	ldrb	ip, [r1], #1
 568:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 56c:	e1530002 	cmp	r3, r2
 570:	1afffffb 	bne	564 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 574:	e28bd000 	add	sp, fp, #0
 578:	e8bd0800 	pop	{fp}
 57c:	e12fff1e 	bx	lr

00000580 <fork>:
 580:	e92d4000 	push	{lr}
 584:	e92d0008 	push	{r3}
 588:	e92d0004 	push	{r2}
 58c:	e92d0002 	push	{r1}
 590:	e92d0001 	push	{r0}
 594:	e3a00001 	mov	r0, #1
 598:	ef000040 	svc	0x00000040
 59c:	e8bd0002 	pop	{r1}
 5a0:	e8bd0002 	pop	{r1}
 5a4:	e8bd0004 	pop	{r2}
 5a8:	e8bd0008 	pop	{r3}
 5ac:	e8bd4000 	pop	{lr}
 5b0:	e12fff1e 	bx	lr

000005b4 <exit>:
 5b4:	e92d4000 	push	{lr}
 5b8:	e92d0008 	push	{r3}
 5bc:	e92d0004 	push	{r2}
 5c0:	e92d0002 	push	{r1}
 5c4:	e92d0001 	push	{r0}
 5c8:	e3a00002 	mov	r0, #2
 5cc:	ef000040 	svc	0x00000040
 5d0:	e8bd0002 	pop	{r1}
 5d4:	e8bd0002 	pop	{r1}
 5d8:	e8bd0004 	pop	{r2}
 5dc:	e8bd0008 	pop	{r3}
 5e0:	e8bd4000 	pop	{lr}
 5e4:	e12fff1e 	bx	lr

000005e8 <wait>:
 5e8:	e92d4000 	push	{lr}
 5ec:	e92d0008 	push	{r3}
 5f0:	e92d0004 	push	{r2}
 5f4:	e92d0002 	push	{r1}
 5f8:	e92d0001 	push	{r0}
 5fc:	e3a00003 	mov	r0, #3
 600:	ef000040 	svc	0x00000040
 604:	e8bd0002 	pop	{r1}
 608:	e8bd0002 	pop	{r1}
 60c:	e8bd0004 	pop	{r2}
 610:	e8bd0008 	pop	{r3}
 614:	e8bd4000 	pop	{lr}
 618:	e12fff1e 	bx	lr

0000061c <pipe>:
 61c:	e92d4000 	push	{lr}
 620:	e92d0008 	push	{r3}
 624:	e92d0004 	push	{r2}
 628:	e92d0002 	push	{r1}
 62c:	e92d0001 	push	{r0}
 630:	e3a00004 	mov	r0, #4
 634:	ef000040 	svc	0x00000040
 638:	e8bd0002 	pop	{r1}
 63c:	e8bd0002 	pop	{r1}
 640:	e8bd0004 	pop	{r2}
 644:	e8bd0008 	pop	{r3}
 648:	e8bd4000 	pop	{lr}
 64c:	e12fff1e 	bx	lr

00000650 <read>:
 650:	e92d4000 	push	{lr}
 654:	e92d0008 	push	{r3}
 658:	e92d0004 	push	{r2}
 65c:	e92d0002 	push	{r1}
 660:	e92d0001 	push	{r0}
 664:	e3a00005 	mov	r0, #5
 668:	ef000040 	svc	0x00000040
 66c:	e8bd0002 	pop	{r1}
 670:	e8bd0002 	pop	{r1}
 674:	e8bd0004 	pop	{r2}
 678:	e8bd0008 	pop	{r3}
 67c:	e8bd4000 	pop	{lr}
 680:	e12fff1e 	bx	lr

00000684 <write>:
 684:	e92d4000 	push	{lr}
 688:	e92d0008 	push	{r3}
 68c:	e92d0004 	push	{r2}
 690:	e92d0002 	push	{r1}
 694:	e92d0001 	push	{r0}
 698:	e3a00010 	mov	r0, #16
 69c:	ef000040 	svc	0x00000040
 6a0:	e8bd0002 	pop	{r1}
 6a4:	e8bd0002 	pop	{r1}
 6a8:	e8bd0004 	pop	{r2}
 6ac:	e8bd0008 	pop	{r3}
 6b0:	e8bd4000 	pop	{lr}
 6b4:	e12fff1e 	bx	lr

000006b8 <close>:
 6b8:	e92d4000 	push	{lr}
 6bc:	e92d0008 	push	{r3}
 6c0:	e92d0004 	push	{r2}
 6c4:	e92d0002 	push	{r1}
 6c8:	e92d0001 	push	{r0}
 6cc:	e3a00015 	mov	r0, #21
 6d0:	ef000040 	svc	0x00000040
 6d4:	e8bd0002 	pop	{r1}
 6d8:	e8bd0002 	pop	{r1}
 6dc:	e8bd0004 	pop	{r2}
 6e0:	e8bd0008 	pop	{r3}
 6e4:	e8bd4000 	pop	{lr}
 6e8:	e12fff1e 	bx	lr

000006ec <kill>:
 6ec:	e92d4000 	push	{lr}
 6f0:	e92d0008 	push	{r3}
 6f4:	e92d0004 	push	{r2}
 6f8:	e92d0002 	push	{r1}
 6fc:	e92d0001 	push	{r0}
 700:	e3a00006 	mov	r0, #6
 704:	ef000040 	svc	0x00000040
 708:	e8bd0002 	pop	{r1}
 70c:	e8bd0002 	pop	{r1}
 710:	e8bd0004 	pop	{r2}
 714:	e8bd0008 	pop	{r3}
 718:	e8bd4000 	pop	{lr}
 71c:	e12fff1e 	bx	lr

00000720 <exec>:
 720:	e92d4000 	push	{lr}
 724:	e92d0008 	push	{r3}
 728:	e92d0004 	push	{r2}
 72c:	e92d0002 	push	{r1}
 730:	e92d0001 	push	{r0}
 734:	e3a00007 	mov	r0, #7
 738:	ef000040 	svc	0x00000040
 73c:	e8bd0002 	pop	{r1}
 740:	e8bd0002 	pop	{r1}
 744:	e8bd0004 	pop	{r2}
 748:	e8bd0008 	pop	{r3}
 74c:	e8bd4000 	pop	{lr}
 750:	e12fff1e 	bx	lr

00000754 <open>:
 754:	e92d4000 	push	{lr}
 758:	e92d0008 	push	{r3}
 75c:	e92d0004 	push	{r2}
 760:	e92d0002 	push	{r1}
 764:	e92d0001 	push	{r0}
 768:	e3a0000f 	mov	r0, #15
 76c:	ef000040 	svc	0x00000040
 770:	e8bd0002 	pop	{r1}
 774:	e8bd0002 	pop	{r1}
 778:	e8bd0004 	pop	{r2}
 77c:	e8bd0008 	pop	{r3}
 780:	e8bd4000 	pop	{lr}
 784:	e12fff1e 	bx	lr

00000788 <mknod>:
 788:	e92d4000 	push	{lr}
 78c:	e92d0008 	push	{r3}
 790:	e92d0004 	push	{r2}
 794:	e92d0002 	push	{r1}
 798:	e92d0001 	push	{r0}
 79c:	e3a00011 	mov	r0, #17
 7a0:	ef000040 	svc	0x00000040
 7a4:	e8bd0002 	pop	{r1}
 7a8:	e8bd0002 	pop	{r1}
 7ac:	e8bd0004 	pop	{r2}
 7b0:	e8bd0008 	pop	{r3}
 7b4:	e8bd4000 	pop	{lr}
 7b8:	e12fff1e 	bx	lr

000007bc <unlink>:
 7bc:	e92d4000 	push	{lr}
 7c0:	e92d0008 	push	{r3}
 7c4:	e92d0004 	push	{r2}
 7c8:	e92d0002 	push	{r1}
 7cc:	e92d0001 	push	{r0}
 7d0:	e3a00012 	mov	r0, #18
 7d4:	ef000040 	svc	0x00000040
 7d8:	e8bd0002 	pop	{r1}
 7dc:	e8bd0002 	pop	{r1}
 7e0:	e8bd0004 	pop	{r2}
 7e4:	e8bd0008 	pop	{r3}
 7e8:	e8bd4000 	pop	{lr}
 7ec:	e12fff1e 	bx	lr

000007f0 <fstat>:
 7f0:	e92d4000 	push	{lr}
 7f4:	e92d0008 	push	{r3}
 7f8:	e92d0004 	push	{r2}
 7fc:	e92d0002 	push	{r1}
 800:	e92d0001 	push	{r0}
 804:	e3a00008 	mov	r0, #8
 808:	ef000040 	svc	0x00000040
 80c:	e8bd0002 	pop	{r1}
 810:	e8bd0002 	pop	{r1}
 814:	e8bd0004 	pop	{r2}
 818:	e8bd0008 	pop	{r3}
 81c:	e8bd4000 	pop	{lr}
 820:	e12fff1e 	bx	lr

00000824 <link>:
 824:	e92d4000 	push	{lr}
 828:	e92d0008 	push	{r3}
 82c:	e92d0004 	push	{r2}
 830:	e92d0002 	push	{r1}
 834:	e92d0001 	push	{r0}
 838:	e3a00013 	mov	r0, #19
 83c:	ef000040 	svc	0x00000040
 840:	e8bd0002 	pop	{r1}
 844:	e8bd0002 	pop	{r1}
 848:	e8bd0004 	pop	{r2}
 84c:	e8bd0008 	pop	{r3}
 850:	e8bd4000 	pop	{lr}
 854:	e12fff1e 	bx	lr

00000858 <mkdir>:
 858:	e92d4000 	push	{lr}
 85c:	e92d0008 	push	{r3}
 860:	e92d0004 	push	{r2}
 864:	e92d0002 	push	{r1}
 868:	e92d0001 	push	{r0}
 86c:	e3a00014 	mov	r0, #20
 870:	ef000040 	svc	0x00000040
 874:	e8bd0002 	pop	{r1}
 878:	e8bd0002 	pop	{r1}
 87c:	e8bd0004 	pop	{r2}
 880:	e8bd0008 	pop	{r3}
 884:	e8bd4000 	pop	{lr}
 888:	e12fff1e 	bx	lr

0000088c <chdir>:
 88c:	e92d4000 	push	{lr}
 890:	e92d0008 	push	{r3}
 894:	e92d0004 	push	{r2}
 898:	e92d0002 	push	{r1}
 89c:	e92d0001 	push	{r0}
 8a0:	e3a00009 	mov	r0, #9
 8a4:	ef000040 	svc	0x00000040
 8a8:	e8bd0002 	pop	{r1}
 8ac:	e8bd0002 	pop	{r1}
 8b0:	e8bd0004 	pop	{r2}
 8b4:	e8bd0008 	pop	{r3}
 8b8:	e8bd4000 	pop	{lr}
 8bc:	e12fff1e 	bx	lr

000008c0 <dup>:
 8c0:	e92d4000 	push	{lr}
 8c4:	e92d0008 	push	{r3}
 8c8:	e92d0004 	push	{r2}
 8cc:	e92d0002 	push	{r1}
 8d0:	e92d0001 	push	{r0}
 8d4:	e3a0000a 	mov	r0, #10
 8d8:	ef000040 	svc	0x00000040
 8dc:	e8bd0002 	pop	{r1}
 8e0:	e8bd0002 	pop	{r1}
 8e4:	e8bd0004 	pop	{r2}
 8e8:	e8bd0008 	pop	{r3}
 8ec:	e8bd4000 	pop	{lr}
 8f0:	e12fff1e 	bx	lr

000008f4 <getpid>:
 8f4:	e92d4000 	push	{lr}
 8f8:	e92d0008 	push	{r3}
 8fc:	e92d0004 	push	{r2}
 900:	e92d0002 	push	{r1}
 904:	e92d0001 	push	{r0}
 908:	e3a0000b 	mov	r0, #11
 90c:	ef000040 	svc	0x00000040
 910:	e8bd0002 	pop	{r1}
 914:	e8bd0002 	pop	{r1}
 918:	e8bd0004 	pop	{r2}
 91c:	e8bd0008 	pop	{r3}
 920:	e8bd4000 	pop	{lr}
 924:	e12fff1e 	bx	lr

00000928 <sbrk>:
 928:	e92d4000 	push	{lr}
 92c:	e92d0008 	push	{r3}
 930:	e92d0004 	push	{r2}
 934:	e92d0002 	push	{r1}
 938:	e92d0001 	push	{r0}
 93c:	e3a0000c 	mov	r0, #12
 940:	ef000040 	svc	0x00000040
 944:	e8bd0002 	pop	{r1}
 948:	e8bd0002 	pop	{r1}
 94c:	e8bd0004 	pop	{r2}
 950:	e8bd0008 	pop	{r3}
 954:	e8bd4000 	pop	{lr}
 958:	e12fff1e 	bx	lr

0000095c <sleep>:
 95c:	e92d4000 	push	{lr}
 960:	e92d0008 	push	{r3}
 964:	e92d0004 	push	{r2}
 968:	e92d0002 	push	{r1}
 96c:	e92d0001 	push	{r0}
 970:	e3a0000d 	mov	r0, #13
 974:	ef000040 	svc	0x00000040
 978:	e8bd0002 	pop	{r1}
 97c:	e8bd0002 	pop	{r1}
 980:	e8bd0004 	pop	{r2}
 984:	e8bd0008 	pop	{r3}
 988:	e8bd4000 	pop	{lr}
 98c:	e12fff1e 	bx	lr

00000990 <uptime>:
 990:	e92d4000 	push	{lr}
 994:	e92d0008 	push	{r3}
 998:	e92d0004 	push	{r2}
 99c:	e92d0002 	push	{r1}
 9a0:	e92d0001 	push	{r0}
 9a4:	e3a0000e 	mov	r0, #14
 9a8:	ef000040 	svc	0x00000040
 9ac:	e8bd0002 	pop	{r1}
 9b0:	e8bd0002 	pop	{r1}
 9b4:	e8bd0004 	pop	{r2}
 9b8:	e8bd0008 	pop	{r3}
 9bc:	e8bd4000 	pop	{lr}
 9c0:	e12fff1e 	bx	lr

000009c4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 9c4:	e92d4800 	push	{fp, lr}
 9c8:	e28db004 	add	fp, sp, #4
 9cc:	e24b3004 	sub	r3, fp, #4
 9d0:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
 9d4:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 9d8:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
 9dc:	e1a01003 	mov	r1, r3
 9e0:	ebffff27 	bl	684 <write>
}
 9e4:	e24bd004 	sub	sp, fp, #4
 9e8:	e8bd8800 	pop	{fp, pc}

000009ec <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 9ec:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 9f0:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 9f4:	e1a00fa1 	lsr	r0, r1, #31
 9f8:	e3530000 	cmp	r3, #0
 9fc:	03a03000 	moveq	r3, #0
 a00:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a04:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 a08:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a0c:	e24dd014 	sub	sp, sp, #20
 a10:	e59f909c 	ldr	r9, [pc, #156]	; ab4 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 a14:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 a18:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 a1c:	e3a0a000 	mov	sl, #0
 a20:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 a24:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 a28:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
 a2c:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 a30:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 a34:	e1a0e031 	lsr	lr, r1, r0
 a38:	e20ee001 	and	lr, lr, #1
 a3c:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
 a40:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
 a44:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 a48:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 a4c:	e2500001 	subs	r0, r0, #1
 a50:	2afffff7 	bcs	a34 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a54:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
 a58:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a5c:	e0601001 	rsb	r1, r0, r1
 a60:	e28a5001 	add	r5, sl, #1
 a64:	e7d91001 	ldrb	r1, [r9, r1]
 a68:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
 a6c:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a70:	11a0a005 	movne	sl, r5
 a74:	1affffeb 	bne	a28 <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
 a78:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
 a7c:	124b2024 	subne	r2, fp, #36	; 0x24
 a80:	10823005 	addne	r3, r2, r5
 a84:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
 a88:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
 a8c:	13a0202d 	movne	r2, #45	; 0x2d
 a90:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 a94:	e7d61005 	ldrb	r1, [r6, r5]
 a98:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 a9c:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
 aa0:	ebffffc7 	bl	9c4 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 aa4:	e3750001 	cmn	r5, #1
 aa8:	1afffff9 	bne	a94 <printint+0xa8>
    putc(fd, buf[i]);
}
 aac:	e24bd020 	sub	sp, fp, #32
 ab0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 ab4:	00000e20 	.word	0x00000e20

00000ab8 <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 ab8:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 abc:	e92d0830 	push	{r4, r5, fp}
 ac0:	e1a02000 	mov	r2, r0
 ac4:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 ac8:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 acc:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 ad0:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 ad4:	e1a04c32 	lsr	r4, r2, ip
 ad8:	e2044001 	and	r4, r4, #1
 adc:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
 ae0:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
 ae4:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
 ae8:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 aec:	e25cc001 	subs	ip, ip, #1
 af0:	2afffff7 	bcs	ad4 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 af4:	e24bd008 	sub	sp, fp, #8
 af8:	e8bd0830 	pop	{r4, r5, fp}
 afc:	e12fff1e 	bx	lr

00000b00 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b00:	e92d000e 	push	{r1, r2, r3}
 b04:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 b08:	e28db020 	add	fp, sp, #32
 b0c:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b10:	e59b4004 	ldr	r4, [fp, #4]
 b14:	e5d48000 	ldrb	r8, [r4]
 b18:	e3580000 	cmp	r8, #0
 b1c:	0a000027 	beq	bc0 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 b20:	e59f712c 	ldr	r7, [pc, #300]	; c54 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 b24:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 b28:	e3a0a000 	mov	sl, #0
 b2c:	ea000008 	b	b54 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 b30:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
 b34:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 b38:	0a000002 	beq	b48 <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
 b3c:	e1a00005 	mov	r0, r5
 b40:	e1a01008 	mov	r1, r8
 b44:	ebffff9e 	bl	9c4 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b48:	e5f48001 	ldrb	r8, [r4, #1]!
 b4c:	e3580000 	cmp	r8, #0
 b50:	0a00001a 	beq	bc0 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
 b54:	e35a0000 	cmp	sl, #0
 b58:	0afffff4 	beq	b30 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 b5c:	e35a0025 	cmp	sl, #37	; 0x25
 b60:	1afffff8 	bne	b48 <printf+0x48>
      if(c == 'd'){
 b64:	e3580064 	cmp	r8, #100	; 0x64
 b68:	0a00002c 	beq	c20 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b6c:	e3580078 	cmp	r8, #120	; 0x78
 b70:	13580070 	cmpne	r8, #112	; 0x70
 b74:	13a09000 	movne	r9, #0
 b78:	03a09001 	moveq	r9, #1
 b7c:	0a000013 	beq	bd0 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b80:	e3580073 	cmp	r8, #115	; 0x73
 b84:	0a000018 	beq	bec <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b88:	e3580063 	cmp	r8, #99	; 0x63
 b8c:	0a00002a 	beq	c3c <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b90:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
 b94:	e1a0100a 	mov	r1, sl
 b98:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b9c:	0a000002 	beq	bac <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 ba0:	ebffff87 	bl	9c4 <putc>
        putc(fd, c);
 ba4:	e1a00005 	mov	r0, r5
 ba8:	e1a01008 	mov	r1, r8
 bac:	ebffff84 	bl	9c4 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 bb0:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 bb4:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 bb8:	e3580000 	cmp	r8, #0
 bbc:	1affffe4 	bne	b54 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 bc0:	e24bd020 	sub	sp, fp, #32
 bc4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 bc8:	e28dd00c 	add	sp, sp, #12
 bcc:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 bd0:	e1a00005 	mov	r0, r5
 bd4:	e4961004 	ldr	r1, [r6], #4
 bd8:	e3a02010 	mov	r2, #16
 bdc:	e3a03000 	mov	r3, #0
 be0:	ebffff81 	bl	9ec <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 be4:	e3a0a000 	mov	sl, #0
 be8:	eaffffd6 	b	b48 <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 bec:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
 bf0:	e3580000 	cmp	r8, #0
 bf4:	01a08007 	moveq	r8, r7
        while(*s != 0){
 bf8:	e5d81000 	ldrb	r1, [r8]
 bfc:	e3510000 	cmp	r1, #0
 c00:	0a000004 	beq	c18 <printf+0x118>
          putc(fd, *s);
 c04:	e1a00005 	mov	r0, r5
 c08:	ebffff6d 	bl	9c4 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 c0c:	e5f81001 	ldrb	r1, [r8, #1]!
 c10:	e3510000 	cmp	r1, #0
 c14:	1afffffa 	bne	c04 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 c18:	e1a0a001 	mov	sl, r1
 c1c:	eaffffc9 	b	b48 <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 c20:	e1a00005 	mov	r0, r5
 c24:	e4961004 	ldr	r1, [r6], #4
 c28:	e3a0200a 	mov	r2, #10
 c2c:	e3a03001 	mov	r3, #1
 c30:	ebffff6d 	bl	9ec <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 c34:	e3a0a000 	mov	sl, #0
 c38:	eaffffc2 	b	b48 <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 c3c:	e4961004 	ldr	r1, [r6], #4
 c40:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 c44:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 c48:	e6ef1071 	uxtb	r1, r1
 c4c:	ebffff5c 	bl	9c4 <putc>
 c50:	eaffffbc 	b	b48 <printf+0x48>
 c54:	00000e34 	.word	0x00000e34

00000c58 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c58:	e59f3098 	ldr	r3, [pc, #152]	; cf8 <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
 c5c:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
 c60:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c64:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
 c68:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c6c:	e152000c 	cmp	r2, ip
 c70:	e5921000 	ldr	r1, [r2]
 c74:	2a000001 	bcs	c80 <free+0x28>
 c78:	e15c0001 	cmp	ip, r1
 c7c:	3a000007 	bcc	ca0 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c80:	e1520001 	cmp	r2, r1
 c84:	3a000003 	bcc	c98 <free+0x40>
 c88:	e152000c 	cmp	r2, ip
 c8c:	3a000003 	bcc	ca0 <free+0x48>
 c90:	e15c0001 	cmp	ip, r1
 c94:	3a000001 	bcc	ca0 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
 c98:	e1a02001 	mov	r2, r1
 c9c:	eafffff2 	b	c6c <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 ca0:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 ca4:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 ca8:	e08c5184 	add	r5, ip, r4, lsl #3
 cac:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
 cb0:	05911004 	ldreq	r1, [r1, #4]
 cb4:	00814004 	addeq	r4, r1, r4
 cb8:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 cbc:	05921000 	ldreq	r1, [r2]
 cc0:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
 cc4:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
 cc8:	e5921004 	ldr	r1, [r2, #4]
 ccc:	e0824181 	add	r4, r2, r1, lsl #3
 cd0:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 cd4:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 cd8:	0510c004 	ldreq	ip, [r0, #-4]
 cdc:	008c1001 	addeq	r1, ip, r1
 ce0:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
 ce4:	05101008 	ldreq	r1, [r0, #-8]
 ce8:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
 cec:	e24bd008 	sub	sp, fp, #8
 cf0:	e8bd0830 	pop	{r4, r5, fp}
 cf4:	e12fff1e 	bx	lr
 cf8:	00000e3c 	.word	0x00000e3c

00000cfc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 cfc:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d00:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
 d04:	e59f50d4 	ldr	r5, [pc, #212]	; de0 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d08:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
 d0c:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 d10:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d14:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 d18:	e3530000 	cmp	r3, #0
 d1c:	0a00002b 	beq	dd0 <malloc+0xd4>
 d20:	e5930000 	ldr	r0, [r3]
 d24:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 d28:	e1520004 	cmp	r2, r4
 d2c:	2a00001b 	bcs	da0 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 d30:	e59f80ac 	ldr	r8, [pc, #172]	; de4 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 d34:	e1a07184 	lsl	r7, r4, #3
 d38:	ea000003 	b	d4c <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d3c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 d40:	e5902004 	ldr	r2, [r0, #4]
 d44:	e1540002 	cmp	r4, r2
 d48:	9a000014 	bls	da0 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d4c:	e5952000 	ldr	r2, [r5]
 d50:	e1a03000 	mov	r3, r0
 d54:	e1500002 	cmp	r0, r2
 d58:	1afffff7 	bne	d3c <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 d5c:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 d60:	81a00007 	movhi	r0, r7
 d64:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 d68:	81a06004 	movhi	r6, r4
 d6c:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 d70:	ebfffeec 	bl	928 <sbrk>
 d74:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 d78:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 d7c:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 d80:	0a000010 	beq	dc8 <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 d84:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
 d88:	ebffffb2 	bl	c58 <free>
  return freep;
 d8c:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 d90:	e3530000 	cmp	r3, #0
 d94:	1affffe8 	bne	d3c <malloc+0x40>
        return 0;
 d98:	e1a00003 	mov	r0, r3
  }
}
 d9c:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 da0:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 da4:	10642002 	rsbne	r2, r4, r2
 da8:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 dac:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 db0:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 db4:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 db8:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
 dbc:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
 dc0:	e2800008 	add	r0, r0, #8
 dc4:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 dc8:	e3a00000 	mov	r0, #0
 dcc:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 dd0:	e2850004 	add	r0, r5, #4
 dd4:	e5850000 	str	r0, [r5]
    base.s.size = 0;
 dd8:	e9850009 	stmib	r5, {r0, r3}
 ddc:	eaffffd3 	b	d30 <malloc+0x34>
 de0:	00000e3c 	.word	0x00000e3c
 de4:	00000fff 	.word	0x00000fff
