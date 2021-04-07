#ifndef POINT_H
#define	POINT_H

#define NEW_POINT(x,a,b) stPoint x; point_init(&x, a, b);
#define NEW_RGB_POINT(x,a,b,c,d,e) st_RGB_Point x; RGB_point_init(&x, a, b,c,d,e);

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

void point_init(  stPoint *const self, int x, int y);
void RGB_point_init(  st_RGB_Point *const self,int x, int y, char R, char G, char B);

#endif	/* POINT_H */

