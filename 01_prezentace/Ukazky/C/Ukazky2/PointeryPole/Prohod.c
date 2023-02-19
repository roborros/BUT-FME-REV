#include <stdio.h>
#include <stdlib.h>

void prohod(int* a, int* b);

int main(){   
    int jedna;
    int dva;

    jedna = 1;
    dva = 2;
    prohod(&jedna, &dva);
    printf("jedna = %d; dva = %d\n", jedna, dva);
    return 0;
}

void prohod(int* a, int* b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}
