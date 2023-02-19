#include <stdio.h>
#include <stdint.h>


int main(void){
	
	uint16_t a = 0b10001000;
	uint16_t b = 0x8000;
	
	printf("HEX: 0x%X\n", a);
	printf("dec: %d\n", b);
}
