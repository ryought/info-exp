#include <stdio.h>


int main()
{
  int a, b, c;
  scanf("%d%d%d", &a, &b, &c);
  

  if (a == b && b == c) {
    printf("A");
  } else if (a == b || a == c || b == c) {
    printf("B");
  } else {
    printf("C");
  }
  return 0;
}
