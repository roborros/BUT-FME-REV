#include <stdio.h>
#include <stdlib.h>


void uloz_do_pole(int pole[], int index, int cislo);

void p_uloz_do_pole(int *pole, int index, int cislo);

int main() {
	
	int cisla[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};	
	
	
	printf("%d\n", cisla[7]);
	
	uloz_do_pole(cisla, 7, 3);
	
	printf("%d\n", cisla[7]);
	
	p_uloz_do_pole(cisla, 7, 7);
	printf("%d\n", cisla[7]);

return 0;
}


void uloz_do_pole(int pole[], int index, int cislo){
	pole[index] = cislo;
}

void p_uloz_do_pole(int *pole, int index, int cislo){
	pole[index] = cislo;
}
