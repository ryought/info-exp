#include <stdio.h>


int main()
{
  int x, y;
  scanf("%d%d", &x, &y);

  for (int i=x; i<=y; i++) {
    if (i%3==0 && i%5==0) {
      printf("FizzBuzz");
    } else if (i%3==0) {
      printf("Fizz");
    } else if (i%5==0) {
      printf("Buzz");
    } else {
      printf("%d", i);
    }
    printf("\n");
  }
  return 0;
}
