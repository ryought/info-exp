#include <stdio.h>
 
int main(int argc, char *argv[])
{
    char s[10];
    int c;
    int i = 0;
 
    c = getchar();
    while ((c != EOF) && (i < 9)) {
        s[i++] = c;
        c = getchar();
    }

    s[9] = 0;
    
    printf("%s\n", s);
 
    return 0;
}
