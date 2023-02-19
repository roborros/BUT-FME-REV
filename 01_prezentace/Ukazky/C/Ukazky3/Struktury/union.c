#include <stdio.h>
#include <stdint.h>

typedef union{
	uint32_t a;
	uint8_t b[4];
}my_un;

typedef union{
	
	struct{
		uint8_t b0 :1;
		uint8_t b1 :1;
		uint8_t b2 :1;
		uint8_t b3 :1;
		
		uint8_t b4 :1;
		uint8_t b5 :1;
		uint8_t b6 :1;
		uint8_t b7 :1;
	};
	
	uint8_t all;
	
}reg_t;


void main(void){

	my_un un;
	
	un.a = 256;
	
	
	printf("a:%d  b:%d\n", un.a, un.b[1]);
	
	reg_t reg;
	
	reg.b0 = 0;
	reg.b1 = 0;
	reg.b3 = 1;
	
	printf("%d",reg.all);
	

	return; 
}
