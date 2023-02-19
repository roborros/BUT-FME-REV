
#include <stdio.h> 
void add(int a, int b) 
{ 
    printf("Add %d\n", a+b); 
} 
void subtract(int a, int b) 
{ 
    printf("Sub %d\n", a-b); 
} 
void multiply(int a, int b) 
{ 
    printf("Mul %d\n", a*b); 
} 
  
int main() 
{ 

    void (*fun_ptr_arr[])(int, int) = {add, subtract, multiply}; 
    unsigned a = 5, b = 5; 
    
  	char i;
	for(i=0; i<=2; i++){
		(*fun_ptr_arr[i])(a, b);
	}
  
    return 0; 
} 

