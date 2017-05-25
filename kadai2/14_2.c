#include <stdio.h>

int min2(int x0, int x1) {
  if (x0 < x1) {
    return x0;
  } else {
    return x1;
  }
}


// return min of 3 numbers
int min3(int x0, int x1, int x2) {
  int buf;
  buf = min2(x0, x1);
  buf = min2(buf, x2);
  return buf;
}


int main(int argc, char *argv[])
{
    int x0 = 0, x1 = 0, x2 = 0;
    
    scanf("%d%d%d", &x0, &x1, &x2);
 
    printf("%d\n", min3(x0, x1, x2));
 
    return 0;
}
