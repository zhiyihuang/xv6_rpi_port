/*****************************************************************
*       usys.S
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/



#include "syscall.h"
#include "traps.h"

/* This is clumsy, but don't know how to make it smart */
.globl fork
fork:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_fork  
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl exit
exit:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_exit
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl wait
wait:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_wait
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl pipe
pipe:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_pipe
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl read
read:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_read
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl write
write:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_write
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl close
close:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_close
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr


.globl kill
kill:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_kill
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl exec
exec:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_exec
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl open
open:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_open
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl mknod
mknod:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_mknod
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl unlink
unlink:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_unlink
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl fstat
fstat:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_fstat
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl link
link:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_link
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl mkdir
mkdir:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_mkdir
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl chdir
chdir:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_chdir
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl dup
dup:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_dup
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl getpid
getpid:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_getpid
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl sbrk
sbrk:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_sbrk
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl sleep
sleep:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_sleep
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr

.globl uptime
uptime:
    push {lr}
    push {r3}
    push {r2}
    push {r1}
    push {r0}
    mov r0, #SYS_uptime
    swi #T_SYSCALL
    pop {r1} /* to avoid overwrite of r0 */
    pop {r1}
    pop {r2}
    pop {r3}
    pop {lr}
    bx lr


/*
SYSCALL(fork)
SYSCALL(exit)
SYSCALL(wait)
SYSCALL(pipe)
SYSCALL(read)
SYSCALL(write)
SYSCALL(close)
SYSCALL(kill)
SYSCALL(exec)
SYSCALL(open)
SYSCALL(mknod)
SYSCALL(unlink)
SYSCALL(fstat)
SYSCALL(link)
SYSCALL(mkdir)
SYSCALL(chdir)
SYSCALL(dup)
SYSCALL(getpid)
SYSCALL(sbrk)
SYSCALL(sleep)
SYSCALL(uptime)
*/
