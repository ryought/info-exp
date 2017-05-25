#include <stdio.h>
 
void reverse(char *a, int k)
{
    printf("%c in %p\n", *a , a);
    printf("%c in %p\n", *(a+11) , a+1);
}
 

int main(int argc, char *argv[])
{
    char a[5][10] = {"afcd", "efgh", "ijkl", "mnop", "qrst"};
    int i;

    printf("%c <--> %c\n", a[1][0], a[2][0]);
    reverse(a, 5);
 
    for (i = 0; i < 5; i++)
        printf("%s\n", a[i]);
 
    return 0;
}