#include <stdio.h>

// prototypy
int sum(int n);


int main(void){
	char cislo;
	int suma;
	
	printf("Zadej cislo:");
	cislo = getchar() - '0';
	printf("\n");
	suma = sum(cislo);		//pouziti funkce
	
	printf("Suma je: %d", suma);
	return 0;
}

int sum(int n){
	if(n != 0){
		return n + sum(n-1);
	}
	else{
		return 0;
	}
}
