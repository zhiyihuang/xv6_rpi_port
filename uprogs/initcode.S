# Initial process execs /init.

#include "syscall.h"
#include "traps.h"


# exec(init, argv)
.globl start
start:
  push {lr}
  ldr r0, =argv
  push {r0}
  ldr r0, =init
  push {r0}
  mov r0, #SYS_exec
  swi #T_SYSCALL
  pop {lr}
  pop {lr}
  pop {lr}
  bx lr

# for(;;) exit();
exit:
  mov r11, #SYS_exit
  swi #T_SYSCALL
  bl exit

# char init[] = "/init\0";
init:
  .string "/init\0"

# char *argv[] = { init, 0 };
.p2align 2
argv:
  .long init
  .long 0

