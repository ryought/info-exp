#include <stdio.h>
#include <stdlib.h>
 
struct wizard {
    char *name;
    int hp;
    int mp;
};
 
int main(int argc, char *argv[])
{
    struct wizard *p;
    char *name;

    p = malloc(sizeof(struct wizard));
    name = malloc(9);
    if (p == NULL) exit(1);
    if (name == NULL) exit(1);

    p->name = name;

    scanf("%9s%d%d", name, &p->hp, &p->mp);
 
    if (p->mp >= 10) {
        p->hp += 100;
        p->mp -= 10;
    }
 
    printf("%s\n%d\n%d\n", p->name, p->hp, p->mp);
 
    free(p);
    free(name);
 
    return 0;
}
