#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n=8,i;

    for(i=0; i<=10; i++)
    {
        if(i%2) {
            continue;
        }
        printf("Tisk: %d\n", i);
    }
    printf("----------------\n");


    while(n != 0)
    {
        printf("Tisk: %d\n", n);
        n--;
    }

    return 0;
}
