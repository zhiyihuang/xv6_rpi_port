// Create a zombie process that 
// must be reparented at exit.

#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void)
{
  if(fork() > 0){
    sleep(5);  // Let child exit before parent.
    printf(2, "Parent exits!\n");
    exit();
  }
  printf(2, "Child exits!\n");
  exit();
}
