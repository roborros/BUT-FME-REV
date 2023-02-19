#include <stdio.h>
#include <stdint.h>

typedef struct{
	uint8_t u1:4;
	uint8_t u2:4;
}bitf_t;

void main(void){
	
	bitf_t my_st;
	
	my_st.u1 = 1;
	
	int i;
	for(i=0; i<20;i++){
		printf("%d\n", my_st.u1++);
	}
	
}
