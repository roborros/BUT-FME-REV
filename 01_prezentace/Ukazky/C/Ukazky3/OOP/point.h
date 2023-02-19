#ifndef POINT_H
#define POINT_H


typedef struct{
	
	int x;
	int y;
	
}point_t;

void ctor(point_t * self, int x, int y);
void move(point_t * self, int dx, int dy);

#endif
