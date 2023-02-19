#include <stdio.h>

int main()
{ 
  	int c;
    int* p_c;

    c = 10;
    p_c = &c;
    
    *p_c = 12;

    printf("Na adrese: 0x%p je hodnota:%d\n",p_c,*p_c);
    
    return 0;
}
