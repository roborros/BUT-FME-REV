#include <stdio.h>
#include <stdint.h>
#include "call.h"


void my_fun(void);

int main(void) {
	
	callback();
	
	register_callback(my_fun);
	
	callback();
	
	return 0;
}

void my_fun(void){
	printf("callback triggered");
}
