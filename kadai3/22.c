#include <stdio.h>

int main(int argc, char *argv[])
{
    char s1[100] = "";
    int i = 0;
    char ch;
    while ((ch = getchar()) != EOF) {
	s1[i] = ch;
	i++;
    }
 
    printf("%s, i:%d\n", s1, i);
 
    return 0;
}
