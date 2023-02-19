#include <stdio.h>

// globalni promìnná
int g_a;


//prototyp
void moje_funkce(void);

int main(void){
	
	moje_funkce();
	printf("a je: %d\n", g_a);

	return 0;
}

// definice
void moje_funkce(void){
	g_a += 10;
	printf("a je: %d\n", g_a);
}
