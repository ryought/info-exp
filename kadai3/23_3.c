#include <stdio.h>

int main(int argc, char *argv[])
{
  char s[100] = "";
  
  int is_ok = 0;
  
  scanf("%99s", s);
  if (s[0] == 'y' && s[1] == 'e' && s[2] == 's' && s[3] == 0) {
    int i;
    for (i=3; i<100; i++) {
      if (s[i] == 0) {
	is_ok = 1;
      } else {
	is_ok = 0;
      }
    }
    if (is_ok == 1)
      puts("OK\n");
  } else {
    puts("NG\n");
  }
  return 0;
}
