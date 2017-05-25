#include <stdio.h>
 
int main(int argc, char *argv[])
{
  int a[4][4] = {};
  int i;
  int tr = 0;
 
  for (i = 0; i < 4; i++) {
    scanf("%d %d %d %d", &a[i]);
  }
  for (i = 0; i < 4; i++) {
    tr += a[i][i];
  }
 
  printf("%d\n", tr);
  return 0;
}
