#include "drivers.h"

__attribute__((naked)) __attribute__((section (".start_section")) )
void startup ( void )
{
__asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
__asm__ volatile(" MOV SP,R0\n");
__asm__ volatile(" BL main\n");					/* call main */
__asm__ volatile(".L1: B .L1\n");				/* never return */
}
#define SIMULATOR

#define BOID_COUNT 2
#define VIEW_DISTANCE 8

#define ALIGNMENT_BIAS 0.0253
#define COHESION_BIAS 0.0253
#define SEPARATION_BIAS 0.253

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
    //pixel((uint8_t) self->x, (uint8_t) self->y, 1);
    old_pixel((uint8_t) self->x, (uint8_t) self->y, 1);
}

void updatePos(pBOID self) {
    self->x += self->xVel;
    self->y += self->yVel;
}

void updateVel(pBOID self) {
    int nearbyCount = 0;
    float sumXPos = 0, sumYPos = 0;
    float sumXVel = 0, sumYVel = 0;
    float dXSeparation = 0, dYSeparation = 0;
    
    for (int i = 0; i < BOID_COUNT; i++) {
        pBOID other = &boids[i];
        float dSquared = squaredDistance(self, other);
        if (dSquared > VIEW_DISTANCE * VIEW_DISTANCE) {
            continue;
        }
        if (self == other) {
            continue;
        }
        nearbyCount++;
        
        // Cohesion
        sumXPos += other->x;
        sumYPos += other->y;
        
        // Alignment
        sumXVel += other->x;
        sumXVel += other->y;
        
        // Separation
        dXSeparation += (self->x - other->x) / dSquared;
        dYSeparation += (self->y - other->y) / dSquared;
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
}

void createBoids() {
    for (int i = 0; i < BOID_COUNT; i++) {
        boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
        /*boids[i] = (BOID) { 
            .x = i * 5.0 + 1.0, 
            .y = 31.0, 
            .xVel = 0.0, 
            .yVel = 0.0,
            draw,
            updatePos,
            updateVel
        };*/
    }
}


void main(void) {
	init();
    
    old_pixel(5, 5, 1);
	clear_buffer();
#ifndef SIMULATOR
	draw_buffer();
#endif

    createBoids();
    
	
    while (1) {
        for (int i = 0; i < BOID_COUNT; i++) {
            //boids[i].updateVel(&boids[i]);
        }
        for (int i = 0; i < BOID_COUNT; i++) {
            boids[i].updatePos(&boids[i]);
            boids[i].draw(&boids[i]);
        }
        
        //draw_buffer();
		delay_milli(20);
    }
}