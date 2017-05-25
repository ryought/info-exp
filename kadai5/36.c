#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
char *substr(char *s)
{
    int i = 0;
    char *p;

    while (s[i] != '\0') {
      if (s[i] == 'a')
	break;
      i++;
    }
 
    p = malloc(strlen(s) - i);
    strcpy(p, s+i);
 
    return p;
}
 
int main()
{
    char buf[100] = "";
    char *s[5];
    int i;
 
    for (i = 0; i < 5; i++) {
        scanf("%99s", buf);
        s[i] = substr(buf);
        buf[0] = '\0';
    }
 
    for (i = 4; 0 <= i; i--) {
        printf("%s\n", s[i]);
        /* 以下の行を入れるとエラーになる。 */
        /* free(s[i]); */
	free(s[i]);
    }
 
    return 0;
}
