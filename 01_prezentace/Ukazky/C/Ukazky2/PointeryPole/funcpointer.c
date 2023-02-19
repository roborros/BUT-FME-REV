#include <stdio.h>
#include <stdint.h>

void fun1(void){
	printf("fun1\n");
}

void fun2(void){
	printf("fun2\n");
}

int main(void) {
	
	void (*call)(void);		// funkce
	
	call= &fun1;			// mohu pouzit symbol adresy
	
	(*call)();				// mohu volats se symbolem dereference
	
	call = &fun2;			// take funguje
	
	call();					// take možnost
	
	return 0;
}
