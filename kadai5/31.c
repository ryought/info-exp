#include <stdio.h>

 
struct vect {
    int x;
    int y;
};

struct vect vect_add(struct vect a, struct vect b) {
  struct vect z;
  z.x = a.x + b.x;
  z.y = a.y + b.y;
  return z;
}


 
int main(int argc, char *argv[])
{
    struct vect a, b, c;
 
    scanf("%d,%d", &a.x, &a.y);
    scanf("%d,%d", &b.x, &b.y);
 
    c = vect_add(a, b);
    c = vect_add(c, b);
 
    printf("%d, %d\n", c.x, c.y);
 
    return 0;
}
