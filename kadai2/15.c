#include <stdio.h>
void reverse(int *a, int length)
{
  int i = 0;
  int b[length] = {};
  for (i = 0; i < length; i++) {
    b[i] = a[length - i - 1];
  }
  a = b;
}



int main(int argc, char *argv[])
{
    int a[5] = {0, 0, 0, 0, 0};
    int i;
    for (i = 0; i < 5; i++)
        scanf("%d", &a[i]);
    reverse(a, 5);
    for (i = 0; i < 5; i++)
        printf("%d\n", a[i]);
    return 0;
}
