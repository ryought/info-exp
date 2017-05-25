#include <stdio.h>
 
void swap(int x, int y)
{
    int z;
 
    z = x;
    x = y;
    y = z;
}
 
int main(int argc, char *argv[])
{
    int x = 0, y = 0;
 
    scanf("%d", &x);
    scanf("%d", &y);
 
    swap(x, y);
 
    printf("%d\n", x);
    printf("%d\n", y);
 
    return 0;
}
