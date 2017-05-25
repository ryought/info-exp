#include <stdio.h>

void reverse(int *a, int len) {
  int b[len];
  int i;
  for (i=0; i<len; i++) {
    b[i] = a[len - i - 1];
  }
  for (i=0; i<len; i++) {
    a[i] = b[i];
  }
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
