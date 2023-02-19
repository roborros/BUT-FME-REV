#include <stdio.h>
#include <stdint.h>


int main(void){
	int16_t a;      
    void* p_v = &a; // void pointer ukazuje na bunku v pameti, ale nelze dereferencovat
        
    a = 1795;
    
	//printf("a: %d\n", *p_v);
	  
    printf("a: %d\n", a);
    printf("Prvni: %d a druhy: %d bajt \n", *(char*)p_v, *(char*)(p_v+1));
    
	return 0;
}
