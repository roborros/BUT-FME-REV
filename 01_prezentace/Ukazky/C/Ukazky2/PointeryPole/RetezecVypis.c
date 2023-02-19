#include <stdio.h>
#include <stdlib.h>


int main() {

    char abc[] = "Pointery jsou fajn!";
    char* p_abc = abc;
    
    printf("%c", *(p_abc+2));

    while(*p_abc != '\0'){
        printf("%c", *p_abc++);
    }


    return 0;
}
