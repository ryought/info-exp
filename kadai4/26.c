#include <stdio.h>


void sort3(int *x0, int *x1, int *x2) {
  int temp;
  while (*x0 > *x1 || *x0 > *x2 || *x1 > *x2) {
    if (*x0 > *x1) {
      temp = *x1;
      *x1 = *x0;
      *x0 = temp;
    }
    if (*x1 > *x2) {
      temp = *x2;
      *x2 = *x1;
      *x1 = temp;
    }
  }
}




int main(int argc, char *argv[])
{
    int x[3] = {0, 0, 0};
    int i;
 
    for (i = 0; i < 3; i++)
        scanf("%d", &x[i]);
 
    sort3(&x[0], &x[1], &x[2]);
 
    for (i = 0; i < 3; i++)
        printf("%d\n", x[i]);
 
    return 0;
}
