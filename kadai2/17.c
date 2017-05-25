#include <stdio.h>

int gcd(int x, int y) {
  // 最大公約数求める when x = gX, y = gY then g is gcd
  int i;
  int r = 1;
  for (i=2; i<x; i++) {
    if (x%i==0 && y%i==0) {
      r = i;
    }
  }
  return r;
}




int main(int argc, char *argv[])
{
    int x = 1, y = 1;
 
    scanf("%d%d", &x, &y);
 
    printf("%d\n", gcd(x, y));
 
    return 0;
}
