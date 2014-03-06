/*****************************************************************
*       string.c
*       adapted from MIT xv6 by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/


#include "types.h"

void*
memsetw(int *dst, int c, uint n)
{
  int *p=dst;
  uint rc=n;

  while (rc-- > 0) *p++ = c;
  return (void *)p;
}

void*
memsetb(char *dst, int c, uint n)
{
  char *p=dst; 
  uint rc=n;

  while (rc-- > 0) *p++ = c;
  return (void *)p;
}


void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
    return memsetw((int *)dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    return memsetb((char *)dst, c, n);
}

int
memcmp(const void *v1, const void *v2, uint n)
{
  const u8 *s1, *s2;
  
  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}

void*
memmove(void *dst, const void *src, uint n)
{
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (u8)*p - (u8)*q;
}

char*
strncpy(char *s, const char *t, int n)
{
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    *s++ = 0;
  return os;
}

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
  char *os;
  
  os = s;
  if(n <= 0)
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
    ;
  *s = 0;
  return os;
}

int
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

uint div(uint n, uint d)  // long division
{
    uint q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}

