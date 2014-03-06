
_usertests:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	e92d4800 	push	{fp, lr}
  printf(1, "usertests starting\n");
       4:	e3a00001 	mov	r0, #1
  return randstate;
}

int
main(int argc, char *argv[])
{
       8:	e28db004 	add	fp, sp, #4
  printf(1, "usertests starting\n");
       c:	e59f10b0 	ldr	r1, [pc, #176]	; c4 <main+0xc4>
      10:	eb000dcb 	bl	3744 <printf>

  if(open("usertests.ran", 0) >= 0){
      14:	e59f00ac 	ldr	r0, [pc, #172]	; c8 <main+0xc8>
      18:	e3a01000 	mov	r1, #0
      1c:	eb000cdd 	bl	3398 <open>
      20:	e3500000 	cmp	r0, #0
      24:	ba000003 	blt	38 <main+0x38>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      28:	e3a00001 	mov	r0, #1
      2c:	e59f1098 	ldr	r1, [pc, #152]	; cc <main+0xcc>
      30:	eb000dc3 	bl	3744 <printf>
    exit();
      34:	eb000c6f 	bl	31f8 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      38:	e3a01c02 	mov	r1, #512	; 0x200
      3c:	e59f0084 	ldr	r0, [pc, #132]	; c8 <main+0xc8>
      40:	eb000cd4 	bl	3398 <open>
      44:	eb000cac 	bl	32fc <close>

  bigargtest();
      48:	eb000af2 	bl	2c18 <bigargtest>
  bigwrite();
      4c:	eb000798 	bl	1eb4 <bigwrite>
  bigargtest();
      50:	eb000af0 	bl	2c18 <bigargtest>
  bsstest();
      54:	eb000ad1 	bl	2ba0 <bsstest>
  sbrktest();
      58:	eb0009b2 	bl	2728 <sbrktest>
  validatetest();
      5c:	eb000aa6 	bl	2afc <validatetest>

  opentest();
      60:	eb00001a 	bl	d0 <opentest>
  writetest();
      64:	eb00003c 	bl	15c <writetest>
  writetest1();
      68:	eb0000a5 	bl	304 <writetest1>
  createtest();
      6c:	eb000108 	bl	494 <createtest>

  mem();
      70:	eb000246 	bl	990 <mem>
  pipe1();
      74:	eb000175 	bl	650 <pipe1>
  preempt();
      78:	eb0001db 	bl	7ec <preempt>
  exitwait();
      7c:	eb000226 	bl	91c <exitwait>

  rmdot();
      80:	eb000878 	bl	2268 <rmdot>
  fourteen();
      84:	eb00082d 	bl	2140 <fourteen>
  bigfile();
      88:	eb0007c2 	bl	1f98 <bigfile>
  subdir();
      8c:	eb000604 	bl	18a4 <subdir>
  concreate();
      90:	eb0004b2 	bl	1360 <concreate>
  linkunlink();
      94:	eb00057a 	bl	1684 <linkunlink>
  linktest();
      98:	eb00043a 	bl	1188 <linktest>
  unlinkread();
      9c:	eb0003db 	bl	1010 <unlinkread>
  createdelete();
      a0:	eb000347 	bl	dc4 <createdelete>
  twofiles();
      a4:	eb0002cf 	bl	be8 <twofiles>
  sharedfd();
      a8:	eb000267 	bl	a4c <sharedfd>
  dirfile();
      ac:	eb0008c5 	bl	23c8 <dirfile>
  iref();
      b0:	eb000936 	bl	2590 <iref>
  forktest();
      b4:	eb00096f 	bl	2678 <forktest>
  bigdir(); // slow
      b8:	eb0005ad 	bl	1774 <bigdir>

  exectest();
      bc:	eb000150 	bl	604 <exectest>

  exit();
      c0:	eb000c4c 	bl	31f8 <exit>
      c4:	000051c4 	.word	0x000051c4
      c8:	000051d8 	.word	0x000051d8
      cc:	000051e8 	.word	0x000051e8

000000d0 <opentest>:

// simple file system tests

void
opentest(void)
{
      d0:	e92d4818 	push	{r3, r4, fp, lr}
      d4:	e28db00c 	add	fp, sp, #12
  int fd;

  printf(stdout, "open test\n");
      d8:	e59f4060 	ldr	r4, [pc, #96]	; 140 <opentest+0x70>
      dc:	e59f1060 	ldr	r1, [pc, #96]	; 144 <opentest+0x74>
      e0:	e5940000 	ldr	r0, [r4]
      e4:	eb000d96 	bl	3744 <printf>
  fd = open("echo", 0);
      e8:	e59f0058 	ldr	r0, [pc, #88]	; 148 <opentest+0x78>
      ec:	e3a01000 	mov	r1, #0
      f0:	eb000ca8 	bl	3398 <open>
  if(fd < 0){
      f4:	e3500000 	cmp	r0, #0
      f8:	ba000009 	blt	124 <opentest+0x54>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
      fc:	eb000c7e 	bl	32fc <close>
  fd = open("doesnotexist", 0);
     100:	e59f0044 	ldr	r0, [pc, #68]	; 14c <opentest+0x7c>
     104:	e3a01000 	mov	r1, #0
     108:	eb000ca2 	bl	3398 <open>
  if(fd >= 0){
     10c:	e3500000 	cmp	r0, #0
    printf(stdout, "open doesnotexist succeeded!\n");
     110:	e5940000 	ldr	r0, [r4]
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
     114:	aa000006 	bge	134 <opentest+0x64>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     118:	e59f1030 	ldr	r1, [pc, #48]	; 150 <opentest+0x80>
}
     11c:	e8bd4818 	pop	{r3, r4, fp, lr}
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     120:	ea000d87 	b	3744 <printf>
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     124:	e5940000 	ldr	r0, [r4]
     128:	e59f1024 	ldr	r1, [pc, #36]	; 154 <opentest+0x84>
     12c:	eb000d84 	bl	3744 <printf>
    exit();
     130:	eb000c30 	bl	31f8 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     134:	e59f101c 	ldr	r1, [pc, #28]	; 158 <opentest+0x88>
     138:	eb000d81 	bl	3744 <printf>
    exit();
     13c:	eb000c2d 	bl	31f8 <exit>
     140:	00005244 	.word	0x00005244
     144:	00003a2c 	.word	0x00003a2c
     148:	00003a38 	.word	0x00003a38
     14c:	00003a54 	.word	0x00003a54
     150:	00003a84 	.word	0x00003a84
     154:	00003a40 	.word	0x00003a40
     158:	00003a64 	.word	0x00003a64

0000015c <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     15c:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
     160:	e28db014 	add	fp, sp, #20
  int fd;
  int i;

  printf(stdout, "small file test\n");
     164:	e59f6150 	ldr	r6, [pc, #336]	; 2bc <writetest+0x160>
     168:	e59f1150 	ldr	r1, [pc, #336]	; 2c0 <writetest+0x164>
     16c:	e5960000 	ldr	r0, [r6]
     170:	eb000d73 	bl	3744 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     174:	e59f0148 	ldr	r0, [pc, #328]	; 2c4 <writetest+0x168>
     178:	e59f1148 	ldr	r1, [pc, #328]	; 2c8 <writetest+0x16c>
     17c:	eb000c85 	bl	3398 <open>
  if(fd >= 0){
     180:	e2505000 	subs	r5, r0, #0
    printf(stdout, "creat small succeeded; ok\n");
     184:	e5960000 	ldr	r0, [r6]
  int fd;
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
     188:	ba000048 	blt	2b0 <writetest+0x154>
    printf(stdout, "creat small succeeded; ok\n");
     18c:	e59f1138 	ldr	r1, [pc, #312]	; 2cc <writetest+0x170>
     190:	eb000d6b 	bl	3744 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     194:	e3a04000 	mov	r4, #0
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     198:	e3a0200a 	mov	r2, #10
     19c:	e1a00005 	mov	r0, r5
     1a0:	e59f1128 	ldr	r1, [pc, #296]	; 2d0 <writetest+0x174>
     1a4:	eb000c47 	bl	32c8 <write>
     1a8:	e350000a 	cmp	r0, #10
     1ac:	e1a02000 	mov	r2, r0
     1b0:	1a000028 	bne	258 <writetest+0xfc>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1b4:	e1a00005 	mov	r0, r5
     1b8:	e59f1114 	ldr	r1, [pc, #276]	; 2d4 <writetest+0x178>
     1bc:	eb000c41 	bl	32c8 <write>
     1c0:	e350000a 	cmp	r0, #10
     1c4:	1a000028 	bne	26c <writetest+0x110>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     1c8:	e2844001 	add	r4, r4, #1
     1cc:	e3540064 	cmp	r4, #100	; 0x64
     1d0:	1afffff0 	bne	198 <writetest+0x3c>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     1d4:	e59f10fc 	ldr	r1, [pc, #252]	; 2d8 <writetest+0x17c>
     1d8:	e5960000 	ldr	r0, [r6]
     1dc:	eb000d58 	bl	3744 <printf>
  close(fd);
     1e0:	e1a00005 	mov	r0, r5
     1e4:	eb000c44 	bl	32fc <close>
  fd = open("small", O_RDONLY);
     1e8:	e59f00d4 	ldr	r0, [pc, #212]	; 2c4 <writetest+0x168>
     1ec:	e3a01000 	mov	r1, #0
     1f0:	eb000c68 	bl	3398 <open>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     1f4:	e59f40c0 	ldr	r4, [pc, #192]	; 2bc <writetest+0x160>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
     1f8:	e2505000 	subs	r5, r0, #0
     1fc:	ba00001f 	blt	280 <writetest+0x124>
    printf(stdout, "open small succeeded ok\n");
     200:	e59f10d4 	ldr	r1, [pc, #212]	; 2dc <writetest+0x180>
     204:	e5940000 	ldr	r0, [r4]
     208:	eb000d4d 	bl	3744 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     20c:	e1a00005 	mov	r0, r5
     210:	e59f10c8 	ldr	r1, [pc, #200]	; 2e0 <writetest+0x184>
     214:	e3a02e7d 	mov	r2, #2000	; 0x7d0
     218:	eb000c1d 	bl	3294 <read>
  if(i == 2000){
     21c:	e3500e7d 	cmp	r0, #2000	; 0x7d0
     220:	1a00001a 	bne	290 <writetest+0x134>
    printf(stdout, "read succeeded ok\n");
     224:	e59f10b8 	ldr	r1, [pc, #184]	; 2e4 <writetest+0x188>
     228:	e5940000 	ldr	r0, [r4]
     22c:	eb000d44 	bl	3744 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     230:	e1a00005 	mov	r0, r5
     234:	eb000c30 	bl	32fc <close>

  if(unlink("small") < 0){
     238:	e59f0084 	ldr	r0, [pc, #132]	; 2c4 <writetest+0x168>
     23c:	eb000c6f 	bl	3400 <unlink>
     240:	e3500000 	cmp	r0, #0
     244:	ba000015 	blt	2a0 <writetest+0x144>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     248:	e5940000 	ldr	r0, [r4]
     24c:	e59f1094 	ldr	r1, [pc, #148]	; 2e8 <writetest+0x18c>
}
     250:	e8bd4878 	pop	{r3, r4, r5, r6, fp, lr}

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     254:	ea000d3a 	b	3744 <printf>
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     258:	e5960000 	ldr	r0, [r6]
     25c:	e59f1088 	ldr	r1, [pc, #136]	; 2ec <writetest+0x190>
     260:	e1a02004 	mov	r2, r4
     264:	eb000d36 	bl	3744 <printf>
      exit();
     268:	eb000be2 	bl	31f8 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     26c:	e5960000 	ldr	r0, [r6]
     270:	e59f1078 	ldr	r1, [pc, #120]	; 2f0 <writetest+0x194>
     274:	e1a02004 	mov	r2, r4
     278:	eb000d31 	bl	3744 <printf>
      exit();
     27c:	eb000bdd 	bl	31f8 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     280:	e5940000 	ldr	r0, [r4]
     284:	e59f1068 	ldr	r1, [pc, #104]	; 2f4 <writetest+0x198>
     288:	eb000d2d 	bl	3744 <printf>
    exit();
     28c:	eb000bd9 	bl	31f8 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     290:	e5940000 	ldr	r0, [r4]
     294:	e59f105c 	ldr	r1, [pc, #92]	; 2f8 <writetest+0x19c>
     298:	eb000d29 	bl	3744 <printf>
    exit();
     29c:	eb000bd5 	bl	31f8 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     2a0:	e5940000 	ldr	r0, [r4]
     2a4:	e59f1050 	ldr	r1, [pc, #80]	; 2fc <writetest+0x1a0>
     2a8:	eb000d25 	bl	3744 <printf>
    exit();
     2ac:	eb000bd1 	bl	31f8 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     2b0:	e59f1048 	ldr	r1, [pc, #72]	; 300 <writetest+0x1a4>
     2b4:	eb000d22 	bl	3744 <printf>
    exit();
     2b8:	eb000bce 	bl	31f8 <exit>
     2bc:	00005244 	.word	0x00005244
     2c0:	00003a94 	.word	0x00003a94
     2c4:	00003aa8 	.word	0x00003aa8
     2c8:	00000202 	.word	0x00000202
     2cc:	00003ab0 	.word	0x00003ab0
     2d0:	00003ae8 	.word	0x00003ae8
     2d4:	00003b18 	.word	0x00003b18
     2d8:	00003b48 	.word	0x00003b48
     2dc:	00003b54 	.word	0x00003b54
     2e0:	000079fc 	.word	0x000079fc
     2e4:	00003b8c 	.word	0x00003b8c
     2e8:	00003bc8 	.word	0x00003bc8
     2ec:	00003af4 	.word	0x00003af4
     2f0:	00003b24 	.word	0x00003b24
     2f4:	00003b70 	.word	0x00003b70
     2f8:	00003ba0 	.word	0x00003ba0
     2fc:	00003bb0 	.word	0x00003bb0
     300:	00003acc 	.word	0x00003acc

00000304 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     304:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     308:	e28db014 	add	fp, sp, #20
  int i, fd, n;

  printf(stdout, "big files test\n");
     30c:	e59f714c 	ldr	r7, [pc, #332]	; 460 <writetest1+0x15c>
     310:	e59f114c 	ldr	r1, [pc, #332]	; 464 <writetest1+0x160>
     314:	e5970000 	ldr	r0, [r7]
     318:	eb000d09 	bl	3744 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     31c:	e59f0144 	ldr	r0, [pc, #324]	; 468 <writetest1+0x164>
     320:	e59f1144 	ldr	r1, [pc, #324]	; 46c <writetest1+0x168>
     324:	eb000c1b 	bl	3398 <open>
  if(fd < 0){
     328:	e2505000 	subs	r5, r0, #0
     32c:	ba000044 	blt	444 <writetest1+0x140>
     330:	e59f6138 	ldr	r6, [pc, #312]	; 470 <writetest1+0x16c>
     334:	e3a04000 	mov	r4, #0
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     338:	e1a00005 	mov	r0, r5
     33c:	e59f112c 	ldr	r1, [pc, #300]	; 470 <writetest1+0x16c>
     340:	e3a02c02 	mov	r2, #512	; 0x200
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     344:	e5864000 	str	r4, [r6]
    if(write(fd, buf, 512) != 512){
     348:	eb000bde 	bl	32c8 <write>
     34c:	e3500c02 	cmp	r0, #512	; 0x200
     350:	1a000024 	bne	3e8 <writetest1+0xe4>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     354:	e2844001 	add	r4, r4, #1
     358:	e354008c 	cmp	r4, #140	; 0x8c
     35c:	1afffff5 	bne	338 <writetest1+0x34>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     360:	e1a00005 	mov	r0, r5
     364:	eb000be4 	bl	32fc <close>

  fd = open("big", O_RDONLY);
     368:	e59f00f8 	ldr	r0, [pc, #248]	; 468 <writetest1+0x164>
     36c:	e3a01000 	mov	r1, #0
     370:	eb000c08 	bl	3398 <open>
  if(fd < 0){
     374:	e2505000 	subs	r5, r0, #0
     378:	ba00002d 	blt	434 <writetest1+0x130>
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     37c:	e59f60ec 	ldr	r6, [pc, #236]	; 470 <writetest1+0x16c>
  }

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
     380:	e3a04000 	mov	r4, #0
     384:	ea000005 	b	3a0 <writetest1+0x9c>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     388:	e3520c02 	cmp	r2, #512	; 0x200
     38c:	1a00001f 	bne	410 <writetest1+0x10c>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     390:	e5963000 	ldr	r3, [r6]
     394:	e1530004 	cmp	r3, r4
     398:	1a000017 	bne	3fc <writetest1+0xf8>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     39c:	e2844001 	add	r4, r4, #1
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     3a0:	e3a02c02 	mov	r2, #512	; 0x200
     3a4:	e1a00005 	mov	r0, r5
     3a8:	e59f10c0 	ldr	r1, [pc, #192]	; 470 <writetest1+0x16c>
     3ac:	eb000bb8 	bl	3294 <read>
    if(i == 0){
     3b0:	e2502000 	subs	r2, r0, #0
     3b4:	1afffff3 	bne	388 <writetest1+0x84>
      if(n == MAXFILE - 1){
     3b8:	e354008b 	cmp	r4, #139	; 0x8b
     3bc:	0a000017 	beq	420 <writetest1+0x11c>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     3c0:	e1a00005 	mov	r0, r5
     3c4:	eb000bcc 	bl	32fc <close>
  if(unlink("big") < 0){
     3c8:	e59f0098 	ldr	r0, [pc, #152]	; 468 <writetest1+0x164>
     3cc:	eb000c0b 	bl	3400 <unlink>
     3d0:	e3500000 	cmp	r0, #0
    printf(stdout, "unlink big failed\n");
     3d4:	e5970000 	ldr	r0, [r7]
      exit();
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
     3d8:	ba00001d 	blt	454 <writetest1+0x150>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     3dc:	e59f1090 	ldr	r1, [pc, #144]	; 474 <writetest1+0x170>
}
     3e0:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     3e4:	ea000cd6 	b	3744 <printf>
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     3e8:	e5970000 	ldr	r0, [r7]
     3ec:	e59f1084 	ldr	r1, [pc, #132]	; 478 <writetest1+0x174>
     3f0:	e1a02004 	mov	r2, r4
     3f4:	eb000cd2 	bl	3744 <printf>
      exit();
     3f8:	eb000b7e 	bl	31f8 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     3fc:	e5970000 	ldr	r0, [r7]
     400:	e59f1074 	ldr	r1, [pc, #116]	; 47c <writetest1+0x178>
     404:	e1a02004 	mov	r2, r4
     408:	eb000ccd 	bl	3744 <printf>
             n, ((int*)buf)[0]);
      exit();
     40c:	eb000b79 	bl	31f8 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     410:	e5970000 	ldr	r0, [r7]
     414:	e59f1064 	ldr	r1, [pc, #100]	; 480 <writetest1+0x17c>
     418:	eb000cc9 	bl	3744 <printf>
      exit();
     41c:	eb000b75 	bl	31f8 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     420:	e5970000 	ldr	r0, [r7]
     424:	e59f1058 	ldr	r1, [pc, #88]	; 484 <writetest1+0x180>
     428:	e1a02004 	mov	r2, r4
     42c:	eb000cc4 	bl	3744 <printf>
        exit();
     430:	eb000b70 	bl	31f8 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     434:	e5970000 	ldr	r0, [r7]
     438:	e59f1048 	ldr	r1, [pc, #72]	; 488 <writetest1+0x184>
     43c:	eb000cc0 	bl	3744 <printf>
    exit();
     440:	eb000b6c 	bl	31f8 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     444:	e5970000 	ldr	r0, [r7]
     448:	e59f103c 	ldr	r1, [pc, #60]	; 48c <writetest1+0x188>
     44c:	eb000cbc 	bl	3744 <printf>
    exit();
     450:	eb000b68 	bl	31f8 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     454:	e59f1034 	ldr	r1, [pc, #52]	; 490 <writetest1+0x18c>
     458:	eb000cb9 	bl	3744 <printf>
    exit();
     45c:	eb000b65 	bl	31f8 <exit>
     460:	00005244 	.word	0x00005244
     464:	00003bdc 	.word	0x00003bdc
     468:	00003bec 	.word	0x00003bec
     46c:	00000202 	.word	0x00000202
     470:	000079fc 	.word	0x000079fc
     474:	00003cac 	.word	0x00003cac
     478:	00003c0c 	.word	0x00003c0c
     47c:	00003c78 	.word	0x00003c78
     480:	00003c68 	.word	0x00003c68
     484:	00003c48 	.word	0x00003c48
     488:	00003c2c 	.word	0x00003c2c
     48c:	00003bf0 	.word	0x00003bf0
     490:	00003c98 	.word	0x00003c98

00000494 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     494:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     498:	e28db014 	add	fp, sp, #20
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     49c:	e59f7088 	ldr	r7, [pc, #136]	; 52c <createtest+0x98>

  name[0] = 'a';
     4a0:	e59f5088 	ldr	r5, [pc, #136]	; 530 <createtest+0x9c>
void
createtest(void)
{
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     4a4:	e59f1088 	ldr	r1, [pc, #136]	; 534 <createtest+0xa0>
     4a8:	e5970000 	ldr	r0, [r7]
     4ac:	eb000ca4 	bl	3744 <printf>

  name[0] = 'a';
  name[2] = '\0';
     4b0:	e3a04030 	mov	r4, #48	; 0x30
{
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
     4b4:	e3a03061 	mov	r3, #97	; 0x61
     4b8:	e5c53000 	strb	r3, [r5]
  name[2] = '\0';
     4bc:	e3a03000 	mov	r3, #0
     4c0:	e5c53002 	strb	r3, [r5, #2]
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     4c4:	e59f6064 	ldr	r6, [pc, #100]	; 530 <createtest+0x9c>
     4c8:	e5c54001 	strb	r4, [r5, #1]
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
     4cc:	e2844001 	add	r4, r4, #1

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     4d0:	e59f1060 	ldr	r1, [pc, #96]	; 538 <createtest+0xa4>
     4d4:	e1a00006 	mov	r0, r6
     4d8:	eb000bae 	bl	3398 <open>
    close(fd);
     4dc:	e6ef4074 	uxtb	r4, r4
     4e0:	eb000b85 	bl	32fc <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     4e4:	e3540064 	cmp	r4, #100	; 0x64
     4e8:	1afffff5 	bne	4c4 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     4ec:	e3a03061 	mov	r3, #97	; 0x61
  name[2] = '\0';
     4f0:	e3a04030 	mov	r4, #48	; 0x30
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     4f4:	e5c63000 	strb	r3, [r6]
  name[2] = '\0';
     4f8:	e3a03000 	mov	r3, #0
     4fc:	e5c63002 	strb	r3, [r6, #2]
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     500:	e5c54001 	strb	r4, [r5, #1]
    unlink(name);
     504:	e2844001 	add	r4, r4, #1
     508:	e59f0020 	ldr	r0, [pc, #32]	; 530 <createtest+0x9c>
     50c:	e6ef4074 	uxtb	r4, r4
     510:	eb000bba 	bl	3400 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     514:	e3540064 	cmp	r4, #100	; 0x64
     518:	1afffff8 	bne	500 <createtest+0x6c>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     51c:	e5970000 	ldr	r0, [r7]
     520:	e59f1014 	ldr	r1, [pc, #20]	; 53c <createtest+0xa8>
}
     524:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     528:	ea000c85 	b	3744 <printf>
     52c:	00005244 	.word	0x00005244
     530:	000099fc 	.word	0x000099fc
     534:	00003cbc 	.word	0x00003cbc
     538:	00000202 	.word	0x00000202
     53c:	00003ce4 	.word	0x00003ce4

00000540 <dirtest>:
}

void dirtest(void)
{
     540:	e92d4818 	push	{r3, r4, fp, lr}
     544:	e28db00c 	add	fp, sp, #12
  printf(stdout, "mkdir test\n");
     548:	e59f4094 	ldr	r4, [pc, #148]	; 5e4 <dirtest+0xa4>
     54c:	e59f1094 	ldr	r1, [pc, #148]	; 5e8 <dirtest+0xa8>
     550:	e5940000 	ldr	r0, [r4]
     554:	eb000c7a 	bl	3744 <printf>

  if(mkdir("dir0") < 0){
     558:	e59f008c 	ldr	r0, [pc, #140]	; 5ec <dirtest+0xac>
     55c:	eb000bce 	bl	349c <mkdir>
     560:	e3500000 	cmp	r0, #0
     564:	ba00000f 	blt	5a8 <dirtest+0x68>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     568:	e59f007c 	ldr	r0, [pc, #124]	; 5ec <dirtest+0xac>
     56c:	eb000bd7 	bl	34d0 <chdir>
     570:	e3500000 	cmp	r0, #0
     574:	ba000016 	blt	5d4 <dirtest+0x94>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     578:	e59f0070 	ldr	r0, [pc, #112]	; 5f0 <dirtest+0xb0>
     57c:	eb000bd3 	bl	34d0 <chdir>
     580:	e3500000 	cmp	r0, #0
     584:	ba00000e 	blt	5c4 <dirtest+0x84>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     588:	e59f005c 	ldr	r0, [pc, #92]	; 5ec <dirtest+0xac>
     58c:	eb000b9b 	bl	3400 <unlink>
     590:	e3500000 	cmp	r0, #0
    printf(stdout, "unlink dir0 failed\n");
     594:	e5940000 	ldr	r0, [r4]
  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     598:	ba000006 	blt	5b8 <dirtest+0x78>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test\n");
     59c:	e59f1044 	ldr	r1, [pc, #68]	; 5e8 <dirtest+0xa8>
}
     5a0:	e8bd4818 	pop	{r3, r4, fp, lr}

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test\n");
     5a4:	ea000c66 	b	3744 <printf>
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     5a8:	e5940000 	ldr	r0, [r4]
     5ac:	e59f1040 	ldr	r1, [pc, #64]	; 5f4 <dirtest+0xb4>
     5b0:	eb000c63 	bl	3744 <printf>
    exit();
     5b4:	eb000b0f 	bl	31f8 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     5b8:	e59f1038 	ldr	r1, [pc, #56]	; 5f8 <dirtest+0xb8>
     5bc:	eb000c60 	bl	3744 <printf>
    exit();
     5c0:	eb000b0c 	bl	31f8 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     5c4:	e5940000 	ldr	r0, [r4]
     5c8:	e59f102c 	ldr	r1, [pc, #44]	; 5fc <dirtest+0xbc>
     5cc:	eb000c5c 	bl	3744 <printf>
    exit();
     5d0:	eb000b08 	bl	31f8 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     5d4:	e5940000 	ldr	r0, [r4]
     5d8:	e59f1020 	ldr	r1, [pc, #32]	; 600 <dirtest+0xc0>
     5dc:	eb000c58 	bl	3744 <printf>
    exit();
     5e0:	eb000b04 	bl	31f8 <exit>
     5e4:	00005244 	.word	0x00005244
     5e8:	00003d0c 	.word	0x00003d0c
     5ec:	00003d18 	.word	0x00003d18
     5f0:	00003d44 	.word	0x00003d44
     5f4:	00003d20 	.word	0x00003d20
     5f8:	00003d5c 	.word	0x00003d5c
     5fc:	00003d48 	.word	0x00003d48
     600:	00003d30 	.word	0x00003d30

00000604 <exectest>:
  printf(stdout, "mkdir test\n");
}

void
exectest(void)
{
     604:	e92d4818 	push	{r3, r4, fp, lr}
     608:	e28db00c 	add	fp, sp, #12
  printf(stdout, "exec test\n");
     60c:	e59f402c 	ldr	r4, [pc, #44]	; 640 <exectest+0x3c>
     610:	e59f102c 	ldr	r1, [pc, #44]	; 644 <exectest+0x40>
     614:	e5940000 	ldr	r0, [r4]
     618:	eb000c49 	bl	3744 <printf>
  if(exec("echo", echoargv) < 0){
     61c:	e59f0024 	ldr	r0, [pc, #36]	; 648 <exectest+0x44>
     620:	e2841004 	add	r1, r4, #4
     624:	eb000b4e 	bl	3364 <exec>
     628:	e3500000 	cmp	r0, #0
     62c:	a8bd8818 	popge	{r3, r4, fp, pc}
    printf(stdout, "exec echo failed\n");
     630:	e5940000 	ldr	r0, [r4]
     634:	e59f1010 	ldr	r1, [pc, #16]	; 64c <exectest+0x48>
     638:	eb000c41 	bl	3744 <printf>
    exit();
     63c:	eb000aed 	bl	31f8 <exit>
     640:	00005244 	.word	0x00005244
     644:	00003d70 	.word	0x00003d70
     648:	00003a38 	.word	0x00003a38
     64c:	00003d7c 	.word	0x00003d7c

00000650 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     650:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     654:	e28db018 	add	fp, sp, #24
     658:	e24dd00c 	sub	sp, sp, #12
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     65c:	e24b0024 	sub	r0, fp, #36	; 0x24
     660:	eb000afe 	bl	3260 <pipe>
     664:	e2506000 	subs	r6, r0, #0
     668:	1a000049 	bne	794 <pipe1+0x144>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     66c:	eb000ad4 	bl	31c4 <fork>
  seq = 0;
  if(pid == 0){
     670:	e2504000 	subs	r4, r0, #0
     674:	0a00001f 	beq	6f8 <pipe1+0xa8>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     678:	da000049 	ble	7a4 <pipe1+0x154>
    close(fds[1]);
     67c:	e51b0020 	ldr	r0, [fp, #-32]
     680:	eb000b1d 	bl	32fc <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     684:	e59f7138 	ldr	r7, [pc, #312]	; 7c4 <pipe1+0x174>
        }
      }
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
     688:	e59f8138 	ldr	r8, [pc, #312]	; 7c8 <pipe1+0x178>
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
     68c:	e3a05001 	mov	r5, #1
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     690:	e1a04006 	mov	r4, r6
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     694:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
     698:	e59f1124 	ldr	r1, [pc, #292]	; 7c4 <pipe1+0x174>
     69c:	e1a02005 	mov	r2, r5
     6a0:	eb000afb 	bl	3294 <read>
     6a4:	e3500000 	cmp	r0, #0
     6a8:	da00002a 	ble	758 <pipe1+0x108>
}

// simple fork and pipe read/write

void
pipe1(void)
     6ac:	e084c000 	add	ip, r4, r0
     6b0:	e0641007 	rsb	r1, r4, r7
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     6b4:	e7d12004 	ldrb	r2, [r1, r4]
     6b8:	e6ef3074 	uxtb	r3, r4
     6bc:	e1520003 	cmp	r2, r3
     6c0:	1a000007 	bne	6e4 <pipe1+0x94>
     6c4:	e2844001 	add	r4, r4, #1
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     6c8:	e154000c 	cmp	r4, ip
     6cc:	1afffff8 	bne	6b4 <pipe1+0x64>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     6d0:	e1a05085 	lsl	r5, r5, #1
      if(cc > sizeof(buf))
        cc = sizeof(buf);
     6d4:	e1550008 	cmp	r5, r8
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     6d8:	e0866000 	add	r6, r6, r0
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
     6dc:	23a05a02 	movcs	r5, #8192	; 0x2000
     6e0:	eaffffeb 	b	694 <pipe1+0x44>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     6e4:	e3a00001 	mov	r0, #1
     6e8:	e59f10dc 	ldr	r1, [pc, #220]	; 7cc <pipe1+0x17c>
     6ec:	eb000c14 	bl	3744 <printf>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     6f0:	e24bd018 	sub	sp, fp, #24
     6f4:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     6f8:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
     6fc:	e59f70c0 	ldr	r7, [pc, #192]	; 7c4 <pipe1+0x174>
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     700:	e59f60c8 	ldr	r6, [pc, #200]	; 7d0 <pipe1+0x180>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     704:	e59f50c8 	ldr	r5, [pc, #200]	; 7d4 <pipe1+0x184>
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     708:	eb000afb 	bl	32fc <close>
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     70c:	e1a03004 	mov	r3, r4
}

// simple fork and pipe read/write

void
pipe1(void)
     710:	e2832b01 	add	r2, r3, #1024	; 0x400
     714:	e1a04003 	mov	r4, r3
     718:	e2822009 	add	r2, r2, #9
     71c:	e0633007 	rsb	r3, r3, r7
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     720:	e7c34004 	strb	r4, [r3, r4]
     724:	e2844001 	add	r4, r4, #1
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     728:	e1540002 	cmp	r4, r2
     72c:	1afffffb 	bne	720 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     730:	e51b0020 	ldr	r0, [fp, #-32]
     734:	e59f1088 	ldr	r1, [pc, #136]	; 7c4 <pipe1+0x174>
     738:	e59f2090 	ldr	r2, [pc, #144]	; 7d0 <pipe1+0x180>
     73c:	eb000ae1 	bl	32c8 <write>
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     740:	e1a03004 	mov	r3, r4
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     744:	e1500006 	cmp	r0, r6
     748:	1a000019 	bne	7b4 <pipe1+0x164>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     74c:	e1540005 	cmp	r4, r5
     750:	1affffee 	bne	710 <pipe1+0xc0>
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
     754:	eb000aa7 	bl	31f8 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     758:	e59f3074 	ldr	r3, [pc, #116]	; 7d4 <pipe1+0x184>
     75c:	e1560003 	cmp	r6, r3
     760:	1a000006 	bne	780 <pipe1+0x130>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     764:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
     768:	eb000ae3 	bl	32fc <close>
    wait();
     76c:	eb000aae 	bl	322c <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     770:	e3a00001 	mov	r0, #1
     774:	e59f105c 	ldr	r1, [pc, #92]	; 7d8 <pipe1+0x188>
     778:	eb000bf1 	bl	3744 <printf>
     77c:	eaffffdb 	b	6f0 <pipe1+0xa0>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     780:	e3a00001 	mov	r0, #1
     784:	e59f1050 	ldr	r1, [pc, #80]	; 7dc <pipe1+0x18c>
     788:	e1a02006 	mov	r2, r6
     78c:	eb000bec 	bl	3744 <printf>
      exit();
     790:	eb000a98 	bl	31f8 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     794:	e3a00001 	mov	r0, #1
     798:	e59f1040 	ldr	r1, [pc, #64]	; 7e0 <pipe1+0x190>
     79c:	eb000be8 	bl	3744 <printf>
    exit();
     7a0:	eb000a94 	bl	31f8 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     7a4:	e3a00001 	mov	r0, #1
     7a8:	e59f1034 	ldr	r1, [pc, #52]	; 7e4 <pipe1+0x194>
     7ac:	eb000be4 	bl	3744 <printf>
    exit();
     7b0:	eb000a90 	bl	31f8 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     7b4:	e3a00001 	mov	r0, #1
     7b8:	e59f1028 	ldr	r1, [pc, #40]	; 7e8 <pipe1+0x198>
     7bc:	eb000be0 	bl	3744 <printf>
        exit();
     7c0:	eb000a8c 	bl	31f8 <exit>
     7c4:	000079fc 	.word	0x000079fc
     7c8:	00002001 	.word	0x00002001
     7cc:	00003db0 	.word	0x00003db0
     7d0:	00000409 	.word	0x00000409
     7d4:	0000142d 	.word	0x0000142d
     7d8:	00003dd8 	.word	0x00003dd8
     7dc:	00003dc0 	.word	0x00003dc0
     7e0:	00003d90 	.word	0x00003d90
     7e4:	00003de4 	.word	0x00003de4
     7e8:	00003da0 	.word	0x00003da0

000007ec <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     7ec:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     7f0:	e28db014 	add	fp, sp, #20
     7f4:	e24dd008 	sub	sp, sp, #8
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     7f8:	e3a00001 	mov	r0, #1
     7fc:	e59f10f8 	ldr	r1, [pc, #248]	; 8fc <preempt+0x110>
     800:	eb000bcf 	bl	3744 <printf>
  pid1 = fork();
     804:	eb000a6e 	bl	31c4 <fork>
  if(pid1 == 0)
     808:	e2506000 	subs	r6, r0, #0
     80c:	1a000000 	bne	814 <preempt+0x28>
     810:	eafffffe 	b	810 <preempt+0x24>
    for(;;)
      ;

  pid2 = fork();
     814:	eb000a6a 	bl	31c4 <fork>
  if(pid2 == 0)
     818:	e2505000 	subs	r5, r0, #0
     81c:	1a000000 	bne	824 <preempt+0x38>
     820:	eafffffe 	b	820 <preempt+0x34>
    for(;;)
      ;

  pipe(pfds);
     824:	e24b001c 	sub	r0, fp, #28
     828:	eb000a8c 	bl	3260 <pipe>
  pid3 = fork();
     82c:	eb000a64 	bl	31c4 <fork>
  if(pid3 == 0){
     830:	e2504000 	subs	r4, r0, #0
     834:	1a00000d 	bne	870 <preempt+0x84>
    close(pfds[0]);
     838:	e51b001c 	ldr	r0, [fp, #-28]
     83c:	eb000aae 	bl	32fc <close>
    if(write(pfds[1], "x", 1) != 1)
     840:	e51b0018 	ldr	r0, [fp, #-24]
     844:	e59f10b4 	ldr	r1, [pc, #180]	; 900 <preempt+0x114>
     848:	e3a02001 	mov	r2, #1
     84c:	eb000a9d 	bl	32c8 <write>
     850:	e3500001 	cmp	r0, #1
     854:	0a000002 	beq	864 <preempt+0x78>
      printf(1, "preempt write error");
     858:	e3a00001 	mov	r0, #1
     85c:	e59f10a0 	ldr	r1, [pc, #160]	; 904 <preempt+0x118>
     860:	eb000bb7 	bl	3744 <printf>
    close(pfds[1]);
     864:	e51b0018 	ldr	r0, [fp, #-24]
     868:	eb000aa3 	bl	32fc <close>
     86c:	eafffffe 	b	86c <preempt+0x80>
    for(;;)
      ;
  }

  close(pfds[1]);
     870:	e51b0018 	ldr	r0, [fp, #-24]
     874:	eb000aa0 	bl	32fc <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     878:	e51b001c 	ldr	r0, [fp, #-28]
     87c:	e59f1084 	ldr	r1, [pc, #132]	; 908 <preempt+0x11c>
     880:	e3a02a02 	mov	r2, #8192	; 0x2000
     884:	eb000a82 	bl	3294 <read>
     888:	e3500001 	cmp	r0, #1
     88c:	e1a07000 	mov	r7, r0
     890:	0a000004 	beq	8a8 <preempt+0xbc>
    printf(1, "preempt read error");
     894:	e3a00001 	mov	r0, #1
     898:	e59f106c 	ldr	r1, [pc, #108]	; 90c <preempt+0x120>
     89c:	eb000ba8 	bl	3744 <printf>
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     8a0:	e24bd014 	sub	sp, fp, #20
     8a4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     8a8:	e51b001c 	ldr	r0, [fp, #-28]
     8ac:	eb000a92 	bl	32fc <close>
  printf(1, "kill... ");
     8b0:	e59f1058 	ldr	r1, [pc, #88]	; 910 <preempt+0x124>
     8b4:	e1a00007 	mov	r0, r7
     8b8:	eb000ba1 	bl	3744 <printf>
  kill(pid1);
     8bc:	e1a00006 	mov	r0, r6
     8c0:	eb000a9a 	bl	3330 <kill>
  kill(pid2);
     8c4:	e1a00005 	mov	r0, r5
     8c8:	eb000a98 	bl	3330 <kill>
  kill(pid3);
     8cc:	e1a00004 	mov	r0, r4
     8d0:	eb000a96 	bl	3330 <kill>
  printf(1, "wait... ");
     8d4:	e59f1038 	ldr	r1, [pc, #56]	; 914 <preempt+0x128>
     8d8:	e1a00007 	mov	r0, r7
     8dc:	eb000b98 	bl	3744 <printf>
  wait();
     8e0:	eb000a51 	bl	322c <wait>
  wait();
     8e4:	eb000a50 	bl	322c <wait>
  wait();
     8e8:	eb000a4f 	bl	322c <wait>
  printf(1, "preempt ok\n");
     8ec:	e1a00007 	mov	r0, r7
     8f0:	e59f1020 	ldr	r1, [pc, #32]	; 918 <preempt+0x12c>
     8f4:	eb000b92 	bl	3744 <printf>
     8f8:	eaffffe8 	b	8a0 <preempt+0xb4>
     8fc:	00003df4 	.word	0x00003df4
     900:	00004760 	.word	0x00004760
     904:	00003e00 	.word	0x00003e00
     908:	000079fc 	.word	0x000079fc
     90c:	00003e14 	.word	0x00003e14
     910:	00003e28 	.word	0x00003e28
     914:	00003e34 	.word	0x00003e34
     918:	00003e40 	.word	0x00003e40

0000091c <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     91c:	e92d4830 	push	{r4, r5, fp, lr}
     920:	e3a04064 	mov	r4, #100	; 0x64
     924:	e28db00c 	add	fp, sp, #12
     928:	ea000005 	b	944 <exitwait+0x28>
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     92c:	0a000013 	beq	980 <exitwait+0x64>
      if(wait() != pid){
     930:	eb000a3d 	bl	322c <wait>
     934:	e1500005 	cmp	r0, r5
     938:	1a000008 	bne	960 <exitwait+0x44>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     93c:	e2544001 	subs	r4, r4, #1
     940:	0a00000a 	beq	970 <exitwait+0x54>
    pid = fork();
     944:	eb000a1e 	bl	31c4 <fork>
    if(pid < 0){
     948:	e2505000 	subs	r5, r0, #0
     94c:	aafffff6 	bge	92c <exitwait+0x10>
      printf(1, "fork failed\n");
     950:	e3a00001 	mov	r0, #1
     954:	e59f1028 	ldr	r1, [pc, #40]	; 984 <exitwait+0x68>
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     958:	e8bd4830 	pop	{r4, r5, fp, lr}
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
     95c:	ea000b78 	b	3744 <printf>
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     960:	e3a00001 	mov	r0, #1
     964:	e59f101c 	ldr	r1, [pc, #28]	; 988 <exitwait+0x6c>
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     968:	e8bd4830 	pop	{r4, r5, fp, lr}
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     96c:	ea000b74 	b	3744 <printf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     970:	e3a00001 	mov	r0, #1
     974:	e59f1010 	ldr	r1, [pc, #16]	; 98c <exitwait+0x70>
}
     978:	e8bd4830 	pop	{r4, r5, fp, lr}
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     97c:	ea000b70 	b	3744 <printf>
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     980:	eb000a1c 	bl	31f8 <exit>
     984:	00005148 	.word	0x00005148
     988:	00003e4c 	.word	0x00003e4c
     98c:	00003e5c 	.word	0x00003e5c

00000990 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     990:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     994:	e3a00001 	mov	r0, #1
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     998:	e28db014 	add	fp, sp, #20
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     99c:	e59f1098 	ldr	r1, [pc, #152]	; a3c <mem+0xac>
     9a0:	eb000b67 	bl	3744 <printf>
  ppid = getpid();
     9a4:	eb000ae3 	bl	3538 <getpid>
     9a8:	e1a04000 	mov	r4, r0
  if((pid = fork()) == 0){
     9ac:	eb000a04 	bl	31c4 <fork>
     9b0:	e2505000 	subs	r5, r0, #0
     9b4:	0a000002 	beq	9c4 <mem+0x34>
     9b8:	ea000017 	b	a1c <mem+0x8c>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     9bc:	e5805000 	str	r5, [r0]
     9c0:	e1a05000 	mov	r5, r0

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     9c4:	e59f0074 	ldr	r0, [pc, #116]	; a40 <mem+0xb0>
     9c8:	eb000bdc 	bl	3940 <malloc>
     9cc:	e3500000 	cmp	r0, #0
     9d0:	1afffff9 	bne	9bc <mem+0x2c>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     9d4:	e3550000 	cmp	r5, #0
     9d8:	1a000001 	bne	9e4 <mem+0x54>
     9dc:	ea000005 	b	9f8 <mem+0x68>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
     9e0:	e1a05006 	mov	r5, r6
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
      m2 = *(char**)m1;
     9e4:	e5956000 	ldr	r6, [r5]
      free(m1);
     9e8:	e1a00005 	mov	r0, r5
     9ec:	eb000baa 	bl	389c <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     9f0:	e3560000 	cmp	r6, #0
     9f4:	1afffff9 	bne	9e0 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     9f8:	e3a00a05 	mov	r0, #20480	; 0x5000
     9fc:	eb000bcf 	bl	3940 <malloc>
    if(m1 == 0){
     a00:	e3500000 	cmp	r0, #0
     a04:	0a000006 	beq	a24 <mem+0x94>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     a08:	eb000ba3 	bl	389c <free>
    printf(1, "mem ok\n");
     a0c:	e3a00001 	mov	r0, #1
     a10:	e59f102c 	ldr	r1, [pc, #44]	; a44 <mem+0xb4>
     a14:	eb000b4a 	bl	3744 <printf>
    exit();
     a18:	eb0009f6 	bl	31f8 <exit>
  } else {
    wait();
  }
}
     a1c:	e8bd4878 	pop	{r3, r4, r5, r6, fp, lr}
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     a20:	ea000a01 	b	322c <wait>
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     a24:	e59f101c 	ldr	r1, [pc, #28]	; a48 <mem+0xb8>
     a28:	e3a00001 	mov	r0, #1
     a2c:	eb000b44 	bl	3744 <printf>
      kill(ppid);
     a30:	e1a00004 	mov	r0, r4
     a34:	eb000a3d 	bl	3330 <kill>
      exit();
     a38:	eb0009ee 	bl	31f8 <exit>
     a3c:	00003e6c 	.word	0x00003e6c
     a40:	00002711 	.word	0x00002711
     a44:	00003e94 	.word	0x00003e94
     a48:	00003e78 	.word	0x00003e78

00000a4c <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     a4c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     a50:	e28db014 	add	fp, sp, #20
     a54:	e24dd010 	sub	sp, sp, #16
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     a58:	e59f1164 	ldr	r1, [pc, #356]	; bc4 <sharedfd+0x178>
     a5c:	e3a00001 	mov	r0, #1
     a60:	eb000b37 	bl	3744 <printf>

  unlink("sharedfd");
     a64:	e59f015c 	ldr	r0, [pc, #348]	; bc8 <sharedfd+0x17c>
     a68:	eb000a64 	bl	3400 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     a6c:	e59f0154 	ldr	r0, [pc, #340]	; bc8 <sharedfd+0x17c>
     a70:	e59f1154 	ldr	r1, [pc, #340]	; bcc <sharedfd+0x180>
     a74:	eb000a47 	bl	3398 <open>
  if(fd < 0){
     a78:	e2505000 	subs	r5, r0, #0
     a7c:	ba000043 	blt	b90 <sharedfd+0x144>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     a80:	eb0009cf 	bl	31c4 <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     a84:	e3a0200a 	mov	r2, #10
     a88:	e3a04ffa 	mov	r4, #1000	; 0x3e8
     a8c:	e3500000 	cmp	r0, #0
     a90:	e1a06000 	mov	r6, r0
     a94:	13a01070 	movne	r1, #112	; 0x70
     a98:	03a01063 	moveq	r1, #99	; 0x63
     a9c:	e24b0020 	sub	r0, fp, #32
     aa0:	eb000959 	bl	300c <memset>
     aa4:	ea000001 	b	ab0 <sharedfd+0x64>
  for(i = 0; i < 1000; i++){
     aa8:	e2544001 	subs	r4, r4, #1
     aac:	0a000008 	beq	ad4 <sharedfd+0x88>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ab0:	e1a00005 	mov	r0, r5
     ab4:	e24b1020 	sub	r1, fp, #32
     ab8:	e3a0200a 	mov	r2, #10
     abc:	eb000a01 	bl	32c8 <write>
     ac0:	e350000a 	cmp	r0, #10
     ac4:	0afffff7 	beq	aa8 <sharedfd+0x5c>
      printf(1, "fstests: write sharedfd failed\n");
     ac8:	e3a00001 	mov	r0, #1
     acc:	e59f10fc 	ldr	r1, [pc, #252]	; bd0 <sharedfd+0x184>
     ad0:	eb000b1b 	bl	3744 <printf>
      break;
    }
  }
  if(pid == 0)
     ad4:	e3560000 	cmp	r6, #0
     ad8:	0a000038 	beq	bc0 <sharedfd+0x174>
    exit();
  else
    wait();
     adc:	eb0009d2 	bl	322c <wait>
  close(fd);
     ae0:	e1a00005 	mov	r0, r5
     ae4:	eb000a04 	bl	32fc <close>
  fd = open("sharedfd", 0);
     ae8:	e59f00d8 	ldr	r0, [pc, #216]	; bc8 <sharedfd+0x17c>
     aec:	e3a01000 	mov	r1, #0
     af0:	eb000a28 	bl	3398 <open>
  if(fd < 0){
     af4:	e2507000 	subs	r7, r0, #0
     af8:	a3a05000 	movge	r5, #0
     afc:	a1a06005 	movge	r6, r5
// More file system tests

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
     b00:	a24b4017 	subge	r4, fp, #23
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
     b04:	ba000025 	blt	ba0 <sharedfd+0x154>
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     b08:	e1a00007 	mov	r0, r7
     b0c:	e24b1020 	sub	r1, fp, #32
     b10:	e3a0200a 	mov	r2, #10
     b14:	eb0009de 	bl	3294 <read>
     b18:	e3500000 	cmp	r0, #0
     b1c:	da00000e 	ble	b5c <sharedfd+0x110>
     b20:	e24b3021 	sub	r3, fp, #33	; 0x21
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
     b24:	e5f32001 	ldrb	r2, [r3, #1]!
     b28:	e3520063 	cmp	r2, #99	; 0x63
        nc++;
     b2c:	02866001 	addeq	r6, r6, #1
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
     b30:	0a000001 	beq	b3c <sharedfd+0xf0>
        nc++;
      if(buf[i] == 'p')
     b34:	e3520070 	cmp	r2, #112	; 0x70
        np++;
     b38:	02855001 	addeq	r5, r5, #1
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     b3c:	e1530004 	cmp	r3, r4
     b40:	1afffff7 	bne	b24 <sharedfd+0xd8>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     b44:	e1a00007 	mov	r0, r7
     b48:	e24b1020 	sub	r1, fp, #32
     b4c:	e3a0200a 	mov	r2, #10
     b50:	eb0009cf 	bl	3294 <read>
     b54:	e3500000 	cmp	r0, #0
     b58:	cafffff0 	bgt	b20 <sharedfd+0xd4>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     b5c:	e1a00007 	mov	r0, r7
     b60:	eb0009e5 	bl	32fc <close>
  unlink("sharedfd");
     b64:	e59f005c 	ldr	r0, [pc, #92]	; bc8 <sharedfd+0x17c>
     b68:	eb000a24 	bl	3400 <unlink>
  if(nc == 10000 && np == 10000){
     b6c:	e59f3060 	ldr	r3, [pc, #96]	; bd4 <sharedfd+0x188>
    printf(1, "sharedfd ok\n");
     b70:	e3a00001 	mov	r0, #1
        np++;
    }
  }
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
     b74:	e1550003 	cmp	r5, r3
     b78:	01560003 	cmpeq	r6, r3
     b7c:	1a00000b 	bne	bb0 <sharedfd+0x164>
    printf(1, "sharedfd ok\n");
     b80:	e59f1050 	ldr	r1, [pc, #80]	; bd8 <sharedfd+0x18c>
     b84:	eb000aee 	bl	3744 <printf>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     b88:	e24bd014 	sub	sp, fp, #20
     b8c:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     b90:	e3a00001 	mov	r0, #1
     b94:	e59f1040 	ldr	r1, [pc, #64]	; bdc <sharedfd+0x190>
     b98:	eb000ae9 	bl	3744 <printf>
    return;
     b9c:	eafffff9 	b	b88 <sharedfd+0x13c>
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     ba0:	e3a00001 	mov	r0, #1
     ba4:	e59f1034 	ldr	r1, [pc, #52]	; be0 <sharedfd+0x194>
     ba8:	eb000ae5 	bl	3744 <printf>
    return;
     bac:	eafffff5 	b	b88 <sharedfd+0x13c>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     bb0:	e59f102c 	ldr	r1, [pc, #44]	; be4 <sharedfd+0x198>
     bb4:	e1a02006 	mov	r2, r6
     bb8:	e1a03005 	mov	r3, r5
     bbc:	eb000ae0 	bl	3744 <printf>
    exit();
     bc0:	eb00098c 	bl	31f8 <exit>
     bc4:	00003e9c 	.word	0x00003e9c
     bc8:	00003eac 	.word	0x00003eac
     bcc:	00000202 	.word	0x00000202
     bd0:	00003ee4 	.word	0x00003ee4
     bd4:	00002710 	.word	0x00002710
     bd8:	00003f30 	.word	0x00003f30
     bdc:	00003eb8 	.word	0x00003eb8
     be0:	00003f04 	.word	0x00003f04
     be4:	00003f40 	.word	0x00003f40

00000be8 <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     be8:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     bec:	e3a00001 	mov	r0, #1

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     bf0:	e28db014 	add	fp, sp, #20
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     bf4:	e59f1194 	ldr	r1, [pc, #404]	; d90 <twofiles+0x1a8>
     bf8:	eb000ad1 	bl	3744 <printf>

  unlink("f1");
     bfc:	e59f0190 	ldr	r0, [pc, #400]	; d94 <twofiles+0x1ac>
     c00:	eb0009fe 	bl	3400 <unlink>
  unlink("f2");
     c04:	e59f018c 	ldr	r0, [pc, #396]	; d98 <twofiles+0x1b0>
     c08:	eb0009fc 	bl	3400 <unlink>

  pid = fork();
     c0c:	eb00096c 	bl	31c4 <fork>
  if(pid < 0){
     c10:	e2506000 	subs	r6, r0, #0
     c14:	ba000050 	blt	d5c <twofiles+0x174>
    printf(1, "fork failed\n");
    exit();
  }

  fname = pid ? "f1" : "f2";
     c18:	159f0174 	ldrne	r0, [pc, #372]	; d94 <twofiles+0x1ac>
     c1c:	059f0174 	ldreq	r0, [pc, #372]	; d98 <twofiles+0x1b0>
  fd = open(fname, O_CREATE | O_RDWR);
     c20:	e59f1174 	ldr	r1, [pc, #372]	; d9c <twofiles+0x1b4>
     c24:	eb0009db 	bl	3398 <open>
  if(fd < 0){
     c28:	e2505000 	subs	r5, r0, #0
     c2c:	ba00004e 	blt	d6c <twofiles+0x184>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
     c30:	e3560000 	cmp	r6, #0
     c34:	e59f0164 	ldr	r0, [pc, #356]	; da0 <twofiles+0x1b8>
     c38:	03a01063 	moveq	r1, #99	; 0x63
     c3c:	13a01070 	movne	r1, #112	; 0x70
     c40:	e3a02c02 	mov	r2, #512	; 0x200
     c44:	eb0008f0 	bl	300c <memset>
     c48:	e3a0400c 	mov	r4, #12
  for(i = 0; i < 12; i++){
    if((n = write(fd, buf, 500)) != 500){
     c4c:	e3a02f7d 	mov	r2, #500	; 0x1f4
     c50:	e1a00005 	mov	r0, r5
     c54:	e59f1144 	ldr	r1, [pc, #324]	; da0 <twofiles+0x1b8>
     c58:	eb00099a 	bl	32c8 <write>
     c5c:	e3500f7d 	cmp	r0, #500	; 0x1f4
     c60:	e1a02000 	mov	r2, r0
     c64:	1a000038 	bne	d4c <twofiles+0x164>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
     c68:	e2544001 	subs	r4, r4, #1
     c6c:	1afffff6 	bne	c4c <twofiles+0x64>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit();
    }
  }
  close(fd);
     c70:	e1a00005 	mov	r0, r5
     c74:	eb0009a0 	bl	32fc <close>
  if(pid)
     c78:	e3560000 	cmp	r6, #0
     c7c:	0a000031 	beq	d48 <twofiles+0x160>
    wait();
     c80:	eb000969 	bl	322c <wait>
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     c84:	e59f7118 	ldr	r7, [pc, #280]	; da4 <twofiles+0x1bc>
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     c88:	e59f0108 	ldr	r0, [pc, #264]	; d98 <twofiles+0x1b0>
     c8c:	e3a01000 	mov	r1, #0
     c90:	eb0009c0 	bl	3398 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     c94:	e59f1104 	ldr	r1, [pc, #260]	; da0 <twofiles+0x1b8>
     c98:	e3a02a02 	mov	r2, #8192	; 0x2000
  else
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
     c9c:	e3a05000 	mov	r5, #0
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     ca0:	e1a06000 	mov	r6, r0
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     ca4:	e1a00006 	mov	r0, r6
     ca8:	eb000979 	bl	3294 <read>
     cac:	e3500000 	cmp	r0, #0
     cb0:	da000010 	ble	cf8 <twofiles+0x110>
     cb4:	e59f30e8 	ldr	r3, [pc, #232]	; da4 <twofiles+0x1bc>
}

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
     cb8:	e087c000 	add	ip, r7, r0
  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != (i?'p':'c')){
     cbc:	e5f31001 	ldrb	r1, [r3, #1]!
     cc0:	e3540000 	cmp	r4, #0
     cc4:	03a02063 	moveq	r2, #99	; 0x63
     cc8:	13a02070 	movne	r2, #112	; 0x70
     ccc:	e1510002 	cmp	r1, r2
     cd0:	1a000019 	bne	d3c <twofiles+0x154>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
     cd4:	e153000c 	cmp	r3, ip
     cd8:	1afffff7 	bne	cbc <twofiles+0xd4>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
     cdc:	e0855000 	add	r5, r5, r0
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     ce0:	e59f10b8 	ldr	r1, [pc, #184]	; da0 <twofiles+0x1b8>
     ce4:	e1a00006 	mov	r0, r6
     ce8:	e3a02a02 	mov	r2, #8192	; 0x2000
     cec:	eb000968 	bl	3294 <read>
     cf0:	e3500000 	cmp	r0, #0
     cf4:	caffffee 	bgt	cb4 <twofiles+0xcc>
          exit();
        }
      }
      total += n;
    }
    close(fd);
     cf8:	e1a00006 	mov	r0, r6
     cfc:	eb00097e 	bl	32fc <close>
    if(total != 12*500){
     d00:	e59f30a0 	ldr	r3, [pc, #160]	; da8 <twofiles+0x1c0>
     d04:	e1550003 	cmp	r5, r3
     d08:	1a00001b 	bne	d7c <twofiles+0x194>
  if(pid)
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
     d0c:	e3540001 	cmp	r4, #1
     d10:	e59f007c 	ldr	r0, [pc, #124]	; d94 <twofiles+0x1ac>
     d14:	1a000006 	bne	d34 <twofiles+0x14c>
      printf(1, "wrong length %d\n", total);
      exit();
    }
  }

  unlink("f1");
     d18:	eb0009b8 	bl	3400 <unlink>
  unlink("f2");
     d1c:	e59f0074 	ldr	r0, [pc, #116]	; d98 <twofiles+0x1b0>
     d20:	eb0009b6 	bl	3400 <unlink>

  printf(1, "twofiles ok\n");
     d24:	e1a00004 	mov	r0, r4
     d28:	e59f107c 	ldr	r1, [pc, #124]	; dac <twofiles+0x1c4>
}
     d2c:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  }

  unlink("f1");
  unlink("f2");

  printf(1, "twofiles ok\n");
     d30:	ea000a83 	b	3744 <printf>
  if(pid)
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
     d34:	e3a04001 	mov	r4, #1
     d38:	eaffffd3 	b	c8c <twofiles+0xa4>
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
     d3c:	e3a00001 	mov	r0, #1
     d40:	e59f1068 	ldr	r1, [pc, #104]	; db0 <twofiles+0x1c8>
     d44:	eb000a7e 	bl	3744 <printf>
          exit();
     d48:	eb00092a 	bl	31f8 <exit>
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
     d4c:	e3a00001 	mov	r0, #1
     d50:	e59f105c 	ldr	r1, [pc, #92]	; db4 <twofiles+0x1cc>
     d54:	eb000a7a 	bl	3744 <printf>
      exit();
     d58:	eb000926 	bl	31f8 <exit>
  unlink("f1");
  unlink("f2");

  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
     d5c:	e3a00001 	mov	r0, #1
     d60:	e59f1050 	ldr	r1, [pc, #80]	; db8 <twofiles+0x1d0>
     d64:	eb000a76 	bl	3744 <printf>
    exit();
     d68:	eb000922 	bl	31f8 <exit>
  }

  fname = pid ? "f1" : "f2";
  fd = open(fname, O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create failed\n");
     d6c:	e3a00001 	mov	r0, #1
     d70:	e59f1044 	ldr	r1, [pc, #68]	; dbc <twofiles+0x1d4>
     d74:	eb000a72 	bl	3744 <printf>
    exit();
     d78:	eb00091e 	bl	31f8 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
     d7c:	e3a00001 	mov	r0, #1
     d80:	e59f1038 	ldr	r1, [pc, #56]	; dc0 <twofiles+0x1d8>
     d84:	e1a02005 	mov	r2, r5
     d88:	eb000a6d 	bl	3744 <printf>
      exit();
     d8c:	eb000919 	bl	31f8 <exit>
     d90:	00003f60 	.word	0x00003f60
     d94:	00003f58 	.word	0x00003f58
     d98:	00003f5c 	.word	0x00003f5c
     d9c:	00000202 	.word	0x00000202
     da0:	000079fc 	.word	0x000079fc
     da4:	000079fb 	.word	0x000079fb
     da8:	00001770 	.word	0x00001770
     dac:	00003fb4 	.word	0x00003fb4
     db0:	00003f94 	.word	0x00003f94
     db4:	00003f80 	.word	0x00003f80
     db8:	00005148 	.word	0x00005148
     dbc:	00003f70 	.word	0x00003f70
     dc0:	00003fa0 	.word	0x00003fa0

00000dc4 <createdelete>:
}

// two processes create and delete different files in same directory
void
createdelete(void)
{
     dc4:	e92d4df0 	push	{r4, r5, r6, r7, r8, sl, fp, lr}
     dc8:	e28db01c 	add	fp, sp, #28
     dcc:	e24dd020 	sub	sp, sp, #32
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
     dd0:	e3a00001 	mov	r0, #1
     dd4:	e59f1214 	ldr	r1, [pc, #532]	; ff0 <createdelete+0x22c>
     dd8:	eb000a59 	bl	3744 <printf>
  pid = fork();
     ddc:	eb0008f8 	bl	31c4 <fork>
  if(pid < 0){
     de0:	e2507000 	subs	r7, r0, #0
     de4:	ba00007d 	blt	fe0 <createdelete+0x21c>
    printf(1, "fork failed\n");
    exit();
  }

  name[0] = pid ? 'p' : 'c';
     de8:	13a03070 	movne	r3, #112	; 0x70
     dec:	03a03063 	moveq	r3, #99	; 0x63
  name[2] = '\0';
     df0:	e3a04000 	mov	r4, #0
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  name[0] = pid ? 'p' : 'c';
     df4:	e54b303c 	strb	r3, [fp, #-60]	; 0x3c
  name[2] = '\0';
     df8:	e54b403a 	strb	r4, [fp, #-58]	; 0x3a
     dfc:	e3a06001 	mov	r6, #1
     e00:	e3a05030 	mov	r5, #48	; 0x30
     e04:	ea000005 	b	e20 <createdelete+0x5c>
  for(i = 0; i < N; i++){
     e08:	e3560014 	cmp	r6, #20
     e0c:	0a000019 	beq	e78 <createdelete+0xb4>
    printf(1, "fork failed\n");
    exit();
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
     e10:	e2855001 	add	r5, r5, #1
     e14:	e2844001 	add	r4, r4, #1
     e18:	e6ef5075 	uxtb	r5, r5
     e1c:	e2866001 	add	r6, r6, #1
  for(i = 0; i < N; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE | O_RDWR);
     e20:	e24b003c 	sub	r0, fp, #60	; 0x3c
     e24:	e59f11c8 	ldr	r1, [pc, #456]	; ff4 <createdelete+0x230>
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    name[1] = '0' + i;
     e28:	e54b503b 	strb	r5, [fp, #-59]	; 0x3b
    fd = open(name, O_CREATE | O_RDWR);
     e2c:	eb000959 	bl	3398 <open>
    if(fd < 0){
     e30:	e3500000 	cmp	r0, #0
     e34:	ba00005b 	blt	fa8 <createdelete+0x1e4>
      printf(1, "create failed\n");
      exit();
    }
    close(fd);
     e38:	eb00092f 	bl	32fc <close>
    if(i > 0 && (i % 2 ) == 0){
     e3c:	e3540000 	cmp	r4, #0
     e40:	0afffff2 	beq	e10 <createdelete+0x4c>
     e44:	e3140001 	tst	r4, #1
     e48:	1affffee 	bne	e08 <createdelete+0x44>
      name[1] = '0' + (i / 2);
     e4c:	e1a030c4 	asr	r3, r4, #1
     e50:	e2833030 	add	r3, r3, #48	; 0x30
      if(unlink(name) < 0){
     e54:	e24b003c 	sub	r0, fp, #60	; 0x3c
      printf(1, "create failed\n");
      exit();
    }
    close(fd);
    if(i > 0 && (i % 2 ) == 0){
      name[1] = '0' + (i / 2);
     e58:	e54b303b 	strb	r3, [fp, #-59]	; 0x3b
      if(unlink(name) < 0){
     e5c:	eb000967 	bl	3400 <unlink>
     e60:	e3500000 	cmp	r0, #0
     e64:	aaffffe7 	bge	e08 <createdelete+0x44>
        printf(1, "unlink failed\n");
     e68:	e3a00001 	mov	r0, #1
     e6c:	e59f1184 	ldr	r1, [pc, #388]	; ff8 <createdelete+0x234>
     e70:	eb000a33 	bl	3744 <printf>
        exit();
     e74:	eb0008df 	bl	31f8 <exit>
      }
    }
  }

  if(pid==0)
     e78:	e3570000 	cmp	r7, #0
     e7c:	0a000056 	beq	fdc <createdelete+0x218>
    exit();
  else
    wait();
     e80:	eb0008e9 	bl	322c <wait>
     e84:	e3a05030 	mov	r5, #48	; 0x30

  for(i = 0; i < N; i++){
     e88:	e3a04000 	mov	r4, #0
    name[0] = 'p';
     e8c:	e3a0a070 	mov	sl, #112	; 0x70
      exit();
    }
    if(fd >= 0)
      close(fd);

    name[0] = 'c';
     e90:	e3a08063 	mov	r8, #99	; 0x63
    wait();

  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
    fd = open(name, 0);
     e94:	e24b003c 	sub	r0, fp, #60	; 0x3c
     e98:	e3a01000 	mov	r1, #0
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
    name[0] = 'p';
     e9c:	e54ba03c 	strb	sl, [fp, #-60]	; 0x3c
    name[1] = '0' + i;
     ea0:	e54b503b 	strb	r5, [fp, #-59]	; 0x3b
    fd = open(name, 0);
     ea4:	eb00093b 	bl	3398 <open>
    if((i == 0 || i >= N/2) && fd < 0){
     ea8:	e2747001 	rsbs	r7, r4, #1
     eac:	33a07000 	movcc	r7, #0
     eb0:	e3540009 	cmp	r4, #9
     eb4:	c3877001 	orrgt	r7, r7, #1
     eb8:	e3570000 	cmp	r7, #0
     ebc:	0a000001 	beq	ec8 <createdelete+0x104>
     ec0:	e3500000 	cmp	r0, #0
     ec4:	ba000040 	blt	fcc <createdelete+0x208>
      printf(1, "oops createdelete %s didn't exist\n", name);
      exit();
    } else if((i >= 1 && i < N/2) && fd >= 0){
     ec8:	e2446001 	sub	r6, r4, #1
     ecc:	e1e03000 	mvn	r3, r0
     ed0:	e3560008 	cmp	r6, #8
     ed4:	83a06000 	movhi	r6, #0
     ed8:	93a06001 	movls	r6, #1
     edc:	e1a03fa3 	lsr	r3, r3, #31
     ee0:	e1160003 	tst	r6, r3
     ee4:	1a00002a 	bne	f94 <createdelete+0x1d0>
      printf(1, "oops createdelete %s did exist\n", name);
      exit();
    }
    if(fd >= 0)
     ee8:	e3530000 	cmp	r3, #0
     eec:	0a000000 	beq	ef4 <createdelete+0x130>
      close(fd);
     ef0:	eb000901 	bl	32fc <close>

    name[0] = 'c';
    name[1] = '0' + i;
    fd = open(name, 0);
     ef4:	e24b003c 	sub	r0, fp, #60	; 0x3c
     ef8:	e3a01000 	mov	r1, #0
      exit();
    }
    if(fd >= 0)
      close(fd);

    name[0] = 'c';
     efc:	e54b803c 	strb	r8, [fp, #-60]	; 0x3c
    name[1] = '0' + i;
     f00:	e54b503b 	strb	r5, [fp, #-59]	; 0x3b
    fd = open(name, 0);
     f04:	eb000923 	bl	3398 <open>
    if((i == 0 || i >= N/2) && fd < 0){
     f08:	e3570000 	cmp	r7, #0
     f0c:	0a000001 	beq	f18 <createdelete+0x154>
     f10:	e3500000 	cmp	r0, #0
     f14:	ba000027 	blt	fb8 <createdelete+0x1f4>
      printf(1, "oops createdelete %s didn't exist\n", name);
      exit();
    } else if((i >= 1 && i < N/2) && fd >= 0){
     f18:	e1e03000 	mvn	r3, r0
     f1c:	e1a03fa3 	lsr	r3, r3, #31
     f20:	e1130006 	tst	r3, r6
     f24:	1a00001a 	bne	f94 <createdelete+0x1d0>
      printf(1, "oops createdelete %s did exist\n", name);
      exit();
    }
    if(fd >= 0)
     f28:	e3530000 	cmp	r3, #0
     f2c:	0a000000 	beq	f34 <createdelete+0x170>
      close(fd);
     f30:	eb0008f1 	bl	32fc <close>
  if(pid==0)
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
     f34:	e2844001 	add	r4, r4, #1
     f38:	e2855001 	add	r5, r5, #1
     f3c:	e3540014 	cmp	r4, #20
     f40:	e6ef5075 	uxtb	r5, r5
     f44:	1affffd2 	bne	e94 <createdelete+0xd0>
     f48:	e3a04030 	mov	r4, #48	; 0x30
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    name[0] = 'p';
     f4c:	e3a06070 	mov	r6, #112	; 0x70
    name[1] = '0' + i;
    unlink(name);
    name[0] = 'c';
     f50:	e3a05063 	mov	r5, #99	; 0x63
      close(fd);
  }

  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
     f54:	e54b403b 	strb	r4, [fp, #-59]	; 0x3b
    unlink(name);
    name[0] = 'c';
    unlink(name);
     f58:	e2844001 	add	r4, r4, #1
  }

  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
    unlink(name);
     f5c:	e24b003c 	sub	r0, fp, #60	; 0x3c
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    name[0] = 'p';
     f60:	e54b603c 	strb	r6, [fp, #-60]	; 0x3c
    name[1] = '0' + i;
    unlink(name);
    name[0] = 'c';
    unlink(name);
     f64:	e6ef4074 	uxtb	r4, r4
  }

  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
    unlink(name);
     f68:	eb000924 	bl	3400 <unlink>
    name[0] = 'c';
    unlink(name);
     f6c:	e24b003c 	sub	r0, fp, #60	; 0x3c

  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
    unlink(name);
    name[0] = 'c';
     f70:	e54b503c 	strb	r5, [fp, #-60]	; 0x3c
    unlink(name);
     f74:	eb000921 	bl	3400 <unlink>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
     f78:	e3540044 	cmp	r4, #68	; 0x44
     f7c:	1afffff4 	bne	f54 <createdelete+0x190>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
     f80:	e3a00001 	mov	r0, #1
     f84:	e59f1070 	ldr	r1, [pc, #112]	; ffc <createdelete+0x238>
     f88:	eb0009ed 	bl	3744 <printf>
}
     f8c:	e24bd01c 	sub	sp, fp, #28
     f90:	e8bd8df0 	pop	{r4, r5, r6, r7, r8, sl, fp, pc}
    fd = open(name, 0);
    if((i == 0 || i >= N/2) && fd < 0){
      printf(1, "oops createdelete %s didn't exist\n", name);
      exit();
    } else if((i >= 1 && i < N/2) && fd >= 0){
      printf(1, "oops createdelete %s did exist\n", name);
     f94:	e3a00001 	mov	r0, #1
     f98:	e59f1060 	ldr	r1, [pc, #96]	; 1000 <createdelete+0x23c>
     f9c:	e24b203c 	sub	r2, fp, #60	; 0x3c
     fa0:	eb0009e7 	bl	3744 <printf>
      exit();
     fa4:	eb000893 	bl	31f8 <exit>
  name[2] = '\0';
  for(i = 0; i < N; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "create failed\n");
     fa8:	e3a00001 	mov	r0, #1
     fac:	e59f1050 	ldr	r1, [pc, #80]	; 1004 <createdelete+0x240>
     fb0:	eb0009e3 	bl	3744 <printf>
      exit();
     fb4:	eb00088f 	bl	31f8 <exit>

    name[0] = 'c';
    name[1] = '0' + i;
    fd = open(name, 0);
    if((i == 0 || i >= N/2) && fd < 0){
      printf(1, "oops createdelete %s didn't exist\n", name);
     fb8:	e3a00001 	mov	r0, #1
     fbc:	e59f1044 	ldr	r1, [pc, #68]	; 1008 <createdelete+0x244>
     fc0:	e24b203c 	sub	r2, fp, #60	; 0x3c
     fc4:	eb0009de 	bl	3744 <printf>
      exit();
     fc8:	eb00088a 	bl	31f8 <exit>
  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
    fd = open(name, 0);
    if((i == 0 || i >= N/2) && fd < 0){
      printf(1, "oops createdelete %s didn't exist\n", name);
     fcc:	e3a00001 	mov	r0, #1
     fd0:	e59f1030 	ldr	r1, [pc, #48]	; 1008 <createdelete+0x244>
     fd4:	e24b203c 	sub	r2, fp, #60	; 0x3c
     fd8:	eb0009d9 	bl	3744 <printf>
      exit();
     fdc:	eb000885 	bl	31f8 <exit>
  char name[32];

  printf(1, "createdelete test\n");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
     fe0:	e3a00001 	mov	r0, #1
     fe4:	e59f1020 	ldr	r1, [pc, #32]	; 100c <createdelete+0x248>
     fe8:	eb0009d5 	bl	3744 <printf>
    exit();
     fec:	eb000881 	bl	31f8 <exit>
     ff0:	00003fc4 	.word	0x00003fc4
     ff4:	00000202 	.word	0x00000202
     ff8:	00003fd8 	.word	0x00003fd8
     ffc:	0000402c 	.word	0x0000402c
    1000:	0000400c 	.word	0x0000400c
    1004:	00003f70 	.word	0x00003f70
    1008:	00003fe8 	.word	0x00003fe8
    100c:	00005148 	.word	0x00005148

00001010 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1010:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1014:	e3a00001 	mov	r0, #1
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1018:	e28db014 	add	fp, sp, #20
  int fd, fd1;

  printf(1, "unlinkread test\n");
    101c:	e59f1130 	ldr	r1, [pc, #304]	; 1154 <unlinkread+0x144>
    1020:	eb0009c7 	bl	3744 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1024:	e59f012c 	ldr	r0, [pc, #300]	; 1158 <unlinkread+0x148>
    1028:	e59f112c 	ldr	r1, [pc, #300]	; 115c <unlinkread+0x14c>
    102c:	eb0008d9 	bl	3398 <open>
  if(fd < 0){
    1030:	e2504000 	subs	r4, r0, #0
    1034:	ba00002e 	blt	10f4 <unlinkread+0xe4>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1038:	e59f1120 	ldr	r1, [pc, #288]	; 1160 <unlinkread+0x150>
    103c:	e3a02005 	mov	r2, #5
    1040:	eb0008a0 	bl	32c8 <write>
  close(fd);
    1044:	e1a00004 	mov	r0, r4
    1048:	eb0008ab 	bl	32fc <close>

  fd = open("unlinkread", O_RDWR);
    104c:	e59f0104 	ldr	r0, [pc, #260]	; 1158 <unlinkread+0x148>
    1050:	e3a01002 	mov	r1, #2
    1054:	eb0008cf 	bl	3398 <open>
  if(fd < 0){
    1058:	e2504000 	subs	r4, r0, #0
    105c:	ba000038 	blt	1144 <unlinkread+0x134>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    1060:	e59f00f0 	ldr	r0, [pc, #240]	; 1158 <unlinkread+0x148>
    1064:	eb0008e5 	bl	3400 <unlink>
    1068:	e3500000 	cmp	r0, #0
    106c:	1a000030 	bne	1134 <unlinkread+0x124>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1070:	e59f10e4 	ldr	r1, [pc, #228]	; 115c <unlinkread+0x14c>
    1074:	e59f00dc 	ldr	r0, [pc, #220]	; 1158 <unlinkread+0x148>
    1078:	eb0008c6 	bl	3398 <open>
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    107c:	e59f50e0 	ldr	r5, [pc, #224]	; 1164 <unlinkread+0x154>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
    1080:	e59f10e0 	ldr	r1, [pc, #224]	; 1168 <unlinkread+0x158>
    1084:	e3a02003 	mov	r2, #3
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1088:	e1a06000 	mov	r6, r0
  write(fd1, "yyy", 3);
    108c:	eb00088d 	bl	32c8 <write>
  close(fd1);
    1090:	e1a00006 	mov	r0, r6
    1094:	eb000898 	bl	32fc <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    1098:	e1a00004 	mov	r0, r4
    109c:	e1a01005 	mov	r1, r5
    10a0:	e3a02a02 	mov	r2, #8192	; 0x2000
    10a4:	eb00087a 	bl	3294 <read>
    10a8:	e3500005 	cmp	r0, #5
    10ac:	1a00001c 	bne	1124 <unlinkread+0x114>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    10b0:	e5d53000 	ldrb	r3, [r5]
    10b4:	e3530068 	cmp	r3, #104	; 0x68
    10b8:	1a000015 	bne	1114 <unlinkread+0x104>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    10bc:	e1a00004 	mov	r0, r4
    10c0:	e1a01005 	mov	r1, r5
    10c4:	e3a0200a 	mov	r2, #10
    10c8:	eb00087e 	bl	32c8 <write>
    10cc:	e350000a 	cmp	r0, #10
    10d0:	1a00000b 	bne	1104 <unlinkread+0xf4>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    10d4:	e1a00004 	mov	r0, r4
    10d8:	eb000887 	bl	32fc <close>
  unlink("unlinkread");
    10dc:	e59f0074 	ldr	r0, [pc, #116]	; 1158 <unlinkread+0x148>
    10e0:	eb0008c6 	bl	3400 <unlink>
  printf(1, "unlinkread ok\n");
    10e4:	e3a00001 	mov	r0, #1
    10e8:	e59f107c 	ldr	r1, [pc, #124]	; 116c <unlinkread+0x15c>
}
    10ec:	e8bd4878 	pop	{r3, r4, r5, r6, fp, lr}
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
  unlink("unlinkread");
  printf(1, "unlinkread ok\n");
    10f0:	ea000993 	b	3744 <printf>
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    10f4:	e3a00001 	mov	r0, #1
    10f8:	e59f1070 	ldr	r1, [pc, #112]	; 1170 <unlinkread+0x160>
    10fc:	eb000990 	bl	3744 <printf>
    exit();
    1100:	eb00083c 	bl	31f8 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1104:	e3a00001 	mov	r0, #1
    1108:	e59f1064 	ldr	r1, [pc, #100]	; 1174 <unlinkread+0x164>
    110c:	eb00098c 	bl	3744 <printf>
    exit();
    1110:	eb000838 	bl	31f8 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    1114:	e3a00001 	mov	r0, #1
    1118:	e59f1058 	ldr	r1, [pc, #88]	; 1178 <unlinkread+0x168>
    111c:	eb000988 	bl	3744 <printf>
    exit();
    1120:	eb000834 	bl	31f8 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    1124:	e3a00001 	mov	r0, #1
    1128:	e59f104c 	ldr	r1, [pc, #76]	; 117c <unlinkread+0x16c>
    112c:	eb000984 	bl	3744 <printf>
    exit();
    1130:	eb000830 	bl	31f8 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    1134:	e3a00001 	mov	r0, #1
    1138:	e59f1040 	ldr	r1, [pc, #64]	; 1180 <unlinkread+0x170>
    113c:	eb000980 	bl	3744 <printf>
    exit();
    1140:	eb00082c 	bl	31f8 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1144:	e3a00001 	mov	r0, #1
    1148:	e59f1034 	ldr	r1, [pc, #52]	; 1184 <unlinkread+0x174>
    114c:	eb00097c 	bl	3744 <printf>
    exit();
    1150:	eb000828 	bl	31f8 <exit>
    1154:	00004040 	.word	0x00004040
    1158:	00004054 	.word	0x00004054
    115c:	00000202 	.word	0x00000202
    1160:	0000407c 	.word	0x0000407c
    1164:	000079fc 	.word	0x000079fc
    1168:	000040b8 	.word	0x000040b8
    116c:	00004108 	.word	0x00004108
    1170:	00004060 	.word	0x00004060
    1174:	000040ec 	.word	0x000040ec
    1178:	000040d4 	.word	0x000040d4
    117c:	000040bc 	.word	0x000040bc
    1180:	0000409c 	.word	0x0000409c
    1184:	00004084 	.word	0x00004084

00001188 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    1188:	e92d4818 	push	{r3, r4, fp, lr}
  int fd;

  printf(1, "linktest\n");
    118c:	e3a00001 	mov	r0, #1
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    1190:	e28db00c 	add	fp, sp, #12
  int fd;

  printf(1, "linktest\n");
    1194:	e59f1180 	ldr	r1, [pc, #384]	; 131c <linktest+0x194>
    1198:	eb000969 	bl	3744 <printf>

  unlink("lf1");
    119c:	e59f017c 	ldr	r0, [pc, #380]	; 1320 <linktest+0x198>
    11a0:	eb000896 	bl	3400 <unlink>
  unlink("lf2");
    11a4:	e59f0178 	ldr	r0, [pc, #376]	; 1324 <linktest+0x19c>
    11a8:	eb000894 	bl	3400 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    11ac:	e59f016c 	ldr	r0, [pc, #364]	; 1320 <linktest+0x198>
    11b0:	e59f1170 	ldr	r1, [pc, #368]	; 1328 <linktest+0x1a0>
    11b4:	eb000877 	bl	3398 <open>
  if(fd < 0){
    11b8:	e2504000 	subs	r4, r0, #0
    11bc:	ba000033 	blt	1290 <linktest+0x108>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    11c0:	e59f1164 	ldr	r1, [pc, #356]	; 132c <linktest+0x1a4>
    11c4:	e3a02005 	mov	r2, #5
    11c8:	eb00083e 	bl	32c8 <write>
    11cc:	e3500005 	cmp	r0, #5
    11d0:	1a00004d 	bne	130c <linktest+0x184>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    11d4:	e1a00004 	mov	r0, r4
    11d8:	eb000847 	bl	32fc <close>

  if(link("lf1", "lf2") < 0){
    11dc:	e59f013c 	ldr	r0, [pc, #316]	; 1320 <linktest+0x198>
    11e0:	e59f113c 	ldr	r1, [pc, #316]	; 1324 <linktest+0x19c>
    11e4:	eb00089f 	bl	3468 <link>
    11e8:	e3500000 	cmp	r0, #0
    11ec:	ba000042 	blt	12fc <linktest+0x174>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    11f0:	e59f0128 	ldr	r0, [pc, #296]	; 1320 <linktest+0x198>
    11f4:	eb000881 	bl	3400 <unlink>

  if(open("lf1", 0) >= 0){
    11f8:	e59f0120 	ldr	r0, [pc, #288]	; 1320 <linktest+0x198>
    11fc:	e3a01000 	mov	r1, #0
    1200:	eb000864 	bl	3398 <open>
    1204:	e3500000 	cmp	r0, #0
    1208:	aa000037 	bge	12ec <linktest+0x164>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    120c:	e59f0110 	ldr	r0, [pc, #272]	; 1324 <linktest+0x19c>
    1210:	e3a01000 	mov	r1, #0
    1214:	eb00085f 	bl	3398 <open>
  if(fd < 0){
    1218:	e2504000 	subs	r4, r0, #0
    121c:	ba00002e 	blt	12dc <linktest+0x154>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    1220:	e59f1108 	ldr	r1, [pc, #264]	; 1330 <linktest+0x1a8>
    1224:	e3a02a02 	mov	r2, #8192	; 0x2000
    1228:	eb000819 	bl	3294 <read>
    122c:	e3500005 	cmp	r0, #5
    1230:	1a000025 	bne	12cc <linktest+0x144>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    1234:	e1a00004 	mov	r0, r4
    1238:	eb00082f 	bl	32fc <close>

  if(link("lf2", "lf2") >= 0){
    123c:	e59f00e0 	ldr	r0, [pc, #224]	; 1324 <linktest+0x19c>
    1240:	e1a01000 	mov	r1, r0
    1244:	eb000887 	bl	3468 <link>
    1248:	e3500000 	cmp	r0, #0
    124c:	aa00001a 	bge	12bc <linktest+0x134>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    1250:	e59f00cc 	ldr	r0, [pc, #204]	; 1324 <linktest+0x19c>
    1254:	eb000869 	bl	3400 <unlink>
  if(link("lf2", "lf1") >= 0){
    1258:	e59f00c4 	ldr	r0, [pc, #196]	; 1324 <linktest+0x19c>
    125c:	e59f10bc 	ldr	r1, [pc, #188]	; 1320 <linktest+0x198>
    1260:	eb000880 	bl	3468 <link>
    1264:	e3500000 	cmp	r0, #0
    1268:	aa00000f 	bge	12ac <linktest+0x124>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    126c:	e59f00c0 	ldr	r0, [pc, #192]	; 1334 <linktest+0x1ac>
    1270:	e59f10a8 	ldr	r1, [pc, #168]	; 1320 <linktest+0x198>
    1274:	eb00087b 	bl	3468 <link>
    1278:	e3500000 	cmp	r0, #0
    printf(1, "link . lf1 succeeded! oops\n");
    127c:	e3a00001 	mov	r0, #1
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    1280:	aa000006 	bge	12a0 <linktest+0x118>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    1284:	e59f10ac 	ldr	r1, [pc, #172]	; 1338 <linktest+0x1b0>
}
    1288:	e8bd4818 	pop	{r3, r4, fp, lr}
  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    128c:	ea00092c 	b	3744 <printf>
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1290:	e3a00001 	mov	r0, #1
    1294:	e59f10a0 	ldr	r1, [pc, #160]	; 133c <linktest+0x1b4>
    1298:	eb000929 	bl	3744 <printf>
    exit();
    129c:	eb0007d5 	bl	31f8 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    12a0:	e59f1098 	ldr	r1, [pc, #152]	; 1340 <linktest+0x1b8>
    12a4:	eb000926 	bl	3744 <printf>
    exit();
    12a8:	eb0007d2 	bl	31f8 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    12ac:	e3a00001 	mov	r0, #1
    12b0:	e59f108c 	ldr	r1, [pc, #140]	; 1344 <linktest+0x1bc>
    12b4:	eb000922 	bl	3744 <printf>
    exit();
    12b8:	eb0007ce 	bl	31f8 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    12bc:	e3a00001 	mov	r0, #1
    12c0:	e59f1080 	ldr	r1, [pc, #128]	; 1348 <linktest+0x1c0>
    12c4:	eb00091e 	bl	3744 <printf>
    exit();
    12c8:	eb0007ca 	bl	31f8 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    12cc:	e3a00001 	mov	r0, #1
    12d0:	e59f1074 	ldr	r1, [pc, #116]	; 134c <linktest+0x1c4>
    12d4:	eb00091a 	bl	3744 <printf>
    exit();
    12d8:	eb0007c6 	bl	31f8 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    12dc:	e3a00001 	mov	r0, #1
    12e0:	e59f1068 	ldr	r1, [pc, #104]	; 1350 <linktest+0x1c8>
    12e4:	eb000916 	bl	3744 <printf>
    exit();
    12e8:	eb0007c2 	bl	31f8 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    12ec:	e3a00001 	mov	r0, #1
    12f0:	e59f105c 	ldr	r1, [pc, #92]	; 1354 <linktest+0x1cc>
    12f4:	eb000912 	bl	3744 <printf>
    exit();
    12f8:	eb0007be 	bl	31f8 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    12fc:	e3a00001 	mov	r0, #1
    1300:	e59f1050 	ldr	r1, [pc, #80]	; 1358 <linktest+0x1d0>
    1304:	eb00090e 	bl	3744 <printf>
    exit();
    1308:	eb0007ba 	bl	31f8 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    130c:	e3a00001 	mov	r0, #1
    1310:	e59f1044 	ldr	r1, [pc, #68]	; 135c <linktest+0x1d4>
    1314:	eb00090a 	bl	3744 <printf>
    exit();
    1318:	eb0007b6 	bl	31f8 <exit>
    131c:	00004118 	.word	0x00004118
    1320:	00004124 	.word	0x00004124
    1324:	00004128 	.word	0x00004128
    1328:	00000202 	.word	0x00000202
    132c:	0000407c 	.word	0x0000407c
    1330:	000079fc 	.word	0x000079fc
    1334:	00004200 	.word	0x00004200
    1338:	00004220 	.word	0x00004220
    133c:	0000412c 	.word	0x0000412c
    1340:	00004204 	.word	0x00004204
    1344:	000041dc 	.word	0x000041dc
    1348:	000041bc 	.word	0x000041bc
    134c:	000041a8 	.word	0x000041a8
    1350:	00004194 	.word	0x00004194
    1354:	0000416c 	.word	0x0000416c
    1358:	00004154 	.word	0x00004154
    135c:	00004140 	.word	0x00004140

00001360 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1360:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    1364:	e28db018 	add	fp, sp, #24
    1368:	e24dd044 	sub	sp, sp, #68	; 0x44
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    136c:	e3a00001 	mov	r0, #1
    1370:	e59f12dc 	ldr	r1, [pc, #732]	; 1654 <concreate+0x2f4>
    1374:	eb0008f2 	bl	3744 <printf>
  file[0] = 'C';
  file[2] = '\0';
    1378:	e3a03000 	mov	r3, #0
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
    137c:	e3a02043 	mov	r2, #67	; 0x43
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1380:	e59f72d0 	ldr	r7, [pc, #720]	; 1658 <concreate+0x2f8>
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    1384:	e59f82d0 	ldr	r8, [pc, #720]	; 165c <concreate+0x2fc>
    char name[14];
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
    1388:	e3a05030 	mov	r5, #48	; 0x30
  for(i = 0; i < 40; i++){
    138c:	e1a04003 	mov	r4, r3
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
    1390:	e54b2020 	strb	r2, [fp, #-32]
  file[2] = '\0';
    1394:	e54b301e 	strb	r3, [fp, #-30]
    1398:	ea000013 	b	13ec <concreate+0x8c>
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    139c:	e0c32498 	smull	r2, r3, r8, r4
    13a0:	e0433fc4 	sub	r3, r3, r4, asr #31
    13a4:	e0833083 	add	r3, r3, r3, lsl #1
    13a8:	e0633004 	rsb	r3, r3, r4
    13ac:	e3530001 	cmp	r3, #1
    13b0:	0a00001e 	beq	1430 <concreate+0xd0>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    13b4:	e24b0020 	sub	r0, fp, #32
    13b8:	e59f12a0 	ldr	r1, [pc, #672]	; 1660 <concreate+0x300>
    13bc:	eb0007f5 	bl	3398 <open>
      if(fd < 0){
    13c0:	e3500000 	cmp	r0, #0
    13c4:	ba00008f 	blt	1608 <concreate+0x2a8>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    13c8:	eb0007cb 	bl	32fc <close>
    }
    if(pid == 0)
    13cc:	e3560000 	cmp	r6, #0
    13d0:	0a000015 	beq	142c <concreate+0xcc>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    13d4:	e2844001 	add	r4, r4, #1
    13d8:	e2855001 	add	r5, r5, #1
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    13dc:	eb000792 	bl	322c <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    13e0:	e3540028 	cmp	r4, #40	; 0x28
    13e4:	e6ef5075 	uxtb	r5, r5
    13e8:	0a000019 	beq	1454 <concreate+0xf4>
    file[1] = '0' + i;
    unlink(file);
    13ec:	e24b0020 	sub	r0, fp, #32

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    13f0:	e54b501f 	strb	r5, [fp, #-31]
    unlink(file);
    13f4:	eb000801 	bl	3400 <unlink>
    pid = fork();
    13f8:	eb000771 	bl	31c4 <fork>
    if(pid && (i % 3) == 1){
    13fc:	e2506000 	subs	r6, r0, #0
    1400:	1affffe5 	bne	139c <concreate+0x3c>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1404:	e0c23497 	smull	r3, r2, r7, r4
    1408:	e1a03fc4 	asr	r3, r4, #31
    140c:	e06330c2 	rsb	r3, r3, r2, asr #1
    1410:	e0833103 	add	r3, r3, r3, lsl #2
    1414:	e0633004 	rsb	r3, r3, r4
    1418:	e3530001 	cmp	r3, #1
    141c:	1affffe4 	bne	13b4 <concreate+0x54>
      link("C0", file);
    1420:	e24b1020 	sub	r1, fp, #32
    1424:	e59f0238 	ldr	r0, [pc, #568]	; 1664 <concreate+0x304>
    1428:	eb00080e 	bl	3468 <link>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
    142c:	eb000771 	bl	31f8 <exit>
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1430:	e24b1020 	sub	r1, fp, #32
    1434:	e59f0228 	ldr	r0, [pc, #552]	; 1664 <concreate+0x304>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1438:	e2844001 	add	r4, r4, #1
    143c:	e2855001 	add	r5, r5, #1
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1440:	eb000808 	bl	3468 <link>
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    1444:	eb000778 	bl	322c <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1448:	e3540028 	cmp	r4, #40	; 0x28
    144c:	e6ef5075 	uxtb	r5, r5
    1450:	1affffe5 	bne	13ec <concreate+0x8c>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1454:	e1a02004 	mov	r2, r4
    1458:	e3a01000 	mov	r1, #0
    145c:	e24b0058 	sub	r0, fp, #88	; 0x58
    1460:	eb0006e9 	bl	300c <memset>
  fd = open(".", 0);
    1464:	e59f01fc 	ldr	r0, [pc, #508]	; 1668 <concreate+0x308>
    1468:	e3a01000 	mov	r1, #0
    146c:	eb0007c9 	bl	3398 <open>
  n = 0;
    1470:	e3a05000 	mov	r5, #0
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1474:	e3a06001 	mov	r6, #1
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    1478:	e1a04000 	mov	r4, r0
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    147c:	e1a00004 	mov	r0, r4
    1480:	e24b1030 	sub	r1, fp, #48	; 0x30
    1484:	e3a02010 	mov	r2, #16
    1488:	eb000781 	bl	3294 <read>
    148c:	e3500000 	cmp	r0, #0
    1490:	da000019 	ble	14fc <concreate+0x19c>
    if(de.inum == 0)
    1494:	e15b33b0 	ldrh	r3, [fp, #-48]	; 0xffffffd0
    1498:	e3530000 	cmp	r3, #0
    149c:	0afffff6 	beq	147c <concreate+0x11c>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    14a0:	e55b302e 	ldrb	r3, [fp, #-46]	; 0x2e
    14a4:	e3530043 	cmp	r3, #67	; 0x43
    14a8:	1afffff3 	bne	147c <concreate+0x11c>
    14ac:	e55b302c 	ldrb	r3, [fp, #-44]	; 0x2c
    14b0:	e3530000 	cmp	r3, #0
    14b4:	1afffff0 	bne	147c <concreate+0x11c>
      i = de.name[1] - '0';
    14b8:	e55b302d 	ldrb	r3, [fp, #-45]	; 0x2d
    14bc:	e2433030 	sub	r3, r3, #48	; 0x30
      if(i < 0 || i >= sizeof(fa)){
    14c0:	e3530027 	cmp	r3, #39	; 0x27
    14c4:	8a00005d 	bhi	1640 <concreate+0x2e0>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    14c8:	e24b201c 	sub	r2, fp, #28
    14cc:	e0823003 	add	r3, r2, r3
    14d0:	e553203c 	ldrb	r2, [r3, #-60]	; 0x3c
    14d4:	e3520000 	cmp	r2, #0
    14d8:	1a000053 	bne	162c <concreate+0x2cc>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    14dc:	e543603c 	strb	r6, [r3, #-60]	; 0x3c
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    14e0:	e1a00004 	mov	r0, r4
    14e4:	e24b1030 	sub	r1, fp, #48	; 0x30
    14e8:	e3a02010 	mov	r2, #16
    14ec:	eb000768 	bl	3294 <read>
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
      n++;
    14f0:	e2855001 	add	r5, r5, #1
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    14f4:	e3500000 	cmp	r0, #0
    14f8:	caffffe5 	bgt	1494 <concreate+0x134>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    14fc:	e1a00004 	mov	r0, r4
    1500:	eb00077d 	bl	32fc <close>

  if(n != 40){
    1504:	e3550028 	cmp	r5, #40	; 0x28
    1508:	1a000043 	bne	161c <concreate+0x2bc>
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    150c:	e59f7148 	ldr	r7, [pc, #328]	; 165c <concreate+0x2fc>
      n++;
    }
  }
  close(fd);

  if(n != 40){
    1510:	e3a06030 	mov	r6, #48	; 0x30
    1514:	e3a04000 	mov	r4, #0
    1518:	ea000017 	b	157c <concreate+0x21c>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
      close(open(file, 0));
    151c:	e3a01000 	mov	r1, #0
    1520:	e24b0020 	sub	r0, fp, #32
    1524:	eb00079b 	bl	3398 <open>
    1528:	eb000773 	bl	32fc <close>
      close(open(file, 0));
    152c:	e3a01000 	mov	r1, #0
    1530:	e24b0020 	sub	r0, fp, #32
    1534:	eb000797 	bl	3398 <open>
    1538:	eb00076f 	bl	32fc <close>
      close(open(file, 0));
    153c:	e3a01000 	mov	r1, #0
    1540:	e24b0020 	sub	r0, fp, #32
    1544:	eb000793 	bl	3398 <open>
    1548:	eb00076b 	bl	32fc <close>
      close(open(file, 0));
    154c:	e3a01000 	mov	r1, #0
    1550:	e24b0020 	sub	r0, fp, #32
    1554:	eb00078f 	bl	3398 <open>
    1558:	eb000767 	bl	32fc <close>
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    155c:	e3550000 	cmp	r5, #0
    1560:	0affffb1 	beq	142c <concreate+0xcc>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1564:	e2844001 	add	r4, r4, #1
    1568:	e2866001 	add	r6, r6, #1
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    156c:	eb00072e 	bl	322c <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1570:	e3540028 	cmp	r4, #40	; 0x28
    1574:	e6ef6076 	uxtb	r6, r6
    1578:	0a000019 	beq	15e4 <concreate+0x284>
    file[1] = '0' + i;
    157c:	e54b601f 	strb	r6, [fp, #-31]
    pid = fork();
    1580:	eb00070f 	bl	31c4 <fork>
    if(pid < 0){
    1584:	e2505000 	subs	r5, r0, #0
    1588:	ba00001a 	blt	15f8 <concreate+0x298>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    158c:	e0c32497 	smull	r2, r3, r7, r4
    1590:	e0433fc4 	sub	r3, r3, r4, asr #31
    1594:	e0833083 	add	r3, r3, r3, lsl #1
    1598:	e0633004 	rsb	r3, r3, r4
    159c:	e1932005 	orrs	r2, r3, r5
    15a0:	0affffdd 	beq	151c <concreate+0x1bc>
    15a4:	e2432001 	sub	r2, r3, #1
    15a8:	e2723000 	rsbs	r3, r2, #0
    15ac:	e0a33002 	adc	r3, r3, r2
    15b0:	e3550000 	cmp	r5, #0
    15b4:	03a03000 	moveq	r3, #0
    15b8:	e3530000 	cmp	r3, #0
    15bc:	1affffd6 	bne	151c <concreate+0x1bc>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    15c0:	e24b0020 	sub	r0, fp, #32
    15c4:	eb00078d 	bl	3400 <unlink>
      unlink(file);
    15c8:	e24b0020 	sub	r0, fp, #32
    15cc:	eb00078b 	bl	3400 <unlink>
      unlink(file);
    15d0:	e24b0020 	sub	r0, fp, #32
    15d4:	eb000789 	bl	3400 <unlink>
      unlink(file);
    15d8:	e24b0020 	sub	r0, fp, #32
    15dc:	eb000787 	bl	3400 <unlink>
    15e0:	eaffffdd 	b	155c <concreate+0x1fc>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    15e4:	e3a00001 	mov	r0, #1
    15e8:	e59f107c 	ldr	r1, [pc, #124]	; 166c <concreate+0x30c>
    15ec:	eb000854 	bl	3744 <printf>
}
    15f0:	e24bd018 	sub	sp, fp, #24
    15f4:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    15f8:	e3a00001 	mov	r0, #1
    15fc:	e59f106c 	ldr	r1, [pc, #108]	; 1670 <concreate+0x310>
    1600:	eb00084f 	bl	3744 <printf>
      exit();
    1604:	eb0006fb 	bl	31f8 <exit>
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
    1608:	e3a00001 	mov	r0, #1
    160c:	e59f1060 	ldr	r1, [pc, #96]	; 1674 <concreate+0x314>
    1610:	e24b2020 	sub	r2, fp, #32
    1614:	eb00084a 	bl	3744 <printf>
        exit();
    1618:	eb0006f6 	bl	31f8 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    161c:	e3a00001 	mov	r0, #1
    1620:	e59f1050 	ldr	r1, [pc, #80]	; 1678 <concreate+0x318>
    1624:	eb000846 	bl	3744 <printf>
    exit();
    1628:	eb0006f2 	bl	31f8 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    162c:	e3a00001 	mov	r0, #1
    1630:	e59f1044 	ldr	r1, [pc, #68]	; 167c <concreate+0x31c>
    1634:	e24b202e 	sub	r2, fp, #46	; 0x2e
    1638:	eb000841 	bl	3744 <printf>
        exit();
    163c:	eb0006ed 	bl	31f8 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1640:	e3a00001 	mov	r0, #1
    1644:	e59f1034 	ldr	r1, [pc, #52]	; 1680 <concreate+0x320>
    1648:	e24b202e 	sub	r2, fp, #46	; 0x2e
    164c:	eb00083c 	bl	3744 <printf>
        exit();
    1650:	eb0006e8 	bl	31f8 <exit>
    1654:	00004230 	.word	0x00004230
    1658:	66666667 	.word	0x66666667
    165c:	55555556 	.word	0x55555556
    1660:	00000202 	.word	0x00000202
    1664:	00004240 	.word	0x00004240
    1668:	00004200 	.word	0x00004200
    166c:	000042d0 	.word	0x000042d0
    1670:	00005148 	.word	0x00005148
    1674:	00004244 	.word	0x00004244
    1678:	0000429c 	.word	0x0000429c
    167c:	0000427c 	.word	0x0000427c
    1680:	00004260 	.word	0x00004260

00001684 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1684:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  int pid, i;

  printf(1, "linkunlink test\n");
    1688:	e3a00001 	mov	r0, #1

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    168c:	e28db01c 	add	fp, sp, #28
  int pid, i;

  printf(1, "linkunlink test\n");
    1690:	e59f10bc 	ldr	r1, [pc, #188]	; 1754 <linkunlink+0xd0>
    1694:	eb00082a 	bl	3744 <printf>

  unlink("x");
    1698:	e59f00b8 	ldr	r0, [pc, #184]	; 1758 <linkunlink+0xd4>
    169c:	eb000757 	bl	3400 <unlink>
  pid = fork();
    16a0:	eb0006c7 	bl	31c4 <fork>
  if(pid < 0){
    16a4:	e2508000 	subs	r8, r0, #0
    16a8:	ba000024 	blt	1740 <linkunlink+0xbc>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    16ac:	13a04001 	movne	r4, #1
    16b0:	03a04061 	moveq	r4, #97	; 0x61
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    16b4:	e59f70a0 	ldr	r7, [pc, #160]	; 175c <linkunlink+0xd8>
    if((x % 3) == 0){
    16b8:	e59f60a0 	ldr	r6, [pc, #160]	; 1760 <linkunlink+0xdc>
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    16bc:	e3a05064 	mov	r5, #100	; 0x64
    16c0:	ea000005 	b	16dc <linkunlink+0x58>
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    16c4:	e3530001 	cmp	r3, #1
    16c8:	0a000018 	beq	1730 <linkunlink+0xac>
      link("cat", "x");
    } else {
      unlink("x");
    16cc:	e59f0084 	ldr	r0, [pc, #132]	; 1758 <linkunlink+0xd4>
    16d0:	eb00074a 	bl	3400 <unlink>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    16d4:	e2555001 	subs	r5, r5, #1
    16d8:	0a00000d 	beq	1714 <linkunlink+0x90>
    x = x * 1103515245 + 12345;
    16dc:	e0040497 	mul	r4, r7, r4
    16e0:	e2844a03 	add	r4, r4, #12288	; 0x3000
    16e4:	e2844039 	add	r4, r4, #57	; 0x39
    if((x % 3) == 0){
    16e8:	e0832496 	umull	r2, r3, r6, r4
    16ec:	e1a030a3 	lsr	r3, r3, #1
    16f0:	e0833083 	add	r3, r3, r3, lsl #1
    16f4:	e0543003 	subs	r3, r4, r3
    16f8:	1afffff1 	bne	16c4 <linkunlink+0x40>
      close(open("x", O_RDWR | O_CREATE));
    16fc:	e59f1060 	ldr	r1, [pc, #96]	; 1764 <linkunlink+0xe0>
    1700:	e59f0050 	ldr	r0, [pc, #80]	; 1758 <linkunlink+0xd4>
    1704:	eb000723 	bl	3398 <open>
    1708:	eb0006fb 	bl	32fc <close>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    170c:	e2555001 	subs	r5, r5, #1
    1710:	1afffff1 	bne	16dc <linkunlink+0x58>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1714:	e3580000 	cmp	r8, #0
    1718:	0a00000c 	beq	1750 <linkunlink+0xcc>
    wait();
    171c:	eb0006c2 	bl	322c <wait>
  else 
    exit();

  printf(1, "linkunlink ok\n");
    1720:	e3a00001 	mov	r0, #1
    1724:	e59f103c 	ldr	r1, [pc, #60]	; 1768 <linkunlink+0xe4>
}
    1728:	e8bd49f8 	pop	{r3, r4, r5, r6, r7, r8, fp, lr}
  if(pid)
    wait();
  else 
    exit();

  printf(1, "linkunlink ok\n");
    172c:	ea000804 	b	3744 <printf>
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1730:	e59f1020 	ldr	r1, [pc, #32]	; 1758 <linkunlink+0xd4>
    1734:	e59f0030 	ldr	r0, [pc, #48]	; 176c <linkunlink+0xe8>
    1738:	eb00074a 	bl	3468 <link>
    173c:	eaffffe4 	b	16d4 <linkunlink+0x50>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1740:	e3a00001 	mov	r0, #1
    1744:	e59f1024 	ldr	r1, [pc, #36]	; 1770 <linkunlink+0xec>
    1748:	eb0007fd 	bl	3744 <printf>
    exit();
    174c:	eb0006a9 	bl	31f8 <exit>
  }

  if(pid)
    wait();
  else 
    exit();
    1750:	eb0006a8 	bl	31f8 <exit>
    1754:	000042e0 	.word	0x000042e0
    1758:	00004760 	.word	0x00004760
    175c:	41c64e6d 	.word	0x41c64e6d
    1760:	aaaaaaab 	.word	0xaaaaaaab
    1764:	00000202 	.word	0x00000202
    1768:	000042f8 	.word	0x000042f8
    176c:	000042f4 	.word	0x000042f4
    1770:	00005148 	.word	0x00005148

00001774 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1774:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    1778:	e28db014 	add	fp, sp, #20
    177c:	e24dd010 	sub	sp, sp, #16
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1780:	e59f1104 	ldr	r1, [pc, #260]	; 188c <bigdir+0x118>
    1784:	e3a00001 	mov	r0, #1
    1788:	eb0007ed 	bl	3744 <printf>
  unlink("bd");
    178c:	e59f00fc 	ldr	r0, [pc, #252]	; 1890 <bigdir+0x11c>
    1790:	eb00071a 	bl	3400 <unlink>

  fd = open("bd", O_CREATE);
    1794:	e59f00f4 	ldr	r0, [pc, #244]	; 1890 <bigdir+0x11c>
    1798:	e3a01c02 	mov	r1, #512	; 0x200
    179c:	eb0006fd 	bl	3398 <open>
  if(fd < 0){
    17a0:	e3500000 	cmp	r0, #0
    17a4:	ba000034 	blt	187c <bigdir+0x108>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    17a8:	eb0006d3 	bl	32fc <close>

  for(i = 0; i < 500; i++){
    17ac:	e3a04000 	mov	r4, #0
    name[0] = 'x';
    17b0:	e3a06078 	mov	r6, #120	; 0x78
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    17b4:	e1a05004 	mov	r5, r4
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    17b8:	e1a02344 	asr	r2, r4, #6
    name[2] = '0' + (i % 64);
    17bc:	e204303f 	and	r3, r4, #63	; 0x3f
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    17c0:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    17c4:	e2833030 	add	r3, r3, #48	; 0x30
    name[3] = '\0';
    if(link("bd", name) != 0){
    17c8:	e59f00c0 	ldr	r0, [pc, #192]	; 1890 <bigdir+0x11c>
    17cc:	e24b1020 	sub	r1, fp, #32
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    17d0:	e54b6020 	strb	r6, [fp, #-32]
    name[1] = '0' + (i / 64);
    17d4:	e54b201f 	strb	r2, [fp, #-31]
    name[2] = '0' + (i % 64);
    17d8:	e54b301e 	strb	r3, [fp, #-30]
    name[3] = '\0';
    17dc:	e54b501d 	strb	r5, [fp, #-29]
    if(link("bd", name) != 0){
    17e0:	eb000720 	bl	3468 <link>
    17e4:	e2507000 	subs	r7, r0, #0
    17e8:	1a00001b 	bne	185c <bigdir+0xe8>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    17ec:	e2844001 	add	r4, r4, #1
    17f0:	e3540f7d 	cmp	r4, #500	; 0x1f4
    17f4:	1affffef 	bne	17b8 <bigdir+0x44>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    17f8:	e59f0090 	ldr	r0, [pc, #144]	; 1890 <bigdir+0x11c>
    17fc:	eb0006ff 	bl	3400 <unlink>
  for(i = 0; i < 500; i++){
    1800:	e1a04007 	mov	r4, r7
    name[0] = 'x';
    1804:	e3a06078 	mov	r6, #120	; 0x78
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1808:	e1a05007 	mov	r5, r7
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    180c:	e1a02344 	asr	r2, r4, #6
    name[2] = '0' + (i % 64);
    1810:	e204303f 	and	r3, r4, #63	; 0x3f
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1814:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    1818:	e2833030 	add	r3, r3, #48	; 0x30
    name[3] = '\0';
    if(unlink(name) != 0){
    181c:	e24b0020 	sub	r0, fp, #32
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1820:	e54b6020 	strb	r6, [fp, #-32]
    name[1] = '0' + (i / 64);
    1824:	e54b201f 	strb	r2, [fp, #-31]
    name[2] = '0' + (i % 64);
    1828:	e54b301e 	strb	r3, [fp, #-30]
    name[3] = '\0';
    182c:	e54b501d 	strb	r5, [fp, #-29]
    if(unlink(name) != 0){
    1830:	eb0006f2 	bl	3400 <unlink>
    1834:	e3500000 	cmp	r0, #0
    1838:	1a00000b 	bne	186c <bigdir+0xf8>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    183c:	e2844001 	add	r4, r4, #1
    1840:	e3540f7d 	cmp	r4, #500	; 0x1f4
    1844:	1afffff0 	bne	180c <bigdir+0x98>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1848:	e3a00001 	mov	r0, #1
    184c:	e59f1040 	ldr	r1, [pc, #64]	; 1894 <bigdir+0x120>
    1850:	eb0007bb 	bl	3744 <printf>
}
    1854:	e24bd014 	sub	sp, fp, #20
    1858:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    185c:	e3a00001 	mov	r0, #1
    1860:	e59f1030 	ldr	r1, [pc, #48]	; 1898 <bigdir+0x124>
    1864:	eb0007b6 	bl	3744 <printf>
      exit();
    1868:	eb000662 	bl	31f8 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    186c:	e3a00001 	mov	r0, #1
    1870:	e59f1024 	ldr	r1, [pc, #36]	; 189c <bigdir+0x128>
    1874:	eb0007b2 	bl	3744 <printf>
      exit();
    1878:	eb00065e 	bl	31f8 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    187c:	e3a00001 	mov	r0, #1
    1880:	e59f1018 	ldr	r1, [pc, #24]	; 18a0 <bigdir+0x12c>
    1884:	eb0007ae 	bl	3744 <printf>
    exit();
    1888:	eb00065a 	bl	31f8 <exit>
    188c:	00004308 	.word	0x00004308
    1890:	00004318 	.word	0x00004318
    1894:	00004360 	.word	0x00004360
    1898:	00004334 	.word	0x00004334
    189c:	00004348 	.word	0x00004348
    18a0:	0000431c 	.word	0x0000431c

000018a4 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    18a4:	e92d4830 	push	{r4, r5, fp, lr}
  int fd, cc;

  printf(1, "subdir test\n");
    18a8:	e3a00001 	mov	r0, #1
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    18ac:	e28db00c 	add	fp, sp, #12
  int fd, cc;

  printf(1, "subdir test\n");
    18b0:	e59f1520 	ldr	r1, [pc, #1312]	; 1dd8 <subdir+0x534>
    18b4:	eb0007a2 	bl	3744 <printf>

  unlink("ff");
    18b8:	e59f051c 	ldr	r0, [pc, #1308]	; 1ddc <subdir+0x538>
    18bc:	eb0006cf 	bl	3400 <unlink>
  if(mkdir("dd") != 0){
    18c0:	e59f0518 	ldr	r0, [pc, #1304]	; 1de0 <subdir+0x53c>
    18c4:	eb0006f4 	bl	349c <mkdir>
    18c8:	e3500000 	cmp	r0, #0
    18cc:	1a00010e 	bne	1d0c <subdir+0x468>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    18d0:	e59f050c 	ldr	r0, [pc, #1292]	; 1de4 <subdir+0x540>
    18d4:	e59f150c 	ldr	r1, [pc, #1292]	; 1de8 <subdir+0x544>
    18d8:	eb0006ae 	bl	3398 <open>
  if(fd < 0){
    18dc:	e2504000 	subs	r4, r0, #0
    18e0:	ba000105 	blt	1cfc <subdir+0x458>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    18e4:	e59f14f0 	ldr	r1, [pc, #1264]	; 1ddc <subdir+0x538>
    18e8:	e3a02002 	mov	r2, #2
    18ec:	eb000675 	bl	32c8 <write>
  close(fd);
    18f0:	e1a00004 	mov	r0, r4
    18f4:	eb000680 	bl	32fc <close>
  
  if(unlink("dd") >= 0){
    18f8:	e59f04e0 	ldr	r0, [pc, #1248]	; 1de0 <subdir+0x53c>
    18fc:	eb0006bf 	bl	3400 <unlink>
    1900:	e3500000 	cmp	r0, #0
    1904:	aa0000f8 	bge	1cec <subdir+0x448>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1908:	e59f04dc 	ldr	r0, [pc, #1244]	; 1dec <subdir+0x548>
    190c:	eb0006e2 	bl	349c <mkdir>
    1910:	e2504000 	subs	r4, r0, #0
    1914:	1a0000f0 	bne	1cdc <subdir+0x438>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1918:	e59f04d0 	ldr	r0, [pc, #1232]	; 1df0 <subdir+0x54c>
    191c:	e59f14c4 	ldr	r1, [pc, #1220]	; 1de8 <subdir+0x544>
    1920:	eb00069c 	bl	3398 <open>
  if(fd < 0){
    1924:	e2505000 	subs	r5, r0, #0
    1928:	ba0000bf 	blt	1c2c <subdir+0x388>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    192c:	e59f14c0 	ldr	r1, [pc, #1216]	; 1df4 <subdir+0x550>
    1930:	e3a02002 	mov	r2, #2
    1934:	eb000663 	bl	32c8 <write>
  close(fd);
    1938:	e1a00005 	mov	r0, r5
    193c:	eb00066e 	bl	32fc <close>

  fd = open("dd/dd/../ff", 0);
    1940:	e59f04b0 	ldr	r0, [pc, #1200]	; 1df8 <subdir+0x554>
    1944:	e1a01004 	mov	r1, r4
    1948:	eb000692 	bl	3398 <open>
  if(fd < 0){
    194c:	e2505000 	subs	r5, r0, #0
    1950:	ba0000b1 	blt	1c1c <subdir+0x378>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1954:	e59f44a0 	ldr	r4, [pc, #1184]	; 1dfc <subdir+0x558>
    1958:	e3a02a02 	mov	r2, #8192	; 0x2000
    195c:	e1a01004 	mov	r1, r4
    1960:	eb00064b 	bl	3294 <read>
  if(cc != 2 || buf[0] != 'f'){
    1964:	e3500002 	cmp	r0, #2
    1968:	1a00008f 	bne	1bac <subdir+0x308>
    196c:	e5d43000 	ldrb	r3, [r4]
    1970:	e3530066 	cmp	r3, #102	; 0x66
    1974:	1a00008c 	bne	1bac <subdir+0x308>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1978:	e1a00005 	mov	r0, r5
    197c:	eb00065e 	bl	32fc <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1980:	e59f0468 	ldr	r0, [pc, #1128]	; 1df0 <subdir+0x54c>
    1984:	e59f1474 	ldr	r1, [pc, #1140]	; 1e00 <subdir+0x55c>
    1988:	eb0006b6 	bl	3468 <link>
    198c:	e3500000 	cmp	r0, #0
    1990:	1a0000ad 	bne	1c4c <subdir+0x3a8>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1994:	e59f0454 	ldr	r0, [pc, #1108]	; 1df0 <subdir+0x54c>
    1998:	eb000698 	bl	3400 <unlink>
    199c:	e3500000 	cmp	r0, #0
    19a0:	1a000089 	bne	1bcc <subdir+0x328>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    19a4:	e59f0444 	ldr	r0, [pc, #1092]	; 1df0 <subdir+0x54c>
    19a8:	e3a01000 	mov	r1, #0
    19ac:	eb000679 	bl	3398 <open>
    19b0:	e3500000 	cmp	r0, #0
    19b4:	aa0000c4 	bge	1ccc <subdir+0x428>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    19b8:	e59f0420 	ldr	r0, [pc, #1056]	; 1de0 <subdir+0x53c>
    19bc:	eb0006c3 	bl	34d0 <chdir>
    19c0:	e3500000 	cmp	r0, #0
    19c4:	1a0000bc 	bne	1cbc <subdir+0x418>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    19c8:	e59f0434 	ldr	r0, [pc, #1076]	; 1e04 <subdir+0x560>
    19cc:	eb0006bf 	bl	34d0 <chdir>
    19d0:	e3500000 	cmp	r0, #0
    19d4:	1a000078 	bne	1bbc <subdir+0x318>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    19d8:	e59f0428 	ldr	r0, [pc, #1064]	; 1e08 <subdir+0x564>
    19dc:	eb0006bb 	bl	34d0 <chdir>
    19e0:	e3500000 	cmp	r0, #0
    19e4:	1a000074 	bne	1bbc <subdir+0x318>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    19e8:	e59f041c 	ldr	r0, [pc, #1052]	; 1e0c <subdir+0x568>
    19ec:	eb0006b7 	bl	34d0 <chdir>
    19f0:	e2504000 	subs	r4, r0, #0
    19f4:	1a000090 	bne	1c3c <subdir+0x398>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    19f8:	e59f0400 	ldr	r0, [pc, #1024]	; 1e00 <subdir+0x55c>
    19fc:	e1a01004 	mov	r1, r4
    1a00:	eb000664 	bl	3398 <open>
  if(fd < 0){
    1a04:	e2505000 	subs	r5, r0, #0
    1a08:	ba0000ee 	blt	1dc8 <subdir+0x524>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1a0c:	e59f13e8 	ldr	r1, [pc, #1000]	; 1dfc <subdir+0x558>
    1a10:	e3a02a02 	mov	r2, #8192	; 0x2000
    1a14:	eb00061e 	bl	3294 <read>
    1a18:	e3500002 	cmp	r0, #2
    1a1c:	1a0000e5 	bne	1db8 <subdir+0x514>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1a20:	e1a00005 	mov	r0, r5
    1a24:	eb000634 	bl	32fc <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1a28:	e59f03c0 	ldr	r0, [pc, #960]	; 1df0 <subdir+0x54c>
    1a2c:	e1a01004 	mov	r1, r4
    1a30:	eb000658 	bl	3398 <open>
    1a34:	e3500000 	cmp	r0, #0
    1a38:	aa00006b 	bge	1bec <subdir+0x348>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1a3c:	e59f03cc 	ldr	r0, [pc, #972]	; 1e10 <subdir+0x56c>
    1a40:	e59f13a0 	ldr	r1, [pc, #928]	; 1de8 <subdir+0x544>
    1a44:	eb000653 	bl	3398 <open>
    1a48:	e3500000 	cmp	r0, #0
    1a4c:	aa000062 	bge	1bdc <subdir+0x338>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1a50:	e59f03bc 	ldr	r0, [pc, #956]	; 1e14 <subdir+0x570>
    1a54:	e59f138c 	ldr	r1, [pc, #908]	; 1de8 <subdir+0x544>
    1a58:	eb00064e 	bl	3398 <open>
    1a5c:	e3500000 	cmp	r0, #0
    1a60:	aa000091 	bge	1cac <subdir+0x408>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1a64:	e59f0374 	ldr	r0, [pc, #884]	; 1de0 <subdir+0x53c>
    1a68:	e3a01c02 	mov	r1, #512	; 0x200
    1a6c:	eb000649 	bl	3398 <open>
    1a70:	e3500000 	cmp	r0, #0
    1a74:	aa000088 	bge	1c9c <subdir+0x3f8>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1a78:	e59f0360 	ldr	r0, [pc, #864]	; 1de0 <subdir+0x53c>
    1a7c:	e3a01002 	mov	r1, #2
    1a80:	eb000644 	bl	3398 <open>
    1a84:	e3500000 	cmp	r0, #0
    1a88:	aa00007f 	bge	1c8c <subdir+0x3e8>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1a8c:	e59f034c 	ldr	r0, [pc, #844]	; 1de0 <subdir+0x53c>
    1a90:	e3a01001 	mov	r1, #1
    1a94:	eb00063f 	bl	3398 <open>
    1a98:	e3500000 	cmp	r0, #0
    1a9c:	aa000076 	bge	1c7c <subdir+0x3d8>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1aa0:	e59f0368 	ldr	r0, [pc, #872]	; 1e10 <subdir+0x56c>
    1aa4:	e59f136c 	ldr	r1, [pc, #876]	; 1e18 <subdir+0x574>
    1aa8:	eb00066e 	bl	3468 <link>
    1aac:	e3500000 	cmp	r0, #0
    1ab0:	0a00006d 	beq	1c6c <subdir+0x3c8>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1ab4:	e59f0358 	ldr	r0, [pc, #856]	; 1e14 <subdir+0x570>
    1ab8:	e59f1358 	ldr	r1, [pc, #856]	; 1e18 <subdir+0x574>
    1abc:	eb000669 	bl	3468 <link>
    1ac0:	e3500000 	cmp	r0, #0
    1ac4:	0a000064 	beq	1c5c <subdir+0x3b8>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1ac8:	e59f0314 	ldr	r0, [pc, #788]	; 1de4 <subdir+0x540>
    1acc:	e59f132c 	ldr	r1, [pc, #812]	; 1e00 <subdir+0x55c>
    1ad0:	eb000664 	bl	3468 <link>
    1ad4:	e3500000 	cmp	r0, #0
    1ad8:	0a00004b 	beq	1c0c <subdir+0x368>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    1adc:	e59f032c 	ldr	r0, [pc, #812]	; 1e10 <subdir+0x56c>
    1ae0:	eb00066d 	bl	349c <mkdir>
    1ae4:	e3500000 	cmp	r0, #0
    1ae8:	0a000043 	beq	1bfc <subdir+0x358>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    1aec:	e59f0320 	ldr	r0, [pc, #800]	; 1e14 <subdir+0x570>
    1af0:	eb000669 	bl	349c <mkdir>
    1af4:	e3500000 	cmp	r0, #0
    1af8:	0a0000aa 	beq	1da8 <subdir+0x504>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    1afc:	e59f02fc 	ldr	r0, [pc, #764]	; 1e00 <subdir+0x55c>
    1b00:	eb000665 	bl	349c <mkdir>
    1b04:	e3500000 	cmp	r0, #0
    1b08:	0a0000a2 	beq	1d98 <subdir+0x4f4>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    1b0c:	e59f0300 	ldr	r0, [pc, #768]	; 1e14 <subdir+0x570>
    1b10:	eb00063a 	bl	3400 <unlink>
    1b14:	e3500000 	cmp	r0, #0
    1b18:	0a00009a 	beq	1d88 <subdir+0x4e4>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    1b1c:	e59f02ec 	ldr	r0, [pc, #748]	; 1e10 <subdir+0x56c>
    1b20:	eb000636 	bl	3400 <unlink>
    1b24:	e3500000 	cmp	r0, #0
    1b28:	0a000092 	beq	1d78 <subdir+0x4d4>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    1b2c:	e59f02b0 	ldr	r0, [pc, #688]	; 1de4 <subdir+0x540>
    1b30:	eb000666 	bl	34d0 <chdir>
    1b34:	e3500000 	cmp	r0, #0
    1b38:	0a00008a 	beq	1d68 <subdir+0x4c4>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    1b3c:	e59f02d8 	ldr	r0, [pc, #728]	; 1e1c <subdir+0x578>
    1b40:	eb000662 	bl	34d0 <chdir>
    1b44:	e3500000 	cmp	r0, #0
    1b48:	0a000082 	beq	1d58 <subdir+0x4b4>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    1b4c:	e59f02ac 	ldr	r0, [pc, #684]	; 1e00 <subdir+0x55c>
    1b50:	eb00062a 	bl	3400 <unlink>
    1b54:	e3500000 	cmp	r0, #0
    1b58:	1a00001b 	bne	1bcc <subdir+0x328>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    1b5c:	e59f0280 	ldr	r0, [pc, #640]	; 1de4 <subdir+0x540>
    1b60:	eb000626 	bl	3400 <unlink>
    1b64:	e3500000 	cmp	r0, #0
    1b68:	1a000076 	bne	1d48 <subdir+0x4a4>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    1b6c:	e59f026c 	ldr	r0, [pc, #620]	; 1de0 <subdir+0x53c>
    1b70:	eb000622 	bl	3400 <unlink>
    1b74:	e3500000 	cmp	r0, #0
    1b78:	0a00006e 	beq	1d38 <subdir+0x494>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    1b7c:	e59f029c 	ldr	r0, [pc, #668]	; 1e20 <subdir+0x57c>
    1b80:	eb00061e 	bl	3400 <unlink>
    1b84:	e3500000 	cmp	r0, #0
    1b88:	ba000066 	blt	1d28 <subdir+0x484>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    1b8c:	e59f024c 	ldr	r0, [pc, #588]	; 1de0 <subdir+0x53c>
    1b90:	eb00061a 	bl	3400 <unlink>
    1b94:	e3500000 	cmp	r0, #0
    printf(1, "unlink dd failed\n");
    1b98:	e3a00001 	mov	r0, #1
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    1b9c:	ba00005e 	blt	1d1c <subdir+0x478>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    1ba0:	e59f127c 	ldr	r1, [pc, #636]	; 1e24 <subdir+0x580>
}
    1ba4:	e8bd4830 	pop	{r4, r5, fp, lr}
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    1ba8:	ea0006e5 	b	3744 <printf>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    1bac:	e3a00001 	mov	r0, #1
    1bb0:	e59f1270 	ldr	r1, [pc, #624]	; 1e28 <subdir+0x584>
    1bb4:	eb0006e2 	bl	3744 <printf>
    exit();
    1bb8:	eb00058e 	bl	31f8 <exit>
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    1bbc:	e3a00001 	mov	r0, #1
    1bc0:	e59f1264 	ldr	r1, [pc, #612]	; 1e2c <subdir+0x588>
    1bc4:	eb0006de 	bl	3744 <printf>
    exit();
    1bc8:	eb00058a 	bl	31f8 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    1bcc:	e3a00001 	mov	r0, #1
    1bd0:	e59f1258 	ldr	r1, [pc, #600]	; 1e30 <subdir+0x58c>
    1bd4:	eb0006da 	bl	3744 <printf>
    exit();
    1bd8:	eb000586 	bl	31f8 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    1bdc:	e3a00001 	mov	r0, #1
    1be0:	e59f124c 	ldr	r1, [pc, #588]	; 1e34 <subdir+0x590>
    1be4:	eb0006d6 	bl	3744 <printf>
    exit();
    1be8:	eb000582 	bl	31f8 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    1bec:	e3a00001 	mov	r0, #1
    1bf0:	e59f1240 	ldr	r1, [pc, #576]	; 1e38 <subdir+0x594>
    1bf4:	eb0006d2 	bl	3744 <printf>
    exit();
    1bf8:	eb00057e 	bl	31f8 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    1bfc:	e3a00001 	mov	r0, #1
    1c00:	e59f1234 	ldr	r1, [pc, #564]	; 1e3c <subdir+0x598>
    1c04:	eb0006ce 	bl	3744 <printf>
    exit();
    1c08:	eb00057a 	bl	31f8 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    1c0c:	e3a00001 	mov	r0, #1
    1c10:	e59f1228 	ldr	r1, [pc, #552]	; 1e40 <subdir+0x59c>
    1c14:	eb0006ca 	bl	3744 <printf>
    exit();
    1c18:	eb000576 	bl	31f8 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    1c1c:	e3a00001 	mov	r0, #1
    1c20:	e59f121c 	ldr	r1, [pc, #540]	; 1e44 <subdir+0x5a0>
    1c24:	eb0006c6 	bl	3744 <printf>
    exit();
    1c28:	eb000572 	bl	31f8 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    1c2c:	e3a00001 	mov	r0, #1
    1c30:	e59f1210 	ldr	r1, [pc, #528]	; 1e48 <subdir+0x5a4>
    1c34:	eb0006c2 	bl	3744 <printf>
    exit();
    1c38:	eb00056e 	bl	31f8 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    1c3c:	e3a00001 	mov	r0, #1
    1c40:	e59f1204 	ldr	r1, [pc, #516]	; 1e4c <subdir+0x5a8>
    1c44:	eb0006be 	bl	3744 <printf>
    exit();
    1c48:	eb00056a 	bl	31f8 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1c4c:	e3a00001 	mov	r0, #1
    1c50:	e59f11f8 	ldr	r1, [pc, #504]	; 1e50 <subdir+0x5ac>
    1c54:	eb0006ba 	bl	3744 <printf>
    exit();
    1c58:	eb000566 	bl	31f8 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    1c5c:	e3a00001 	mov	r0, #1
    1c60:	e59f11ec 	ldr	r1, [pc, #492]	; 1e54 <subdir+0x5b0>
    1c64:	eb0006b6 	bl	3744 <printf>
    exit();
    1c68:	eb000562 	bl	31f8 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    1c6c:	e3a00001 	mov	r0, #1
    1c70:	e59f11e0 	ldr	r1, [pc, #480]	; 1e58 <subdir+0x5b4>
    1c74:	eb0006b2 	bl	3744 <printf>
    exit();
    1c78:	eb00055e 	bl	31f8 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    1c7c:	e3a00001 	mov	r0, #1
    1c80:	e59f11d4 	ldr	r1, [pc, #468]	; 1e5c <subdir+0x5b8>
    1c84:	eb0006ae 	bl	3744 <printf>
    exit();
    1c88:	eb00055a 	bl	31f8 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    1c8c:	e3a00001 	mov	r0, #1
    1c90:	e59f11c8 	ldr	r1, [pc, #456]	; 1e60 <subdir+0x5bc>
    1c94:	eb0006aa 	bl	3744 <printf>
    exit();
    1c98:	eb000556 	bl	31f8 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    1c9c:	e3a00001 	mov	r0, #1
    1ca0:	e59f11bc 	ldr	r1, [pc, #444]	; 1e64 <subdir+0x5c0>
    1ca4:	eb0006a6 	bl	3744 <printf>
    exit();
    1ca8:	eb000552 	bl	31f8 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    1cac:	e3a00001 	mov	r0, #1
    1cb0:	e59f11b0 	ldr	r1, [pc, #432]	; 1e68 <subdir+0x5c4>
    1cb4:	eb0006a2 	bl	3744 <printf>
    exit();
    1cb8:	eb00054e 	bl	31f8 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    1cbc:	e3a00001 	mov	r0, #1
    1cc0:	e59f11a4 	ldr	r1, [pc, #420]	; 1e6c <subdir+0x5c8>
    1cc4:	eb00069e 	bl	3744 <printf>
    exit();
    1cc8:	eb00054a 	bl	31f8 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1ccc:	e3a00001 	mov	r0, #1
    1cd0:	e59f1198 	ldr	r1, [pc, #408]	; 1e70 <subdir+0x5cc>
    1cd4:	eb00069a 	bl	3744 <printf>
    exit();
    1cd8:	eb000546 	bl	31f8 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    1cdc:	e3a00001 	mov	r0, #1
    1ce0:	e59f118c 	ldr	r1, [pc, #396]	; 1e74 <subdir+0x5d0>
    1ce4:	eb000696 	bl	3744 <printf>
    exit();
    1ce8:	eb000542 	bl	31f8 <exit>
  }
  write(fd, "ff", 2);
  close(fd);
  
  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1cec:	e3a00001 	mov	r0, #1
    1cf0:	e59f1180 	ldr	r1, [pc, #384]	; 1e78 <subdir+0x5d4>
    1cf4:	eb000692 	bl	3744 <printf>
    exit();
    1cf8:	eb00053e 	bl	31f8 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    1cfc:	e3a00001 	mov	r0, #1
    1d00:	e59f1174 	ldr	r1, [pc, #372]	; 1e7c <subdir+0x5d8>
    1d04:	eb00068e 	bl	3744 <printf>
    exit();
    1d08:	eb00053a 	bl	31f8 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    1d0c:	e3a00001 	mov	r0, #1
    1d10:	e59f1168 	ldr	r1, [pc, #360]	; 1e80 <subdir+0x5dc>
    1d14:	eb00068a 	bl	3744 <printf>
    exit();
    1d18:	eb000536 	bl	31f8 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    1d1c:	e59f1160 	ldr	r1, [pc, #352]	; 1e84 <subdir+0x5e0>
    1d20:	eb000687 	bl	3744 <printf>
    exit();
    1d24:	eb000533 	bl	31f8 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    1d28:	e3a00001 	mov	r0, #1
    1d2c:	e59f1154 	ldr	r1, [pc, #340]	; 1e88 <subdir+0x5e4>
    1d30:	eb000683 	bl	3744 <printf>
    exit();
    1d34:	eb00052f 	bl	31f8 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    1d38:	e3a00001 	mov	r0, #1
    1d3c:	e59f1148 	ldr	r1, [pc, #328]	; 1e8c <subdir+0x5e8>
    1d40:	eb00067f 	bl	3744 <printf>
    exit();
    1d44:	eb00052b 	bl	31f8 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    1d48:	e3a00001 	mov	r0, #1
    1d4c:	e59f113c 	ldr	r1, [pc, #316]	; 1e90 <subdir+0x5ec>
    1d50:	eb00067b 	bl	3744 <printf>
    exit();
    1d54:	eb000527 	bl	31f8 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    1d58:	e3a00001 	mov	r0, #1
    1d5c:	e59f1130 	ldr	r1, [pc, #304]	; 1e94 <subdir+0x5f0>
    1d60:	eb000677 	bl	3744 <printf>
    exit();
    1d64:	eb000523 	bl	31f8 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    1d68:	e3a00001 	mov	r0, #1
    1d6c:	e59f1124 	ldr	r1, [pc, #292]	; 1e98 <subdir+0x5f4>
    1d70:	eb000673 	bl	3744 <printf>
    exit();
    1d74:	eb00051f 	bl	31f8 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    1d78:	e3a00001 	mov	r0, #1
    1d7c:	e59f1118 	ldr	r1, [pc, #280]	; 1e9c <subdir+0x5f8>
    1d80:	eb00066f 	bl	3744 <printf>
    exit();
    1d84:	eb00051b 	bl	31f8 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    1d88:	e3a00001 	mov	r0, #1
    1d8c:	e59f110c 	ldr	r1, [pc, #268]	; 1ea0 <subdir+0x5fc>
    1d90:	eb00066b 	bl	3744 <printf>
    exit();
    1d94:	eb000517 	bl	31f8 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    1d98:	e3a00001 	mov	r0, #1
    1d9c:	e59f1100 	ldr	r1, [pc, #256]	; 1ea4 <subdir+0x600>
    1da0:	eb000667 	bl	3744 <printf>
    exit();
    1da4:	eb000513 	bl	31f8 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    1da8:	e3a00001 	mov	r0, #1
    1dac:	e59f10f4 	ldr	r1, [pc, #244]	; 1ea8 <subdir+0x604>
    1db0:	eb000663 	bl	3744 <printf>
    exit();
    1db4:	eb00050f 	bl	31f8 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    1db8:	e3a00001 	mov	r0, #1
    1dbc:	e59f10e8 	ldr	r1, [pc, #232]	; 1eac <subdir+0x608>
    1dc0:	eb00065f 	bl	3744 <printf>
    exit();
    1dc4:	eb00050b 	bl	31f8 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    1dc8:	e3a00001 	mov	r0, #1
    1dcc:	e59f10dc 	ldr	r1, [pc, #220]	; 1eb0 <subdir+0x60c>
    1dd0:	eb00065b 	bl	3744 <printf>
    exit();
    1dd4:	eb000507 	bl	31f8 <exit>
    1dd8:	0000436c 	.word	0x0000436c
    1ddc:	00004474 	.word	0x00004474
    1de0:	00004520 	.word	0x00004520
    1de4:	00004394 	.word	0x00004394
    1de8:	00000202 	.word	0x00000202
    1dec:	000043dc 	.word	0x000043dc
    1df0:	00004400 	.word	0x00004400
    1df4:	00004424 	.word	0x00004424
    1df8:	00004428 	.word	0x00004428
    1dfc:	000079fc 	.word	0x000079fc
    1e00:	0000446c 	.word	0x0000446c
    1e04:	000044ec 	.word	0x000044ec
    1e08:	00004514 	.word	0x00004514
    1e0c:	00004524 	.word	0x00004524
    1e10:	0000459c 	.word	0x0000459c
    1e14:	000045c4 	.word	0x000045c4
    1e18:	0000463c 	.word	0x0000463c
    1e1c:	0000475c 	.word	0x0000475c
    1e20:	000047b4 	.word	0x000047b4
    1e24:	000047e8 	.word	0x000047e8
    1e28:	00004450 	.word	0x00004450
    1e2c:	000044f8 	.word	0x000044f8
    1e30:	0000449c 	.word	0x0000449c
    1e34:	000045a8 	.word	0x000045a8
    1e38:	00004574 	.word	0x00004574
    1e3c:	000046b4 	.word	0x000046b4
    1e40:	00004690 	.word	0x00004690
    1e44:	00004434 	.word	0x00004434
    1e48:	0000440c 	.word	0x0000440c
    1e4c:	0000452c 	.word	0x0000452c
    1e50:	00004478 	.word	0x00004478
    1e54:	0000466c 	.word	0x0000466c
    1e58:	00004648 	.word	0x00004648
    1e5c:	00004620 	.word	0x00004620
    1e60:	00004604 	.word	0x00004604
    1e64:	000045ec 	.word	0x000045ec
    1e68:	000045d0 	.word	0x000045d0
    1e6c:	000044d8 	.word	0x000044d8
    1e70:	000044b4 	.word	0x000044b4
    1e74:	000043e4 	.word	0x000043e4
    1e78:	000043b4 	.word	0x000043b4
    1e7c:	0000439c 	.word	0x0000439c
    1e80:	0000437c 	.word	0x0000437c
    1e84:	000047d4 	.word	0x000047d4
    1e88:	000047bc 	.word	0x000047bc
    1e8c:	00004794 	.word	0x00004794
    1e90:	0000477c 	.word	0x0000477c
    1e94:	00004764 	.word	0x00004764
    1e98:	00004744 	.word	0x00004744
    1e9c:	00004728 	.word	0x00004728
    1ea0:	0000470c 	.word	0x0000470c
    1ea4:	000046ec 	.word	0x000046ec
    1ea8:	000046d0 	.word	0x000046d0
    1eac:	00004558 	.word	0x00004558
    1eb0:	00004540 	.word	0x00004540

00001eb4 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    1eb4:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
  int fd, sz;

  printf(1, "bigwrite test\n");
    1eb8:	e3a00001 	mov	r0, #1
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    1ebc:	e28db014 	add	fp, sp, #20
  int fd, sz;

  printf(1, "bigwrite test\n");
    1ec0:	e59f10ac 	ldr	r1, [pc, #172]	; 1f74 <bigwrite+0xc0>
    1ec4:	eb00061e 	bl	3744 <printf>

  unlink("bigwrite");
    1ec8:	e59f00a8 	ldr	r0, [pc, #168]	; 1f78 <bigwrite+0xc4>
    1ecc:	eb00054b 	bl	3400 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    1ed0:	e59f40a4 	ldr	r4, [pc, #164]	; 1f7c <bigwrite+0xc8>
    1ed4:	e59f60a4 	ldr	r6, [pc, #164]	; 1f80 <bigwrite+0xcc>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    1ed8:	e59f0098 	ldr	r0, [pc, #152]	; 1f78 <bigwrite+0xc4>
    1edc:	e59f10a0 	ldr	r1, [pc, #160]	; 1f84 <bigwrite+0xd0>
    1ee0:	eb00052c 	bl	3398 <open>
    if(fd < 0){
    1ee4:	e2505000 	subs	r5, r0, #0
    1ee8:	ba00001d 	blt	1f64 <bigwrite+0xb0>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    1eec:	e59f1094 	ldr	r1, [pc, #148]	; 1f88 <bigwrite+0xd4>
    1ef0:	e1a02004 	mov	r2, r4
    1ef4:	eb0004f3 	bl	32c8 <write>
      if(cc != sz){
    1ef8:	e1500004 	cmp	r0, r4
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    1efc:	e1a03000 	mov	r3, r0
      if(cc != sz){
    1f00:	1a000012 	bne	1f50 <bigwrite+0x9c>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    1f04:	e1a00005 	mov	r0, r5
    1f08:	e59f1078 	ldr	r1, [pc, #120]	; 1f88 <bigwrite+0xd4>
    1f0c:	e1a02004 	mov	r2, r4
    1f10:	eb0004ec 	bl	32c8 <write>
      if(cc != sz){
    1f14:	e1540000 	cmp	r4, r0
    1f18:	1a00000b 	bne	1f4c <bigwrite+0x98>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    1f1c:	e1a00005 	mov	r0, r5
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    1f20:	e2844f75 	add	r4, r4, #468	; 0x1d4
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    1f24:	eb0004f4 	bl	32fc <close>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    1f28:	e2844003 	add	r4, r4, #3
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    unlink("bigwrite");
    1f2c:	e59f0044 	ldr	r0, [pc, #68]	; 1f78 <bigwrite+0xc4>
    1f30:	eb000532 	bl	3400 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    1f34:	e1540006 	cmp	r4, r6
    1f38:	1affffe6 	bne	1ed8 <bigwrite+0x24>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    1f3c:	e3a00001 	mov	r0, #1
    1f40:	e59f1044 	ldr	r1, [pc, #68]	; 1f8c <bigwrite+0xd8>
}
    1f44:	e8bd4878 	pop	{r3, r4, r5, r6, fp, lr}
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    1f48:	ea0005fd 	b	3744 <printf>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    1f4c:	e1a03000 	mov	r3, r0
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    1f50:	e3a00001 	mov	r0, #1
    1f54:	e59f1034 	ldr	r1, [pc, #52]	; 1f90 <bigwrite+0xdc>
    1f58:	e1a02004 	mov	r2, r4
    1f5c:	eb0005f8 	bl	3744 <printf>
        exit();
    1f60:	eb0004a4 	bl	31f8 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    1f64:	e3a00001 	mov	r0, #1
    1f68:	e59f1024 	ldr	r1, [pc, #36]	; 1f94 <bigwrite+0xe0>
    1f6c:	eb0005f4 	bl	3744 <printf>
      exit();
    1f70:	eb0004a0 	bl	31f8 <exit>
    1f74:	000047f4 	.word	0x000047f4
    1f78:	00004804 	.word	0x00004804
    1f7c:	000001f3 	.word	0x000001f3
    1f80:	00001807 	.word	0x00001807
    1f84:	00000202 	.word	0x00000202
    1f88:	000079fc 	.word	0x000079fc
    1f8c:	0000483c 	.word	0x0000483c
    1f90:	00004828 	.word	0x00004828
    1f94:	00004810 	.word	0x00004810

00001f98 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    1f98:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    1f9c:	e3a00001 	mov	r0, #1
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    1fa0:	e28db014 	add	fp, sp, #20
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    1fa4:	e59f1160 	ldr	r1, [pc, #352]	; 210c <bigfile+0x174>
    1fa8:	eb0005e5 	bl	3744 <printf>

  unlink("bigfile");
    1fac:	e59f015c 	ldr	r0, [pc, #348]	; 2110 <bigfile+0x178>
    1fb0:	eb000512 	bl	3400 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    1fb4:	e59f0154 	ldr	r0, [pc, #340]	; 2110 <bigfile+0x178>
    1fb8:	e59f1154 	ldr	r1, [pc, #340]	; 2114 <bigfile+0x17c>
    1fbc:	eb0004f5 	bl	3398 <open>
  if(fd < 0){
    1fc0:	e2505000 	subs	r5, r0, #0
    1fc4:	a3a04000 	movge	r4, #0
    1fc8:	ba000047 	blt	20ec <bigfile+0x154>
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    1fcc:	e1a01004 	mov	r1, r4
    1fd0:	e3a02f96 	mov	r2, #600	; 0x258
    1fd4:	e59f013c 	ldr	r0, [pc, #316]	; 2118 <bigfile+0x180>
    1fd8:	eb00040b 	bl	300c <memset>
    if(write(fd, buf, 600) != 600){
    1fdc:	e1a00005 	mov	r0, r5
    1fe0:	e59f1130 	ldr	r1, [pc, #304]	; 2118 <bigfile+0x180>
    1fe4:	e3a02f96 	mov	r2, #600	; 0x258
    1fe8:	eb0004b6 	bl	32c8 <write>
    1fec:	e3500f96 	cmp	r0, #600	; 0x258
    1ff0:	1a000035 	bne	20cc <bigfile+0x134>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    1ff4:	e2844001 	add	r4, r4, #1
    1ff8:	e3540014 	cmp	r4, #20
    1ffc:	1afffff2 	bne	1fcc <bigfile+0x34>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2000:	e1a00005 	mov	r0, r5
    2004:	eb0004bc 	bl	32fc <close>

  fd = open("bigfile", 0);
    2008:	e59f0100 	ldr	r0, [pc, #256]	; 2110 <bigfile+0x178>
    200c:	e3a01000 	mov	r1, #0
    2010:	eb0004e0 	bl	3398 <open>
  if(fd < 0){
    2014:	e2507000 	subs	r7, r0, #0
    2018:	ba00002f 	blt	20dc <bigfile+0x144>
    201c:	e3a05000 	mov	r5, #0
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    2020:	e59f60f0 	ldr	r6, [pc, #240]	; 2118 <bigfile+0x180>
    }
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    2024:	e1a04005 	mov	r4, r5
    2028:	ea000009 	b	2054 <bigfile+0xbc>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    202c:	e3500f4b 	cmp	r0, #300	; 0x12c
    2030:	1a00001d 	bne	20ac <bigfile+0x114>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    2034:	e5d63000 	ldrb	r3, [r6]
    2038:	e15300c4 	cmp	r3, r4, asr #1
    203c:	1a000016 	bne	209c <bigfile+0x104>
    2040:	e5d6212b 	ldrb	r2, [r6, #299]	; 0x12b
    2044:	e1530002 	cmp	r3, r2
    2048:	1a000013 	bne	209c <bigfile+0x104>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    204c:	e2855f4b 	add	r5, r5, #300	; 0x12c
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    2050:	e2844001 	add	r4, r4, #1
    cc = read(fd, buf, 300);
    2054:	e1a00007 	mov	r0, r7
    2058:	e59f10b8 	ldr	r1, [pc, #184]	; 2118 <bigfile+0x180>
    205c:	e3a02f4b 	mov	r2, #300	; 0x12c
    2060:	eb00048b 	bl	3294 <read>
    if(cc < 0){
    2064:	e3500000 	cmp	r0, #0
    2068:	ba000013 	blt	20bc <bigfile+0x124>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    206c:	1affffee 	bne	202c <bigfile+0x94>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    2070:	e1a00007 	mov	r0, r7
    2074:	eb0004a0 	bl	32fc <close>
  if(total != 20*600){
    2078:	e59f309c 	ldr	r3, [pc, #156]	; 211c <bigfile+0x184>
    207c:	e1550003 	cmp	r5, r3
    2080:	1a00001d 	bne	20fc <bigfile+0x164>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    2084:	e59f0084 	ldr	r0, [pc, #132]	; 2110 <bigfile+0x178>
    2088:	eb0004dc 	bl	3400 <unlink>

  printf(1, "bigfile test ok\n");
    208c:	e3a00001 	mov	r0, #1
    2090:	e59f1088 	ldr	r1, [pc, #136]	; 2120 <bigfile+0x188>
}
    2094:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");

  printf(1, "bigfile test ok\n");
    2098:	ea0005a9 	b	3744 <printf>
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    209c:	e3a00001 	mov	r0, #1
    20a0:	e59f107c 	ldr	r1, [pc, #124]	; 2124 <bigfile+0x18c>
    20a4:	eb0005a6 	bl	3744 <printf>
      exit();
    20a8:	eb000452 	bl	31f8 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    20ac:	e3a00001 	mov	r0, #1
    20b0:	e59f1070 	ldr	r1, [pc, #112]	; 2128 <bigfile+0x190>
    20b4:	eb0005a2 	bl	3744 <printf>
      exit();
    20b8:	eb00044e 	bl	31f8 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    20bc:	e3a00001 	mov	r0, #1
    20c0:	e59f1064 	ldr	r1, [pc, #100]	; 212c <bigfile+0x194>
    20c4:	eb00059e 	bl	3744 <printf>
      exit();
    20c8:	eb00044a 	bl	31f8 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    20cc:	e3a00001 	mov	r0, #1
    20d0:	e59f1058 	ldr	r1, [pc, #88]	; 2130 <bigfile+0x198>
    20d4:	eb00059a 	bl	3744 <printf>
      exit();
    20d8:	eb000446 	bl	31f8 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    20dc:	e3a00001 	mov	r0, #1
    20e0:	e59f104c 	ldr	r1, [pc, #76]	; 2134 <bigfile+0x19c>
    20e4:	eb000596 	bl	3744 <printf>
    exit();
    20e8:	eb000442 	bl	31f8 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    20ec:	e3a00001 	mov	r0, #1
    20f0:	e59f1040 	ldr	r1, [pc, #64]	; 2138 <bigfile+0x1a0>
    20f4:	eb000592 	bl	3744 <printf>
    exit();
    20f8:	eb00043e 	bl	31f8 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    20fc:	e3a00001 	mov	r0, #1
    2100:	e59f1034 	ldr	r1, [pc, #52]	; 213c <bigfile+0x1a4>
    2104:	eb00058e 	bl	3744 <printf>
    exit();
    2108:	eb00043a 	bl	31f8 <exit>
    210c:	0000484c 	.word	0x0000484c
    2110:	0000485c 	.word	0x0000485c
    2114:	00000202 	.word	0x00000202
    2118:	000079fc 	.word	0x000079fc
    211c:	00002ee0 	.word	0x00002ee0
    2120:	00004910 	.word	0x00004910
    2124:	000048d8 	.word	0x000048d8
    2128:	000048c4 	.word	0x000048c4
    212c:	000048ac 	.word	0x000048ac
    2130:	0000487c 	.word	0x0000487c
    2134:	00004894 	.word	0x00004894
    2138:	00004864 	.word	0x00004864
    213c:	000048f4 	.word	0x000048f4

00002140 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2140:	e92d4818 	push	{r3, r4, fp, lr}
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2144:	e3a00001 	mov	r0, #1
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2148:	e28db00c 	add	fp, sp, #12
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    214c:	e59f10dc 	ldr	r1, [pc, #220]	; 2230 <fourteen+0xf0>
    2150:	eb00057b 	bl	3744 <printf>

  if(mkdir("12345678901234") != 0){
    2154:	e59f00d8 	ldr	r0, [pc, #216]	; 2234 <fourteen+0xf4>
    2158:	eb0004cf 	bl	349c <mkdir>
    215c:	e3500000 	cmp	r0, #0
    2160:	1a00001b 	bne	21d4 <fourteen+0x94>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2164:	e59f00cc 	ldr	r0, [pc, #204]	; 2238 <fourteen+0xf8>
    2168:	eb0004cb 	bl	349c <mkdir>
    216c:	e2504000 	subs	r4, r0, #0
    2170:	1a00002a 	bne	2220 <fourteen+0xe0>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2174:	e59f00c0 	ldr	r0, [pc, #192]	; 223c <fourteen+0xfc>
    2178:	e3a01c02 	mov	r1, #512	; 0x200
    217c:	eb000485 	bl	3398 <open>
  if(fd < 0){
    2180:	e3500000 	cmp	r0, #0
    2184:	ba000021 	blt	2210 <fourteen+0xd0>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    2188:	eb00045b 	bl	32fc <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    218c:	e59f00ac 	ldr	r0, [pc, #172]	; 2240 <fourteen+0x100>
    2190:	e1a01004 	mov	r1, r4
    2194:	eb00047f 	bl	3398 <open>
  if(fd < 0){
    2198:	e3500000 	cmp	r0, #0
    219c:	ba000017 	blt	2200 <fourteen+0xc0>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    21a0:	eb000455 	bl	32fc <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    21a4:	e59f0098 	ldr	r0, [pc, #152]	; 2244 <fourteen+0x104>
    21a8:	eb0004bb 	bl	349c <mkdir>
    21ac:	e3500000 	cmp	r0, #0
    21b0:	0a00000e 	beq	21f0 <fourteen+0xb0>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    21b4:	e59f008c 	ldr	r0, [pc, #140]	; 2248 <fourteen+0x108>
    21b8:	eb0004b7 	bl	349c <mkdir>
    21bc:	e3500000 	cmp	r0, #0
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    21c0:	e3a00001 	mov	r0, #1

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    21c4:	0a000006 	beq	21e4 <fourteen+0xa4>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    21c8:	e59f107c 	ldr	r1, [pc, #124]	; 224c <fourteen+0x10c>
}
    21cc:	e8bd4818 	pop	{r3, r4, fp, lr}
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    21d0:	ea00055b 	b	3744 <printf>

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    21d4:	e3a00001 	mov	r0, #1
    21d8:	e59f1070 	ldr	r1, [pc, #112]	; 2250 <fourteen+0x110>
    21dc:	eb000558 	bl	3744 <printf>
    exit();
    21e0:	eb000404 	bl	31f8 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    21e4:	e59f1068 	ldr	r1, [pc, #104]	; 2254 <fourteen+0x114>
    21e8:	eb000555 	bl	3744 <printf>
    exit();
    21ec:	eb000401 	bl	31f8 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    21f0:	e3a00001 	mov	r0, #1
    21f4:	e59f105c 	ldr	r1, [pc, #92]	; 2258 <fourteen+0x118>
    21f8:	eb000551 	bl	3744 <printf>
    exit();
    21fc:	eb0003fd 	bl	31f8 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2200:	e3a00001 	mov	r0, #1
    2204:	e59f1050 	ldr	r1, [pc, #80]	; 225c <fourteen+0x11c>
    2208:	eb00054d 	bl	3744 <printf>
    exit();
    220c:	eb0003f9 	bl	31f8 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2210:	e3a00001 	mov	r0, #1
    2214:	e59f1044 	ldr	r1, [pc, #68]	; 2260 <fourteen+0x120>
    2218:	eb000549 	bl	3744 <printf>
    exit();
    221c:	eb0003f5 	bl	31f8 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2220:	e3a00001 	mov	r0, #1
    2224:	e59f1038 	ldr	r1, [pc, #56]	; 2264 <fourteen+0x124>
    2228:	eb000545 	bl	3744 <printf>
    exit();
    222c:	eb0003f1 	bl	31f8 <exit>
    2230:	00004924 	.word	0x00004924
    2234:	00004ae0 	.word	0x00004ae0
    2238:	00004954 	.word	0x00004954
    223c:	000049a4 	.word	0x000049a4
    2240:	00004a14 	.word	0x00004a14
    2244:	00004a80 	.word	0x00004a80
    2248:	00004ad0 	.word	0x00004ad0
    224c:	00004b24 	.word	0x00004b24
    2250:	00004934 	.word	0x00004934
    2254:	00004af0 	.word	0x00004af0
    2258:	00004aa0 	.word	0x00004aa0
    225c:	00004a44 	.word	0x00004a44
    2260:	000049d4 	.word	0x000049d4
    2264:	00004974 	.word	0x00004974

00002268 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2268:	e92d4800 	push	{fp, lr}
  printf(1, "rmdot test\n");
    226c:	e3a00001 	mov	r0, #1
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2270:	e28db004 	add	fp, sp, #4
  printf(1, "rmdot test\n");
    2274:	e59f110c 	ldr	r1, [pc, #268]	; 2388 <rmdot+0x120>
    2278:	eb000531 	bl	3744 <printf>
  if(mkdir("dots") != 0){
    227c:	e59f0108 	ldr	r0, [pc, #264]	; 238c <rmdot+0x124>
    2280:	eb000485 	bl	349c <mkdir>
    2284:	e3500000 	cmp	r0, #0
    2288:	1a00001f 	bne	230c <rmdot+0xa4>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    228c:	e59f00f8 	ldr	r0, [pc, #248]	; 238c <rmdot+0x124>
    2290:	eb00048e 	bl	34d0 <chdir>
    2294:	e3500000 	cmp	r0, #0
    2298:	1a000036 	bne	2378 <rmdot+0x110>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    229c:	e59f00ec 	ldr	r0, [pc, #236]	; 2390 <rmdot+0x128>
    22a0:	eb000456 	bl	3400 <unlink>
    22a4:	e3500000 	cmp	r0, #0
    22a8:	0a00002e 	beq	2368 <rmdot+0x100>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    22ac:	e59f00e0 	ldr	r0, [pc, #224]	; 2394 <rmdot+0x12c>
    22b0:	eb000452 	bl	3400 <unlink>
    22b4:	e3500000 	cmp	r0, #0
    22b8:	0a000026 	beq	2358 <rmdot+0xf0>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    22bc:	e59f00d4 	ldr	r0, [pc, #212]	; 2398 <rmdot+0x130>
    22c0:	eb000482 	bl	34d0 <chdir>
    22c4:	e3500000 	cmp	r0, #0
    22c8:	1a00001e 	bne	2348 <rmdot+0xe0>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    22cc:	e59f00c8 	ldr	r0, [pc, #200]	; 239c <rmdot+0x134>
    22d0:	eb00044a 	bl	3400 <unlink>
    22d4:	e3500000 	cmp	r0, #0
    22d8:	0a000016 	beq	2338 <rmdot+0xd0>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    22dc:	e59f00bc 	ldr	r0, [pc, #188]	; 23a0 <rmdot+0x138>
    22e0:	eb000446 	bl	3400 <unlink>
    22e4:	e3500000 	cmp	r0, #0
    22e8:	0a00000e 	beq	2328 <rmdot+0xc0>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    22ec:	e59f0098 	ldr	r0, [pc, #152]	; 238c <rmdot+0x124>
    22f0:	eb000442 	bl	3400 <unlink>
    22f4:	e3500000 	cmp	r0, #0
    printf(1, "unlink dots failed!\n");
    22f8:	e3a00001 	mov	r0, #1
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    22fc:	1a000006 	bne	231c <rmdot+0xb4>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    2300:	e59f109c 	ldr	r1, [pc, #156]	; 23a4 <rmdot+0x13c>
}
    2304:	e8bd4800 	pop	{fp, lr}
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    2308:	ea00050d 	b	3744 <printf>
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    230c:	e3a00001 	mov	r0, #1
    2310:	e59f1090 	ldr	r1, [pc, #144]	; 23a8 <rmdot+0x140>
    2314:	eb00050a 	bl	3744 <printf>
    exit();
    2318:	eb0003b6 	bl	31f8 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    231c:	e59f1088 	ldr	r1, [pc, #136]	; 23ac <rmdot+0x144>
    2320:	eb000507 	bl	3744 <printf>
    exit();
    2324:	eb0003b3 	bl	31f8 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    2328:	e3a00001 	mov	r0, #1
    232c:	e59f107c 	ldr	r1, [pc, #124]	; 23b0 <rmdot+0x148>
    2330:	eb000503 	bl	3744 <printf>
    exit();
    2334:	eb0003af 	bl	31f8 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    2338:	e3a00001 	mov	r0, #1
    233c:	e59f1070 	ldr	r1, [pc, #112]	; 23b4 <rmdot+0x14c>
    2340:	eb0004ff 	bl	3744 <printf>
    exit();
    2344:	eb0003ab 	bl	31f8 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2348:	e3a00001 	mov	r0, #1
    234c:	e59f1064 	ldr	r1, [pc, #100]	; 23b8 <rmdot+0x150>
    2350:	eb0004fb 	bl	3744 <printf>
    exit();
    2354:	eb0003a7 	bl	31f8 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2358:	e3a00001 	mov	r0, #1
    235c:	e59f1058 	ldr	r1, [pc, #88]	; 23bc <rmdot+0x154>
    2360:	eb0004f7 	bl	3744 <printf>
    exit();
    2364:	eb0003a3 	bl	31f8 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    2368:	e3a00001 	mov	r0, #1
    236c:	e59f104c 	ldr	r1, [pc, #76]	; 23c0 <rmdot+0x158>
    2370:	eb0004f3 	bl	3744 <printf>
    exit();
    2374:	eb00039f 	bl	31f8 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    2378:	e3a00001 	mov	r0, #1
    237c:	e59f1040 	ldr	r1, [pc, #64]	; 23c4 <rmdot+0x15c>
    2380:	eb0004ef 	bl	3744 <printf>
    exit();
    2384:	eb00039b 	bl	31f8 <exit>
    2388:	00004b34 	.word	0x00004b34
    238c:	00004b40 	.word	0x00004b40
    2390:	00004200 	.word	0x00004200
    2394:	00003d44 	.word	0x00003d44
    2398:	00004b90 	.word	0x00004b90
    239c:	00004ba4 	.word	0x00004ba4
    23a0:	00004bc4 	.word	0x00004bc4
    23a4:	00004bfc 	.word	0x00004bfc
    23a8:	00004b48 	.word	0x00004b48
    23ac:	00004be4 	.word	0x00004be4
    23b0:	00004bcc 	.word	0x00004bcc
    23b4:	00004bac 	.word	0x00004bac
    23b8:	00004b94 	.word	0x00004b94
    23bc:	00004b80 	.word	0x00004b80
    23c0:	00004b70 	.word	0x00004b70
    23c4:	00004b5c 	.word	0x00004b5c

000023c8 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    23c8:	e92d4818 	push	{r3, r4, fp, lr}
  int fd;

  printf(1, "dir vs file\n");
    23cc:	e3a00001 	mov	r0, #1
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    23d0:	e28db00c 	add	fp, sp, #12
  int fd;

  printf(1, "dir vs file\n");
    23d4:	e59f1174 	ldr	r1, [pc, #372]	; 2550 <dirfile+0x188>
    23d8:	eb0004d9 	bl	3744 <printf>

  fd = open("dirfile", O_CREATE);
    23dc:	e59f0170 	ldr	r0, [pc, #368]	; 2554 <dirfile+0x18c>
    23e0:	e3a01c02 	mov	r1, #512	; 0x200
    23e4:	eb0003eb 	bl	3398 <open>
  if(fd < 0){
    23e8:	e3500000 	cmp	r0, #0
    23ec:	ba00003b 	blt	24e0 <dirfile+0x118>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    23f0:	eb0003c1 	bl	32fc <close>
  if(chdir("dirfile") == 0){
    23f4:	e59f0158 	ldr	r0, [pc, #344]	; 2554 <dirfile+0x18c>
    23f8:	eb000434 	bl	34d0 <chdir>
    23fc:	e3500000 	cmp	r0, #0
    2400:	0a000032 	beq	24d0 <dirfile+0x108>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    2404:	e59f014c 	ldr	r0, [pc, #332]	; 2558 <dirfile+0x190>
    2408:	e3a01000 	mov	r1, #0
    240c:	eb0003e1 	bl	3398 <open>
  if(fd >= 0){
    2410:	e3500000 	cmp	r0, #0
    2414:	aa000029 	bge	24c0 <dirfile+0xf8>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    2418:	e59f0138 	ldr	r0, [pc, #312]	; 2558 <dirfile+0x190>
    241c:	e3a01c02 	mov	r1, #512	; 0x200
    2420:	eb0003dc 	bl	3398 <open>
  if(fd >= 0){
    2424:	e3500000 	cmp	r0, #0
    2428:	aa000024 	bge	24c0 <dirfile+0xf8>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    242c:	e59f0124 	ldr	r0, [pc, #292]	; 2558 <dirfile+0x190>
    2430:	eb000419 	bl	349c <mkdir>
    2434:	e3500000 	cmp	r0, #0
    2438:	0a000040 	beq	2540 <dirfile+0x178>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    243c:	e59f0114 	ldr	r0, [pc, #276]	; 2558 <dirfile+0x190>
    2440:	eb0003ee 	bl	3400 <unlink>
    2444:	e3500000 	cmp	r0, #0
    2448:	0a000038 	beq	2530 <dirfile+0x168>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    244c:	e59f0108 	ldr	r0, [pc, #264]	; 255c <dirfile+0x194>
    2450:	e59f1100 	ldr	r1, [pc, #256]	; 2558 <dirfile+0x190>
    2454:	eb000403 	bl	3468 <link>
    2458:	e3500000 	cmp	r0, #0
    245c:	0a00002f 	beq	2520 <dirfile+0x158>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2460:	e59f00ec 	ldr	r0, [pc, #236]	; 2554 <dirfile+0x18c>
    2464:	eb0003e5 	bl	3400 <unlink>
    2468:	e2504000 	subs	r4, r0, #0
    246c:	1a000027 	bne	2510 <dirfile+0x148>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2470:	e59f00e8 	ldr	r0, [pc, #232]	; 2560 <dirfile+0x198>
    2474:	e3a01002 	mov	r1, #2
    2478:	eb0003c6 	bl	3398 <open>
  if(fd >= 0){
    247c:	e3500000 	cmp	r0, #0
    2480:	aa00001e 	bge	2500 <dirfile+0x138>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2484:	e1a01004 	mov	r1, r4
    2488:	e59f00d0 	ldr	r0, [pc, #208]	; 2560 <dirfile+0x198>
    248c:	eb0003c1 	bl	3398 <open>
  if(write(fd, "x", 1) > 0){
    2490:	e59f10cc 	ldr	r1, [pc, #204]	; 2564 <dirfile+0x19c>
    2494:	e3a02001 	mov	r2, #1
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2498:	e1a04000 	mov	r4, r0
  if(write(fd, "x", 1) > 0){
    249c:	eb000389 	bl	32c8 <write>
    24a0:	e3500000 	cmp	r0, #0
    24a4:	ca000011 	bgt	24f0 <dirfile+0x128>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    24a8:	e1a00004 	mov	r0, r4
    24ac:	eb000392 	bl	32fc <close>

  printf(1, "dir vs file OK\n");
    24b0:	e3a00001 	mov	r0, #1
    24b4:	e59f10ac 	ldr	r1, [pc, #172]	; 2568 <dirfile+0x1a0>
}
    24b8:	e8bd4818 	pop	{r3, r4, fp, lr}
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);

  printf(1, "dir vs file OK\n");
    24bc:	ea0004a0 	b	3744 <printf>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    24c0:	e3a00001 	mov	r0, #1
    24c4:	e59f10a0 	ldr	r1, [pc, #160]	; 256c <dirfile+0x1a4>
    24c8:	eb00049d 	bl	3744 <printf>
    exit();
    24cc:	eb000349 	bl	31f8 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    24d0:	e3a00001 	mov	r0, #1
    24d4:	e59f1094 	ldr	r1, [pc, #148]	; 2570 <dirfile+0x1a8>
    24d8:	eb000499 	bl	3744 <printf>
    exit();
    24dc:	eb000345 	bl	31f8 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    24e0:	e3a00001 	mov	r0, #1
    24e4:	e59f1088 	ldr	r1, [pc, #136]	; 2574 <dirfile+0x1ac>
    24e8:	eb000495 	bl	3744 <printf>
    exit();
    24ec:	eb000341 	bl	31f8 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    24f0:	e3a00001 	mov	r0, #1
    24f4:	e59f107c 	ldr	r1, [pc, #124]	; 2578 <dirfile+0x1b0>
    24f8:	eb000491 	bl	3744 <printf>
    exit();
    24fc:	eb00033d 	bl	31f8 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2500:	e3a00001 	mov	r0, #1
    2504:	e59f1070 	ldr	r1, [pc, #112]	; 257c <dirfile+0x1b4>
    2508:	eb00048d 	bl	3744 <printf>
    exit();
    250c:	eb000339 	bl	31f8 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2510:	e3a00001 	mov	r0, #1
    2514:	e59f1064 	ldr	r1, [pc, #100]	; 2580 <dirfile+0x1b8>
    2518:	eb000489 	bl	3744 <printf>
    exit();
    251c:	eb000335 	bl	31f8 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2520:	e3a00001 	mov	r0, #1
    2524:	e59f1058 	ldr	r1, [pc, #88]	; 2584 <dirfile+0x1bc>
    2528:	eb000485 	bl	3744 <printf>
    exit();
    252c:	eb000331 	bl	31f8 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2530:	e3a00001 	mov	r0, #1
    2534:	e59f104c 	ldr	r1, [pc, #76]	; 2588 <dirfile+0x1c0>
    2538:	eb000481 	bl	3744 <printf>
    exit();
    253c:	eb00032d 	bl	31f8 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2540:	e3a00001 	mov	r0, #1
    2544:	e59f1040 	ldr	r1, [pc, #64]	; 258c <dirfile+0x1c4>
    2548:	eb00047d 	bl	3744 <printf>
    exit();
    254c:	eb000329 	bl	31f8 <exit>
    2550:	00004c08 	.word	0x00004c08
    2554:	00004c18 	.word	0x00004c18
    2558:	00004c54 	.word	0x00004c54
    255c:	00004cc0 	.word	0x00004cc0
    2560:	00004200 	.word	0x00004200
    2564:	00004760 	.word	0x00004760
    2568:	00004d34 	.word	0x00004d34
    256c:	00004c60 	.word	0x00004c60
    2570:	00004c38 	.word	0x00004c38
    2574:	00004c20 	.word	0x00004c20
    2578:	00004d20 	.word	0x00004d20
    257c:	00004d00 	.word	0x00004d00
    2580:	00004ce8 	.word	0x00004ce8
    2584:	00004cc8 	.word	0x00004cc8
    2588:	00004ca0 	.word	0x00004ca0
    258c:	00004c80 	.word	0x00004c80

00002590 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2590:	e92d4818 	push	{r3, r4, fp, lr}
  int i, fd;

  printf(1, "empty file name\n");
    2594:	e3a00001 	mov	r0, #1
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2598:	e28db00c 	add	fp, sp, #12
  int i, fd;

  printf(1, "empty file name\n");
    259c:	e59f10b0 	ldr	r1, [pc, #176]	; 2654 <iref+0xc4>
    25a0:	eb000467 	bl	3744 <printf>
    25a4:	e3a04033 	mov	r4, #51	; 0x33

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    25a8:	e59f00a8 	ldr	r0, [pc, #168]	; 2658 <iref+0xc8>
    25ac:	eb0003ba 	bl	349c <mkdir>
    25b0:	e3500000 	cmp	r0, #0
    25b4:	1a00001e 	bne	2634 <iref+0xa4>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    25b8:	e59f0098 	ldr	r0, [pc, #152]	; 2658 <iref+0xc8>
    25bc:	eb0003c3 	bl	34d0 <chdir>
    25c0:	e3500000 	cmp	r0, #0
    25c4:	1a00001e 	bne	2644 <iref+0xb4>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    25c8:	e59f008c 	ldr	r0, [pc, #140]	; 265c <iref+0xcc>
    25cc:	eb0003b2 	bl	349c <mkdir>
    link("README", "");
    25d0:	e59f1084 	ldr	r1, [pc, #132]	; 265c <iref+0xcc>
    25d4:	e59f0084 	ldr	r0, [pc, #132]	; 2660 <iref+0xd0>
    25d8:	eb0003a2 	bl	3468 <link>
    fd = open("", O_CREATE);
    25dc:	e59f0078 	ldr	r0, [pc, #120]	; 265c <iref+0xcc>
    25e0:	e3a01c02 	mov	r1, #512	; 0x200
    25e4:	eb00036b 	bl	3398 <open>
    if(fd >= 0)
    25e8:	e3500000 	cmp	r0, #0
    25ec:	ba000000 	blt	25f4 <iref+0x64>
      close(fd);
    25f0:	eb000341 	bl	32fc <close>
    fd = open("xx", O_CREATE);
    25f4:	e59f0068 	ldr	r0, [pc, #104]	; 2664 <iref+0xd4>
    25f8:	e3a01c02 	mov	r1, #512	; 0x200
    25fc:	eb000365 	bl	3398 <open>
    if(fd >= 0)
    2600:	e3500000 	cmp	r0, #0
    2604:	ba000000 	blt	260c <iref+0x7c>
      close(fd);
    2608:	eb00033b 	bl	32fc <close>
    unlink("xx");
    260c:	e59f0050 	ldr	r0, [pc, #80]	; 2664 <iref+0xd4>
    2610:	eb00037a 	bl	3400 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2614:	e2544001 	subs	r4, r4, #1
    2618:	1affffe2 	bne	25a8 <iref+0x18>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    261c:	e59f0044 	ldr	r0, [pc, #68]	; 2668 <iref+0xd8>
    2620:	eb0003aa 	bl	34d0 <chdir>
  printf(1, "empty file name OK\n");
    2624:	e3a00001 	mov	r0, #1
    2628:	e59f103c 	ldr	r1, [pc, #60]	; 266c <iref+0xdc>
}
    262c:	e8bd4818 	pop	{r3, r4, fp, lr}
      close(fd);
    unlink("xx");
  }

  chdir("/");
  printf(1, "empty file name OK\n");
    2630:	ea000443 	b	3744 <printf>
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2634:	e3a00001 	mov	r0, #1
    2638:	e59f1030 	ldr	r1, [pc, #48]	; 2670 <iref+0xe0>
    263c:	eb000440 	bl	3744 <printf>
      exit();
    2640:	eb0002ec 	bl	31f8 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2644:	e3a00001 	mov	r0, #1
    2648:	e59f1024 	ldr	r1, [pc, #36]	; 2674 <iref+0xe4>
    264c:	eb00043c 	bl	3744 <printf>
      exit();
    2650:	eb0002e8 	bl	31f8 <exit>
    2654:	00004d44 	.word	0x00004d44
    2658:	00004d58 	.word	0x00004d58
    265c:	00004b20 	.word	0x00004b20
    2660:	00004cc0 	.word	0x00004cc0
    2664:	00004c5c 	.word	0x00004c5c
    2668:	00004b90 	.word	0x00004b90
    266c:	00004d88 	.word	0x00004d88
    2670:	00004d60 	.word	0x00004d60
    2674:	00004d74 	.word	0x00004d74

00002678 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2678:	e92d4818 	push	{r3, r4, fp, lr}
  int n, pid;

  printf(1, "fork test\n");
    267c:	e3a00001 	mov	r0, #1
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2680:	e28db00c 	add	fp, sp, #12
  int n, pid;

  printf(1, "fork test\n");
    2684:	e59f1088 	ldr	r1, [pc, #136]	; 2714 <forktest+0x9c>
    2688:	eb00042d 	bl	3744 <printf>

  for(n=0; n<1000; n++){
    268c:	e3a04000 	mov	r4, #0
    2690:	ea000003 	b	26a4 <forktest+0x2c>
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    2694:	0a00001a 	beq	2704 <forktest+0x8c>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2698:	e2844001 	add	r4, r4, #1
    269c:	e3540ffa 	cmp	r4, #1000	; 0x3e8
    26a0:	0a000010 	beq	26e8 <forktest+0x70>
    pid = fork();
    26a4:	eb0002c6 	bl	31c4 <fork>
    if(pid < 0)
    26a8:	e3500000 	cmp	r0, #0
    26ac:	aafffff8 	bge	2694 <forktest+0x1c>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    26b0:	e3540000 	cmp	r4, #0
    26b4:	0a000004 	beq	26cc <forktest+0x54>
    if(wait() < 0){
    26b8:	eb0002db 	bl	322c <wait>
    26bc:	e3500000 	cmp	r0, #0
    26c0:	ba00000c 	blt	26f8 <forktest+0x80>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    26c4:	e2544001 	subs	r4, r4, #1
    26c8:	1afffffa 	bne	26b8 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    26cc:	eb0002d6 	bl	322c <wait>
    26d0:	e3700001 	cmn	r0, #1
    printf(1, "wait got too many\n");
    26d4:	e3a00001 	mov	r0, #1
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    26d8:	1a00000a 	bne	2708 <forktest+0x90>
    printf(1, "wait got too many\n");
    exit();
  }
  
  printf(1, "fork test OK\n");
    26dc:	e59f1034 	ldr	r1, [pc, #52]	; 2718 <forktest+0xa0>
}
    26e0:	e8bd4818 	pop	{r3, r4, fp, lr}
  if(wait() != -1){
    printf(1, "wait got too many\n");
    exit();
  }
  
  printf(1, "fork test OK\n");
    26e4:	ea000416 	b	3744 <printf>
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    26e8:	e3a00001 	mov	r0, #1
    26ec:	e59f1028 	ldr	r1, [pc, #40]	; 271c <forktest+0xa4>
    26f0:	eb000413 	bl	3744 <printf>
    exit();
    26f4:	eb0002bf 	bl	31f8 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    26f8:	e3a00001 	mov	r0, #1
    26fc:	e59f101c 	ldr	r1, [pc, #28]	; 2720 <forktest+0xa8>
    2700:	eb00040f 	bl	3744 <printf>
      exit();
    2704:	eb0002bb 	bl	31f8 <exit>
    }
  }
  
  if(wait() != -1){
    printf(1, "wait got too many\n");
    2708:	e59f1014 	ldr	r1, [pc, #20]	; 2724 <forktest+0xac>
    270c:	eb00040c 	bl	3744 <printf>
    exit();
    2710:	eb0002b8 	bl	31f8 <exit>
    2714:	00004d9c 	.word	0x00004d9c
    2718:	00004dd0 	.word	0x00004dd0
    271c:	00004de0 	.word	0x00004de0
    2720:	00004da8 	.word	0x00004da8
    2724:	00004dbc 	.word	0x00004dbc

00002728 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2728:	e92d4df0 	push	{r4, r5, r6, r7, r8, sl, fp, lr}
    272c:	e28db01c 	add	fp, sp, #28
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2730:	e59f4358 	ldr	r4, [pc, #856]	; 2a90 <sbrktest+0x368>
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2734:	e24dd040 	sub	sp, sp, #64	; 0x40
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2738:	e59f1354 	ldr	r1, [pc, #852]	; 2a94 <sbrktest+0x36c>
    273c:	e5940000 	ldr	r0, [r4]
    2740:	eb0003ff 	bl	3744 <printf>
  oldbrk = sbrk(0);
    2744:	e3a00000 	mov	r0, #0
    2748:	eb000387 	bl	356c <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    274c:	e59f8344 	ldr	r8, [pc, #836]	; 2a98 <sbrktest+0x370>
    2750:	e3a07000 	mov	r7, #0
    b = sbrk(1);
    2754:	e3a0a001 	mov	sl, #1
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    2758:	e1a06000 	mov	r6, r0

  // can one sbrk() less than a page?
  a = sbrk(0);
    275c:	e3a00000 	mov	r0, #0
    2760:	eb000381 	bl	356c <sbrk>
    2764:	e1a05000 	mov	r5, r0
  int i;
  for(i = 0; i < 5000; i++){ 
    b = sbrk(1);
    2768:	e3a00001 	mov	r0, #1
    276c:	eb00037e 	bl	356c <sbrk>
    if(b != a){
    2770:	e1500005 	cmp	r0, r5

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    b = sbrk(1);
    2774:	e1a0c000 	mov	ip, r0
    if(b != a){
    2778:	1a000085 	bne	2994 <sbrktest+0x26c>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    277c:	e2877001 	add	r7, r7, #1
    2780:	e1570008 	cmp	r7, r8
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2784:	e4c5a001 	strb	sl, [r5], #1
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    2788:	1afffff6 	bne	2768 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    278c:	eb00028c 	bl	31c4 <fork>
  if(pid < 0){
    2790:	e2507000 	subs	r7, r0, #0
    2794:	ba0000b9 	blt	2a80 <sbrktest+0x358>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2798:	e3a00001 	mov	r0, #1
    279c:	eb000372 	bl	356c <sbrk>
  c = sbrk(1);
    27a0:	e3a00001 	mov	r0, #1
    27a4:	eb000370 	bl	356c <sbrk>
  if(c != a + 1){
    27a8:	e2855001 	add	r5, r5, #1
    27ac:	e1550000 	cmp	r5, r0
    27b0:	1a0000ae 	bne	2a70 <sbrktest+0x348>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    27b4:	e3570000 	cmp	r7, #0
    27b8:	0a0000ab 	beq	2a6c <sbrktest+0x344>
    exit();
  wait();
    27bc:	eb00029a 	bl	322c <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    27c0:	e3a00000 	mov	r0, #0
    27c4:	eb000368 	bl	356c <sbrk>
    27c8:	e1a05000 	mov	r5, r0
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    27cc:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    27d0:	eb000365 	bl	356c <sbrk>
  if (p != a) { 
    27d4:	e1550000 	cmp	r5, r0
    27d8:	1a0000a0 	bne	2a60 <sbrktest+0x338>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    27dc:	e59f32b8 	ldr	r3, [pc, #696]	; 2a9c <sbrktest+0x374>
    27e0:	e3a02063 	mov	r2, #99	; 0x63

  // can one de-allocate?
  a = sbrk(0);
    27e4:	e3a00000 	mov	r0, #0
  if (p != a) { 
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    27e8:	e5c32000 	strb	r2, [r3]

  // can one de-allocate?
  a = sbrk(0);
    27ec:	eb00035e 	bl	356c <sbrk>
    27f0:	e1a05000 	mov	r5, r0
  c = sbrk(-4096);
    27f4:	e59f02a4 	ldr	r0, [pc, #676]	; 2aa0 <sbrktest+0x378>
    27f8:	eb00035b 	bl	356c <sbrk>
  if(c == (char*)0xffffffff){
    27fc:	e3700001 	cmn	r0, #1
    2800:	0a000092 	beq	2a50 <sbrktest+0x328>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2804:	e3a00000 	mov	r0, #0
    2808:	eb000357 	bl	356c <sbrk>
  if(c != a - 4096){
    280c:	e2452a01 	sub	r2, r5, #4096	; 0x1000
    2810:	e1500002 	cmp	r0, r2
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2814:	e1a03000 	mov	r3, r0
  if(c != a - 4096){
    2818:	1a000087 	bne	2a3c <sbrktest+0x314>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    281c:	e3a00000 	mov	r0, #0
    2820:	eb000351 	bl	356c <sbrk>
    2824:	e1a07000 	mov	r7, r0
  c = sbrk(4096);
    2828:	e3a00a01 	mov	r0, #4096	; 0x1000
    282c:	eb00034e 	bl	356c <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2830:	e1500007 	cmp	r0, r7
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2834:	e1a05000 	mov	r5, r0
  if(c != a || sbrk(0) != a + 4096){
    2838:	1a000079 	bne	2a24 <sbrktest+0x2fc>
    283c:	e3a00000 	mov	r0, #0
    2840:	eb000349 	bl	356c <sbrk>
    2844:	e2853a01 	add	r3, r5, #4096	; 0x1000
    2848:	e1530000 	cmp	r3, r0
    284c:	1a000074 	bne	2a24 <sbrktest+0x2fc>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2850:	e59f3244 	ldr	r3, [pc, #580]	; 2a9c <sbrktest+0x374>
    2854:	e5d33000 	ldrb	r3, [r3]
    2858:	e3530063 	cmp	r3, #99	; 0x63
    285c:	0a00006c 	beq	2a14 <sbrktest+0x2ec>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2860:	e3a00000 	mov	r0, #0
    2864:	eb000340 	bl	356c <sbrk>
    2868:	e1a05000 	mov	r5, r0
  c = sbrk(-(sbrk(0) - oldbrk));
    286c:	e3a00000 	mov	r0, #0
    2870:	eb00033d 	bl	356c <sbrk>
    2874:	e0600006 	rsb	r0, r0, r6
    2878:	eb00033b 	bl	356c <sbrk>
  if(c != a){
    287c:	e1500005 	cmp	r0, r5
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
    2880:	e1a03000 	mov	r3, r0
  if(c != a){
    2884:	1a00005d 	bne	2a00 <sbrktest+0x2d8>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2888:	e59f8214 	ldr	r8, [pc, #532]	; 2aa4 <sbrktest+0x37c>
    exit();
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    288c:	e3a07102 	mov	r7, #-2147483648	; 0x80000000
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2890:	eb000328 	bl	3538 <getpid>
    2894:	e1a05000 	mov	r5, r0
    pid = fork();
    2898:	eb000249 	bl	31c4 <fork>
    if(pid < 0){
    289c:	e3500000 	cmp	r0, #0
    28a0:	ba000052 	blt	29f0 <sbrktest+0x2c8>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    28a4:	0a000049 	beq	29d0 <sbrktest+0x2a8>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    28a8:	e2877cc3 	add	r7, r7, #49920	; 0xc300
    28ac:	e2877050 	add	r7, r7, #80	; 0x50
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    28b0:	eb00025d 	bl	322c <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    28b4:	e1570008 	cmp	r7, r8
    28b8:	1afffff4 	bne	2890 <sbrktest+0x168>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    28bc:	e24b0028 	sub	r0, fp, #40	; 0x28
    28c0:	eb000266 	bl	3260 <pipe>
    28c4:	e3500000 	cmp	r0, #0
    printf(1, "pipe() failed\n");
    exit();
    28c8:	024b5054 	subeq	r5, fp, #84	; 0x54
  
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
    28cc:	024b802c 	subeq	r8, fp, #44	; 0x2c
    28d0:	01a07005 	moveq	r7, r5
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    28d4:	1a000039 	bne	29c0 <sbrktest+0x298>
    printf(1, "pipe() failed\n");
    exit();
  }

  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    28d8:	eb000239 	bl	31c4 <fork>
    28dc:	e3500000 	cmp	r0, #0
    28e0:	e5a70004 	str	r0, [r7, #4]!
    28e4:	0a000020 	beq	296c <sbrktest+0x244>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    28e8:	e3700001 	cmn	r0, #1
    28ec:	0a000003 	beq	2900 <sbrktest+0x1d8>
      read(fds[0], &scratch, 1);
    28f0:	e51b0028 	ldr	r0, [fp, #-40]	; 0x28
    28f4:	e24b101d 	sub	r1, fp, #29
    28f8:	e3a02001 	mov	r2, #1
    28fc:	eb000264 	bl	3294 <read>
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }

  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2900:	e1570008 	cmp	r7, r8
    2904:	1afffff3 	bne	28d8 <sbrktest+0x1b0>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2908:	e3a00a01 	mov	r0, #4096	; 0x1000
    290c:	eb000316 	bl	356c <sbrk>
    2910:	e1a07000 	mov	r7, r0
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2914:	e5b50004 	ldr	r0, [r5, #4]!
    2918:	e3700001 	cmn	r0, #1
    291c:	0a000001 	beq	2928 <sbrktest+0x200>
      continue;
    kill(pids[i]);
    2920:	eb000282 	bl	3330 <kill>
    wait();
    2924:	eb000240 	bl	322c <wait>
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2928:	e1580005 	cmp	r8, r5
    292c:	1afffff8 	bne	2914 <sbrktest+0x1ec>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    2930:	e3770001 	cmn	r7, #1
    2934:	0a00001d 	beq	29b0 <sbrktest+0x288>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2938:	e3a00000 	mov	r0, #0
    293c:	eb00030a 	bl	356c <sbrk>
    2940:	e1560000 	cmp	r6, r0
    2944:	2a000003 	bcs	2958 <sbrktest+0x230>
    sbrk(-(sbrk(0) - oldbrk));
    2948:	e3a00000 	mov	r0, #0
    294c:	eb000306 	bl	356c <sbrk>
    2950:	e0600006 	rsb	r0, r0, r6
    2954:	eb000304 	bl	356c <sbrk>

  printf(stdout, "sbrk test OK\n");
    2958:	e5940000 	ldr	r0, [r4]
    295c:	e59f1144 	ldr	r1, [pc, #324]	; 2aa8 <sbrktest+0x380>
    2960:	eb000377 	bl	3744 <printf>
}
    2964:	e24bd01c 	sub	sp, fp, #28
    2968:	e8bd8df0 	pop	{r4, r5, r6, r7, r8, sl, fp, pc}
  }

  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    296c:	eb0002fe 	bl	356c <sbrk>
    2970:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    2974:	eb0002fc 	bl	356c <sbrk>
      write(fds[1], "x", 1);
    2978:	e51b0024 	ldr	r0, [fp, #-36]	; 0x24
    297c:	e59f1128 	ldr	r1, [pc, #296]	; 2aac <sbrktest+0x384>
    2980:	e3a02001 	mov	r2, #1
    2984:	eb00024f 	bl	32c8 <write>
      // sit around until killed
      for(;;) sleep(1000);
    2988:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    298c:	eb000303 	bl	35a0 <sleep>
    2990:	eafffffc 	b	2988 <sbrktest+0x260>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2994:	e5940000 	ldr	r0, [r4]
    2998:	e59f1110 	ldr	r1, [pc, #272]	; 2ab0 <sbrktest+0x388>
    299c:	e1a02007 	mov	r2, r7
    29a0:	e1a03005 	mov	r3, r5
    29a4:	e58dc000 	str	ip, [sp]
    29a8:	eb000365 	bl	3744 <printf>
      exit();
    29ac:	eb000211 	bl	31f8 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    29b0:	e5940000 	ldr	r0, [r4]
    29b4:	e59f10f8 	ldr	r1, [pc, #248]	; 2ab4 <sbrktest+0x38c>
    29b8:	eb000361 	bl	3744 <printf>
    exit();
    29bc:	eb00020d 	bl	31f8 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    29c0:	e3a00001 	mov	r0, #1
    29c4:	e59f10ec 	ldr	r1, [pc, #236]	; 2ab8 <sbrktest+0x390>
    29c8:	eb00035d 	bl	3744 <printf>
    exit();
    29cc:	eb000209 	bl	31f8 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    29d0:	e1a02007 	mov	r2, r7
    29d4:	e59f10e0 	ldr	r1, [pc, #224]	; 2abc <sbrktest+0x394>
    29d8:	e5d73000 	ldrb	r3, [r7]
    29dc:	e5940000 	ldr	r0, [r4]
    29e0:	eb000357 	bl	3744 <printf>
      kill(ppid);
    29e4:	e1a00005 	mov	r0, r5
    29e8:	eb000250 	bl	3330 <kill>
      exit();
    29ec:	eb000201 	bl	31f8 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    29f0:	e5940000 	ldr	r0, [r4]
    29f4:	e59f10c4 	ldr	r1, [pc, #196]	; 2ac0 <sbrktest+0x398>
    29f8:	eb000351 	bl	3744 <printf>
      exit();
    29fc:	eb0001fd 	bl	31f8 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2a00:	e5940000 	ldr	r0, [r4]
    2a04:	e59f10b8 	ldr	r1, [pc, #184]	; 2ac4 <sbrktest+0x39c>
    2a08:	e1a02005 	mov	r2, r5
    2a0c:	eb00034c 	bl	3744 <printf>
    exit();
    2a10:	eb0001f8 	bl	31f8 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2a14:	e5940000 	ldr	r0, [r4]
    2a18:	e59f10a8 	ldr	r1, [pc, #168]	; 2ac8 <sbrktest+0x3a0>
    2a1c:	eb000348 	bl	3744 <printf>
    exit();
    2a20:	eb0001f4 	bl	31f8 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2a24:	e5940000 	ldr	r0, [r4]
    2a28:	e59f109c 	ldr	r1, [pc, #156]	; 2acc <sbrktest+0x3a4>
    2a2c:	e1a02007 	mov	r2, r7
    2a30:	e1a03005 	mov	r3, r5
    2a34:	eb000342 	bl	3744 <printf>
    exit();
    2a38:	eb0001ee 	bl	31f8 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2a3c:	e5940000 	ldr	r0, [r4]
    2a40:	e59f1088 	ldr	r1, [pc, #136]	; 2ad0 <sbrktest+0x3a8>
    2a44:	e1a02005 	mov	r2, r5
    2a48:	eb00033d 	bl	3744 <printf>
    exit();
    2a4c:	eb0001e9 	bl	31f8 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    2a50:	e5940000 	ldr	r0, [r4]
    2a54:	e59f1078 	ldr	r1, [pc, #120]	; 2ad4 <sbrktest+0x3ac>
    2a58:	eb000339 	bl	3744 <printf>
    exit();
    2a5c:	eb0001e5 	bl	31f8 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) { 
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2a60:	e5940000 	ldr	r0, [r4]
    2a64:	e59f106c 	ldr	r1, [pc, #108]	; 2ad8 <sbrktest+0x3b0>
    2a68:	eb000335 	bl	3744 <printf>
    exit();
    2a6c:	eb0001e1 	bl	31f8 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    2a70:	e5940000 	ldr	r0, [r4]
    2a74:	e59f1060 	ldr	r1, [pc, #96]	; 2adc <sbrktest+0x3b4>
    2a78:	eb000331 	bl	3744 <printf>
    exit();
    2a7c:	eb0001dd 	bl	31f8 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    2a80:	e5940000 	ldr	r0, [r4]
    2a84:	e59f1054 	ldr	r1, [pc, #84]	; 2ae0 <sbrktest+0x3b8>
    2a88:	eb00032d 	bl	3744 <printf>
    exit();
    2a8c:	eb0001d9 	bl	31f8 <exit>
    2a90:	00005244 	.word	0x00005244
    2a94:	00004e04 	.word	0x00004e04
    2a98:	00001388 	.word	0x00001388
    2a9c:	063fffff 	.word	0x063fffff
    2aa0:	fffff000 	.word	0xfffff000
    2aa4:	801e8480 	.word	0x801e8480
    2aa8:	00004fa8 	.word	0x00004fa8
    2aac:	00004760 	.word	0x00004760
    2ab0:	00004e10 	.word	0x00004e10
    2ab4:	00004f8c 	.word	0x00004f8c
    2ab8:	00003d90 	.word	0x00003d90
    2abc:	00004f70 	.word	0x00004f70
    2ac0:	00005148 	.word	0x00005148
    2ac4:	00004f4c 	.word	0x00004f4c
    2ac8:	00004f1c 	.word	0x00004f1c
    2acc:	00004ef4 	.word	0x00004ef4
    2ad0:	00004ebc 	.word	0x00004ebc
    2ad4:	00004ea0 	.word	0x00004ea0
    2ad8:	00004e60 	.word	0x00004e60
    2adc:	00004e44 	.word	0x00004e44
    2ae0:	00004e2c 	.word	0x00004e2c

00002ae4 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    2ae4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2ae8:	e28db000 	add	fp, sp, #0
    sleep(*p);
    2aec:	e5900000 	ldr	r0, [r0]
}
    2af0:	e28bd000 	add	sp, fp, #0
    2af4:	e8bd0800 	pop	{fp}
}

void
validateint(int *p)
{
    sleep(*p);
    2af8:	ea0002a8 	b	35a0 <sleep>

00002afc <validatetest>:
}

void
validatetest(void)
{
    2afc:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
    2b00:	e28db014 	add	fp, sp, #20
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    2b04:	e59f5080 	ldr	r5, [pc, #128]	; 2b8c <validatetest+0x90>
    2b08:	e59f1080 	ldr	r1, [pc, #128]	; 2b90 <validatetest+0x94>
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    2b0c:	e3a04000 	mov	r4, #0
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    2b10:	e5950000 	ldr	r0, [r5]
    2b14:	eb00030a 	bl	3744 <printf>
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    2b18:	eb0001a9 	bl	31c4 <fork>
    2b1c:	e2506000 	subs	r6, r0, #0
    2b20:	0a000012 	beq	2b70 <validatetest+0x74>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    2b24:	e3a00000 	mov	r0, #0
    2b28:	eb00029c 	bl	35a0 <sleep>
    sleep(0);
    2b2c:	e3a00000 	mov	r0, #0
    2b30:	eb00029a 	bl	35a0 <sleep>
    kill(pid);
    2b34:	e1a00006 	mov	r0, r6
    2b38:	eb0001fc 	bl	3330 <kill>
    wait();
    2b3c:	eb0001ba 	bl	322c <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    2b40:	e59f004c 	ldr	r0, [pc, #76]	; 2b94 <validatetest+0x98>
    2b44:	e1a01004 	mov	r1, r4
    2b48:	eb000246 	bl	3468 <link>
    2b4c:	e3700001 	cmn	r0, #1
    2b50:	1a000009 	bne	2b7c <validatetest+0x80>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    2b54:	e2844a01 	add	r4, r4, #4096	; 0x1000
    2b58:	e3540945 	cmp	r4, #1130496	; 0x114000
    2b5c:	1affffed 	bne	2b18 <validatetest+0x1c>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    2b60:	e5950000 	ldr	r0, [r5]
    2b64:	e59f102c 	ldr	r1, [pc, #44]	; 2b98 <validatetest+0x9c>
}
    2b68:	e8bd4878 	pop	{r3, r4, r5, r6, fp, lr}
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    2b6c:	ea0002f4 	b	3744 <printf>
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    2b70:	e1a00004 	mov	r0, r4
    2b74:	ebffffda 	bl	2ae4 <validateint>
      exit();
    2b78:	eb00019e 	bl	31f8 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    2b7c:	e5950000 	ldr	r0, [r5]
    2b80:	e59f1014 	ldr	r1, [pc, #20]	; 2b9c <validatetest+0xa0>
    2b84:	eb0002ee 	bl	3744 <printf>
      exit();
    2b88:	eb00019a 	bl	31f8 <exit>
    2b8c:	00005244 	.word	0x00005244
    2b90:	00004fb8 	.word	0x00004fb8
    2b94:	00004fc8 	.word	0x00004fc8
    2b98:	00004ff0 	.word	0x00004ff0
    2b9c:	00004fd4 	.word	0x00004fd4

00002ba0 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    2ba0:	e92d4818 	push	{r3, r4, fp, lr}
    2ba4:	e28db00c 	add	fp, sp, #12
  int i;

  printf(stdout, "bss test\n");
    2ba8:	e59f4050 	ldr	r4, [pc, #80]	; 2c00 <bsstest+0x60>
    2bac:	e59f1050 	ldr	r1, [pc, #80]	; 2c04 <bsstest+0x64>
    2bb0:	e5940000 	ldr	r0, [r4]
    2bb4:	eb0002e2 	bl	3744 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    2bb8:	e59f3048 	ldr	r3, [pc, #72]	; 2c08 <bsstest+0x68>
    2bbc:	e5d32000 	ldrb	r2, [r3]
    2bc0:	e3520000 	cmp	r2, #0
    2bc4:	1a000009 	bne	2bf0 <bsstest+0x50>
}

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
    2bc8:	e59f103c 	ldr	r1, [pc, #60]	; 2c0c <bsstest+0x6c>
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    2bcc:	e5f32001 	ldrb	r2, [r3, #1]!
    2bd0:	e3520000 	cmp	r2, #0
    2bd4:	1a000005 	bne	2bf0 <bsstest+0x50>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    2bd8:	e1530001 	cmp	r3, r1
    2bdc:	1afffffa 	bne	2bcc <bsstest+0x2c>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    2be0:	e5940000 	ldr	r0, [r4]
    2be4:	e59f1024 	ldr	r1, [pc, #36]	; 2c10 <bsstest+0x70>
}
    2be8:	e8bd4818 	pop	{r3, r4, fp, lr}
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    2bec:	ea0002d4 	b	3744 <printf>
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    2bf0:	e5940000 	ldr	r0, [r4]
    2bf4:	e59f1018 	ldr	r1, [pc, #24]	; 2c14 <bsstest+0x74>
    2bf8:	eb0002d1 	bl	3744 <printf>
      exit();
    2bfc:	eb00017d 	bl	31f8 <exit>
    2c00:	00005244 	.word	0x00005244
    2c04:	00005000 	.word	0x00005000
    2c08:	000052ec 	.word	0x000052ec
    2c0c:	000079fb 	.word	0x000079fb
    2c10:	00005020 	.word	0x00005020
    2c14:	0000500c 	.word	0x0000500c

00002c18 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    2c18:	e92d4830 	push	{r4, r5, fp, lr}
    2c1c:	e28db00c 	add	fp, sp, #12
  int pid, fd;

  unlink("bigarg-ok");
    2c20:	e59f00c0 	ldr	r0, [pc, #192]	; 2ce8 <bigargtest+0xd0>
    2c24:	eb0001f5 	bl	3400 <unlink>
  pid = fork();
    2c28:	eb000165 	bl	31c4 <fork>
  if(pid == 0){
    2c2c:	e3500000 	cmp	r0, #0
    2c30:	0a00000a 	beq	2c60 <bigargtest+0x48>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    2c34:	ba000026 	blt	2cd4 <bigargtest+0xbc>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    2c38:	eb00017b 	bl	322c <wait>
  fd = open("bigarg-ok", 0);
    2c3c:	e59f00a4 	ldr	r0, [pc, #164]	; 2ce8 <bigargtest+0xd0>
    2c40:	e3a01000 	mov	r1, #0
    2c44:	eb0001d3 	bl	3398 <open>
  if(fd < 0){
    2c48:	e3500000 	cmp	r0, #0
    2c4c:	ba00001b 	blt	2cc0 <bigargtest+0xa8>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    2c50:	eb0001a9 	bl	32fc <close>
  unlink("bigarg-ok");
    2c54:	e59f008c 	ldr	r0, [pc, #140]	; 2ce8 <bigargtest+0xd0>
}
    2c58:	e8bd4830 	pop	{r4, r5, fp, lr}
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
  unlink("bigarg-ok");
    2c5c:	ea0001e7 	b	3400 <unlink>
{
  int pid, fd;

  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    2c60:	e59f3084 	ldr	r3, [pc, #132]	; 2cec <bigargtest+0xd4>
    2c64:	e59f1084 	ldr	r1, [pc, #132]	; 2cf0 <bigargtest+0xd8>

// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
    2c68:	e283207c 	add	r2, r3, #124	; 0x7c
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    2c6c:	e5a31004 	str	r1, [r3, #4]!
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    2c70:	e1530002 	cmp	r3, r2
    2c74:	1afffffc 	bne	2c6c <bigargtest+0x54>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    2c78:	e59f4074 	ldr	r4, [pc, #116]	; 2cf4 <bigargtest+0xdc>
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    2c7c:	e59f5074 	ldr	r5, [pc, #116]	; 2cf8 <bigargtest+0xe0>
    2c80:	e3a03000 	mov	r3, #0
    printf(stdout, "bigarg test\n");
    2c84:	e59f1070 	ldr	r1, [pc, #112]	; 2cfc <bigargtest+0xe4>
    2c88:	e5940000 	ldr	r0, [r4]
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    2c8c:	e585307c 	str	r3, [r5, #124]	; 0x7c
    printf(stdout, "bigarg test\n");
    2c90:	eb0002ab 	bl	3744 <printf>
    exec("echo", args);
    2c94:	e1a01005 	mov	r1, r5
    2c98:	e59f0060 	ldr	r0, [pc, #96]	; 2d00 <bigargtest+0xe8>
    2c9c:	eb0001b0 	bl	3364 <exec>
    printf(stdout, "bigarg test ok\n");
    2ca0:	e5940000 	ldr	r0, [r4]
    2ca4:	e59f1058 	ldr	r1, [pc, #88]	; 2d04 <bigargtest+0xec>
    2ca8:	eb0002a5 	bl	3744 <printf>
    fd = open("bigarg-ok", O_CREATE);
    2cac:	e3a01c02 	mov	r1, #512	; 0x200
    2cb0:	e59f0030 	ldr	r0, [pc, #48]	; 2ce8 <bigargtest+0xd0>
    2cb4:	eb0001b7 	bl	3398 <open>
    close(fd);
    2cb8:	eb00018f 	bl	32fc <close>
    exit();
    2cbc:	eb00014d 	bl	31f8 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    2cc0:	e59f302c 	ldr	r3, [pc, #44]	; 2cf4 <bigargtest+0xdc>
    2cc4:	e59f103c 	ldr	r1, [pc, #60]	; 2d08 <bigargtest+0xf0>
    2cc8:	e5930000 	ldr	r0, [r3]
    2ccc:	eb00029c 	bl	3744 <printf>
    exit();
    2cd0:	eb000148 	bl	31f8 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    2cd4:	e59f3018 	ldr	r3, [pc, #24]	; 2cf4 <bigargtest+0xdc>
    2cd8:	e59f102c 	ldr	r1, [pc, #44]	; 2d0c <bigargtest+0xf4>
    2cdc:	e5930000 	ldr	r0, [r3]
    2ce0:	eb000297 	bl	3744 <printf>
    exit();
    2ce4:	eb000143 	bl	31f8 <exit>
    2ce8:	00005030 	.word	0x00005030
    2cec:	0000525c 	.word	0x0000525c
    2cf0:	0000503c 	.word	0x0000503c
    2cf4:	00005244 	.word	0x00005244
    2cf8:	00005260 	.word	0x00005260
    2cfc:	0000511c 	.word	0x0000511c
    2d00:	00003a38 	.word	0x00003a38
    2d04:	0000512c 	.word	0x0000512c
    2d08:	00005158 	.word	0x00005158
    2d0c:	0000513c 	.word	0x0000513c

00002d10 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    2d10:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2d14:	e28db020 	add	fp, sp, #32
    2d18:	e24dd044 	sub	sp, sp, #68	; 0x44
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    2d1c:	e3a00001 	mov	r0, #1
    2d20:	e59f11cc 	ldr	r1, [pc, #460]	; 2ef4 <fsfull+0x1e4>
    2d24:	eb000286 	bl	3744 <printf>

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    2d28:	e59f91c8 	ldr	r9, [pc, #456]	; 2ef8 <fsfull+0x1e8>
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
    2d2c:	e59f51c8 	ldr	r5, [pc, #456]	; 2efc <fsfull+0x1ec>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    2d30:	e3a04000 	mov	r4, #0
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2d34:	e59f81c4 	ldr	r8, [pc, #452]	; 2f00 <fsfull+0x1f0>
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    2d38:	e0cc1499 	smull	r1, ip, r9, r4
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    2d3c:	e0c23498 	smull	r3, r2, r8, r4
    2d40:	e59fa1bc 	ldr	sl, [pc, #444]	; 2f04 <fsfull+0x1f4>
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    2d44:	e1a06fc4 	asr	r6, r4, #31
    2d48:	e066c34c 	rsb	ip, r6, ip, asr #6
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    2d4c:	e3a03064 	mov	r3, #100	; 0x64
    2d50:	e06622c2 	rsb	r2, r6, r2, asr #5

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2d54:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    name[3] = '0' + (nfiles % 100) / 10;
    2d58:	e0020293 	mul	r2, r3, r2

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2d5c:	e0000c90 	mul	r0, r0, ip
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    2d60:	e0c3e49a 	smull	lr, r3, sl, r4
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    2d64:	e59f119c 	ldr	r1, [pc, #412]	; 2f08 <fsfull+0x1f8>

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2d68:	e0600004 	rsb	r0, r0, r4
    name[3] = '0' + (nfiles % 100) / 10;
    2d6c:	e0622004 	rsb	r2, r2, r4

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2d70:	e0c8e098 	smull	lr, r8, r8, r0
    name[3] = '0' + (nfiles % 100) / 10;
    2d74:	e0cae29a 	smull	lr, sl, sl, r2
    name[4] = '0' + (nfiles % 10);
    2d78:	e0663143 	rsb	r3, r6, r3, asr #2

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2d7c:	e1a00fc0 	asr	r0, r0, #31
    name[3] = '0' + (nfiles % 100) / 10;
    2d80:	e1a02fc2 	asr	r2, r2, #31
    name[4] = '0' + (nfiles % 10);
    2d84:	e0833103 	add	r3, r3, r3, lsl #2

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2d88:	e06082c8 	rsb	r8, r0, r8, asr #5
    name[3] = '0' + (nfiles % 100) / 10;
    2d8c:	e062a14a 	rsb	sl, r2, sl, asr #2
    name[4] = '0' + (nfiles % 10);
    2d90:	e0443083 	sub	r3, r4, r3, lsl #1
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    2d94:	e28cc030 	add	ip, ip, #48	; 0x30
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    2d98:	e2833030 	add	r3, r3, #48	; 0x30

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    2d9c:	e3a0e066 	mov	lr, #102	; 0x66
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2da0:	e2888030 	add	r8, r8, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    2da4:	e24b2064 	sub	r2, fp, #100	; 0x64
    2da8:	e3a00001 	mov	r0, #1
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    2dac:	e28aa030 	add	sl, sl, #48	; 0x30
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    2db0:	e3a07000 	mov	r7, #0

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    2db4:	e54be064 	strb	lr, [fp, #-100]	; 0x64
    name[1] = '0' + nfiles / 1000;
    2db8:	e54bc063 	strb	ip, [fp, #-99]	; 0x63
    name[2] = '0' + (nfiles % 1000) / 100;
    2dbc:	e54b8062 	strb	r8, [fp, #-98]	; 0x62
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    2dc0:	e54b3060 	strb	r3, [fp, #-96]	; 0x60
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    2dc4:	e54ba061 	strb	sl, [fp, #-97]	; 0x61
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    2dc8:	e54b705f 	strb	r7, [fp, #-95]	; 0x5f
    printf(1, "writing %s\n", name);
    2dcc:	eb00025c 	bl	3744 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    2dd0:	e24b0064 	sub	r0, fp, #100	; 0x64
    2dd4:	e59f1130 	ldr	r1, [pc, #304]	; 2f0c <fsfull+0x1fc>
    2dd8:	eb00016e 	bl	3398 <open>
    if(fd < 0){
    2ddc:	e2508000 	subs	r8, r0, #0
    2de0:	aa000001 	bge	2dec <fsfull+0xdc>
    2de4:	ea000010 	b	2e2c <fsfull+0x11c>
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    2de8:	e0877000 	add	r7, r7, r0
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    2dec:	e1a00008 	mov	r0, r8
    2df0:	e59f1118 	ldr	r1, [pc, #280]	; 2f10 <fsfull+0x200>
    2df4:	e3a02c02 	mov	r2, #512	; 0x200
    2df8:	eb000132 	bl	32c8 <write>
      if(cc < 512)
    2dfc:	e1500005 	cmp	r0, r5
    2e00:	cafffff8 	bgt	2de8 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    2e04:	e59f1108 	ldr	r1, [pc, #264]	; 2f14 <fsfull+0x204>
    2e08:	e1a02007 	mov	r2, r7
    2e0c:	e3a00001 	mov	r0, #1
    2e10:	eb00024b 	bl	3744 <printf>
    close(fd);
    2e14:	e1a00008 	mov	r0, r8
    2e18:	eb000137 	bl	32fc <close>
    if(total == 0)
    2e1c:	e3570000 	cmp	r7, #0
    2e20:	0a000005 	beq	2e3c <fsfull+0x12c>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    2e24:	e2844001 	add	r4, r4, #1
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    2e28:	eaffffc1 	b	2d34 <fsfull+0x24>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    2e2c:	e3a00001 	mov	r0, #1
    2e30:	e59f10e0 	ldr	r1, [pc, #224]	; 2f18 <fsfull+0x208>
    2e34:	e24b2064 	sub	r2, fp, #100	; 0x64
    2e38:	eb000241 	bl	3744 <printf>
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    2e3c:	e59f80b4 	ldr	r8, [pc, #180]	; 2ef8 <fsfull+0x1e8>
    name[2] = '0' + (nfiles % 1000) / 100;
    2e40:	e59f70b8 	ldr	r7, [pc, #184]	; 2f00 <fsfull+0x1f0>
    name[3] = '0' + (nfiles % 100) / 10;
    2e44:	e59f50b8 	ldr	r5, [pc, #184]	; 2f04 <fsfull+0x1f4>
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    2e48:	e0cc1498 	smull	r1, ip, r8, r4
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    2e4c:	e0c32497 	smull	r2, r3, r7, r4
    name[4] = '0' + (nfiles % 10);
    2e50:	e0cea495 	smull	sl, lr, r5, r4
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    2e54:	e066c34c 	rsb	ip, r6, ip, asr #6
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    2e58:	e3a02064 	mov	r2, #100	; 0x64
    2e5c:	e06632c3 	rsb	r3, r6, r3, asr #5

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2e60:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    name[3] = '0' + (nfiles % 100) / 10;
    2e64:	e0030392 	mul	r3, r2, r3

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2e68:	e0000c90 	mul	r0, r0, ip
    name[3] = '0' + (nfiles % 100) / 10;
    2e6c:	e0633004 	rsb	r3, r3, r4

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2e70:	e0600004 	rsb	r0, r0, r4
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    2e74:	e066614e 	rsb	r6, r6, lr, asr #2

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2e78:	e0c12097 	smull	r2, r1, r7, r0
    name[3] = '0' + (nfiles % 100) / 10;
    2e7c:	e0c2a395 	smull	sl, r2, r5, r3
    name[4] = '0' + (nfiles % 10);
    2e80:	e0866106 	add	r6, r6, r6, lsl #2
    2e84:	e0446086 	sub	r6, r4, r6, lsl #1

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2e88:	e1a00fc0 	asr	r0, r0, #31
    name[3] = '0' + (nfiles % 100) / 10;
    2e8c:	e1a03fc3 	asr	r3, r3, #31

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    2e90:	e06012c1 	rsb	r1, r0, r1, asr #5
    name[3] = '0' + (nfiles % 100) / 10;
    2e94:	e0632142 	rsb	r2, r3, r2, asr #2
    name[4] = '0' + (nfiles % 10);
    2e98:	e2863030 	add	r3, r6, #48	; 0x30
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    2e9c:	e28cc030 	add	ip, ip, #48	; 0x30
    name[2] = '0' + (nfiles % 1000) / 100;
    2ea0:	e2811030 	add	r1, r1, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    2ea4:	e2822030 	add	r2, r2, #48	; 0x30
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    nfiles--;
    2ea8:	e2444001 	sub	r4, r4, #1
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    2eac:	e3a0e066 	mov	lr, #102	; 0x66
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    2eb0:	e54b3060 	strb	r3, [fp, #-96]	; 0x60
    name[5] = '\0';
    unlink(name);
    2eb4:	e24b0064 	sub	r0, fp, #100	; 0x64
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    2eb8:	e3a03000 	mov	r3, #0
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    2ebc:	e54be064 	strb	lr, [fp, #-100]	; 0x64
    name[1] = '0' + nfiles / 1000;
    2ec0:	e54bc063 	strb	ip, [fp, #-99]	; 0x63
    name[2] = '0' + (nfiles % 1000) / 100;
    2ec4:	e54b1062 	strb	r1, [fp, #-98]	; 0x62
    name[3] = '0' + (nfiles % 100) / 10;
    2ec8:	e54b2061 	strb	r2, [fp, #-97]	; 0x61
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    2ecc:	e54b305f 	strb	r3, [fp, #-95]	; 0x5f
    unlink(name);
    2ed0:	eb00014a 	bl	3400 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    2ed4:	e3740001 	cmn	r4, #1
    2ed8:	e1a06fc4 	asr	r6, r4, #31
    2edc:	1affffd9 	bne	2e48 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    2ee0:	e3a00001 	mov	r0, #1
    2ee4:	e59f1030 	ldr	r1, [pc, #48]	; 2f1c <fsfull+0x20c>
    2ee8:	eb000215 	bl	3744 <printf>
}
    2eec:	e24bd020 	sub	sp, fp, #32
    2ef0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2ef4:	00005170 	.word	0x00005170
    2ef8:	10624dd3 	.word	0x10624dd3
    2efc:	000001ff 	.word	0x000001ff
    2f00:	51eb851f 	.word	0x51eb851f
    2f04:	66666667 	.word	0x66666667
    2f08:	00005180 	.word	0x00005180
    2f0c:	00000202 	.word	0x00000202
    2f10:	000079fc 	.word	0x000079fc
    2f14:	0000519c 	.word	0x0000519c
    2f18:	0000518c 	.word	0x0000518c
    2f1c:	000051ac 	.word	0x000051ac

00002f20 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    2f20:	e59f3024 	ldr	r3, [pc, #36]	; 2f4c <rand+0x2c>
}

unsigned long randstate = 1;
unsigned int
rand()
{
    2f24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2f28:	e28db000 	add	fp, sp, #0
  randstate = randstate * 1664525 + 1013904223;
    2f2c:	e5931018 	ldr	r1, [r3, #24]
    2f30:	e59f0018 	ldr	r0, [pc, #24]	; 2f50 <rand+0x30>
    2f34:	e59f2018 	ldr	r2, [pc, #24]	; 2f54 <rand+0x34>
    2f38:	e0202190 	mla	r0, r0, r1, r2
    2f3c:	e5830018 	str	r0, [r3, #24]
  return randstate;
}
    2f40:	e28bd000 	add	sp, fp, #0
    2f44:	e8bd0800 	pop	{fp}
    2f48:	e12fff1e 	bx	lr
    2f4c:	00005244 	.word	0x00005244
    2f50:	0019660d 	.word	0x0019660d
    2f54:	3c6ef35f 	.word	0x3c6ef35f

00002f58 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
    2f58:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    2f5c:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
    2f60:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    2f64:	e4d13001 	ldrb	r3, [r1], #1
    2f68:	e3530000 	cmp	r3, #0
    2f6c:	e4c23001 	strb	r3, [r2], #1
    2f70:	1afffffb 	bne	2f64 <strcpy+0xc>
    ;
  return os;
}
    2f74:	e28bd000 	add	sp, fp, #0
    2f78:	e8bd0800 	pop	{fp}
    2f7c:	e12fff1e 	bx	lr

00002f80 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    2f80:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2f84:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
    2f88:	e5d03000 	ldrb	r3, [r0]
    2f8c:	e5d12000 	ldrb	r2, [r1]
    2f90:	e3530000 	cmp	r3, #0
    2f94:	1a000004 	bne	2fac <strcmp+0x2c>
    2f98:	ea000005 	b	2fb4 <strcmp+0x34>
    2f9c:	e5f03001 	ldrb	r3, [r0, #1]!
    2fa0:	e3530000 	cmp	r3, #0
    2fa4:	0a000006 	beq	2fc4 <strcmp+0x44>
    2fa8:	e5f12001 	ldrb	r2, [r1, #1]!
    2fac:	e1530002 	cmp	r3, r2
    2fb0:	0afffff9 	beq	2f9c <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
    2fb4:	e0620003 	rsb	r0, r2, r3
    2fb8:	e28bd000 	add	sp, fp, #0
    2fbc:	e8bd0800 	pop	{fp}
    2fc0:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    2fc4:	e5d12001 	ldrb	r2, [r1, #1]
    2fc8:	eafffff9 	b	2fb4 <strcmp+0x34>

00002fcc <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
    2fcc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2fd0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
    2fd4:	e5d03000 	ldrb	r3, [r0]
    2fd8:	e3530000 	cmp	r3, #0
    2fdc:	01a00003 	moveq	r0, r3
    2fe0:	0a000006 	beq	3000 <strlen+0x34>
    2fe4:	e1a02000 	mov	r2, r0
    2fe8:	e3a03000 	mov	r3, #0
    2fec:	e5f21001 	ldrb	r1, [r2, #1]!
    2ff0:	e2833001 	add	r3, r3, #1
    2ff4:	e1a00003 	mov	r0, r3
    2ff8:	e3510000 	cmp	r1, #0
    2ffc:	1afffffa 	bne	2fec <strlen+0x20>
    ;
  return n;
}
    3000:	e28bd000 	add	sp, fp, #0
    3004:	e8bd0800 	pop	{fp}
    3008:	e12fff1e 	bx	lr

0000300c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
    300c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
    3010:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3014:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
    3018:	0a000006 	beq	3038 <memset+0x2c>
    301c:	e6ef1071 	uxtb	r1, r1
    3020:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
    3024:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
    3028:	e2533001 	subs	r3, r3, #1
    302c:	e4cc1001 	strb	r1, [ip], #1
    3030:	1afffffc 	bne	3028 <memset+0x1c>
    3034:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
    3038:	e28bd000 	add	sp, fp, #0
    303c:	e8bd0800 	pop	{fp}
    3040:	e12fff1e 	bx	lr

00003044 <strchr>:

char*
strchr(const char *s, char c)
{
    3044:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3048:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
    304c:	e5d03000 	ldrb	r3, [r0]
    3050:	e3530000 	cmp	r3, #0
    3054:	1a000004 	bne	306c <strchr+0x28>
    3058:	ea000008 	b	3080 <strchr+0x3c>
    305c:	e5d03001 	ldrb	r3, [r0, #1]
    3060:	e2800001 	add	r0, r0, #1
    3064:	e3530000 	cmp	r3, #0
    3068:	0a000004 	beq	3080 <strchr+0x3c>
    if(*s == c)
    306c:	e1530001 	cmp	r3, r1
    3070:	1afffff9 	bne	305c <strchr+0x18>
      return (char*)s;
  return 0;
}
    3074:	e28bd000 	add	sp, fp, #0
    3078:	e8bd0800 	pop	{fp}
    307c:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
    3080:	e1a00003 	mov	r0, r3
    3084:	eafffffa 	b	3074 <strchr+0x30>

00003088 <gets>:
}

char*
gets(char *buf, int max)
{
    3088:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    308c:	e28db018 	add	fp, sp, #24
    3090:	e24dd00c 	sub	sp, sp, #12
    3094:	e1a08000 	mov	r8, r0
    3098:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    309c:	e1a06000 	mov	r6, r0
    30a0:	e3a05000 	mov	r5, #0
    30a4:	ea000008 	b	30cc <gets+0x44>
    cc = read(0, &c, 1);
    30a8:	eb000079 	bl	3294 <read>
    if(cc < 1)
    30ac:	e3500000 	cmp	r0, #0
    30b0:	da00000b 	ble	30e4 <gets+0x5c>
      break;
    buf[i++] = c;
    30b4:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
    30b8:	e1a05004 	mov	r5, r4
    30bc:	e353000a 	cmp	r3, #10
    30c0:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    30c4:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
    30c8:	0a00000a 	beq	30f8 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    30cc:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    30d0:	e0854002 	add	r4, r5, r2
    30d4:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
    30d8:	e3a00000 	mov	r0, #0
    30dc:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    30e0:	bafffff0 	blt	30a8 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    30e4:	e3a03000 	mov	r3, #0
    30e8:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
    30ec:	e1a00008 	mov	r0, r8
    30f0:	e24bd018 	sub	sp, fp, #24
    30f4:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    30f8:	e1a05004 	mov	r5, r4
    30fc:	eafffff8 	b	30e4 <gets+0x5c>

00003100 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
    3100:	e92d4830 	push	{r4, r5, fp, lr}
    3104:	e1a05001 	mov	r5, r1
    3108:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    310c:	e3a01000 	mov	r1, #0
    3110:	eb0000a0 	bl	3398 <open>
  if(fd < 0)
    3114:	e2504000 	subs	r4, r0, #0
    return -1;
    3118:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    311c:	ba000004 	blt	3134 <stat+0x34>
    return -1;
  r = fstat(fd, st);
    3120:	e1a01005 	mov	r1, r5
    3124:	eb0000c2 	bl	3434 <fstat>
    3128:	e1a05000 	mov	r5, r0
  close(fd);
    312c:	e1a00004 	mov	r0, r4
    3130:	eb000071 	bl	32fc <close>
  return r;
}
    3134:	e1a00005 	mov	r0, r5
    3138:	e8bd8830 	pop	{r4, r5, fp, pc}

0000313c <atoi>:

int
atoi(const char *s)
{
    313c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3140:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3144:	e5d03000 	ldrb	r3, [r0]
    3148:	e2432030 	sub	r2, r3, #48	; 0x30
    314c:	e6ef2072 	uxtb	r2, r2
    3150:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
    3154:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
    3158:	8a000009 	bhi	3184 <atoi+0x48>
    315c:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
    3160:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
    3164:	e0800100 	add	r0, r0, r0, lsl #2
    3168:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    316c:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
    3170:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3174:	e2431030 	sub	r1, r3, #48	; 0x30
    3178:	e6ef1071 	uxtb	r1, r1
    317c:	e3510009 	cmp	r1, #9
    3180:	9afffff7 	bls	3164 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
    3184:	e28bd000 	add	sp, fp, #0
    3188:	e8bd0800 	pop	{fp}
    318c:	e12fff1e 	bx	lr

00003190 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3190:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    3194:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3198:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    319c:	da000005 	ble	31b8 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
    31a0:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
    31a4:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
    31a8:	e4d1c001 	ldrb	ip, [r1], #1
    31ac:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    31b0:	e1530002 	cmp	r3, r2
    31b4:	1afffffb 	bne	31a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    31b8:	e28bd000 	add	sp, fp, #0
    31bc:	e8bd0800 	pop	{fp}
    31c0:	e12fff1e 	bx	lr

000031c4 <fork>:
    31c4:	e92d4000 	push	{lr}
    31c8:	e92d0008 	push	{r3}
    31cc:	e92d0004 	push	{r2}
    31d0:	e92d0002 	push	{r1}
    31d4:	e92d0001 	push	{r0}
    31d8:	e3a00001 	mov	r0, #1
    31dc:	ef000040 	svc	0x00000040
    31e0:	e8bd0002 	pop	{r1}
    31e4:	e8bd0002 	pop	{r1}
    31e8:	e8bd0004 	pop	{r2}
    31ec:	e8bd0008 	pop	{r3}
    31f0:	e8bd4000 	pop	{lr}
    31f4:	e12fff1e 	bx	lr

000031f8 <exit>:
    31f8:	e92d4000 	push	{lr}
    31fc:	e92d0008 	push	{r3}
    3200:	e92d0004 	push	{r2}
    3204:	e92d0002 	push	{r1}
    3208:	e92d0001 	push	{r0}
    320c:	e3a00002 	mov	r0, #2
    3210:	ef000040 	svc	0x00000040
    3214:	e8bd0002 	pop	{r1}
    3218:	e8bd0002 	pop	{r1}
    321c:	e8bd0004 	pop	{r2}
    3220:	e8bd0008 	pop	{r3}
    3224:	e8bd4000 	pop	{lr}
    3228:	e12fff1e 	bx	lr

0000322c <wait>:
    322c:	e92d4000 	push	{lr}
    3230:	e92d0008 	push	{r3}
    3234:	e92d0004 	push	{r2}
    3238:	e92d0002 	push	{r1}
    323c:	e92d0001 	push	{r0}
    3240:	e3a00003 	mov	r0, #3
    3244:	ef000040 	svc	0x00000040
    3248:	e8bd0002 	pop	{r1}
    324c:	e8bd0002 	pop	{r1}
    3250:	e8bd0004 	pop	{r2}
    3254:	e8bd0008 	pop	{r3}
    3258:	e8bd4000 	pop	{lr}
    325c:	e12fff1e 	bx	lr

00003260 <pipe>:
    3260:	e92d4000 	push	{lr}
    3264:	e92d0008 	push	{r3}
    3268:	e92d0004 	push	{r2}
    326c:	e92d0002 	push	{r1}
    3270:	e92d0001 	push	{r0}
    3274:	e3a00004 	mov	r0, #4
    3278:	ef000040 	svc	0x00000040
    327c:	e8bd0002 	pop	{r1}
    3280:	e8bd0002 	pop	{r1}
    3284:	e8bd0004 	pop	{r2}
    3288:	e8bd0008 	pop	{r3}
    328c:	e8bd4000 	pop	{lr}
    3290:	e12fff1e 	bx	lr

00003294 <read>:
    3294:	e92d4000 	push	{lr}
    3298:	e92d0008 	push	{r3}
    329c:	e92d0004 	push	{r2}
    32a0:	e92d0002 	push	{r1}
    32a4:	e92d0001 	push	{r0}
    32a8:	e3a00005 	mov	r0, #5
    32ac:	ef000040 	svc	0x00000040
    32b0:	e8bd0002 	pop	{r1}
    32b4:	e8bd0002 	pop	{r1}
    32b8:	e8bd0004 	pop	{r2}
    32bc:	e8bd0008 	pop	{r3}
    32c0:	e8bd4000 	pop	{lr}
    32c4:	e12fff1e 	bx	lr

000032c8 <write>:
    32c8:	e92d4000 	push	{lr}
    32cc:	e92d0008 	push	{r3}
    32d0:	e92d0004 	push	{r2}
    32d4:	e92d0002 	push	{r1}
    32d8:	e92d0001 	push	{r0}
    32dc:	e3a00010 	mov	r0, #16
    32e0:	ef000040 	svc	0x00000040
    32e4:	e8bd0002 	pop	{r1}
    32e8:	e8bd0002 	pop	{r1}
    32ec:	e8bd0004 	pop	{r2}
    32f0:	e8bd0008 	pop	{r3}
    32f4:	e8bd4000 	pop	{lr}
    32f8:	e12fff1e 	bx	lr

000032fc <close>:
    32fc:	e92d4000 	push	{lr}
    3300:	e92d0008 	push	{r3}
    3304:	e92d0004 	push	{r2}
    3308:	e92d0002 	push	{r1}
    330c:	e92d0001 	push	{r0}
    3310:	e3a00015 	mov	r0, #21
    3314:	ef000040 	svc	0x00000040
    3318:	e8bd0002 	pop	{r1}
    331c:	e8bd0002 	pop	{r1}
    3320:	e8bd0004 	pop	{r2}
    3324:	e8bd0008 	pop	{r3}
    3328:	e8bd4000 	pop	{lr}
    332c:	e12fff1e 	bx	lr

00003330 <kill>:
    3330:	e92d4000 	push	{lr}
    3334:	e92d0008 	push	{r3}
    3338:	e92d0004 	push	{r2}
    333c:	e92d0002 	push	{r1}
    3340:	e92d0001 	push	{r0}
    3344:	e3a00006 	mov	r0, #6
    3348:	ef000040 	svc	0x00000040
    334c:	e8bd0002 	pop	{r1}
    3350:	e8bd0002 	pop	{r1}
    3354:	e8bd0004 	pop	{r2}
    3358:	e8bd0008 	pop	{r3}
    335c:	e8bd4000 	pop	{lr}
    3360:	e12fff1e 	bx	lr

00003364 <exec>:
    3364:	e92d4000 	push	{lr}
    3368:	e92d0008 	push	{r3}
    336c:	e92d0004 	push	{r2}
    3370:	e92d0002 	push	{r1}
    3374:	e92d0001 	push	{r0}
    3378:	e3a00007 	mov	r0, #7
    337c:	ef000040 	svc	0x00000040
    3380:	e8bd0002 	pop	{r1}
    3384:	e8bd0002 	pop	{r1}
    3388:	e8bd0004 	pop	{r2}
    338c:	e8bd0008 	pop	{r3}
    3390:	e8bd4000 	pop	{lr}
    3394:	e12fff1e 	bx	lr

00003398 <open>:
    3398:	e92d4000 	push	{lr}
    339c:	e92d0008 	push	{r3}
    33a0:	e92d0004 	push	{r2}
    33a4:	e92d0002 	push	{r1}
    33a8:	e92d0001 	push	{r0}
    33ac:	e3a0000f 	mov	r0, #15
    33b0:	ef000040 	svc	0x00000040
    33b4:	e8bd0002 	pop	{r1}
    33b8:	e8bd0002 	pop	{r1}
    33bc:	e8bd0004 	pop	{r2}
    33c0:	e8bd0008 	pop	{r3}
    33c4:	e8bd4000 	pop	{lr}
    33c8:	e12fff1e 	bx	lr

000033cc <mknod>:
    33cc:	e92d4000 	push	{lr}
    33d0:	e92d0008 	push	{r3}
    33d4:	e92d0004 	push	{r2}
    33d8:	e92d0002 	push	{r1}
    33dc:	e92d0001 	push	{r0}
    33e0:	e3a00011 	mov	r0, #17
    33e4:	ef000040 	svc	0x00000040
    33e8:	e8bd0002 	pop	{r1}
    33ec:	e8bd0002 	pop	{r1}
    33f0:	e8bd0004 	pop	{r2}
    33f4:	e8bd0008 	pop	{r3}
    33f8:	e8bd4000 	pop	{lr}
    33fc:	e12fff1e 	bx	lr

00003400 <unlink>:
    3400:	e92d4000 	push	{lr}
    3404:	e92d0008 	push	{r3}
    3408:	e92d0004 	push	{r2}
    340c:	e92d0002 	push	{r1}
    3410:	e92d0001 	push	{r0}
    3414:	e3a00012 	mov	r0, #18
    3418:	ef000040 	svc	0x00000040
    341c:	e8bd0002 	pop	{r1}
    3420:	e8bd0002 	pop	{r1}
    3424:	e8bd0004 	pop	{r2}
    3428:	e8bd0008 	pop	{r3}
    342c:	e8bd4000 	pop	{lr}
    3430:	e12fff1e 	bx	lr

00003434 <fstat>:
    3434:	e92d4000 	push	{lr}
    3438:	e92d0008 	push	{r3}
    343c:	e92d0004 	push	{r2}
    3440:	e92d0002 	push	{r1}
    3444:	e92d0001 	push	{r0}
    3448:	e3a00008 	mov	r0, #8
    344c:	ef000040 	svc	0x00000040
    3450:	e8bd0002 	pop	{r1}
    3454:	e8bd0002 	pop	{r1}
    3458:	e8bd0004 	pop	{r2}
    345c:	e8bd0008 	pop	{r3}
    3460:	e8bd4000 	pop	{lr}
    3464:	e12fff1e 	bx	lr

00003468 <link>:
    3468:	e92d4000 	push	{lr}
    346c:	e92d0008 	push	{r3}
    3470:	e92d0004 	push	{r2}
    3474:	e92d0002 	push	{r1}
    3478:	e92d0001 	push	{r0}
    347c:	e3a00013 	mov	r0, #19
    3480:	ef000040 	svc	0x00000040
    3484:	e8bd0002 	pop	{r1}
    3488:	e8bd0002 	pop	{r1}
    348c:	e8bd0004 	pop	{r2}
    3490:	e8bd0008 	pop	{r3}
    3494:	e8bd4000 	pop	{lr}
    3498:	e12fff1e 	bx	lr

0000349c <mkdir>:
    349c:	e92d4000 	push	{lr}
    34a0:	e92d0008 	push	{r3}
    34a4:	e92d0004 	push	{r2}
    34a8:	e92d0002 	push	{r1}
    34ac:	e92d0001 	push	{r0}
    34b0:	e3a00014 	mov	r0, #20
    34b4:	ef000040 	svc	0x00000040
    34b8:	e8bd0002 	pop	{r1}
    34bc:	e8bd0002 	pop	{r1}
    34c0:	e8bd0004 	pop	{r2}
    34c4:	e8bd0008 	pop	{r3}
    34c8:	e8bd4000 	pop	{lr}
    34cc:	e12fff1e 	bx	lr

000034d0 <chdir>:
    34d0:	e92d4000 	push	{lr}
    34d4:	e92d0008 	push	{r3}
    34d8:	e92d0004 	push	{r2}
    34dc:	e92d0002 	push	{r1}
    34e0:	e92d0001 	push	{r0}
    34e4:	e3a00009 	mov	r0, #9
    34e8:	ef000040 	svc	0x00000040
    34ec:	e8bd0002 	pop	{r1}
    34f0:	e8bd0002 	pop	{r1}
    34f4:	e8bd0004 	pop	{r2}
    34f8:	e8bd0008 	pop	{r3}
    34fc:	e8bd4000 	pop	{lr}
    3500:	e12fff1e 	bx	lr

00003504 <dup>:
    3504:	e92d4000 	push	{lr}
    3508:	e92d0008 	push	{r3}
    350c:	e92d0004 	push	{r2}
    3510:	e92d0002 	push	{r1}
    3514:	e92d0001 	push	{r0}
    3518:	e3a0000a 	mov	r0, #10
    351c:	ef000040 	svc	0x00000040
    3520:	e8bd0002 	pop	{r1}
    3524:	e8bd0002 	pop	{r1}
    3528:	e8bd0004 	pop	{r2}
    352c:	e8bd0008 	pop	{r3}
    3530:	e8bd4000 	pop	{lr}
    3534:	e12fff1e 	bx	lr

00003538 <getpid>:
    3538:	e92d4000 	push	{lr}
    353c:	e92d0008 	push	{r3}
    3540:	e92d0004 	push	{r2}
    3544:	e92d0002 	push	{r1}
    3548:	e92d0001 	push	{r0}
    354c:	e3a0000b 	mov	r0, #11
    3550:	ef000040 	svc	0x00000040
    3554:	e8bd0002 	pop	{r1}
    3558:	e8bd0002 	pop	{r1}
    355c:	e8bd0004 	pop	{r2}
    3560:	e8bd0008 	pop	{r3}
    3564:	e8bd4000 	pop	{lr}
    3568:	e12fff1e 	bx	lr

0000356c <sbrk>:
    356c:	e92d4000 	push	{lr}
    3570:	e92d0008 	push	{r3}
    3574:	e92d0004 	push	{r2}
    3578:	e92d0002 	push	{r1}
    357c:	e92d0001 	push	{r0}
    3580:	e3a0000c 	mov	r0, #12
    3584:	ef000040 	svc	0x00000040
    3588:	e8bd0002 	pop	{r1}
    358c:	e8bd0002 	pop	{r1}
    3590:	e8bd0004 	pop	{r2}
    3594:	e8bd0008 	pop	{r3}
    3598:	e8bd4000 	pop	{lr}
    359c:	e12fff1e 	bx	lr

000035a0 <sleep>:
    35a0:	e92d4000 	push	{lr}
    35a4:	e92d0008 	push	{r3}
    35a8:	e92d0004 	push	{r2}
    35ac:	e92d0002 	push	{r1}
    35b0:	e92d0001 	push	{r0}
    35b4:	e3a0000d 	mov	r0, #13
    35b8:	ef000040 	svc	0x00000040
    35bc:	e8bd0002 	pop	{r1}
    35c0:	e8bd0002 	pop	{r1}
    35c4:	e8bd0004 	pop	{r2}
    35c8:	e8bd0008 	pop	{r3}
    35cc:	e8bd4000 	pop	{lr}
    35d0:	e12fff1e 	bx	lr

000035d4 <uptime>:
    35d4:	e92d4000 	push	{lr}
    35d8:	e92d0008 	push	{r3}
    35dc:	e92d0004 	push	{r2}
    35e0:	e92d0002 	push	{r1}
    35e4:	e92d0001 	push	{r0}
    35e8:	e3a0000e 	mov	r0, #14
    35ec:	ef000040 	svc	0x00000040
    35f0:	e8bd0002 	pop	{r1}
    35f4:	e8bd0002 	pop	{r1}
    35f8:	e8bd0004 	pop	{r2}
    35fc:	e8bd0008 	pop	{r3}
    3600:	e8bd4000 	pop	{lr}
    3604:	e12fff1e 	bx	lr

00003608 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3608:	e92d4800 	push	{fp, lr}
    360c:	e28db004 	add	fp, sp, #4
    3610:	e24b3004 	sub	r3, fp, #4
    3614:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
    3618:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    361c:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
    3620:	e1a01003 	mov	r1, r3
    3624:	ebffff27 	bl	32c8 <write>
}
    3628:	e24bd004 	sub	sp, fp, #4
    362c:	e8bd8800 	pop	{fp, pc}

00003630 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3630:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3634:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    3638:	e1a00fa1 	lsr	r0, r1, #31
    363c:	e3530000 	cmp	r3, #0
    3640:	03a03000 	moveq	r3, #0
    3644:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3648:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    364c:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3650:	e24dd014 	sub	sp, sp, #20
    3654:	e59f909c 	ldr	r9, [pc, #156]	; 36f8 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    3658:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    365c:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
    3660:	e3a0a000 	mov	sl, #0
    3664:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
    3668:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    366c:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
    3670:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    3674:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
    3678:	e1a0e031 	lsr	lr, r1, r0
    367c:	e20ee001 	and	lr, lr, #1
    3680:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
    3684:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
    3688:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
    368c:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    3690:	e2500001 	subs	r0, r0, #1
    3694:	2afffff7 	bcs	3678 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    3698:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
    369c:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    36a0:	e0601001 	rsb	r1, r0, r1
    36a4:	e28a5001 	add	r5, sl, #1
    36a8:	e7d91001 	ldrb	r1, [r9, r1]
    36ac:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
    36b0:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    36b4:	11a0a005 	movne	sl, r5
    36b8:	1affffeb 	bne	366c <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
    36bc:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
    36c0:	124b2024 	subne	r2, fp, #36	; 0x24
    36c4:	10823005 	addne	r3, r2, r5
    36c8:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
    36cc:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
    36d0:	13a0202d 	movne	r2, #45	; 0x2d
    36d4:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
    36d8:	e7d61005 	ldrb	r1, [r6, r5]
    36dc:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    36e0:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
    36e4:	ebffffc7 	bl	3608 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    36e8:	e3750001 	cmn	r5, #1
    36ec:	1afffff9 	bne	36d8 <printint+0xa8>
    putc(fd, buf[i]);
}
    36f0:	e24bd020 	sub	sp, fp, #32
    36f4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    36f8:	00005228 	.word	0x00005228

000036fc <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    36fc:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    3700:	e92d0830 	push	{r4, r5, fp}
    3704:	e1a02000 	mov	r2, r0
    3708:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    370c:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    3710:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
    3714:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
    3718:	e1a04c32 	lsr	r4, r2, ip
    371c:	e2044001 	and	r4, r4, #1
    3720:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
    3724:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
    3728:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
    372c:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    3730:	e25cc001 	subs	ip, ip, #1
    3734:	2afffff7 	bcs	3718 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
    3738:	e24bd008 	sub	sp, fp, #8
    373c:	e8bd0830 	pop	{r4, r5, fp}
    3740:	e12fff1e 	bx	lr

00003744 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3744:	e92d000e 	push	{r1, r2, r3}
    3748:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    374c:	e28db020 	add	fp, sp, #32
    3750:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3754:	e59b4004 	ldr	r4, [fp, #4]
    3758:	e5d48000 	ldrb	r8, [r4]
    375c:	e3580000 	cmp	r8, #0
    3760:	0a000027 	beq	3804 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    3764:	e59f712c 	ldr	r7, [pc, #300]	; 3898 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    3768:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    376c:	e3a0a000 	mov	sl, #0
    3770:	ea000008 	b	3798 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3774:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
    3778:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    377c:	0a000002 	beq	378c <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
    3780:	e1a00005 	mov	r0, r5
    3784:	e1a01008 	mov	r1, r8
    3788:	ebffff9e 	bl	3608 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    378c:	e5f48001 	ldrb	r8, [r4, #1]!
    3790:	e3580000 	cmp	r8, #0
    3794:	0a00001a 	beq	3804 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
    3798:	e35a0000 	cmp	sl, #0
    379c:	0afffff4 	beq	3774 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    37a0:	e35a0025 	cmp	sl, #37	; 0x25
    37a4:	1afffff8 	bne	378c <printf+0x48>
      if(c == 'd'){
    37a8:	e3580064 	cmp	r8, #100	; 0x64
    37ac:	0a00002c 	beq	3864 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    37b0:	e3580078 	cmp	r8, #120	; 0x78
    37b4:	13580070 	cmpne	r8, #112	; 0x70
    37b8:	13a09000 	movne	r9, #0
    37bc:	03a09001 	moveq	r9, #1
    37c0:	0a000013 	beq	3814 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    37c4:	e3580073 	cmp	r8, #115	; 0x73
    37c8:	0a000018 	beq	3830 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    37cc:	e3580063 	cmp	r8, #99	; 0x63
    37d0:	0a00002a 	beq	3880 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    37d4:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
    37d8:	e1a0100a 	mov	r1, sl
    37dc:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    37e0:	0a000002 	beq	37f0 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    37e4:	ebffff87 	bl	3608 <putc>
        putc(fd, c);
    37e8:	e1a00005 	mov	r0, r5
    37ec:	e1a01008 	mov	r1, r8
    37f0:	ebffff84 	bl	3608 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    37f4:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    37f8:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    37fc:	e3580000 	cmp	r8, #0
    3800:	1affffe4 	bne	3798 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3804:	e24bd020 	sub	sp, fp, #32
    3808:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    380c:	e28dd00c 	add	sp, sp, #12
    3810:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3814:	e1a00005 	mov	r0, r5
    3818:	e4961004 	ldr	r1, [r6], #4
    381c:	e3a02010 	mov	r2, #16
    3820:	e3a03000 	mov	r3, #0
    3824:	ebffff81 	bl	3630 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3828:	e3a0a000 	mov	sl, #0
    382c:	eaffffd6 	b	378c <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    3830:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
    3834:	e3580000 	cmp	r8, #0
    3838:	01a08007 	moveq	r8, r7
        while(*s != 0){
    383c:	e5d81000 	ldrb	r1, [r8]
    3840:	e3510000 	cmp	r1, #0
    3844:	0a000004 	beq	385c <printf+0x118>
          putc(fd, *s);
    3848:	e1a00005 	mov	r0, r5
    384c:	ebffff6d 	bl	3608 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3850:	e5f81001 	ldrb	r1, [r8, #1]!
    3854:	e3510000 	cmp	r1, #0
    3858:	1afffffa 	bne	3848 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    385c:	e1a0a001 	mov	sl, r1
    3860:	eaffffc9 	b	378c <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3864:	e1a00005 	mov	r0, r5
    3868:	e4961004 	ldr	r1, [r6], #4
    386c:	e3a0200a 	mov	r2, #10
    3870:	e3a03001 	mov	r3, #1
    3874:	ebffff6d 	bl	3630 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3878:	e3a0a000 	mov	sl, #0
    387c:	eaffffc2 	b	378c <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3880:	e4961004 	ldr	r1, [r6], #4
    3884:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3888:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    388c:	e6ef1071 	uxtb	r1, r1
    3890:	ebffff5c 	bl	3608 <putc>
    3894:	eaffffbc 	b	378c <printf+0x48>
    3898:	0000523c 	.word	0x0000523c

0000389c <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    389c:	e59f3098 	ldr	r3, [pc, #152]	; 393c <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
    38a0:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
    38a4:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    38a8:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
    38ac:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    38b0:	e152000c 	cmp	r2, ip
    38b4:	e5921000 	ldr	r1, [r2]
    38b8:	2a000001 	bcs	38c4 <free+0x28>
    38bc:	e15c0001 	cmp	ip, r1
    38c0:	3a000007 	bcc	38e4 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    38c4:	e1520001 	cmp	r2, r1
    38c8:	3a000003 	bcc	38dc <free+0x40>
    38cc:	e152000c 	cmp	r2, ip
    38d0:	3a000003 	bcc	38e4 <free+0x48>
    38d4:	e15c0001 	cmp	ip, r1
    38d8:	3a000001 	bcc	38e4 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
    38dc:	e1a02001 	mov	r2, r1
    38e0:	eafffff2 	b	38b0 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    38e4:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    38e8:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    38ec:	e08c5184 	add	r5, ip, r4, lsl #3
    38f0:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
    38f4:	05911004 	ldreq	r1, [r1, #4]
    38f8:	00814004 	addeq	r4, r1, r4
    38fc:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    3900:	05921000 	ldreq	r1, [r2]
    3904:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
    3908:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
    390c:	e5921004 	ldr	r1, [r2, #4]
    3910:	e0824181 	add	r4, r2, r1, lsl #3
    3914:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3918:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    391c:	0510c004 	ldreq	ip, [r0, #-4]
    3920:	008c1001 	addeq	r1, ip, r1
    3924:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
    3928:	05101008 	ldreq	r1, [r0, #-8]
    392c:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
    3930:	e24bd008 	sub	sp, fp, #8
    3934:	e8bd0830 	pop	{r4, r5, fp}
    3938:	e12fff1e 	bx	lr
    393c:	000052e0 	.word	0x000052e0

00003940 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3940:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3944:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
    3948:	e59f50d4 	ldr	r5, [pc, #212]	; 3a24 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    394c:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
    3950:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    3954:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3958:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    395c:	e3530000 	cmp	r3, #0
    3960:	0a00002b 	beq	3a14 <malloc+0xd4>
    3964:	e5930000 	ldr	r0, [r3]
    3968:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    396c:	e1520004 	cmp	r2, r4
    3970:	2a00001b 	bcs	39e4 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    3974:	e59f80ac 	ldr	r8, [pc, #172]	; 3a28 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    3978:	e1a07184 	lsl	r7, r4, #3
    397c:	ea000003 	b	3990 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3980:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    3984:	e5902004 	ldr	r2, [r0, #4]
    3988:	e1540002 	cmp	r4, r2
    398c:	9a000014 	bls	39e4 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3990:	e5952000 	ldr	r2, [r5]
    3994:	e1a03000 	mov	r3, r0
    3998:	e1500002 	cmp	r0, r2
    399c:	1afffff7 	bne	3980 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    39a0:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    39a4:	81a00007 	movhi	r0, r7
    39a8:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    39ac:	81a06004 	movhi	r6, r4
    39b0:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    39b4:	ebfffeec 	bl	356c <sbrk>
    39b8:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    39bc:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
    39c0:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
    39c4:	0a000010 	beq	3a0c <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    39c8:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
    39cc:	ebffffb2 	bl	389c <free>
  return freep;
    39d0:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    39d4:	e3530000 	cmp	r3, #0
    39d8:	1affffe8 	bne	3980 <malloc+0x40>
        return 0;
    39dc:	e1a00003 	mov	r0, r3
  }
}
    39e0:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    39e4:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    39e8:	10642002 	rsbne	r2, r4, r2
    39ec:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    39f0:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
    39f4:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    39f8:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
    39fc:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
    3a00:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
    3a04:	e2800008 	add	r0, r0, #8
    3a08:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
    3a0c:	e3a00000 	mov	r0, #0
    3a10:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3a14:	e2850004 	add	r0, r5, #4
    3a18:	e5850000 	str	r0, [r5]
    base.s.size = 0;
    3a1c:	e9850009 	stmib	r5, {r0, r3}
    3a20:	eaffffd3 	b	3974 <malloc+0x34>
    3a24:	000052e0 	.word	0x000052e0
    3a28:	00000fff 	.word	0x00000fff
