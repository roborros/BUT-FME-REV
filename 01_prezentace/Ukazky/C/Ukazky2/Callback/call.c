#include "call.h"
#include <stdio.h>

static reg_function call;

void register_callback(reg_function fun){
	call = fun;
}

void callback(void){
	
	if(call == NULL){
		return;
	}
	call();
}
