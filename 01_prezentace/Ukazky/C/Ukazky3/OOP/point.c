#include "point.h"


void move(point_t * self, int dx, int dy){
	
	self->x += dx;
	self->y += dy;
	
	return;
}

void ctor(point_t * self, int x, int y){
	
	self->x = x;
	self->y = y;
	
	return;
}

