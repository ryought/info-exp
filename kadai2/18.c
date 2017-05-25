#include <stdio.h>

int fibo(int n) {
  if (n==1) {
    return 1;
  } else if (n==2) {
    return 1;
  }
  return fibo(n-1) + fibo(n-2);
}



int main(int argc, char *argv[])
{
  int n = 1;
  scanf("%d", &n);
  
  printf("%d\n", fibo(n));
 
  return 0;
}
