#include <stdio.h>


int main(int argc, char *argv[]) {
  char ch;
  int count = 0;
  for (;;) {
    ch = getchar();
    //printf("%c", ch);
    if (ch == 'a') count++;
    if (ch == -1) break;
  }
  printf("%d\n", count);
  return 0;
}
