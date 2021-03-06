#include "drivers.h"
#include <stdlib.h>

__attribute__((naked)) __attribute__((section (".start_section")) )
void startup ( void )
{
__asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
__asm__ volatile(" MOV SP,R0\n");
__asm__ volatile(" BL main\n");					/* call main */
__asm__ volatile(".L1: B .L1\n");				/* never return */
}
//#define SIMULATOR

#define BOID_COUNT 100
#define VIEW_DISTANCE 15

#define ALIGNMENT_BIAS 0.33
#define COHESION_BIAS 0.1
#define SEPARATION_BIAS 0.05
#define MAX_SPEED 14
#define MIN_SPEED 1
#define BALL_FORCE 50
#define BALL_SPEED 5


typedef struct tBall {
	int x, y;
	int radius;
} BALL, *pBALL;

static BALL ball = {63, 31, 2};

void drawBall() {
	for (int y = -ball.radius; y < ball.radius; y++) {
		for (int x = -ball.radius; x < ball.radius; x++) {
			if (x*x+y*y < ball.radius*ball.radius) {
				pixel(ball.x+x, ball.y+y, 1);
			}
		}
	}
}

void updateBall() {
	switch (keyb()) {
		case 2:
			ball.y -= BALL_SPEED;
			break;
		case 4:
			ball.x -= BALL_SPEED;
			break;
		case 5:
			ball.y += BALL_SPEED;
			break;
		case 6:
			ball.x += BALL_SPEED;
			break;
	}
	ball.x = (ball.x + 128) % 128;
	ball.y = (ball.y + 64) % 64;
}

typedef struct tBoid {
	float x, y;
	float xVel, yVel;
    
    void (* draw) (struct tBoid *);
    void (* updatePos) (struct tBoid *);
    void (* updateVel) (struct tBoid *);
} BOID, *pBOID;

float squaredDistance(pBOID one, pBOID two) {
    float xD = two->x - one->x;
    float yD = two->y - one->y;
    return xD * xD + yD + yD;
}


static BOID boids[BOID_COUNT];

void draw(pBOID self) {
    pixel((uint8_t) self->x, (uint8_t) self->y, 1);
    //old_pixel((uint8_t) self->x, (uint8_t) self->y, 1);
}

void updatePos(pBOID self) {
    self->x += self->xVel;
    self->y += self->yVel;
	while (self->x < 0) {
		self->x += 128;
	}
	while (self->x > 127) {
		self->x -= 128;
	}
	while (self->y < 0) {
		self->y += 64;
	}
	while (self->y > 63) {
		self->y -= 64;
	}
}

float root(float n){
  float lo = 0, hi = n, mid;
  for(int i = 0 ; i < 3 ; i++){
      mid = (lo+hi)/2;
      if(mid*mid == n) return mid;
      if(mid*mid > n) hi = mid;
      else lo = mid;
  }
  return mid;
}


void updateVel(pBOID self) {
    int nearbyCount = 0;
    float sumXPos = 0, sumYPos = 0;
    float sumXVel = 0, sumYVel = 0;
    float dXSeparation = 0, dYSeparation = 0;
    
    for (int i = 0; i < BOID_COUNT; i++) {
        pBOID other = &boids[i];
		float dx = other->x - self->x;
		float dy = other->y - self->y;
		if (abs(dx) > 63) {
			dx = 128 - dx;
		}
		if (abs(dy) > 31) {
			dy = 64 - dy;
		}
        float dSquared = dx * dx + dy * dy;
        if (dSquared > VIEW_DISTANCE * VIEW_DISTANCE) {
            continue;
        }
		if (dSquared == 0) {
			continue;
		}
        if (self == other) {
            continue;
        }
        nearbyCount++;
        
        // Cohesion
        sumXPos += self->x+dx;
        sumYPos += self->y+dy;
        
        // Alignment
        sumXVel += other->xVel;
        sumXVel += other->yVel;
        
        // Separation
		float d = root(dSquared);
        dXSeparation += (-dx) / d;
        dYSeparation += (-dy) / d;
    }
	
	float dx = ball.x - self->x;
	float dy = ball.y - self->y;
	if (abs(dx) > 63) {
		dx = 128 - dx;
	}
	if (abs(dy) > 31) {
		dy = 64 - dy;
	}
	float dSquared = dx * dx + dy * dy;
	if (dSquared <= VIEW_DISTANCE * VIEW_DISTANCE) {
		float d = root(dSquared);
		dXSeparation += ((-dx) / d)*BALL_FORCE;
		dYSeparation += ((-dy) / d)*BALL_FORCE;
		nearbyCount++;
	}
	
	
	
	if (nearbyCount == 0) {
		return;
	}
    
    // Cohesion
    float avgXPos = sumXPos / nearbyCount;
    float avgYPos = sumYPos / nearbyCount;
    
    float dXCohesion = avgXPos - self->x;
    float dYCohesion = avgYPos - self->y;
    
    // Alignment
    float avgXVel = sumXVel / nearbyCount;
    float avgYVel = sumYVel / nearbyCount;
    
    float dXAlignment = avgXVel - self->xVel;
    float dYAlignment = avgYVel - self->yVel;
    
    // Calculate new acceleration for the Boid
    self->xVel += dXSeparation * SEPARATION_BIAS + dXCohesion * COHESION_BIAS + dXAlignment * ALIGNMENT_BIAS;
    self->yVel += dYSeparation * SEPARATION_BIAS + dYCohesion * COHESION_BIAS + dYAlignment * ALIGNMENT_BIAS;
	
	while (self->xVel * self->xVel + self->yVel * self->yVel > MAX_SPEED * MAX_SPEED) {
		self->xVel *= 0.9;
		self->yVel *= 0.9;
	}
	while (self->xVel * self->xVel + self->yVel * self->yVel < MIN_SPEED * MIN_SPEED) {
		self->xVel *= 1.1;
		self->yVel *= 1.1;
	}
}

void createBoids() {
    for (int i = 0; i < BOID_COUNT; i++) {
        //boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
        boids[i] = (BOID) { 
            .x = (i * 105 + 10.0), 
            .y = (i * 10 + 10.0), 
            .xVel = (i%2)-0.5,
            .yVel = (i%3)-0.75,
            draw,
            updatePos,
            updateVel
        };
    }
}


void main(void) {
	init();
    
	clear_buffer();
#ifndef SIMULATOR
	draw_buffer();
#endif
	createBoids();
	
    while (1) {
		clear_buffer();
		if (keyb() == 0x0D) {
			createBoids();
		}
		updateBall();
        for (int i = 0; i < BOID_COUNT; i++) {
			boids[i].updateVel(&boids[i]);
        }
		drawBall();
        for (int i = 0; i < BOID_COUNT; i++) {
            boids[i].updatePos(&boids[i]);
            boids[i].draw(&boids[i]);
        }
        
        draw_buffer();
		delay_milli(2);
    }
}
