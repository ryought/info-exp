#include <stdio.h>

int main()
{
  int a;
  int b;
  int r, r2;
  scanf("%d%d", &a, &b);
  r = 100 * a / b;
  r2 = 1000 * a / b;
  if((r2 - r*10) >= 5) {
    r = r+1;　
  }
  printf("%d\n", r);
  return 0;
}
