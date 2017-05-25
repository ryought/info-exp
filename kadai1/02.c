#include <stdio.h>

int main()
{
  int a;
  int b;
  double r;
  scanf("%d", &a);
  scanf("%d", &b);
  r = (double)a / (double)b *100;
  printf("%f\n", r);
  return 0;
}
