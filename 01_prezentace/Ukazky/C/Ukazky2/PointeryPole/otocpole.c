#include <stdio.h>

void otoc_pole(int pole[], int velikost);

int main(){
	int i;
	int cisla[] = {1, 2, 3, 4, 5, 6,7};
	
	for(i=0; i<sizeof(cisla)/4; i++){
		printf("%d\n", cisla[i]);
	}
	
	otoc_pole(cisla, sizeof(cisla)/4);
	
	for(i=0; i<sizeof(cisla)/4; i++){
		printf("%d\n", cisla[i]);
	}
	
	return 0;
}

void otoc_pole(int pole[], int velikost){
	int i;
	int temp;
	
    for (i = 0; i < (velikost / 2); i++) {
        temp = pole[velikost - 1 - i];
        pole[velikost - 1 - i] = pole[i];
        pole[i] = temp;
    }
}
