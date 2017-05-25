#include <stdio.h>

 
int main(int argc, char *argv[])
{
    char s[9];
    int c;
    int i = 0;
 
    c = getchar();
    while ((c != EOF) && (i < 9)) {
        s[i++] = c;
	printf("got: %c @ %d\n", c, i);
        c = getchar();
    }
 
    printf("%9s\n", s);
    for (i = 0; i < 9; i++) {
      printf("%c", s[i]);
    }
 
    return 0;
}
