#include <stdio.h>

void mul(int l[][3], int r[][2], int a[][2], int n)
{
  /* 行列`a'が行列`l'と行列`r'の積を表すようになる。 */
  /* `n'は`l'と`a'の行数を表す。 */
  /* `r'の行数は積の定義と`l'のサイズから決まるので、引数には含まれない。 */
  int i,t,s;

  for (t = 0; t < 2; t++) {
    for (s = 0; s < 2; s++) {
      for (i = 0; i < 3; i++) {
	a[t][s] += l[t][i] * r[i][s];
      }
    }
  }
  
}


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
  mul(a, b, r, 2);
 
  printf("%d %d\n%d %d\n", r[0][0], r[0][1], r[1][0], r[1][1]);
  return 0;
}


