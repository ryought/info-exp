#include <stdio.h>

int printLayer(int number, int begin) {
  for (int i = 1; i<=begin; i++) {
    printf(" ");
  }
  for (int j = 1; j<=2*number-1; j++) {
    printf("*");
  }
  printf("\n");
  return 0;
}



int main()
{
  int N; // number of layer
  scanf("%d", &N);

  
  for (int i=1; i<=N; i++) {
    printLayer(i, N-i);
  }
  return 0;
}
