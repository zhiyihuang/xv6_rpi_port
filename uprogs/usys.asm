
usys.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <fork>:
   0:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   4:	e3a00001 	mov	r0, #1
   8:	ef000040 	svc	0x00000040
   c:	e8bd1ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
  10:	e8bd0002 	pop	{r1}
  14:	e12fff1e 	bx	lr

00000018 <exit>:
  18:	e92d1000 	push	{ip}
  1c:	e3a0c002 	mov	ip, #2
  20:	e92d4000 	push	{lr}
  24:	ef000040 	svc	0x00000040
  28:	e8bd4000 	pop	{lr}
  2c:	e8bd1000 	pop	{ip}
  30:	e12fff1e 	bx	lr

00000034 <wait>:
  34:	e92d1000 	push	{ip}
  38:	e3a0c003 	mov	ip, #3
  3c:	e92d4000 	push	{lr}
  40:	ef000040 	svc	0x00000040
  44:	e8bd4000 	pop	{lr}
  48:	e8bd1000 	pop	{ip}
  4c:	e12fff1e 	bx	lr

00000050 <pipe>:
  50:	e92d1000 	push	{ip}
  54:	e3a0c004 	mov	ip, #4
  58:	e92d4000 	push	{lr}
  5c:	ef000040 	svc	0x00000040
  60:	e8bd4000 	pop	{lr}
  64:	e8bd1000 	pop	{ip}
  68:	e12fff1e 	bx	lr

0000006c <read>:
  6c:	e92d1000 	push	{ip}
  70:	e3a0c005 	mov	ip, #5
  74:	e92d4000 	push	{lr}
  78:	ef000040 	svc	0x00000040
  7c:	e8bd4000 	pop	{lr}
  80:	e8bd1000 	pop	{ip}
  84:	e12fff1e 	bx	lr

00000088 <write>:
  88:	e92d1000 	push	{ip}
  8c:	e3a0c010 	mov	ip, #16
  90:	e92d4000 	push	{lr}
  94:	ef000040 	svc	0x00000040
  98:	e8bd4000 	pop	{lr}
  9c:	e8bd1000 	pop	{ip}
  a0:	e12fff1e 	bx	lr

000000a4 <close>:
  a4:	e92d1000 	push	{ip}
  a8:	e3a0c015 	mov	ip, #21
  ac:	e92d4000 	push	{lr}
  b0:	ef000040 	svc	0x00000040
  b4:	e8bd4000 	pop	{lr}
  b8:	e8bd1000 	pop	{ip}
  bc:	e12fff1e 	bx	lr

000000c0 <kill>:
  c0:	e92d1000 	push	{ip}
  c4:	e3a0c006 	mov	ip, #6
  c8:	e92d4000 	push	{lr}
  cc:	ef000040 	svc	0x00000040
  d0:	e8bd4000 	pop	{lr}
  d4:	e8bd1000 	pop	{ip}
  d8:	e12fff1e 	bx	lr

000000dc <exec>:
  dc:	e92d1000 	push	{ip}
  e0:	e3a0c007 	mov	ip, #7
  e4:	e92d4000 	push	{lr}
  e8:	ef000040 	svc	0x00000040
  ec:	e8bd4000 	pop	{lr}
  f0:	e8bd1000 	pop	{ip}
  f4:	e12fff1e 	bx	lr

000000f8 <open>:
  f8:	e92d1000 	push	{ip}
  fc:	e3a0c00f 	mov	ip, #15
 100:	e92d4000 	push	{lr}
 104:	ef000040 	svc	0x00000040
 108:	e8bd4000 	pop	{lr}
 10c:	e8bd1000 	pop	{ip}
 110:	e12fff1e 	bx	lr

00000114 <mknod>:
 114:	e92d1000 	push	{ip}
 118:	e3a0c011 	mov	ip, #17
 11c:	e92d4000 	push	{lr}
 120:	ef000040 	svc	0x00000040
 124:	e8bd4000 	pop	{lr}
 128:	e8bd1000 	pop	{ip}
 12c:	e12fff1e 	bx	lr

