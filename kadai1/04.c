#include <stdio.h>

int main()
{
  int a;
  int A;
  scanf("%d", &a);
  if(a >= 0) {
    A = a;
  }else{
    A = -a;
  }
  printf("%d\n", A);
} 
