#include <stdio.h>

//prototyp
void moje_funkce(int a);

int main(void){

	int a=0;
	
	moje_funkce(a);
	printf("a je: %d\n", a);

	return 0;
}

// definice
void moje_funkce(int a){
	a = a + 10;
	printf("a je: %d\n", a);
}
