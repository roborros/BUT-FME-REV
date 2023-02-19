#include <stdio.h>

// prototypy
int smysl_zivota(void);
int pricti_deset(int cislo);


int main(void){
	char cislo;
	
	printf("Smysl zivota: %d\n", smysl_zivota());
	printf("Zadej cislo:");
	cislo = getche() - '0';
	printf("\n");
	printf("Cislo +10 je: %d\n", pricti_deset(cislo));
	
	return 0;
}

// definice
int smysl_zivota(void){
	return 42;
}

//definice
int pricti_deset(int cislo){
	cislo += 10;
	return cislo;
}
