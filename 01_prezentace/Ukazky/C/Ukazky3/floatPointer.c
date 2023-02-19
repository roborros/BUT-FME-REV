#include <stdio.h>
#include <stdint.h>

typedef union{
	float f;
	uint8_t b[4];
}myfloat_t;

int main()
{
    float a;
    void *pf = &a;

    *(uint8_t*)(pf+3) = 0b10111111;
    *(uint8_t*)(pf+2) = 0b01100000;
    *(uint8_t*)(pf+1) = 0b00000000;
    *(uint8_t*)(pf) = 0b00000000;

    printf("%f\n", a);
    
    myfloat_t f;
    
    f.f = a;
    
    printf("%f\n", f.f);
    printf("%d\n", f.b[2]);

    return 0;
}
