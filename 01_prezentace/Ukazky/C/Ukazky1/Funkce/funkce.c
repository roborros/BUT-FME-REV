#include <stdio.h>

// prototypy
void tisk(void);
void tisk_cisla(int cislo);


int main(void){
	char cislo;
	
	tisk();					//pouziti funkce
	
	printf("Zadej cislo:");
	cislo = getchar() - '0';
	printf("\n");
	tisk_cisla(cislo);		//pouziti funkce
	
	return 0;
}

// definice
void tisk_cisla(int a){
	printf("Cislo je %d\n", a);
}

//definice
void tisk(void){
	printf("Tisk z funkce\n");
}
