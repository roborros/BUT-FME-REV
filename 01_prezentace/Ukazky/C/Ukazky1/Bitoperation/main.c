#include <stdio.h>
#include <stdint.h>

#define BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  (byte & 128 ? '1' : '0'), \
  (byte & 64 ? '1' : '0'), \
  (byte & 32 ? '1' : '0'), \
  (byte & 16 ? '1' : '0'), \
  (byte & 8 ? '1' : '0'), \
  (byte & 4 ? '1' : '0'), \
  (byte & 2 ? '1' : '0'), \
  (byte & 1 ? '1' : '0') 


int main(void){
	
	uint8_t a = 0b11110001;
	uint8_t b = 0b00001101;
	
	uint8_t c = a | b;
	
	printf("bin: "BINARY_PATTERN, BYTE_TO_BINARY(c));
	
	printf("\n=======================================\n");
	
	uint8_t d = 0b00000011;
	
	uint8_t e = d << 2;
	
	
	printf("bin: "BINARY_PATTERN, BYTE_TO_BINARY(e));
	printf("\n%d", e);
	
	printf("\n=======================================\n");
	
	uint8_t k = 1;
	uint8_t j = 2;
	
	printf("\nbin: "BINARY_PATTERN, BYTE_TO_BINARY(k));
	printf("\nbin: "BINARY_PATTERN, BYTE_TO_BINARY(j));
	
	if (k && j){
		printf("\nOK 1");
	}
	
	if (k & j){
		printf("OK 2");
	}
	
	printf("\n=======================================\n");
	
	a = 0b00101011;
	printf("\nbin: "BINARY_PATTERN, BYTE_TO_BINARY(a));
	
	b = a | (1 << 2);
	printf("\nOR : "BINARY_PATTERN, BYTE_TO_BINARY(b));
	
	b = a & (~(1<<3));
	printf("\nAND: "BINARY_PATTERN, BYTE_TO_BINARY(b));
	
	b = a ^ (0b1111);
	printf("\nXOR: "BINARY_PATTERN, BYTE_TO_BINARY(b));
	return 0;
}