00000130 <unlink>:
 130:	e92d1000 	push	{ip}
 134:	e3a0c012 	mov	ip, #18
 138:	e92d4000 	push	{lr}
 13c:	ef000040 	svc	0x00000040
 140:	e8bd4000 	pop	{lr}
 144:	e8bd1000 	pop	{ip}
 148:	e12fff1e 	bx	lr

0000014c <fstat>:
 14c:	e92d1000 	push	{ip}
 150:	e3a0c008 	mov	ip, #8
 154:	e92d4000 	push	{lr}
 158:	ef000040 	svc	0x00000040
 15c:	e8bd4000 	pop	{lr}
 160:	e8bd1000 	pop	{ip}
 164:	e12fff1e 	bx	lr

00000168 <link>:
 168:	e92d1000 	push	{ip}
 16c:	e3a0c013 	mov	ip, #19
 170:	e92d4000 	push	{lr}
 174:	ef000040 	svc	0x00000040
 178:	e8bd4000 	pop	{lr}
 17c:	e8bd1000 	pop	{ip}
 180:	e12fff1e 	bx	lr

00000184 <mkdir>:
 184:	e92d1000 	push	{ip}
 188:	e3a0c014 	mov	ip, #20
 18c:	e92d4000 	push	{lr}
 190:	ef000040 	svc	0x00000040
 194:	e8bd4000 	pop	{lr}
 198:	e8bd1000 	pop	{ip}
 19c:	e12fff1e 	bx	lr

000001a0 <chdir>:
 1a0:	e92d1000 	push	{ip}
 1a4:	e3a0c009 	mov	ip, #9
 1a8:	e92d4000 	push	{lr}
 1ac:	ef000040 	svc	0x00000040
 1b0:	e8bd4000 	pop	{lr}
 1b4:	e8bd1000 	pop	{ip}
 1b8:	e12fff1e 	bx	lr

000001bc <dup>:
 1bc:	e92d1000 	push	{ip}
 1c0:	e3a0c00a 	mov	ip, #10
 1c4:	e92d4000 	push	{lr}
 1c8:	ef000040 	svc	0x00000040
 1cc:	e8bd4000 	pop	{lr}
 1d0:	e8bd1000 	pop	{ip}
 1d4:	e12fff1e 	bx	lr

000001d8 <getpid>:
 1d8:	e92d1000 	push	{ip}
 1dc:	e3a0c00b 	mov	ip, #11
 1e0:	e92d4000 	push	{lr}
 1e4:	ef000040 	svc	0x00000040
 1e8:	e8bd4000 	pop	{lr}
 1ec:	e8bd1000 	pop	{ip}
 1f0:	e12fff1e 	bx	lr

000001f4 <sbrk>:
 1f4:	e92d1000 	push	{ip}
 1f8:	e3a0c00c 	mov	ip, #12
 1fc:	e92d4000 	push	{lr}
 200:	ef000040 	svc	0x00000040
 204:	e8bd4000 	pop	{lr}
 208:	e8bd1000 	pop	{ip}
 20c:	e12fff1e 	bx	lr

00000210 <sleep>:
 210:	e92d1000 	push	{ip}
 214:	e3a0c00d 	mov	ip, #13
 218:	e92d4000 	push	{lr}
 21c:	ef000040 	svc	0x00000040
 220:	e8bd4000 	pop	{lr}
 224:	e8bd1000 	pop	{ip}
 228:	e12fff1e 	bx	lr

0000022c <uptime>:
 22c:	e92d1000 	push	{ip}
 230:	e3a0c00e 	mov	ip, #14
 234:	e92d4000 	push	{lr}
 238:	ef000040 	svc	0x00000040
 23c:	e8bd4000 	pop	{lr}
 240:	e8bd1000 	pop	{ip}
 244:	e12fff1e 	bx	lr
