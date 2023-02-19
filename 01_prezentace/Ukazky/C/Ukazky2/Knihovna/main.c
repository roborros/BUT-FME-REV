#include <stdio.h>
#include <stdint.h>

#include "MyMath.h"

int main(void){
	
	int a=2, b=3;
	double obsah = PI * a * a;
	
	printf("Soucet je: %d\n", soucet(a, b));
	printf("Odecet je: %d\n", odecet(a, b));
	
	printf("Obsah je: %lf\n", obsah);
	
	return 0;
	
#include "zavorka.h"

