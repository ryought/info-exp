#include <stdio.h>

int returnBig(int a, int b) {
  int r;
  if(a>b) {
    r = a;
  } else {
    r = b;
  }
  return r;
}


int main()
{
  int a, b, c, d;
  scanf("%d%d%d%d", &a, &b, &c, &d);
  b = returnBig(a,b);
  c = returnBig(b,c);
  d = returnBig(c,d);
  printf("%d\n", d);
}
