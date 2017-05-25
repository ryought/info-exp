#include <stdio.h>

void second(int *i) {
  printf("%d\n", i);
  printf("%d\n", *i);
}



int main(int argc, char *argv[]) {
  int i = 50;
  printf("%d\n", i);
  second(i);
  second(&i);
  return 0;
}
  
