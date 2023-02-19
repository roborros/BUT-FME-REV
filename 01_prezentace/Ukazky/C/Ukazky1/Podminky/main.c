#include <stdio.h>
#include <stdlib.h>

int main()
{
    char b;

    printf("Vloz znak:");
    b = getche();
    printf("\n");

    if(b == 'M')
    {
        printf("Bylo to M");
    }
    else if(b == 'K')
    {
        printf("Bylo to K");
    }
    else
    {
        printf("Ani M ani K");
    }

    return 0;
}
