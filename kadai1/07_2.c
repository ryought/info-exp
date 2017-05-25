#include <stdio.h>


int main()
{
  int a;
  int b;
  int c;
  int r=0;
  scanf("%d", &a);
  b = a;
  while (b != 0) {
    c = b % 10;
    b = b / 10;
    r = r*10 + c;
    //printf("%d %d %d\n", c, b, r);
  }
  printf("%d\n", r);
  return 0;
}
