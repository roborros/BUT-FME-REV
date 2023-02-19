#include <stdio.h>

typedef enum{
	OK=0,
	NOK,
	ERR,
}STATUS;

STATUS fun(int a);

void main(void){
	
	STATUS stat;
	
	stat = fun(-1);
	
	switch(stat){

		case OK:
			printf("OK");
			break;
		case NOK:
			printf("NOK");
			break;
		case ERR:
			printf("ERR");
			break;
		
	}
	
	printf("\n%d",  ERR);
	
}

STATUS fun(int a){
	if(a == 0){
		return OK;
	}
	else if(a > 0){
		return NOK;
	}
	else{
		return ERR;
	}
}
