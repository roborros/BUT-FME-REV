#include <stdio.h>

void nacti(char pole[], char n);

int main(void){
	
	char zprava[10];
	
	printf("Zadej zpravu:\n");
	
	nacti(zprava, sizeof(zprava));
	
	printf("%s", zprava);
	
	
	return 0;
}

void nacti(char pole[], char n){
	
	char i;
	
	for(i=0; i<n;i++){
		pole[i] = getchar();
		if(pole[i] == '\n'){
			pole[i] = '\0';
			return;
		}
	}
	
	pole[n-1] = '\0';
	return;
}
