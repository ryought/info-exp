#include <stdio.h>
 
void reverse(char *a, int k)
{
    int i, j;
    char tmp;

    for (i = 0; i < (k - 1) / 2; i++) {
        for (j = 0; j < 10; j++) {
            tmp = *(a + i*10 + j);
            *(a + i*10 + j) = *(a + (k-i-1)*10 + j);
            *(a + (k-i-1)*10 + j) = tmp;
        }
    }
}
 

int main(int argc, char *argv[])
{
    char a[5][10] = {"", "", "", "", ""};
    int i;
 
    for (i = 0; i < 5; i++)
        scanf("%9s", a[i]);
 
    reverse(a, 5);
 
    for (i = 0; i < 5; i++)
        printf("%s\n", a[i]);
 
    return 0;
}