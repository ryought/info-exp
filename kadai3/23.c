#include <stdio.h>

int main(int argc, char *argv[])
{
  char s1[100] = "";
  char s2[100] = "";
  
  scanf("%99s %99s", s1, s2);
  int i = 0;
  for(i = 0; i < 100; i++) {
    if (s1[i] == s2[i]) {
      continue;
    } else {
      break;
    }
  }
  printf("%d\n", i);
  return 0;
}
