#include <stdio.h>
#include <stdint.h>

int main()
{
    int a=10;
    int b=3;

    float c, f;

    c = a/b;
    f = (float)a/b;

    printf("c=%f, f=%f\n", c, f);

    int16_t d = 65535;
    
    uint16_t e = (uint16_t)d;
    
    printf("d=%d, e=%d", d, e);
    return 0;
}
