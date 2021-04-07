# 1 "point.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/PIC18F-K_DFP/1.4.87/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "point.c" 2
# 1 "./point.h" 1






typedef struct _sPoint{
    int x;
    int y;
    void (*set)(struct _sPoint *const self, int x, int y);
    void (*move)(struct _sPoint *const self, int dx, int dy);
    int (*distance)(struct _sPoint *const self, struct _sPoint *const other);
}stPoint;

typedef struct _s_RGB_Point{
    stPoint super;
    char R;
    char G;
    char B;
}st_RGB_Point;

void point_init( stPoint *const self, int x, int y);
void RGB_point_init( st_RGB_Point *const self,int x, int y, char R, char G, char B);
# 1 "point.c" 2



static void set( stPoint *const self,
                    int x,
                    int y){
    self->x = x;
    self->y = y;
    return;
}


static void move( stPoint *const self,
                    int dx,
                    int dy){
    self->x += dx;
    self->y += dy;
    return;
}


static int int_sqrt(int s){
 int x0 = s >> 1;

 if ( x0 )
 {

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

static int distance( stPoint *const self,
                        stPoint *const other){

    int dx = self->x - other->x;
    int dy = self->y - other->y;
    int pwd = dx*dx + dy*dy;

    return int_sqrt(pwd);

}


void point_init( stPoint *const self,
                    int x,
                    int y){

    self->set = &set;
    self->move = &move;
    self->distance = &distance;
    self->x = x;
    self->y = y;

}

void RGB_point_init( st_RGB_Point *const self,
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
