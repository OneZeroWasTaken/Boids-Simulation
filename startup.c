#include "drivers.h"

__attribute__((naked)) __attribute__((section (".start_section")) )
void startup ( void )
{
__asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
__asm__ volatile(" MOV SP,R0\n");
__asm__ volatile(" BL main\n");					/* call main */
__asm__ volatile(".L1: B .L1\n");				/* never return */
}



typedef struct tPoint {
    uint8_t x;
    uint8_t y;
} POINT;

#define MAX_POINTS 20

typedef struct tGeometry {
    int numpoints;
    int sizex;
    int sizey;
    POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObj {
    PGEOMETRY geo;
    int dirx, diry;
    int posx, posy;
    void (* draw) (struct tObj *);
    void (* clear) (struct tObj *);
    void (* move) (struct tObj *);
    void (* set_speed) (struct tObj *, int, int);
} OBJECT, *POBJECT;

void set_object_speed(POBJECT o, int speedx, int speedy) {
    o->dirx = speedx;
    o->diry = speedy;
}

void draw_object(POBJECT o) {
	/*
    int numpoints = o->geo->numpoints;
    for (int i = 0; i < numpoints; i++) {
        POINT p = o->geo->px[i];
        pixel(o->posx + p.x, o->posy + p.y, 1);
    }
	*/
	 paint(o, 1);
}

void clear_object(POBJECT o) {
	/*
    int numpoints = o->geo->numpoints;
    for (int i = 0; i < numpoints; i++) {
        POINT p = o->geo->px[i];
        pixel(o->posx + p.x, o->posy + p.y, 0);
    }
	 * */
	 paint(o, 0);
}

void paint(POBJECT o, int color) {
    int width = o->geo->sizex;
    int height = o->geo->sizey;
	int r = width/2;
	for (int y=0; y<height; y++) {
		for (int x=0; x<width; x++) {
			int xr = x-width/2;
			int yr = y-height/2;
			if (xr*xr+yr*yr < r*r)
				pixel(o->posx + x, o->posy + y, color);
		}
	}
}

void move_object(POBJECT o) {
    clear_object(o);
    int newx = o->posx + o->dirx;
    int newy = o->posy + o->diry;
    int width = o->geo->sizex;
    int height = o->geo->sizey;
    o->posx = newx;
    o->posy = newy;
    if (newx < 1) {
        o->dirx *= -1;
    }
    if (newx + width > 128) {
        o->dirx *= -1;
    }
    if (newy < 1) {
        o->diry *= -1;
    }
    if (newy + height > 64) {
        o->diry *= -1;
    }
    draw_object(o);
}

GEOMETRY ball_geometry = {
    12,
    30,30,
    {
        {0,1}, {0,2}, {1,0}, {1,1}, {1,2},
        {1,3}, {2,0}, {2,1}, {2,2}, {2,3},
        {3,1}, {3,2}
    }
};

static OBJECT ball = {
    &ball_geometry,
    1,1,
    50,30,
    draw_object,
    clear_object,
    move_object,
    set_object_speed
};


typedef struct tBoid {
	int x, y,
	int xvel, yvel,
} BOID, *BOID;



void main(void) {
    POBJECT p = &ball;
	init();
	
	clear_buffer();
	pixel(0, 1, 1);
	uint8_t data = buffer[0][0];
	draw_buffer();

    for (int i = 0; i < 128; i++) {
        pixel(i, 0, 1);
        pixel(i, 63, 1);
    }
    for (int i = 0; i < 64; i++) {
        pixel(0, i, 1);
        pixel(127, i, 1);
    }
	
	int speed = 4;
    p->set_speed(p, speed, 0);
	char c;
    while(1) {
        p->move(p);
		c = keyb();
		out7seg(c);
		switch (c) {
			case 6: p->set_speed(p, speed, 0); break;
			case 2: p->set_speed(p, 0, -speed); break;
			case 4: p->set_speed(p, -speed, 0); break;
			case 5: p->set_speed(p, 0, speed); break;
		}
	draw_buffer();
		delay_milli(20);
    }
}