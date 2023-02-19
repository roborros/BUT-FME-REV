#include <stdio.h>
#include <stdlib.h>

int main()
{
    char c;
    printf("Zadej znak:");
    c = getchar();
    printf("\n");

    switch (c)
    {
        case 'A':
            printf("Zadals A");
            break;
        case 'B':
            printf("Zadals B");
            break;
        case 'C':
            printf("Zadals C");
            break;
        default:
            break;
    }
    return 0;
}
