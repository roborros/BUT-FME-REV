#include <stdio.h>
#include "point.h"

int main(void) {
	
	point_t p1;
	point_t p2;
	
	ctor(&p1, 0, 0);
	ctor(&p2, 10, 10);
	
	printf("x:%d; y:%d\n", p1.x, p1.y); 
	printf("x:%d; y:%d\n", p2.x, p2.y);
	
	move(&p2, 10, -10);
	move(&p1, 2, 2);
	 
	printf("x:%d; y:%d\n", p2.x, p2.y);
	printf("x:%d; y:%d\n", p1.x, p1.y);
	
	
	return 0;
}
