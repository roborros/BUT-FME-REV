#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct{
    char    jmeno[25];
    int     vek;
    int     vyska;
} clovek;

int vek(clovek* kdo);

int main() {

    clovek Petr = {"Petr Novak", 25, 178};
    clovek Michal;
    
    clovek* p_Petr = &Petr;

    Michal.vek = 16;
    Michal.vyska = 193;

    strcpy(Michal.jmeno, "Michal Novak");

    printf("Petr ma %d let\n",  Petr.vek);
    printf("Michal se jmenuje %s\n",  Michal.jmeno);
    
    printf("Petr meri %d cm\n",  p_Petr->vyska);
    
    printf("Michal ma %d let\n", vek(&Michal));

    return 0;
}

int vek(clovek *kdo){
	return kdo->vek;
}
