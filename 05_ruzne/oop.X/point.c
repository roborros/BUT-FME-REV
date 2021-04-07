#include "point.h"

// privatni
static void set(    stPoint *const self, 
                    int x, 
                    int y){
    self->x = x;
    self->y = y;
    return;
}

//privatni
static void move(   stPoint *const self, 
                    int dx, 
                    int dy){
    self->x += dx;
    self->y += dy;
    return;
}

// privatni
static int int_sqrt(int s){
	int x0 = s >> 1;				

	if ( x0 )
	{
        // newton
		int x1 = ( x0 + s / x0 ) >> 1;	
		
		while ( x1 < x0 )			
		{
			x0 = x1;
			x1 = ( x0 + s / x0 ) >> 1;
		}
		
		return x0;
	}
	else
	{
		return s;
	}
}
// privatni
static int distance(    stPoint *const self,
                        stPoint *const other){

    int dx = self->x - other->x;
    int dy = self->y - other->y;
    int pwd = dx*dx + dy*dy; 

    return int_sqrt(pwd);

}

// verejna metoda
void point_init(    stPoint *const self, 
                    int x, 
                    int y){
    //
    self->set = &set;
    self->move = &move;
    self->distance = &distance;
    self->x = x;
    self->y = y;
    //
}

void RGB_point_init(    st_RGB_Point *const self,
                        int x,
                        int y,
                        char R, 
                        char G, 
                        char B){
    
    point_init(&self->super, x, y);
    
    self->R = R;
    self->G = G;
    self->B = B;

}