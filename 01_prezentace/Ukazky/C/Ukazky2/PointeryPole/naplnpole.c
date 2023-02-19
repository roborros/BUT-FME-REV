#include <stdio.h>
#include <stdlib.h>


void napln_pole(char pole[], int size);


int main() {
	
	char string[5];
	
	napln_pole(string, sizeof(string));
	printf("%s", string);
	return 0;
}

void napln_pole(char pole[], int size){
	int i;
	printf("Napln pole!\n");
	
	for(i=0; i<size-1; i++){
		pole[i] = getche();
		printf("\n");
	}
	pole[size-1] = '\0';
	return;
}

