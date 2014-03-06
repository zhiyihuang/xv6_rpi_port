
_sh:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	e92d4830 	push	{r4, r5, fp, lr}
       4:	e28db00c 	add	fp, sp, #12
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
       8:	ea000001 	b	14 <main+0x14>
    if(fd >= 3){
       c:	e3530002 	cmp	r3, #2
      10:	ca000027 	bgt	b4 <main+0xb4>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
      14:	e59f00ac 	ldr	r0, [pc, #172]	; c8 <main+0xc8>
      18:	e3a01002 	mov	r1, #2
      1c:	eb0003c1 	bl	f28 <open>
      20:	e2503000 	subs	r3, r0, #0
      24:	aafffff8 	bge	c <main+0xc>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      28:	e59f409c 	ldr	r4, [pc, #156]	; cc <main+0xcc>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      2c:	e3a05000 	mov	r5, #0
      30:	ea000003 	b	44 <main+0x44>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      34:	eb000043 	bl	148 <fork1>
      38:	e3500000 	cmp	r0, #0
      3c:	0a00001e 	beq	bc <main+0xbc>
      runcmd(parsecmd(buf));
    wait();
      40:	eb00035d 	bl	dbc <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      44:	e59f0080 	ldr	r0, [pc, #128]	; cc <main+0xcc>
      48:	e3a01064 	mov	r1, #100	; 0x64
      4c:	eb000021 	bl	d8 <getcmd>
      50:	e3500000 	cmp	r0, #0
      54:	ba000015 	blt	b0 <main+0xb0>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      58:	e5d43000 	ldrb	r3, [r4]
      5c:	e3530063 	cmp	r3, #99	; 0x63
      60:	1afffff3 	bne	34 <main+0x34>
      64:	e5d43001 	ldrb	r3, [r4, #1]
      68:	e3530064 	cmp	r3, #100	; 0x64
      6c:	1afffff0 	bne	34 <main+0x34>
      70:	e5d43002 	ldrb	r3, [r4, #2]
      74:	e3530020 	cmp	r3, #32
      78:	1affffed 	bne	34 <main+0x34>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      7c:	e59f0048 	ldr	r0, [pc, #72]	; cc <main+0xcc>
      80:	eb0002b5 	bl	b5c <strlen>
      84:	e0843000 	add	r3, r4, r0
      if(chdir(buf+3) < 0)
      88:	e59f0040 	ldr	r0, [pc, #64]	; d0 <main+0xd0>
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      8c:	e5435001 	strb	r5, [r3, #-1]
      if(chdir(buf+3) < 0)
      90:	eb0003f2 	bl	1060 <chdir>
      94:	e3500000 	cmp	r0, #0
      98:	aaffffe9 	bge	44 <main+0x44>
        printf(2, "cannot cd %s\n", buf+3);
      9c:	e3a00002 	mov	r0, #2
      a0:	e59f102c 	ldr	r1, [pc, #44]	; d4 <main+0xd4>
      a4:	e59f2024 	ldr	r2, [pc, #36]	; d0 <main+0xd0>
      a8:	eb000489 	bl	12d4 <printf>
      ac:	eaffffe4 	b	44 <main+0x44>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
      b0:	eb000334 	bl	d88 <exit>
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      b4:	eb000374 	bl	e8c <close>
      break;
      b8:	eaffffda 	b	28 <main+0x28>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
      bc:	e59f0008 	ldr	r0, [pc, #8]	; cc <main+0xcc>
      c0:	eb000268 	bl	a68 <parsecmd>
      c4:	eb000027 	bl	168 <runcmd>
      c8:	00001684 	.word	0x00001684
      cc:	000016c8 	.word	0x000016c8
      d0:	000016cb 	.word	0x000016cb
      d4:	0000168c 	.word	0x0000168c

000000d8 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
      d8:	e92d4830 	push	{r4, r5, fp, lr}
      dc:	e1a04000 	mov	r4, r0
      e0:	e28db00c 	add	fp, sp, #12
      e4:	e1a05001 	mov	r5, r1
  printf(2, "$ ");
      e8:	e3a00002 	mov	r0, #2
      ec:	e59f1030 	ldr	r1, [pc, #48]	; 124 <getcmd+0x4c>
      f0:	eb000477 	bl	12d4 <printf>
  memset(buf, 0, nbuf);
      f4:	e1a02005 	mov	r2, r5
      f8:	e1a00004 	mov	r0, r4
      fc:	e3a01000 	mov	r1, #0
     100:	eb0002a5 	bl	b9c <memset>
  gets(buf, nbuf);
     104:	e1a00004 	mov	r0, r4
     108:	e1a01005 	mov	r1, r5
     10c:	eb0002c1 	bl	c18 <gets>
  if(buf[0] == 0) // EOF
     110:	e5d43000 	ldrb	r3, [r4]
     114:	e3530000 	cmp	r3, #0
    return -1;
  return 0;
}
     118:	03e00000 	mvneq	r0, #0
     11c:	13a00000 	movne	r0, #0
     120:	e8bd8830 	pop	{r4, r5, fp, pc}
     124:	000015bc 	.word	0x000015bc

00000128 <panic>:
  exit();
}

void
panic(char *s)
{
     128:	e92d4800 	push	{fp, lr}
     12c:	e1a02000 	mov	r2, r0
     130:	e28db004 	add	fp, sp, #4
  printf(2, "%s\n", s);
     134:	e59f1008 	ldr	r1, [pc, #8]	; 144 <panic+0x1c>
     138:	e3a00002 	mov	r0, #2
     13c:	eb000464 	bl	12d4 <printf>
  exit();
     140:	eb000310 	bl	d88 <exit>
     144:	000015c0 	.word	0x000015c0

00000148 <fork1>:
}

int
fork1(void)
{
     148:	e92d4800 	push	{fp, lr}
     14c:	e28db004 	add	fp, sp, #4
  int pid;
  
  pid = fork();
     150:	eb0002ff 	bl	d54 <fork>
  if(pid == -1)
     154:	e3700001 	cmn	r0, #1
     158:	18bd8800 	popne	{fp, pc}
    panic("fork");
     15c:	e59f0000 	ldr	r0, [pc]	; 164 <fork1+0x1c>
     160:	ebfffff0 	bl	128 <panic>
     164:	000015c4 	.word	0x000015c4

00000168 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     168:	e92d4810 	push	{r4, fp, lr}
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     16c:	e2504000 	subs	r4, r0, #0
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     170:	e28db008 	add	fp, sp, #8
     174:	e24dd00c 	sub	sp, sp, #12
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     178:	0a000019 	beq	1e4 <runcmd+0x7c>
    exit();
  
  switch(cmd->type){
     17c:	e5943000 	ldr	r3, [r4]
     180:	e2433001 	sub	r3, r3, #1
     184:	e3530004 	cmp	r3, #4
     188:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     18c:	ea000019 	b	1f8 <runcmd+0x90>
     190:	00000200 	.word	0x00000200
     194:	00000228 	.word	0x00000228
     198:	000001a4 	.word	0x000001a4
     19c:	0000024c 	.word	0x0000024c
     1a0:	000001e8 	.word	0x000001e8
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     1a4:	e24b0014 	sub	r0, fp, #20
     1a8:	eb000310 	bl	df0 <pipe>
     1ac:	e3500000 	cmp	r0, #0
     1b0:	ba000030 	blt	278 <runcmd+0x110>
      panic("pipe");
    if(fork1() == 0){
     1b4:	ebffffe3 	bl	148 <fork1>
     1b8:	e3500000 	cmp	r0, #0
     1bc:	0a000038 	beq	2a4 <runcmd+0x13c>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     1c0:	ebffffe0 	bl	148 <fork1>
     1c4:	e3500000 	cmp	r0, #0
     1c8:	0a00002c 	beq	280 <runcmd+0x118>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1cc:	e51b0014 	ldr	r0, [fp, #-20]
     1d0:	eb00032d 	bl	e8c <close>
    close(p[1]);
     1d4:	e51b0010 	ldr	r0, [fp, #-16]
     1d8:	eb00032b 	bl	e8c <close>
    wait();
     1dc:	eb0002f6 	bl	dbc <wait>
    wait();
     1e0:	eb0002f5 	bl	dbc <wait>
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit();
     1e4:	eb0002e7 	bl	d88 <exit>
    wait();
    break;
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     1e8:	ebffffd6 	bl	148 <fork1>
     1ec:	e3500000 	cmp	r0, #0
     1f0:	0a000013 	beq	244 <runcmd+0xdc>
      runcmd(bcmd->cmd);
    break;
  }
  exit();
     1f4:	eb0002e3 	bl	d88 <exit>
  if(cmd == 0)
    exit();
  
  switch(cmd->type){
  default:
    panic("runcmd");
     1f8:	e59f00cc 	ldr	r0, [pc, #204]	; 2cc <runcmd+0x164>
     1fc:	ebffffc9 	bl	128 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     200:	e5940004 	ldr	r0, [r4, #4]
     204:	e3500000 	cmp	r0, #0
     208:	0afffff5 	beq	1e4 <runcmd+0x7c>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     20c:	e2841004 	add	r1, r4, #4
     210:	eb000337 	bl	ef4 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     214:	e3a00002 	mov	r0, #2
     218:	e59f10b0 	ldr	r1, [pc, #176]	; 2d0 <runcmd+0x168>
     21c:	e5942004 	ldr	r2, [r4, #4]
     220:	eb00042b 	bl	12d4 <printf>
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit();
     224:	eb0002d7 	bl	d88 <exit>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     228:	e5940014 	ldr	r0, [r4, #20]
     22c:	eb000316 	bl	e8c <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     230:	e5940008 	ldr	r0, [r4, #8]
     234:	e5941010 	ldr	r1, [r4, #16]
     238:	eb00033a 	bl	f28 <open>
     23c:	e3500000 	cmp	r0, #0
     240:	ba000007 	blt	264 <runcmd+0xfc>
    break;
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     244:	e5940004 	ldr	r0, [r4, #4]
     248:	ebffffc6 	bl	168 <runcmd>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     24c:	ebffffbd 	bl	148 <fork1>
     250:	e3500000 	cmp	r0, #0
     254:	0afffffa 	beq	244 <runcmd+0xdc>
      runcmd(lcmd->left);
    wait();
     258:	eb0002d7 	bl	dbc <wait>
    runcmd(lcmd->right);
     25c:	e5940008 	ldr	r0, [r4, #8]
     260:	ebffffc0 	bl	168 <runcmd>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     264:	e3a00002 	mov	r0, #2
     268:	e59f1064 	ldr	r1, [pc, #100]	; 2d4 <runcmd+0x16c>
     26c:	e5942008 	ldr	r2, [r4, #8]
     270:	eb000417 	bl	12d4 <printf>
      exit();
     274:	eb0002c3 	bl	d88 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     278:	e59f0058 	ldr	r0, [pc, #88]	; 2d8 <runcmd+0x170>
     27c:	ebffffa9 	bl	128 <panic>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     280:	eb000301 	bl	e8c <close>
      dup(p[0]);
     284:	e51b0014 	ldr	r0, [fp, #-20]
     288:	eb000381 	bl	1094 <dup>
      close(p[0]);
     28c:	e51b0014 	ldr	r0, [fp, #-20]
     290:	eb0002fd 	bl	e8c <close>
      close(p[1]);
     294:	e51b0010 	ldr	r0, [fp, #-16]
     298:	eb0002fb 	bl	e8c <close>
      runcmd(pcmd->right);
     29c:	e5940008 	ldr	r0, [r4, #8]
     2a0:	ebffffb0 	bl	168 <runcmd>
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     2a4:	e3a00001 	mov	r0, #1
     2a8:	eb0002f7 	bl	e8c <close>
      dup(p[1]);
     2ac:	e51b0010 	ldr	r0, [fp, #-16]
     2b0:	eb000377 	bl	1094 <dup>
      close(p[0]);
     2b4:	e51b0014 	ldr	r0, [fp, #-20]
     2b8:	eb0002f3 	bl	e8c <close>
      close(p[1]);
     2bc:	e51b0010 	ldr	r0, [fp, #-16]
     2c0:	eb0002f1 	bl	e8c <close>
      runcmd(pcmd->left);
     2c4:	e5940004 	ldr	r0, [r4, #4]
     2c8:	ebffffa6 	bl	168 <runcmd>
     2cc:	000015cc 	.word	0x000015cc
     2d0:	000015d4 	.word	0x000015d4
     2d4:	000015e4 	.word	0x000015e4
     2d8:	000015f4 	.word	0x000015f4

000002dc <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     2dc:	e92d4818 	push	{r3, r4, fp, lr}
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2e0:	e3a00054 	mov	r0, #84	; 0x54
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     2e4:	e28db00c 	add	fp, sp, #12
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2e8:	eb000478 	bl	14d0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2ec:	e3a01000 	mov	r1, #0
     2f0:	e3a02054 	mov	r2, #84	; 0x54
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2f4:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     2f8:	eb000227 	bl	b9c <memset>
  cmd->type = EXEC;
     2fc:	e3a03001 	mov	r3, #1
     300:	e5843000 	str	r3, [r4]
  return (struct cmd*)cmd;
}
     304:	e1a00004 	mov	r0, r4
     308:	e8bd8818 	pop	{r3, r4, fp, pc}

0000030c <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     30c:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
     310:	e1a06000 	mov	r6, r0
     314:	e28db01c 	add	fp, sp, #28
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     318:	e3a00018 	mov	r0, #24
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     31c:	e1a08003 	mov	r8, r3
     320:	e1a05001 	mov	r5, r1
     324:	e1a04002 	mov	r4, r2
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     328:	eb000468 	bl	14d0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     32c:	e3a01000 	mov	r1, #0
     330:	e3a02018 	mov	r2, #24
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     334:	e1a07000 	mov	r7, r0
  memset(cmd, 0, sizeof(*cmd));
     338:	eb000217 	bl	b9c <memset>
  cmd->type = REDIR;
     33c:	e3a03002 	mov	r3, #2
  cmd->cmd = subcmd;
  cmd->file = file;
     340:	e5875008 	str	r5, [r7, #8]
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     344:	e8870048 	stm	r7, {r3, r6}
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
     348:	e59b3004 	ldr	r3, [fp, #4]
  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
     34c:	e587400c 	str	r4, [r7, #12]
  cmd->mode = mode;
     350:	e5878010 	str	r8, [r7, #16]
  cmd->fd = fd;
     354:	e5873014 	str	r3, [r7, #20]
  return (struct cmd*)cmd;
}
     358:	e1a00007 	mov	r0, r7
     35c:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}

00000360 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     360:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
     364:	e1a06000 	mov	r6, r0
     368:	e28db014 	add	fp, sp, #20
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     36c:	e3a0000c 	mov	r0, #12
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     370:	e1a05001 	mov	r5, r1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     374:	eb000455 	bl	14d0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     378:	e3a01000 	mov	r1, #0
     37c:	e3a0200c 	mov	r2, #12
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     380:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     384:	eb000204 	bl	b9c <memset>
  cmd->type = PIPE;
     388:	e3a03003 	mov	r3, #3
  cmd->left = left;
  cmd->right = right;
     38c:	e5845008 	str	r5, [r4, #8]
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
  cmd->left = left;
     390:	e8840048 	stm	r4, {r3, r6}
  cmd->right = right;
  return (struct cmd*)cmd;
}
     394:	e1a00004 	mov	r0, r4
     398:	e8bd8878 	pop	{r3, r4, r5, r6, fp, pc}

0000039c <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     39c:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
     3a0:	e1a06000 	mov	r6, r0
     3a4:	e28db014 	add	fp, sp, #20
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a8:	e3a0000c 	mov	r0, #12
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3ac:	e1a05001 	mov	r5, r1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b0:	eb000446 	bl	14d0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3b4:	e3a01000 	mov	r1, #0
     3b8:	e3a0200c 	mov	r2, #12
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3bc:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     3c0:	eb0001f5 	bl	b9c <memset>
  cmd->type = LIST;
     3c4:	e3a03004 	mov	r3, #4
  cmd->left = left;
  cmd->right = right;
     3c8:	e5845008 	str	r5, [r4, #8]
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
  cmd->left = left;
     3cc:	e8840048 	stm	r4, {r3, r6}
  cmd->right = right;
  return (struct cmd*)cmd;
}
     3d0:	e1a00004 	mov	r0, r4
     3d4:	e8bd8878 	pop	{r3, r4, r5, r6, fp, pc}

000003d8 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     3d8:	e92d4830 	push	{r4, r5, fp, lr}
     3dc:	e1a05000 	mov	r5, r0
     3e0:	e28db00c 	add	fp, sp, #12
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e4:	e3a00008 	mov	r0, #8
     3e8:	eb000438 	bl	14d0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ec:	e3a01000 	mov	r1, #0
     3f0:	e3a02008 	mov	r2, #8
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3f4:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     3f8:	eb0001e7 	bl	b9c <memset>
  cmd->type = BACK;
     3fc:	e3a03005 	mov	r3, #5
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}
     400:	e1a00004 	mov	r0, r4
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
  cmd->cmd = subcmd;
     404:	e8840028 	stm	r4, {r3, r5}
  return (struct cmd*)cmd;
}
     408:	e8bd8830 	pop	{r4, r5, fp, pc}

0000040c <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     40c:	e92d4df0 	push	{r4, r5, r6, r7, r8, sl, fp, lr}
     410:	e1a06000 	mov	r6, r0
  char *s;
  int ret;
  
  s = *ps;
     414:	e5904000 	ldr	r4, [r0]
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     418:	e28db01c 	add	fp, sp, #28
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     41c:	e1540001 	cmp	r4, r1
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     420:	e1a05001 	mov	r5, r1
     424:	e1a07002 	mov	r7, r2
     428:	e1a0a003 	mov	sl, r3
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     42c:	31a08004 	movcc	r8, r4
     430:	3a000003 	bcc	444 <gettoken+0x38>
     434:	ea000009 	b	460 <gettoken+0x54>
     438:	e1580005 	cmp	r8, r5
    s++;
     43c:	e1a04008 	mov	r4, r8
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     440:	0a000006 	beq	460 <gettoken+0x54>
     444:	e5d81000 	ldrb	r1, [r8]
     448:	e59f0124 	ldr	r0, [pc, #292]	; 574 <gettoken+0x168>
     44c:	eb0001e0 	bl	bd4 <strchr>
     450:	e1a04008 	mov	r4, r8
     454:	e2888001 	add	r8, r8, #1
     458:	e3500000 	cmp	r0, #0
     45c:	1afffff5 	bne	438 <gettoken+0x2c>
    s++;
  if(q)
     460:	e3570000 	cmp	r7, #0
    *q = s;
     464:	15874000 	strne	r4, [r7]
  ret = *s;
     468:	e5d48000 	ldrb	r8, [r4]
  switch(*s){
     46c:	e358003c 	cmp	r8, #60	; 0x3c
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
     470:	e1a01008 	mov	r1, r8
  switch(*s){
     474:	8a000015 	bhi	4d0 <gettoken+0xc4>
     478:	e358003b 	cmp	r8, #59	; 0x3b
     47c:	3a00002d 	bcc	538 <gettoken+0x12c>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     480:	e2844001 	add	r4, r4, #1
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     484:	e35a0000 	cmp	sl, #0
    *eq = s;
     488:	158a4000 	strne	r4, [sl]
  
  while(s < es && strchr(whitespace, *s))
     48c:	e1540005 	cmp	r4, r5
     490:	31a07004 	movcc	r7, r4
     494:	3a000003 	bcc	4a8 <gettoken+0x9c>
     498:	ea000009 	b	4c4 <gettoken+0xb8>
     49c:	e1570005 	cmp	r7, r5
    s++;
     4a0:	e1a04007 	mov	r4, r7
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     4a4:	0a000006 	beq	4c4 <gettoken+0xb8>
     4a8:	e5d71000 	ldrb	r1, [r7]
     4ac:	e59f00c0 	ldr	r0, [pc, #192]	; 574 <gettoken+0x168>
     4b0:	eb0001c7 	bl	bd4 <strchr>
     4b4:	e1a04007 	mov	r4, r7
     4b8:	e2877001 	add	r7, r7, #1
     4bc:	e3500000 	cmp	r0, #0
     4c0:	1afffff5 	bne	49c <gettoken+0x90>
    s++;
  *ps = s;
     4c4:	e5864000 	str	r4, [r6]
  return ret;
}
     4c8:	e1a00008 	mov	r0, r8
     4cc:	e8bd8df0 	pop	{r4, r5, r6, r7, r8, sl, fp, pc}
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     4d0:	e358003e 	cmp	r8, #62	; 0x3e
     4d4:	0a000020 	beq	55c <gettoken+0x150>
     4d8:	e358007c 	cmp	r8, #124	; 0x7c
     4dc:	0affffe7 	beq	480 <gettoken+0x74>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4e0:	e1550004 	cmp	r5, r4
     4e4:	81a08004 	movhi	r8, r4
     4e8:	81a07008 	movhi	r7, r8
     4ec:	8a000008 	bhi	514 <gettoken+0x108>
     4f0:	ea00000e 	b	530 <gettoken+0x124>
     4f4:	e5d41000 	ldrb	r1, [r4]
     4f8:	eb0001b5 	bl	bd4 <strchr>
     4fc:	e3500000 	cmp	r0, #0
     500:	1a00000a 	bne	530 <gettoken+0x124>
     504:	e1570005 	cmp	r7, r5
      s++;
     508:	e1a04007 	mov	r4, r7
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     50c:	0a000007 	beq	530 <gettoken+0x124>
     510:	e5f81001 	ldrb	r1, [r8, #1]!
     514:	e59f0058 	ldr	r0, [pc, #88]	; 574 <gettoken+0x168>
     518:	eb0001ad 	bl	bd4 <strchr>
     51c:	e1a04007 	mov	r4, r7
     520:	e2877001 	add	r7, r7, #1
     524:	e3500000 	cmp	r0, #0
     528:	e59f0048 	ldr	r0, [pc, #72]	; 578 <gettoken+0x16c>
     52c:	0afffff0 	beq	4f4 <gettoken+0xe8>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     530:	e3a08061 	mov	r8, #97	; 0x61
     534:	eaffffd2 	b	484 <gettoken+0x78>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     538:	e3580029 	cmp	r8, #41	; 0x29
     53c:	8affffe7 	bhi	4e0 <gettoken+0xd4>
     540:	e3580028 	cmp	r8, #40	; 0x28
     544:	2affffcd 	bcs	480 <gettoken+0x74>
     548:	e3580000 	cmp	r8, #0
     54c:	0affffcc 	beq	484 <gettoken+0x78>
     550:	e3580026 	cmp	r8, #38	; 0x26
     554:	1affffe1 	bne	4e0 <gettoken+0xd4>
     558:	eaffffc8 	b	480 <gettoken+0x74>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     55c:	e5d43001 	ldrb	r3, [r4, #1]
     560:	e353003e 	cmp	r3, #62	; 0x3e
      ret = '+';
      s++;
     564:	02844002 	addeq	r4, r4, #2
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     568:	03a0802b 	moveq	r8, #43	; 0x2b
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     56c:	1affffc3 	bne	480 <gettoken+0x74>
     570:	eaffffc3 	b	484 <gettoken+0x78>
     574:	000016b8 	.word	0x000016b8
     578:	000016c0 	.word	0x000016c0

0000057c <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     57c:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
     580:	e1a06000 	mov	r6, r0
  char *s;
  
  s = *ps;
     584:	e5904000 	ldr	r4, [r0]
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     588:	e28db01c 	add	fp, sp, #28
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     58c:	e1540001 	cmp	r4, r1
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     590:	e1a05001 	mov	r5, r1
     594:	e1a08002 	mov	r8, r2
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     598:	31a07004 	movcc	r7, r4
     59c:	3a000003 	bcc	5b0 <peek+0x34>
     5a0:	ea000009 	b	5cc <peek+0x50>
     5a4:	e1570005 	cmp	r7, r5
    s++;
     5a8:	e1a04007 	mov	r4, r7
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     5ac:	0a000006 	beq	5cc <peek+0x50>
     5b0:	e5d71000 	ldrb	r1, [r7]
     5b4:	e59f003c 	ldr	r0, [pc, #60]	; 5f8 <peek+0x7c>
     5b8:	eb000185 	bl	bd4 <strchr>
     5bc:	e1a04007 	mov	r4, r7
     5c0:	e2877001 	add	r7, r7, #1
     5c4:	e3500000 	cmp	r0, #0
     5c8:	1afffff5 	bne	5a4 <peek+0x28>
    s++;
  *ps = s;
     5cc:	e5864000 	str	r4, [r6]
  return *s && strchr(toks, *s);
     5d0:	e5d41000 	ldrb	r1, [r4]
     5d4:	e3510000 	cmp	r1, #0
     5d8:	1a000001 	bne	5e4 <peek+0x68>
     5dc:	e1a00001 	mov	r0, r1
}
     5e0:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     5e4:	e1a00008 	mov	r0, r8
     5e8:	eb000179 	bl	bd4 <strchr>
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
     5ec:	e2900000 	adds	r0, r0, #0
     5f0:	13a00001 	movne	r0, #1
     5f4:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
     5f8:	000016b8 	.word	0x000016b8

000005fc <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     5fc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     600:	e28db018 	add	fp, sp, #24
     604:	e24dd014 	sub	sp, sp, #20
     608:	e1a07000 	mov	r7, r0
     60c:	e1a06001 	mov	r6, r1
     610:	e1a05002 	mov	r5, r2
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     614:	e3a08001 	mov	r8, #1
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     618:	e1a00006 	mov	r0, r6
     61c:	e1a01005 	mov	r1, r5
     620:	e59f20c0 	ldr	r2, [pc, #192]	; 6e8 <parseredirs+0xec>
     624:	ebffffd4 	bl	57c <peek>
     628:	e3500000 	cmp	r0, #0
     62c:	0a00001f 	beq	6b0 <parseredirs+0xb4>
    tok = gettoken(ps, es, 0, 0);
     630:	e3a02000 	mov	r2, #0
     634:	e1a03002 	mov	r3, r2
     638:	e1a01005 	mov	r1, r5
     63c:	e1a00006 	mov	r0, r6
     640:	ebffff71 	bl	40c <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     644:	e1a01005 	mov	r1, r5
     648:	e24b2024 	sub	r2, fp, #36	; 0x24
     64c:	e24b3020 	sub	r3, fp, #32
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
     650:	e1a04000 	mov	r4, r0
    if(gettoken(ps, es, &q, &eq) != 'a')
     654:	e1a00006 	mov	r0, r6
     658:	ebffff6b 	bl	40c <gettoken>
     65c:	e3500061 	cmp	r0, #97	; 0x61
     660:	1a00001e 	bne	6e0 <parseredirs+0xe4>
      panic("missing file for redirection");
    switch(tok){
     664:	e354003c 	cmp	r4, #60	; 0x3c
     668:	0a000013 	beq	6bc <parseredirs+0xc0>
     66c:	e354003e 	cmp	r4, #62	; 0x3e
     670:	0a000001 	beq	67c <parseredirs+0x80>
     674:	e354002b 	cmp	r4, #43	; 0x2b
     678:	1affffe6 	bne	618 <parseredirs+0x1c>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     67c:	e1a00007 	mov	r0, r7
     680:	e51b1024 	ldr	r1, [fp, #-36]	; 0x24
     684:	e51b2020 	ldr	r2, [fp, #-32]
     688:	e59f305c 	ldr	r3, [pc, #92]	; 6ec <parseredirs+0xf0>
     68c:	e58d8000 	str	r8, [sp]
     690:	ebffff1d 	bl	30c <redircmd>
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     694:	e1a01005 	mov	r1, r5
     698:	e59f2048 	ldr	r2, [pc, #72]	; 6e8 <parseredirs+0xec>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     69c:	e1a07000 	mov	r7, r0
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6a0:	e1a00006 	mov	r0, r6
     6a4:	ebffffb4 	bl	57c <peek>
     6a8:	e3500000 	cmp	r0, #0
     6ac:	1affffdf 	bne	630 <parseredirs+0x34>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     6b0:	e1a00007 	mov	r0, r7
     6b4:	e24bd018 	sub	sp, fp, #24
     6b8:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6bc:	e3a0c000 	mov	ip, #0
     6c0:	e1a00007 	mov	r0, r7
     6c4:	e51b1024 	ldr	r1, [fp, #-36]	; 0x24
     6c8:	e51b2020 	ldr	r2, [fp, #-32]
     6cc:	e1a0300c 	mov	r3, ip
     6d0:	e58dc000 	str	ip, [sp]
     6d4:	ebffff0c 	bl	30c <redircmd>
     6d8:	e1a07000 	mov	r7, r0
      break;
     6dc:	eaffffcd 	b	618 <parseredirs+0x1c>
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     6e0:	e59f0008 	ldr	r0, [pc, #8]	; 6f0 <parseredirs+0xf4>
     6e4:	ebfffe8f 	bl	128 <panic>
     6e8:	0000161c 	.word	0x0000161c
     6ec:	00000201 	.word	0x00000201
     6f0:	000015fc 	.word	0x000015fc

000006f4 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     6f4:	e92d4df0 	push	{r4, r5, r6, r7, r8, sl, fp, lr}
     6f8:	e28db01c 	add	fp, sp, #28
     6fc:	e24dd008 	sub	sp, sp, #8
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     700:	e59f20e8 	ldr	r2, [pc, #232]	; 7f0 <parseexec+0xfc>
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     704:	e1a06000 	mov	r6, r0
     708:	e1a05001 	mov	r5, r1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     70c:	ebffff9a 	bl	57c <peek>
     710:	e2507000 	subs	r7, r0, #0
     714:	1a000025 	bne	7b0 <parseexec+0xbc>
    return parseblock(ps, es);

  ret = execcmd();
     718:	ebfffeef 	bl	2dc <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     71c:	e1a01006 	mov	r1, r6
     720:	e1a02005 	mov	r2, r5
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     724:	e1a0a000 	mov	sl, r0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     728:	ebffffb3 	bl	5fc <parseredirs>
     72c:	e1a0400a 	mov	r4, sl
     730:	e1a08000 	mov	r8, r0
  while(!peek(ps, es, "|)&;")){
     734:	ea000004 	b	74c <parseexec+0x58>
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     738:	e1a00008 	mov	r0, r8
     73c:	e1a01006 	mov	r1, r6
     740:	e1a02005 	mov	r2, r5
     744:	ebffffac 	bl	5fc <parseredirs>
     748:	e1a08000 	mov	r8, r0
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     74c:	e1a00006 	mov	r0, r6
     750:	e1a01005 	mov	r1, r5
     754:	e59f2098 	ldr	r2, [pc, #152]	; 7f4 <parseexec+0x100>
     758:	ebffff87 	bl	57c <peek>
     75c:	e3500000 	cmp	r0, #0
     760:	1a000019 	bne	7cc <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     764:	e1a00006 	mov	r0, r6
     768:	e1a01005 	mov	r1, r5
     76c:	e24b2024 	sub	r2, fp, #36	; 0x24
     770:	e24b3020 	sub	r3, fp, #32
     774:	ebffff24 	bl	40c <gettoken>
     778:	e3500000 	cmp	r0, #0
     77c:	0a000012 	beq	7cc <parseexec+0xd8>
      break;
    if(tok != 'a')
     780:	e3500061 	cmp	r0, #97	; 0x61
     784:	1a000017 	bne	7e8 <parseexec+0xf4>
      panic("syntax");
    cmd->argv[argc] = q;
     788:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    cmd->eargv[argc] = eq;
    argc++;
     78c:	e2877001 	add	r7, r7, #1
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     790:	e5843004 	str	r3, [r4, #4]
    cmd->eargv[argc] = eq;
     794:	e51b3020 	ldr	r3, [fp, #-32]
    argc++;
    if(argc >= MAXARGS)
     798:	e357000a 	cmp	r7, #10
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
     79c:	e584302c 	str	r3, [r4, #44]	; 0x2c
    argc++;
     7a0:	e2844004 	add	r4, r4, #4
    if(argc >= MAXARGS)
     7a4:	1affffe3 	bne	738 <parseexec+0x44>
      panic("too many args");
     7a8:	e59f0048 	ldr	r0, [pc, #72]	; 7f8 <parseexec+0x104>
     7ac:	ebfffe5d 	bl	128 <panic>
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    return parseblock(ps, es);
     7b0:	e1a00006 	mov	r0, r6
     7b4:	e1a01005 	mov	r1, r5
     7b8:	eb000054 	bl	910 <parseblock>
     7bc:	e1a08000 	mov	r8, r0
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     7c0:	e1a00008 	mov	r0, r8
     7c4:	e24bd01c 	sub	sp, fp, #28
     7c8:	e8bd8df0 	pop	{r4, r5, r6, r7, r8, sl, fp, pc}
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
     7cc:	e287300a 	add	r3, r7, #10
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     7d0:	e08a7107 	add	r7, sl, r7, lsl #2
  cmd->eargv[argc] = 0;
     7d4:	e08aa103 	add	sl, sl, r3, lsl #2
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     7d8:	e3a03000 	mov	r3, #0
     7dc:	e5873004 	str	r3, [r7, #4]
  cmd->eargv[argc] = 0;
     7e0:	e58a3004 	str	r3, [sl, #4]
  return ret;
     7e4:	eafffff5 	b	7c0 <parseexec+0xcc>
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     7e8:	e59f000c 	ldr	r0, [pc, #12]	; 7fc <parseexec+0x108>
     7ec:	ebfffe4d 	bl	128 <panic>
     7f0:	00001620 	.word	0x00001620
     7f4:	0000163c 	.word	0x0000163c
     7f8:	0000162c 	.word	0x0000162c
     7fc:	00001624 	.word	0x00001624

00000800 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     800:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
     804:	e28db014 	add	fp, sp, #20
     808:	e1a05000 	mov	r5, r0
     80c:	e1a04001 	mov	r4, r1
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     810:	ebffffb7 	bl	6f4 <parseexec>
  if(peek(ps, es, "|")){
     814:	e1a01004 	mov	r1, r4
     818:	e59f2048 	ldr	r2, [pc, #72]	; 868 <parsepipe+0x68>
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     81c:	e1a06000 	mov	r6, r0
  if(peek(ps, es, "|")){
     820:	e1a00005 	mov	r0, r5
     824:	ebffff54 	bl	57c <peek>
     828:	e3500000 	cmp	r0, #0
     82c:	1a000001 	bne	838 <parsepipe+0x38>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     830:	e1a00006 	mov	r0, r6
     834:	e8bd8878 	pop	{r3, r4, r5, r6, fp, pc}
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     838:	e3a02000 	mov	r2, #0
     83c:	e1a03002 	mov	r3, r2
     840:	e1a01004 	mov	r1, r4
     844:	e1a00005 	mov	r0, r5
     848:	ebfffeef 	bl	40c <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     84c:	e1a01004 	mov	r1, r4
     850:	e1a00005 	mov	r0, r5
     854:	ebffffe9 	bl	800 <parsepipe>
     858:	e1a01000 	mov	r1, r0
     85c:	e1a00006 	mov	r0, r6
  }
  return cmd;
}
     860:	e8bd4878 	pop	{r3, r4, r5, r6, fp, lr}
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     864:	eafffebd 	b	360 <pipecmd>
     868:	00001644 	.word	0x00001644

0000086c <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     86c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     870:	e28db014 	add	fp, sp, #20
     874:	e1a05000 	mov	r5, r0
     878:	e1a04001 	mov	r4, r1
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     87c:	ebffffdf 	bl	800 <parsepipe>
     880:	e1a06000 	mov	r6, r0
  while(peek(ps, es, "&")){
     884:	ea000003 	b	898 <parseline+0x2c>
    gettoken(ps, es, 0, 0);
     888:	ebfffedf 	bl	40c <gettoken>
    cmd = backcmd(cmd);
     88c:	e1a00006 	mov	r0, r6
     890:	ebfffed0 	bl	3d8 <backcmd>
     894:	e1a06000 	mov	r6, r0
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     898:	e1a01004 	mov	r1, r4
     89c:	e59f2064 	ldr	r2, [pc, #100]	; 908 <parseline+0x9c>
     8a0:	e1a00005 	mov	r0, r5
     8a4:	ebffff34 	bl	57c <peek>
    gettoken(ps, es, 0, 0);
     8a8:	e3a02000 	mov	r2, #0
     8ac:	e1a01004 	mov	r1, r4
     8b0:	e1a03002 	mov	r3, r2
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     8b4:	e2507000 	subs	r7, r0, #0
    gettoken(ps, es, 0, 0);
     8b8:	e1a00005 	mov	r0, r5
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     8bc:	1afffff1 	bne	888 <parseline+0x1c>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     8c0:	e59f2044 	ldr	r2, [pc, #68]	; 90c <parseline+0xa0>
     8c4:	ebffff2c 	bl	57c <peek>
     8c8:	e3500000 	cmp	r0, #0
     8cc:	1a000001 	bne	8d8 <parseline+0x6c>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     8d0:	e1a00006 	mov	r0, r6
     8d4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     8d8:	e1a02007 	mov	r2, r7
     8dc:	e1a03007 	mov	r3, r7
     8e0:	e1a01004 	mov	r1, r4
     8e4:	e1a00005 	mov	r0, r5
     8e8:	ebfffec7 	bl	40c <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     8ec:	e1a01004 	mov	r1, r4
     8f0:	e1a00005 	mov	r0, r5
     8f4:	ebffffdc 	bl	86c <parseline>
     8f8:	e1a01000 	mov	r1, r0
     8fc:	e1a00006 	mov	r0, r6
  }
  return cmd;
}
     900:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     904:	eafffea4 	b	39c <listcmd>
     908:	00001648 	.word	0x00001648
     90c:	0000164c 	.word	0x0000164c

00000910 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     910:	e92d4878 	push	{r3, r4, r5, r6, fp, lr}
     914:	e28db014 	add	fp, sp, #20
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     918:	e59f2084 	ldr	r2, [pc, #132]	; 9a4 <parseblock+0x94>
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     91c:	e1a05000 	mov	r5, r0
     920:	e1a04001 	mov	r4, r1
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     924:	ebffff14 	bl	57c <peek>
     928:	e3500000 	cmp	r0, #0
     92c:	0a000018 	beq	994 <parseblock+0x84>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     930:	e3a02000 	mov	r2, #0
     934:	e1a03002 	mov	r3, r2
     938:	e1a01004 	mov	r1, r4
     93c:	e1a00005 	mov	r0, r5
     940:	ebfffeb1 	bl	40c <gettoken>
  cmd = parseline(ps, es);
     944:	e1a01004 	mov	r1, r4
     948:	e1a00005 	mov	r0, r5
     94c:	ebffffc6 	bl	86c <parseline>
  if(!peek(ps, es, ")"))
     950:	e1a01004 	mov	r1, r4
     954:	e59f204c 	ldr	r2, [pc, #76]	; 9a8 <parseblock+0x98>
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     958:	e1a06000 	mov	r6, r0
  if(!peek(ps, es, ")"))
     95c:	e1a00005 	mov	r0, r5
     960:	ebffff05 	bl	57c <peek>
     964:	e3500000 	cmp	r0, #0
     968:	0a00000b 	beq	99c <parseblock+0x8c>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     96c:	e3a02000 	mov	r2, #0
     970:	e1a01004 	mov	r1, r4
     974:	e1a03002 	mov	r3, r2
     978:	e1a00005 	mov	r0, r5
     97c:	ebfffea2 	bl	40c <gettoken>
  cmd = parseredirs(cmd, ps, es);
     980:	e1a00006 	mov	r0, r6
     984:	e1a01005 	mov	r1, r5
     988:	e1a02004 	mov	r2, r4
  return cmd;
}
     98c:	e8bd4878 	pop	{r3, r4, r5, r6, fp, lr}
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
     990:	eaffff19 	b	5fc <parseredirs>
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     994:	e59f0010 	ldr	r0, [pc, #16]	; 9ac <parseblock+0x9c>
     998:	ebfffde2 	bl	128 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     99c:	e59f000c 	ldr	r0, [pc, #12]	; 9b0 <parseblock+0xa0>
     9a0:	ebfffde0 	bl	128 <panic>
     9a4:	00001620 	.word	0x00001620
     9a8:	0000165c 	.word	0x0000165c
     9ac:	00001650 	.word	0x00001650
     9b0:	00001660 	.word	0x00001660

000009b4 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     9b4:	e92d4818 	push	{r3, r4, fp, lr}
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     9b8:	e2504000 	subs	r4, r0, #0
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     9bc:	e28db00c 	add	fp, sp, #12
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     9c0:	0a00000b 	beq	9f4 <nulterminate+0x40>
    return 0;
  
  switch(cmd->type){
     9c4:	e5943000 	ldr	r3, [r4]
     9c8:	e2433001 	sub	r3, r3, #1
     9cc:	e3530004 	cmp	r3, #4
     9d0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     9d4:	ea000006 	b	9f4 <nulterminate+0x40>
     9d8:	00000a14 	.word	0x00000a14
     9dc:	00000a4c 	.word	0x00000a4c
     9e0:	000009fc 	.word	0x000009fc
     9e4:	000009fc 	.word	0x000009fc
     9e8:	000009ec 	.word	0x000009ec
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     9ec:	e5940004 	ldr	r0, [r4, #4]
     9f0:	ebffffef 	bl	9b4 <nulterminate>
    break;
  }
  return cmd;
}
     9f4:	e1a00004 	mov	r0, r4
     9f8:	e8bd8818 	pop	{r3, r4, fp, pc}
    nulterminate(pcmd->right);
    break;
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     9fc:	e5940004 	ldr	r0, [r4, #4]
     a00:	ebffffeb 	bl	9b4 <nulterminate>
    nulterminate(lcmd->right);
     a04:	e5940008 	ldr	r0, [r4, #8]
     a08:	ebffffe9 	bl	9b4 <nulterminate>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a0c:	e1a00004 	mov	r0, r4
     a10:	e8bd8818 	pop	{r3, r4, fp, pc}
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a14:	e5943004 	ldr	r3, [r4, #4]
     a18:	e3530000 	cmp	r3, #0
     a1c:	0afffff4 	beq	9f4 <nulterminate+0x40>
     a20:	e1a03004 	mov	r3, r4
      *ecmd->eargv[i] = 0;
     a24:	e3a00000 	mov	r0, #0
     a28:	e593102c 	ldr	r1, [r3, #44]	; 0x2c
  return ret;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
     a2c:	e1a02003 	mov	r2, r3
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
     a30:	e2833004 	add	r3, r3, #4
     a34:	e5c10000 	strb	r0, [r1]
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a38:	e5922008 	ldr	r2, [r2, #8]
     a3c:	e3520000 	cmp	r2, #0
     a40:	1afffff8 	bne	a28 <nulterminate+0x74>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a44:	e1a00004 	mov	r0, r4
     a48:	e8bd8818 	pop	{r3, r4, fp, pc}
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     a4c:	e5940004 	ldr	r0, [r4, #4]
     a50:	ebffffd7 	bl	9b4 <nulterminate>
    *rcmd->efile = 0;
     a54:	e594300c 	ldr	r3, [r4, #12]
     a58:	e3a02000 	mov	r2, #0
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a5c:	e1a00004 	mov	r0, r4
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     a60:	e5c32000 	strb	r2, [r3]
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a64:	e8bd8818 	pop	{r3, r4, fp, pc}

00000a68 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     a68:	e92d4870 	push	{r4, r5, r6, fp, lr}
     a6c:	e28db010 	add	fp, sp, #16
     a70:	e24b6014 	sub	r6, fp, #20
     a74:	e24dd00c 	sub	sp, sp, #12
     a78:	e5260004 	str	r0, [r6, #-4]!
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     a7c:	e1a04000 	mov	r4, r0
     a80:	eb000035 	bl	b5c <strlen>
     a84:	e0844000 	add	r4, r4, r0
  cmd = parseline(&s, es);
     a88:	e1a01004 	mov	r1, r4
     a8c:	e1a00006 	mov	r0, r6
     a90:	ebffff75 	bl	86c <parseline>
  peek(&s, es, "");
     a94:	e59f2040 	ldr	r2, [pc, #64]	; adc <parsecmd+0x74>
     a98:	e1a01004 	mov	r1, r4
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
     a9c:	e1a05000 	mov	r5, r0
  peek(&s, es, "");
     aa0:	e1a00006 	mov	r0, r6
     aa4:	ebfffeb4 	bl	57c <peek>
  if(s != es){
     aa8:	e51b2018 	ldr	r2, [fp, #-24]
     aac:	e1520004 	cmp	r2, r4
     ab0:	1a000004 	bne	ac8 <parsecmd+0x60>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     ab4:	e1a00005 	mov	r0, r5
     ab8:	ebffffbd 	bl	9b4 <nulterminate>
  return cmd;
}
     abc:	e1a00005 	mov	r0, r5
     ac0:	e24bd010 	sub	sp, fp, #16
     ac4:	e8bd8870 	pop	{r4, r5, r6, fp, pc}

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     ac8:	e3a00002 	mov	r0, #2
     acc:	e59f100c 	ldr	r1, [pc, #12]	; ae0 <parsecmd+0x78>
     ad0:	eb0001ff 	bl	12d4 <printf>
    panic("syntax");
     ad4:	e59f0008 	ldr	r0, [pc, #8]	; ae4 <parsecmd+0x7c>
     ad8:	ebfffd92 	bl	128 <panic>
     adc:	00001640 	.word	0x00001640
     ae0:	00001674 	.word	0x00001674
     ae4:	00001624 	.word	0x00001624

00000ae8 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     ae8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     aec:	e1a02000 	mov	r2, r0
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     af0:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     af4:	e4d13001 	ldrb	r3, [r1], #1
     af8:	e3530000 	cmp	r3, #0
     afc:	e4c23001 	strb	r3, [r2], #1
     b00:	1afffffb 	bne	af4 <strcpy+0xc>
    ;
  return os;
}
     b04:	e28bd000 	add	sp, fp, #0
     b08:	e8bd0800 	pop	{fp}
     b0c:	e12fff1e 	bx	lr

00000b10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b14:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
     b18:	e5d03000 	ldrb	r3, [r0]
     b1c:	e5d12000 	ldrb	r2, [r1]
     b20:	e3530000 	cmp	r3, #0
     b24:	1a000004 	bne	b3c <strcmp+0x2c>
     b28:	ea000005 	b	b44 <strcmp+0x34>
     b2c:	e5f03001 	ldrb	r3, [r0, #1]!
     b30:	e3530000 	cmp	r3, #0
     b34:	0a000006 	beq	b54 <strcmp+0x44>
     b38:	e5f12001 	ldrb	r2, [r1, #1]!
     b3c:	e1530002 	cmp	r3, r2
     b40:	0afffff9 	beq	b2c <strcmp+0x1c>
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     b44:	e0620003 	rsb	r0, r2, r3
     b48:	e28bd000 	add	sp, fp, #0
     b4c:	e8bd0800 	pop	{fp}
     b50:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b54:	e5d12001 	ldrb	r2, [r1, #1]
     b58:	eafffff9 	b	b44 <strcmp+0x34>

00000b5c <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     b5c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b60:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
     b64:	e5d03000 	ldrb	r3, [r0]
     b68:	e3530000 	cmp	r3, #0
     b6c:	01a00003 	moveq	r0, r3
     b70:	0a000006 	beq	b90 <strlen+0x34>
     b74:	e1a02000 	mov	r2, r0
     b78:	e3a03000 	mov	r3, #0
     b7c:	e5f21001 	ldrb	r1, [r2, #1]!
     b80:	e2833001 	add	r3, r3, #1
     b84:	e1a00003 	mov	r0, r3
     b88:	e3510000 	cmp	r1, #0
     b8c:	1afffffa 	bne	b7c <strlen+0x20>
    ;
  return n;
}
     b90:	e28bd000 	add	sp, fp, #0
     b94:	e8bd0800 	pop	{fp}
     b98:	e12fff1e 	bx	lr

00000b9c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
     b9c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
     ba0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     ba4:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
     ba8:	0a000006 	beq	bc8 <memset+0x2c>
     bac:	e6ef1071 	uxtb	r1, r1
     bb0:	e1a03002 	mov	r3, r2
}

void*
memset(void *dst, int c, uint n)
{
  char *p=dst;
     bb4:	e1a0c000 	mov	ip, r0
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
     bb8:	e2533001 	subs	r3, r3, #1
     bbc:	e4cc1001 	strb	r1, [ip], #1
     bc0:	1afffffc 	bne	bb8 <memset+0x1c>
     bc4:	e0800002 	add	r0, r0, r2
  return (void *)p;
}
     bc8:	e28bd000 	add	sp, fp, #0
     bcc:	e8bd0800 	pop	{fp}
     bd0:	e12fff1e 	bx	lr

00000bd4 <strchr>:

char*
strchr(const char *s, char c)
{
     bd4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     bd8:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
     bdc:	e5d03000 	ldrb	r3, [r0]
     be0:	e3530000 	cmp	r3, #0
     be4:	1a000004 	bne	bfc <strchr+0x28>
     be8:	ea000008 	b	c10 <strchr+0x3c>
     bec:	e5d03001 	ldrb	r3, [r0, #1]
     bf0:	e2800001 	add	r0, r0, #1
     bf4:	e3530000 	cmp	r3, #0
     bf8:	0a000004 	beq	c10 <strchr+0x3c>
    if(*s == c)
     bfc:	e1530001 	cmp	r3, r1
     c00:	1afffff9 	bne	bec <strchr+0x18>
      return (char*)s;
  return 0;
}
     c04:	e28bd000 	add	sp, fp, #0
     c08:	e8bd0800 	pop	{fp}
     c0c:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
     c10:	e1a00003 	mov	r0, r3
     c14:	eafffffa 	b	c04 <strchr+0x30>

00000c18 <gets>:
}

char*
gets(char *buf, int max)
{
     c18:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     c1c:	e28db018 	add	fp, sp, #24
     c20:	e24dd00c 	sub	sp, sp, #12
     c24:	e1a08000 	mov	r8, r0
     c28:	e1a07001 	mov	r7, r1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c2c:	e1a06000 	mov	r6, r0
     c30:	e3a05000 	mov	r5, #0
     c34:	ea000008 	b	c5c <gets+0x44>
    cc = read(0, &c, 1);
     c38:	eb000079 	bl	e24 <read>
    if(cc < 1)
     c3c:	e3500000 	cmp	r0, #0
     c40:	da00000b 	ble	c74 <gets+0x5c>
      break;
    buf[i++] = c;
     c44:	e55b301d 	ldrb	r3, [fp, #-29]
    if(c == '\n' || c == '\r')
     c48:	e1a05004 	mov	r5, r4
     c4c:	e353000a 	cmp	r3, #10
     c50:	1353000d 	cmpne	r3, #13

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     c54:	e4c63001 	strb	r3, [r6], #1
    if(c == '\n' || c == '\r')
     c58:	0a00000a 	beq	c88 <gets+0x70>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     c5c:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c60:	e0854002 	add	r4, r5, r2
     c64:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
     c68:	e3a00000 	mov	r0, #0
     c6c:	e24b101d 	sub	r1, fp, #29
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c70:	bafffff0 	blt	c38 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c74:	e3a03000 	mov	r3, #0
     c78:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
     c7c:	e1a00008 	mov	r0, r8
     c80:	e24bd018 	sub	sp, fp, #24
     c84:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c88:	e1a05004 	mov	r5, r4
     c8c:	eafffff8 	b	c74 <gets+0x5c>

00000c90 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
     c90:	e92d4830 	push	{r4, r5, fp, lr}
     c94:	e1a05001 	mov	r5, r1
     c98:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c9c:	e3a01000 	mov	r1, #0
     ca0:	eb0000a0 	bl	f28 <open>
  if(fd < 0)
     ca4:	e2504000 	subs	r4, r0, #0
    return -1;
     ca8:	b3e05000 	mvnlt	r5, #0
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
     cac:	ba000004 	blt	cc4 <stat+0x34>
    return -1;
  r = fstat(fd, st);
     cb0:	e1a01005 	mov	r1, r5
     cb4:	eb0000c2 	bl	fc4 <fstat>
     cb8:	e1a05000 	mov	r5, r0
  close(fd);
     cbc:	e1a00004 	mov	r0, r4
     cc0:	eb000071 	bl	e8c <close>
  return r;
}
     cc4:	e1a00005 	mov	r0, r5
     cc8:	e8bd8830 	pop	{r4, r5, fp, pc}

00000ccc <atoi>:

int
atoi(const char *s)
{
     ccc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     cd0:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     cd4:	e5d03000 	ldrb	r3, [r0]
     cd8:	e2432030 	sub	r2, r3, #48	; 0x30
     cdc:	e6ef2072 	uxtb	r2, r2
     ce0:	e3520009 	cmp	r2, #9
int
atoi(const char *s)
{
  int n;

  n = 0;
     ce4:	83a00000 	movhi	r0, #0
  while('0' <= *s && *s <= '9')
     ce8:	8a000009 	bhi	d14 <atoi+0x48>
     cec:	e1a02000 	mov	r2, r0
int
atoi(const char *s)
{
  int n;

  n = 0;
     cf0:	e3a00000 	mov	r0, #0
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
     cf4:	e0800100 	add	r0, r0, r0, lsl #2
     cf8:	e0830080 	add	r0, r3, r0, lsl #1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     cfc:	e5f23001 	ldrb	r3, [r2, #1]!
    n = n*10 + *s++ - '0';
     d00:	e2400030 	sub	r0, r0, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d04:	e2431030 	sub	r1, r3, #48	; 0x30
     d08:	e6ef1071 	uxtb	r1, r1
     d0c:	e3510009 	cmp	r1, #9
     d10:	9afffff7 	bls	cf4 <atoi+0x28>
    n = n*10 + *s++ - '0';
  return n;
}
     d14:	e28bd000 	add	sp, fp, #0
     d18:	e8bd0800 	pop	{fp}
     d1c:	e12fff1e 	bx	lr

00000d20 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d20:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
     d24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     d28:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d2c:	da000005 	ble	d48 <memmove+0x28>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
     d30:	e0802002 	add	r2, r0, r2
{
  char *dst, *src;
  
  dst = vdst;
     d34:	e1a03000 	mov	r3, r0
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
     d38:	e4d1c001 	ldrb	ip, [r1], #1
     d3c:	e4c3c001 	strb	ip, [r3], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d40:	e1530002 	cmp	r3, r2
     d44:	1afffffb 	bne	d38 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     d48:	e28bd000 	add	sp, fp, #0
     d4c:	e8bd0800 	pop	{fp}
     d50:	e12fff1e 	bx	lr

00000d54 <fork>:
     d54:	e92d4000 	push	{lr}
     d58:	e92d0008 	push	{r3}
     d5c:	e92d0004 	push	{r2}
     d60:	e92d0002 	push	{r1}
     d64:	e92d0001 	push	{r0}
     d68:	e3a00001 	mov	r0, #1
     d6c:	ef000040 	svc	0x00000040
     d70:	e8bd0002 	pop	{r1}
     d74:	e8bd0002 	pop	{r1}
     d78:	e8bd0004 	pop	{r2}
     d7c:	e8bd0008 	pop	{r3}
     d80:	e8bd4000 	pop	{lr}
     d84:	e12fff1e 	bx	lr

00000d88 <exit>:
     d88:	e92d4000 	push	{lr}
     d8c:	e92d0008 	push	{r3}
     d90:	e92d0004 	push	{r2}
     d94:	e92d0002 	push	{r1}
     d98:	e92d0001 	push	{r0}
     d9c:	e3a00002 	mov	r0, #2
     da0:	ef000040 	svc	0x00000040
     da4:	e8bd0002 	pop	{r1}
     da8:	e8bd0002 	pop	{r1}
     dac:	e8bd0004 	pop	{r2}
     db0:	e8bd0008 	pop	{r3}
     db4:	e8bd4000 	pop	{lr}
     db8:	e12fff1e 	bx	lr

00000dbc <wait>:
     dbc:	e92d4000 	push	{lr}
     dc0:	e92d0008 	push	{r3}
     dc4:	e92d0004 	push	{r2}
     dc8:	e92d0002 	push	{r1}
     dcc:	e92d0001 	push	{r0}
     dd0:	e3a00003 	mov	r0, #3
     dd4:	ef000040 	svc	0x00000040
     dd8:	e8bd0002 	pop	{r1}
     ddc:	e8bd0002 	pop	{r1}
     de0:	e8bd0004 	pop	{r2}
     de4:	e8bd0008 	pop	{r3}
     de8:	e8bd4000 	pop	{lr}
     dec:	e12fff1e 	bx	lr

00000df0 <pipe>:
     df0:	e92d4000 	push	{lr}
     df4:	e92d0008 	push	{r3}
     df8:	e92d0004 	push	{r2}
     dfc:	e92d0002 	push	{r1}
     e00:	e92d0001 	push	{r0}
     e04:	e3a00004 	mov	r0, #4
     e08:	ef000040 	svc	0x00000040
     e0c:	e8bd0002 	pop	{r1}
     e10:	e8bd0002 	pop	{r1}
     e14:	e8bd0004 	pop	{r2}
     e18:	e8bd0008 	pop	{r3}
     e1c:	e8bd4000 	pop	{lr}
     e20:	e12fff1e 	bx	lr

00000e24 <read>:
     e24:	e92d4000 	push	{lr}
     e28:	e92d0008 	push	{r3}
     e2c:	e92d0004 	push	{r2}
     e30:	e92d0002 	push	{r1}
     e34:	e92d0001 	push	{r0}
     e38:	e3a00005 	mov	r0, #5
     e3c:	ef000040 	svc	0x00000040
     e40:	e8bd0002 	pop	{r1}
     e44:	e8bd0002 	pop	{r1}
     e48:	e8bd0004 	pop	{r2}
     e4c:	e8bd0008 	pop	{r3}
     e50:	e8bd4000 	pop	{lr}
     e54:	e12fff1e 	bx	lr

00000e58 <write>:
     e58:	e92d4000 	push	{lr}
     e5c:	e92d0008 	push	{r3}
     e60:	e92d0004 	push	{r2}
     e64:	e92d0002 	push	{r1}
     e68:	e92d0001 	push	{r0}
     e6c:	e3a00010 	mov	r0, #16
     e70:	ef000040 	svc	0x00000040
     e74:	e8bd0002 	pop	{r1}
     e78:	e8bd0002 	pop	{r1}
     e7c:	e8bd0004 	pop	{r2}
     e80:	e8bd0008 	pop	{r3}
     e84:	e8bd4000 	pop	{lr}
     e88:	e12fff1e 	bx	lr

00000e8c <close>:
     e8c:	e92d4000 	push	{lr}
     e90:	e92d0008 	push	{r3}
     e94:	e92d0004 	push	{r2}
     e98:	e92d0002 	push	{r1}
     e9c:	e92d0001 	push	{r0}
     ea0:	e3a00015 	mov	r0, #21
     ea4:	ef000040 	svc	0x00000040
     ea8:	e8bd0002 	pop	{r1}
     eac:	e8bd0002 	pop	{r1}
     eb0:	e8bd0004 	pop	{r2}
     eb4:	e8bd0008 	pop	{r3}
     eb8:	e8bd4000 	pop	{lr}
     ebc:	e12fff1e 	bx	lr

00000ec0 <kill>:
     ec0:	e92d4000 	push	{lr}
     ec4:	e92d0008 	push	{r3}
     ec8:	e92d0004 	push	{r2}
     ecc:	e92d0002 	push	{r1}
     ed0:	e92d0001 	push	{r0}
     ed4:	e3a00006 	mov	r0, #6
     ed8:	ef000040 	svc	0x00000040
     edc:	e8bd0002 	pop	{r1}
     ee0:	e8bd0002 	pop	{r1}
     ee4:	e8bd0004 	pop	{r2}
     ee8:	e8bd0008 	pop	{r3}
     eec:	e8bd4000 	pop	{lr}
     ef0:	e12fff1e 	bx	lr

00000ef4 <exec>:
     ef4:	e92d4000 	push	{lr}
     ef8:	e92d0008 	push	{r3}
     efc:	e92d0004 	push	{r2}
     f00:	e92d0002 	push	{r1}
     f04:	e92d0001 	push	{r0}
     f08:	e3a00007 	mov	r0, #7
     f0c:	ef000040 	svc	0x00000040
     f10:	e8bd0002 	pop	{r1}
     f14:	e8bd0002 	pop	{r1}
     f18:	e8bd0004 	pop	{r2}
     f1c:	e8bd0008 	pop	{r3}
     f20:	e8bd4000 	pop	{lr}
     f24:	e12fff1e 	bx	lr

00000f28 <open>:
     f28:	e92d4000 	push	{lr}
     f2c:	e92d0008 	push	{r3}
     f30:	e92d0004 	push	{r2}
     f34:	e92d0002 	push	{r1}
     f38:	e92d0001 	push	{r0}
     f3c:	e3a0000f 	mov	r0, #15
     f40:	ef000040 	svc	0x00000040
     f44:	e8bd0002 	pop	{r1}
     f48:	e8bd0002 	pop	{r1}
     f4c:	e8bd0004 	pop	{r2}
     f50:	e8bd0008 	pop	{r3}
     f54:	e8bd4000 	pop	{lr}
     f58:	e12fff1e 	bx	lr

00000f5c <mknod>:
     f5c:	e92d4000 	push	{lr}
     f60:	e92d0008 	push	{r3}
     f64:	e92d0004 	push	{r2}
     f68:	e92d0002 	push	{r1}
     f6c:	e92d0001 	push	{r0}
     f70:	e3a00011 	mov	r0, #17
     f74:	ef000040 	svc	0x00000040
     f78:	e8bd0002 	pop	{r1}
     f7c:	e8bd0002 	pop	{r1}
     f80:	e8bd0004 	pop	{r2}
     f84:	e8bd0008 	pop	{r3}
     f88:	e8bd4000 	pop	{lr}
     f8c:	e12fff1e 	bx	lr

00000f90 <unlink>:
     f90:	e92d4000 	push	{lr}
     f94:	e92d0008 	push	{r3}
     f98:	e92d0004 	push	{r2}
     f9c:	e92d0002 	push	{r1}
     fa0:	e92d0001 	push	{r0}
     fa4:	e3a00012 	mov	r0, #18
     fa8:	ef000040 	svc	0x00000040
     fac:	e8bd0002 	pop	{r1}
     fb0:	e8bd0002 	pop	{r1}
     fb4:	e8bd0004 	pop	{r2}
     fb8:	e8bd0008 	pop	{r3}
     fbc:	e8bd4000 	pop	{lr}
     fc0:	e12fff1e 	bx	lr

00000fc4 <fstat>:
     fc4:	e92d4000 	push	{lr}
     fc8:	e92d0008 	push	{r3}
     fcc:	e92d0004 	push	{r2}
     fd0:	e92d0002 	push	{r1}
     fd4:	e92d0001 	push	{r0}
     fd8:	e3a00008 	mov	r0, #8
     fdc:	ef000040 	svc	0x00000040
     fe0:	e8bd0002 	pop	{r1}
     fe4:	e8bd0002 	pop	{r1}
     fe8:	e8bd0004 	pop	{r2}
     fec:	e8bd0008 	pop	{r3}
     ff0:	e8bd4000 	pop	{lr}
     ff4:	e12fff1e 	bx	lr

00000ff8 <link>:
     ff8:	e92d4000 	push	{lr}
     ffc:	e92d0008 	push	{r3}
    1000:	e92d0004 	push	{r2}
    1004:	e92d0002 	push	{r1}
    1008:	e92d0001 	push	{r0}
    100c:	e3a00013 	mov	r0, #19
    1010:	ef000040 	svc	0x00000040
    1014:	e8bd0002 	pop	{r1}
    1018:	e8bd0002 	pop	{r1}
    101c:	e8bd0004 	pop	{r2}
    1020:	e8bd0008 	pop	{r3}
    1024:	e8bd4000 	pop	{lr}
    1028:	e12fff1e 	bx	lr

0000102c <mkdir>:
    102c:	e92d4000 	push	{lr}
    1030:	e92d0008 	push	{r3}
    1034:	e92d0004 	push	{r2}
    1038:	e92d0002 	push	{r1}
    103c:	e92d0001 	push	{r0}
    1040:	e3a00014 	mov	r0, #20
    1044:	ef000040 	svc	0x00000040
    1048:	e8bd0002 	pop	{r1}
    104c:	e8bd0002 	pop	{r1}
    1050:	e8bd0004 	pop	{r2}
    1054:	e8bd0008 	pop	{r3}
    1058:	e8bd4000 	pop	{lr}
    105c:	e12fff1e 	bx	lr

00001060 <chdir>:
    1060:	e92d4000 	push	{lr}
    1064:	e92d0008 	push	{r3}
    1068:	e92d0004 	push	{r2}
    106c:	e92d0002 	push	{r1}
    1070:	e92d0001 	push	{r0}
    1074:	e3a00009 	mov	r0, #9
    1078:	ef000040 	svc	0x00000040
    107c:	e8bd0002 	pop	{r1}
    1080:	e8bd0002 	pop	{r1}
    1084:	e8bd0004 	pop	{r2}
    1088:	e8bd0008 	pop	{r3}
    108c:	e8bd4000 	pop	{lr}
    1090:	e12fff1e 	bx	lr

00001094 <dup>:
    1094:	e92d4000 	push	{lr}
    1098:	e92d0008 	push	{r3}
    109c:	e92d0004 	push	{r2}
    10a0:	e92d0002 	push	{r1}
    10a4:	e92d0001 	push	{r0}
    10a8:	e3a0000a 	mov	r0, #10
    10ac:	ef000040 	svc	0x00000040
    10b0:	e8bd0002 	pop	{r1}
    10b4:	e8bd0002 	pop	{r1}
    10b8:	e8bd0004 	pop	{r2}
    10bc:	e8bd0008 	pop	{r3}
    10c0:	e8bd4000 	pop	{lr}
    10c4:	e12fff1e 	bx	lr

000010c8 <getpid>:
    10c8:	e92d4000 	push	{lr}
    10cc:	e92d0008 	push	{r3}
    10d0:	e92d0004 	push	{r2}
    10d4:	e92d0002 	push	{r1}
    10d8:	e92d0001 	push	{r0}
    10dc:	e3a0000b 	mov	r0, #11
    10e0:	ef000040 	svc	0x00000040
    10e4:	e8bd0002 	pop	{r1}
    10e8:	e8bd0002 	pop	{r1}
    10ec:	e8bd0004 	pop	{r2}
    10f0:	e8bd0008 	pop	{r3}
    10f4:	e8bd4000 	pop	{lr}
    10f8:	e12fff1e 	bx	lr

000010fc <sbrk>:
    10fc:	e92d4000 	push	{lr}
    1100:	e92d0008 	push	{r3}
    1104:	e92d0004 	push	{r2}
    1108:	e92d0002 	push	{r1}
    110c:	e92d0001 	push	{r0}
    1110:	e3a0000c 	mov	r0, #12
    1114:	ef000040 	svc	0x00000040
    1118:	e8bd0002 	pop	{r1}
    111c:	e8bd0002 	pop	{r1}
    1120:	e8bd0004 	pop	{r2}
    1124:	e8bd0008 	pop	{r3}
    1128:	e8bd4000 	pop	{lr}
    112c:	e12fff1e 	bx	lr

00001130 <sleep>:
    1130:	e92d4000 	push	{lr}
    1134:	e92d0008 	push	{r3}
    1138:	e92d0004 	push	{r2}
    113c:	e92d0002 	push	{r1}
    1140:	e92d0001 	push	{r0}
    1144:	e3a0000d 	mov	r0, #13
    1148:	ef000040 	svc	0x00000040
    114c:	e8bd0002 	pop	{r1}
    1150:	e8bd0002 	pop	{r1}
    1154:	e8bd0004 	pop	{r2}
    1158:	e8bd0008 	pop	{r3}
    115c:	e8bd4000 	pop	{lr}
    1160:	e12fff1e 	bx	lr

00001164 <uptime>:
    1164:	e92d4000 	push	{lr}
    1168:	e92d0008 	push	{r3}
    116c:	e92d0004 	push	{r2}
    1170:	e92d0002 	push	{r1}
    1174:	e92d0001 	push	{r0}
    1178:	e3a0000e 	mov	r0, #14
    117c:	ef000040 	svc	0x00000040
    1180:	e8bd0002 	pop	{r1}
    1184:	e8bd0002 	pop	{r1}
    1188:	e8bd0004 	pop	{r2}
    118c:	e8bd0008 	pop	{r3}
    1190:	e8bd4000 	pop	{lr}
    1194:	e12fff1e 	bx	lr

00001198 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1198:	e92d4800 	push	{fp, lr}
    119c:	e28db004 	add	fp, sp, #4
    11a0:	e24b3004 	sub	r3, fp, #4
    11a4:	e24dd008 	sub	sp, sp, #8
  write(fd, &c, 1);
    11a8:	e3a02001 	mov	r2, #1
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    11ac:	e5631001 	strb	r1, [r3, #-1]!
  write(fd, &c, 1);
    11b0:	e1a01003 	mov	r1, r3
    11b4:	ebffff27 	bl	e58 <write>
}
    11b8:	e24bd004 	sub	sp, fp, #4
    11bc:	e8bd8800 	pop	{fp, pc}

000011c0 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    11c0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    11c4:	e1a04000 	mov	r4, r0
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    11c8:	e1a00fa1 	lsr	r0, r1, #31
    11cc:	e3530000 	cmp	r3, #0
    11d0:	03a03000 	moveq	r3, #0
    11d4:	12003001 	andne	r3, r0, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    11d8:	e28db020 	add	fp, sp, #32
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    11dc:	e3530000 	cmp	r3, #0
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    11e0:	e24dd014 	sub	sp, sp, #20
    11e4:	e59f909c 	ldr	r9, [pc, #156]	; 1288 <printint+0xc8>
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    11e8:	12611000 	rsbne	r1, r1, #0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    11ec:	13a03001 	movne	r3, #1
  } else {
    x = xx;
  }

  b = base;
  i = 0;
    11f0:	e3a0a000 	mov	sl, #0
    11f4:	e24b6034 	sub	r6, fp, #52	; 0x34
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
    11f8:	e3a08001 	mov	r8, #1
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    11fc:	e3a07000 	mov	r7, #0
    int i;

    for(i=31;i>=0;i--){
    1200:	e3a0001f 	mov	r0, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    1204:	e1a0c007 	mov	ip, r7
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
    1208:	e1a0e031 	lsr	lr, r1, r0
    120c:	e20ee001 	and	lr, lr, #1
    1210:	e18ec08c 	orr	ip, lr, ip, lsl #1
        if(r >= d) {
    1214:	e152000c 	cmp	r2, ip
            r = r - d;
            q = q | (1 << i);
    1218:	91877018 	orrls	r7, r7, r8, lsl r0

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
    121c:	9062c00c 	rsbls	ip, r2, ip
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    1220:	e2500001 	subs	r0, r0, #1
    1224:	2afffff7 	bcs	1208 <printint+0x48>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    1228:	e0000792 	mul	r0, r2, r7
  }while((x = y) != 0);
    122c:	e3570000 	cmp	r7, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    1230:	e0601001 	rsb	r1, r0, r1
    1234:	e28a5001 	add	r5, sl, #1
    1238:	e7d91001 	ldrb	r1, [r9, r1]
    123c:	e7c6100a 	strb	r1, [r6, sl]
  }while((x = y) != 0);
    1240:	11a01007 	movne	r1, r7

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    1244:	11a0a005 	movne	sl, r5
    1248:	1affffeb 	bne	11fc <printint+0x3c>
  }while((x = y) != 0);
  if(neg)
    124c:	e3530000 	cmp	r3, #0
    buf[i++] = '-';
    1250:	124b2024 	subne	r2, fp, #36	; 0x24
    1254:	10823005 	addne	r3, r2, r5
    1258:	128a5002 	addne	r5, sl, #2

  while(--i >= 0)
    125c:	e2455001 	sub	r5, r5, #1
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';
    1260:	13a0202d 	movne	r2, #45	; 0x2d
    1264:	15432010 	strbne	r2, [r3, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
    1268:	e7d61005 	ldrb	r1, [r6, r5]
    126c:	e1a00004 	mov	r0, r4
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1270:	e2455001 	sub	r5, r5, #1
    putc(fd, buf[i]);
    1274:	ebffffc7 	bl	1198 <putc>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1278:	e3750001 	cmn	r5, #1
    127c:	1afffff9 	bne	1268 <printint+0xa8>
    putc(fd, buf[i]);
}
    1280:	e24bd020 	sub	sp, fp, #32
    1284:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1288:	0000169c 	.word	0x0000169c

0000128c <div>:
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    128c:	e3a03000 	mov	r3, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    1290:	e92d0830 	push	{r4, r5, fp}
    1294:	e1a02000 	mov	r2, r0
    1298:	e28db008 	add	fp, sp, #8
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    129c:	e3a0c01f 	mov	ip, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    12a0:	e1a00003 	mov	r0, r3
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
    12a4:	e3a05001 	mov	r5, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
    12a8:	e1a04c32 	lsr	r4, r2, ip
    12ac:	e2044001 	and	r4, r4, #1
    12b0:	e1843083 	orr	r3, r4, r3, lsl #1
        if(r >= d) {
    12b4:	e1530001 	cmp	r3, r1
            r = r - d;
            q = q | (1 << i);
    12b8:	21800c15 	orrcs	r0, r0, r5, lsl ip

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
    12bc:	20613003 	rsbcs	r3, r1, r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    12c0:	e25cc001 	subs	ip, ip, #1
    12c4:	2afffff7 	bcs	12a8 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
    12c8:	e24bd008 	sub	sp, fp, #8
    12cc:	e8bd0830 	pop	{r4, r5, fp}
    12d0:	e12fff1e 	bx	lr

000012d4 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    12d4:	e92d000e 	push	{r1, r2, r3}
    12d8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    12dc:	e28db020 	add	fp, sp, #32
    12e0:	e1a05000 	mov	r5, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    12e4:	e59b4004 	ldr	r4, [fp, #4]
    12e8:	e5d48000 	ldrb	r8, [r4]
    12ec:	e3580000 	cmp	r8, #0
    12f0:	0a000027 	beq	1394 <printf+0xc0>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    12f4:	e59f712c 	ldr	r7, [pc, #300]	; 1428 <printf+0x154>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    12f8:	e28b6008 	add	r6, fp, #8
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    12fc:	e3a0a000 	mov	sl, #0
    1300:	ea000008 	b	1328 <printf+0x54>
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1304:	e3580025 	cmp	r8, #37	; 0x25
        state = '%';
    1308:	01a0a008 	moveq	sl, r8
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    130c:	0a000002 	beq	131c <printf+0x48>
        state = '%';
      } else {
        putc(fd, c);
    1310:	e1a00005 	mov	r0, r5
    1314:	e1a01008 	mov	r1, r8
    1318:	ebffff9e 	bl	1198 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    131c:	e5f48001 	ldrb	r8, [r4, #1]!
    1320:	e3580000 	cmp	r8, #0
    1324:	0a00001a 	beq	1394 <printf+0xc0>
    c = fmt[i] & 0xff;
    if(state == 0){
    1328:	e35a0000 	cmp	sl, #0
    132c:	0afffff4 	beq	1304 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1330:	e35a0025 	cmp	sl, #37	; 0x25
    1334:	1afffff8 	bne	131c <printf+0x48>
      if(c == 'd'){
    1338:	e3580064 	cmp	r8, #100	; 0x64
    133c:	0a00002c 	beq	13f4 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1340:	e3580078 	cmp	r8, #120	; 0x78
    1344:	13580070 	cmpne	r8, #112	; 0x70
    1348:	13a09000 	movne	r9, #0
    134c:	03a09001 	moveq	r9, #1
    1350:	0a000013 	beq	13a4 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1354:	e3580073 	cmp	r8, #115	; 0x73
    1358:	0a000018 	beq	13c0 <printf+0xec>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    135c:	e3580063 	cmp	r8, #99	; 0x63
    1360:	0a00002a 	beq	1410 <printf+0x13c>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1364:	e3580025 	cmp	r8, #37	; 0x25
        putc(fd, c);
    1368:	e1a0100a 	mov	r1, sl
    136c:	e1a00005 	mov	r0, r5
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1370:	0a000002 	beq	1380 <printf+0xac>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1374:	ebffff87 	bl	1198 <putc>
        putc(fd, c);
    1378:	e1a00005 	mov	r0, r5
    137c:	e1a01008 	mov	r1, r8
    1380:	ebffff84 	bl	1198 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1384:	e5f48001 	ldrb	r8, [r4, #1]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1388:	e1a0a009 	mov	sl, r9
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    138c:	e3580000 	cmp	r8, #0
    1390:	1affffe4 	bne	1328 <printf+0x54>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1394:	e24bd020 	sub	sp, fp, #32
    1398:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    139c:	e28dd00c 	add	sp, sp, #12
    13a0:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    13a4:	e1a00005 	mov	r0, r5
    13a8:	e4961004 	ldr	r1, [r6], #4
    13ac:	e3a02010 	mov	r2, #16
    13b0:	e3a03000 	mov	r3, #0
    13b4:	ebffff81 	bl	11c0 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    13b8:	e3a0a000 	mov	sl, #0
    13bc:	eaffffd6 	b	131c <printf+0x48>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    13c0:	e4968004 	ldr	r8, [r6], #4
        ap++;
        if(s == 0)
          s = "(null)";
    13c4:	e3580000 	cmp	r8, #0
    13c8:	01a08007 	moveq	r8, r7
        while(*s != 0){
    13cc:	e5d81000 	ldrb	r1, [r8]
    13d0:	e3510000 	cmp	r1, #0
    13d4:	0a000004 	beq	13ec <printf+0x118>
          putc(fd, *s);
    13d8:	e1a00005 	mov	r0, r5
    13dc:	ebffff6d 	bl	1198 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    13e0:	e5f81001 	ldrb	r1, [r8, #1]!
    13e4:	e3510000 	cmp	r1, #0
    13e8:	1afffffa 	bne	13d8 <printf+0x104>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    13ec:	e1a0a001 	mov	sl, r1
    13f0:	eaffffc9 	b	131c <printf+0x48>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    13f4:	e1a00005 	mov	r0, r5
    13f8:	e4961004 	ldr	r1, [r6], #4
    13fc:	e3a0200a 	mov	r2, #10
    1400:	e3a03001 	mov	r3, #1
    1404:	ebffff6d 	bl	11c0 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1408:	e3a0a000 	mov	sl, #0
    140c:	eaffffc2 	b	131c <printf+0x48>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1410:	e4961004 	ldr	r1, [r6], #4
    1414:	e1a00005 	mov	r0, r5
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1418:	e1a0a009 	mov	sl, r9
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    141c:	e6ef1071 	uxtb	r1, r1
    1420:	ebffff5c 	bl	1198 <putc>
    1424:	eaffffbc 	b	131c <printf+0x48>
    1428:	000016b0 	.word	0x000016b0

0000142c <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    142c:	e59f3098 	ldr	r3, [pc, #152]	; 14cc <free+0xa0>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1430:	e92d0830 	push	{r4, r5, fp}
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1434:	e240c008 	sub	ip, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1438:	e5932000 	ldr	r2, [r3]
static Header base;
static Header *freep;

void
free(void *ap)
{
    143c:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1440:	e152000c 	cmp	r2, ip
    1444:	e5921000 	ldr	r1, [r2]
    1448:	2a000001 	bcs	1454 <free+0x28>
    144c:	e15c0001 	cmp	ip, r1
    1450:	3a000007 	bcc	1474 <free+0x48>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1454:	e1520001 	cmp	r2, r1
    1458:	3a000003 	bcc	146c <free+0x40>
    145c:	e152000c 	cmp	r2, ip
    1460:	3a000003 	bcc	1474 <free+0x48>
    1464:	e15c0001 	cmp	ip, r1
    1468:	3a000001 	bcc	1474 <free+0x48>
static Header base;
static Header *freep;

void
free(void *ap)
{
    146c:	e1a02001 	mov	r2, r1
    1470:	eafffff2 	b	1440 <free+0x14>

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1474:	e5104004 	ldr	r4, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1478:	e5832000 	str	r2, [r3]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    147c:	e08c5184 	add	r5, ip, r4, lsl #3
    1480:	e1550001 	cmp	r5, r1
    bp->s.size += p->s.ptr->s.size;
    1484:	05911004 	ldreq	r1, [r1, #4]
    1488:	00814004 	addeq	r4, r1, r4
    148c:	05004004 	streq	r4, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    1490:	05921000 	ldreq	r1, [r2]
    1494:	05911000 	ldreq	r1, [r1]
  } else
    bp->s.ptr = p->s.ptr;
    1498:	e5001008 	str	r1, [r0, #-8]
  if(p + p->s.size == bp){
    149c:	e5921004 	ldr	r1, [r2, #4]
    14a0:	e0824181 	add	r4, r2, r1, lsl #3
    14a4:	e15c0004 	cmp	ip, r4
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    14a8:	1582c000 	strne	ip, [r2]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    14ac:	0510c004 	ldreq	ip, [r0, #-4]
    14b0:	008c1001 	addeq	r1, ip, r1
    14b4:	05821004 	streq	r1, [r2, #4]
    p->s.ptr = bp->s.ptr;
    14b8:	05101008 	ldreq	r1, [r0, #-8]
    14bc:	05821000 	streq	r1, [r2]
  } else
    p->s.ptr = bp;
  freep = p;
}
    14c0:	e24bd008 	sub	sp, fp, #8
    14c4:	e8bd0830 	pop	{r4, r5, fp}
    14c8:	e12fff1e 	bx	lr
    14cc:	0000172c 	.word	0x0000172c

000014d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    14d0:	e92d49f8 	push	{r3, r4, r5, r6, r7, r8, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    14d4:	e2804007 	add	r4, r0, #7
  if((prevp = freep) == 0){
    14d8:	e59f50d4 	ldr	r5, [pc, #212]	; 15b4 <malloc+0xe4>
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    14dc:	e1a041a4 	lsr	r4, r4, #3
  return freep;
}

void*
malloc(uint nbytes)
{
    14e0:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    14e4:	e5953000 	ldr	r3, [r5]
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    14e8:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    14ec:	e3530000 	cmp	r3, #0
    14f0:	0a00002b 	beq	15a4 <malloc+0xd4>
    14f4:	e5930000 	ldr	r0, [r3]
    14f8:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    14fc:	e1520004 	cmp	r2, r4
    1500:	2a00001b 	bcs	1574 <malloc+0xa4>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1504:	e59f80ac 	ldr	r8, [pc, #172]	; 15b8 <malloc+0xe8>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    1508:	e1a07184 	lsl	r7, r4, #3
    150c:	ea000003 	b	1520 <malloc+0x50>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1510:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    1514:	e5902004 	ldr	r2, [r0, #4]
    1518:	e1540002 	cmp	r4, r2
    151c:	9a000014 	bls	1574 <malloc+0xa4>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1520:	e5952000 	ldr	r2, [r5]
    1524:	e1a03000 	mov	r3, r0
    1528:	e1500002 	cmp	r0, r2
    152c:	1afffff7 	bne	1510 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1530:	e1540008 	cmp	r4, r8
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    1534:	81a00007 	movhi	r0, r7
    1538:	93a00902 	movls	r0, #32768	; 0x8000
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    153c:	81a06004 	movhi	r6, r4
    1540:	93a06a01 	movls	r6, #4096	; 0x1000
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    1544:	ebfffeec 	bl	10fc <sbrk>
    1548:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    154c:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
    1550:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
    1554:	0a000010 	beq	159c <malloc+0xcc>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1558:	e5836004 	str	r6, [r3, #4]
  free((void*)(hp + 1));
    155c:	ebffffb2 	bl	142c <free>
  return freep;
    1560:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1564:	e3530000 	cmp	r3, #0
    1568:	1affffe8 	bne	1510 <malloc+0x40>
        return 0;
    156c:	e1a00003 	mov	r0, r3
  }
}
    1570:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1574:	e1540002 	cmp	r4, r2
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1578:	10642002 	rsbne	r2, r4, r2
    157c:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1580:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
    1584:	10800182 	addne	r0, r0, r2, lsl #3
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1588:	05832000 	streq	r2, [r3]
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
    158c:	15804004 	strne	r4, [r0, #4]
      }
      freep = prevp;
    1590:	e5853000 	str	r3, [r5]
      return (void*)(p + 1);
    1594:	e2800008 	add	r0, r0, #8
    1598:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
    159c:	e3a00000 	mov	r0, #0
    15a0:	e8bd89f8 	pop	{r3, r4, r5, r6, r7, r8, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    15a4:	e2850004 	add	r0, r5, #4
    15a8:	e5850000 	str	r0, [r5]
    base.s.size = 0;
    15ac:	e9850009 	stmib	r5, {r0, r3}
    15b0:	eaffffd3 	b	1504 <malloc+0x34>
    15b4:	0000172c 	.word	0x0000172c
    15b8:	00000fff 	.word	0x00000fff
