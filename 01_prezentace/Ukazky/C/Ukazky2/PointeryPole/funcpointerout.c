#include <stdio.h>

char *max(char *pole, char n);

int main(void){
	
	char pole[5] = {1, 10, 30, 10, 3};
	char *p_max = max(pole, 5);
	
	printf("Max prvek je: %d", *p_max);
	
	return 0;
}

char *max(char *pole, char n){
	char i;
	char *p_max = pole;
	
	for(i=1; i<n; i++){
		if(pole[i] > *p_max){
			p_max = &pole[i];
		}
	}
	return p_max;
}
