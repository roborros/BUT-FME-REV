#include <stdio.h>
#include <stdlib.h>

#define PI 3.1415F
#define ADD(x,y) (x + y)

int main()
{
    int polomer, a, b;

    printf("Vloz cislo:");
    polomer = (int)(getche() - '0');
    printf("\n");
    float obsah = PI*polomer*polomer;
    printf("Obsah je: %f\n", obsah);

    printf("Vloz cislo a:");
    a = (int)(getche() - '0');
    printf("\n");

    printf("Vloz cislo b:");
    b = (int)(getche() - '0');
    printf("\n");

    printf("Soucet a+b je:%d", ADD(a,b));

    return 0;
}
