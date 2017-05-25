#include <stdio.h>

int main(int argc, char *argv[])
{
    char s1[100] = "";
    char s2[100] = "";
    int i = 0;
    char ch;
    while ((ch = getchar()) != EOF) {
      if (ch == ' ' || ch == '\n') {
	break;
      } else {
	s1[i] = ch;
	i++;
      }
    }
    i = i - 1;
    int j = 0;
    while (i>=0) {
      s2[j] = s1[i];
      j++;
      i = i - 1;
    }
    printf("%s", s2);
  
    return 0;
}
