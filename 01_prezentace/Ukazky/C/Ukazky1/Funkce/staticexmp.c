#include <stdio.h>

// prototyp
int suma(int a);

int main()
{   
	int a=1;
	
	printf("Suma1 je: %d\n", suma(a));
	
	printf("Suma2 je: %d\n", suma(a));
	
	printf("Suma3 je: %d\n", suma(a));
	
    return 0;
}

int suma(int a){
	static int pocet=0;
	int sum;
	
	sum = a + pocet;
	pocet++;
	return sum;
}
