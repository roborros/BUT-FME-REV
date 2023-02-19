#include <stdio.h> 
  

int main() 
{ 
 
    int a, b;
    for (a=0, b=-10; (a+b)<10; a++,b++){
    	printf("a=%d; b=%d\n", a, b);
	}
    return 0; 
} 

