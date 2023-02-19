#include <stdio.h>
#include <stdint.h>


void main(void){
	
	int8_t a = 0b00000101;  //  5
	int8_t b = 0b11111011;	// -5
	

	printf("%d\n", a);
	printf("%d\n", b);
	
	printf("+++++++++++++++++++++++++++++++++++\n");
	
	int8_t c = 0b00000100;	// 4
	int8_t d = 0b11111100;	//-4
	
	
	printf("%d\n", c);
	printf("%d\n", d);
	
	return;
}
