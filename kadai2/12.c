#include <stdio.h>
 
int main(int argc, char *argv[])
{
  int a[2][3] = {};
  int b[3][2] = {};
  int r[2][2] = {};
  int i, j;
 
  for (i = 0; i < 2; i++) {
    for (j = 0; j < 3; j++) {
      scanf("%d", &a[i][j]);
    }
  }
  for (i = 0; i < 3; i++) {
    for (j = 0; j < 2; j++) {
      scanf("%d", &b[i][j]);
    }
  }

  int t,s;

  for (t = 0; t < 2; t++) {
    for (s = 0; s < 2; s++) {
      for (i = 0; i < 3; i++) {
	r[t][s] += a[t][i] * b[i][s];
      }
    }
  }
 
  printf("%d %d\n%d %d\n", r[0][0], r[0][1], r[1][0], r[1][1]);
  return 0;
}
