#include "drivers.h"

//#define USBDM
#define SIMULATOR

#define PORT_BASE   ((volatile unsigned int *) 0x40021000)

#define portModer   ((volatile unsigned int *) 0x40021000)
#define portOtyper  ((volatile unsigned int *) 0x40021004)
#define portOspeedr ((volatile unsigned int *) 0x40021008)
#define portPupdr   ((volatile unsigned int *) 0x4002100C)

#define portIdrLow  ((volatile unsigned char *) 0x40021010)
#define portIdrHigh ((volatile unsigned char *) 0x40021011)
#define portOdrLow  ((volatile unsigned char *) 0x40021014)
#define portOdrHigh ((volatile unsigned char *) 0x40021015)

#define B_E         0x40
#define B_SELECT    4
#define B_RW        2
#define B_RS        1

#define B_RST       0x20
#define B_CS2       0x10
#define B_CS1       0x08

#define LCD_ON          0b00111111
#define LCD_OFF         0b00111110
#define LCD_SET_ADD     0b01000000
#define LCD_SET_PAGE    0b10111000
#define LCD_DISP_START  0b11000000
#define LCD_BUSY        0b10000000


#define STK_CTRL    ((volatile unsigned int *) 0xE000E010)
#define STK_LOAD    ((volatile unsigned int *) 0xE000E014)
#define STK_VAL     ((volatile unsigned int *) 0xE000E018)



#define GPIO_D_MODER    (volatile unsigned int *) (0x40020C00)
#define GPIO_D_OTYPER   (volatile unsigned int *) (0x40020C04)
#define GPIO_D_OSPEEDR  (volatile unsigned int *) (0x40020C08)
#define GPIO_D_PUPDR    (volatile unsigned int *) (0x40020C0C)
#define GPIO_D_IDR      (volatile unsigned int *) (0x40020C10)
#define GPIO_D_ODR      (volatile unsigned int *) (0x40020C14)

#define KB_OUT  (volatile unsigned char *) (0x40020C15)
#define KB_IN   (volatile unsigned char *) (0x40020C11)

#define SEG_OUT (unsigned char *) GPIO_D_ODR

static void delay_250ns(void) {
    *STK_CTRL = 0;
    *STK_LOAD = (168/4)-1;
    *STK_VAL = 0;
    *STK_CTRL = 5;
    while((*STK_CTRL & 0x10000) == 0);
    *STK_CTRL = 0;
}

static void delay_500ns(void) {
    delay_250ns();
    delay_250ns();
}

void delay_mikro(unsigned int us) {
    #ifdef SIMULATOR
        if (us > 500) {
            us = 1;
        }
    #endif
    while (us > 0) {
        delay_250ns();
        delay_250ns();
        delay_250ns();
        delay_250ns();
        us--;
    }
}

void delay_milli(unsigned int ms) {
    #ifdef SIMULATOR
        ms = 1;
    #endif
    while (ms > 0) {
        delay_mikro(1000);
        ms--;
    }
}


typedef unsigned char uint8_t;

static void graphic_ctrl_bit_set(uint8_t x) {
    uint8_t c;
    c = *portOdrLow;
    c &= ~B_SELECT;
    c |= (~B_SELECT & x);
    *portOdrLow = c;
}

static void graphic_ctrl_bit_clear(uint8_t x) {
    uint8_t c;
    c = *portOdrLow;
    c &= ~B_SELECT;
    c &= ~x;
    *portOdrLow = c;
}

static void select_controller(uint8_t controller) {
    uint8_t mask = (B_CS1 | B_CS2);
    controller &= mask;
    
    uint8_t c;
    c = *portOdrLow;
    c &= ~mask;     //Set CS1 and CS2 to 0
    c |= controller;//OR in CS1 and CS2 from controller
    *portOdrLow = c;
}

static void graphic_wait_ready(void) {
    graphic_ctrl_bit_clear(B_E);
    *portModer = 0x00005555;
    graphic_ctrl_bit_clear(B_RS);
    graphic_ctrl_bit_set(B_RW);
    delay_500ns();
    
    while(1) {
        graphic_ctrl_bit_set(B_E);
        delay_500ns();
        graphic_ctrl_bit_clear(B_E);
        delay_500ns();
        uint8_t busy = *portIdrHigh;
        busy &= LCD_BUSY;
        if (~busy) {
            break;
        }
    }
    graphic_ctrl_bit_set(B_E);
    *portModer = 0x55555555;
}

static uint8_t graphic_read(uint8_t controller) {
    graphic_ctrl_bit_clear(B_E);
    *portModer = 0x00005555;
    graphic_ctrl_bit_set(B_RS);
    graphic_ctrl_bit_set(B_RW);
    select_controller(controller);
    delay_500ns();
    graphic_ctrl_bit_set(B_E);
    delay_500ns();
    uint8_t rv = *portIdrHigh;
    graphic_ctrl_bit_clear(B_E);
    *portModer = 0x55555555;
    if (controller == B_CS1 || controller == B_CS2) {
        select_controller(controller);
        graphic_wait_ready();
    }
    return rv;
}

static void graphic_write(uint8_t value, uint8_t controller) {
    *portOdrHigh = value;
    select_controller(controller);
    delay_500ns();
    graphic_ctrl_bit_set(B_E);
    delay_500ns();
    graphic_ctrl_bit_clear(B_E);
    
    if (controller == B_CS1 || controller == B_CS2) {
        select_controller(controller);
        graphic_wait_ready();
    }
    
    *portOdrHigh = 0;
    graphic_ctrl_bit_set(B_E);
    select_controller(0);
}

static void graphic_write_command(uint8_t command, uint8_t controller) {
    graphic_ctrl_bit_clear(B_E);
    select_controller(controller);
    graphic_ctrl_bit_clear(B_RS);
    graphic_ctrl_bit_clear(B_RW);
    graphic_write(command, controller);
}

static void graphic_write_data(uint8_t data, uint8_t controller) {
    graphic_ctrl_bit_clear(B_E);
    select_controller(controller);
    graphic_ctrl_bit_set(B_RS);
    graphic_ctrl_bit_clear(B_RW);
    graphic_write(data, controller);
}

static uint8_t graphic_read_data(uint8_t controller) {
    graphic_read(controller);
    return graphic_read(controller);
}

static void graphic_initialize() {
    graphic_ctrl_bit_set(B_E);
    delay_mikro(10);
    graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
    delay_milli(30);
    graphic_ctrl_bit_set(B_RST);
    
    graphic_write_command(LCD_OFF,          B_CS1 | B_CS2);
    graphic_write_command(LCD_ON,           B_CS1 | B_CS2);
    graphic_write_command(LCD_DISP_START,   B_CS1 | B_CS2);
    graphic_write_command(LCD_SET_ADD,      B_CS1 | B_CS2);
    graphic_write_command(LCD_SET_PAGE,     B_CS1 | B_CS2);
    
    select_controller(0);
}

static void graphic_clear_screen() {
    for (uint8_t page = 0; page < 8; page++) {
        graphic_write_command(LCD_SET_PAGE | page,  B_CS1 | B_CS2);
        graphic_write_command(LCD_SET_ADD | 0,      B_CS1 | B_CS2);
        for (uint8_t add = 0; add < 64; add++) {
            graphic_write_data(0, B_CS1 | B_CS2);
        }
    }
}



static uint8_t buffer[8][128];


void pixel(uint8_t x, uint8_t y, uint8_t set) {
	if (x>127 || y>63) return;
	
    uint8_t mask = 1 << (y % 8);
	
	if (set) {
		buffer[y/8][x] |= mask;
	} else {
		buffer[y/8][x] &= ~mask;
	}
}

void clear_buffer() {
	for (uint8_t y = 0; y<8; y++) {
		for (uint8_t x = 0; x<128; x++) {
			buffer[y][x] = 0;
		}
	}
}

void draw_buffer() {
	for (uint8_t y = 0; y<8; y++) {
		for (uint8_t x = 0; x<64; x++) {
			graphic_write_command(LCD_SET_ADD | x, B_CS1);
			graphic_write_command(LCD_SET_PAGE | y, B_CS1);
			graphic_write_data(buffer[y][x], B_CS1);
			
			graphic_write_command(LCD_ON,           B_CS1 | B_CS2);
			graphic_write_command(LCD_DISP_START,   B_CS1 | B_CS2);
		}
	}
	for (uint8_t y = 0; y<8; y++) {
		for (uint8_t x = 64; x<128; x++) {
			graphic_write_command(LCD_SET_ADD | x-64, B_CS2);
			graphic_write_command(LCD_SET_PAGE | y, B_CS2);
			graphic_write_data(buffer[y][x], B_CS2);
			
			graphic_write_command(LCD_ON,           B_CS1 | B_CS2);
			graphic_write_command(LCD_DISP_START,   B_CS1 | B_CS2);
		}
	}
}


void init() {
	#ifdef USBDM
	*((unsigned long *) 0x40023830) = 0x18;
	__asm volatile( " LDR R0,=0x08000209\n BLX R0 \n");
	#endif
    *portModer = 0x55555555; // Set E0-15 to output
	
	*((unsigned long *) 0x40023830) = 0x18;
    // GPIO_D 8-15 ska bli keypad
    // Set MODER
    *GPIO_D_MODER &= 0x0000FFFF;
    *GPIO_D_MODER |= 0x55000000;
    // Set OTYPER
    *GPIO_D_OTYPER &= 0xFFFF00FF;
    *GPIO_D_OTYPER |= 0x00000F00;
    
    // Set PUPDR
    *GPIO_D_PUPDR &= 0x0000FFFF;
    *GPIO_D_PUPDR |= 0xFFAA0000;
    
    // GPIO_D 0-7 ska bli 7seg
    // Set MODER
    *GPIO_D_MODER &= 0xFFFF0000;
    *GPIO_D_MODER |= 0x00005555;
	
	
    graphic_initialize();
}


unsigned char keyb(void) {
    unsigned char keys[] = {1, 2, 3,10,
                            4, 5, 6,11,
                            7, 8, 9,12,
                            14,0,15,13};
    char index = 0xFF;
    char base = 0x10;
    for (char row = 0; row<5; row++) {
        char outVal = base << row;
        *KB_OUT = outVal;
        char inVal = *KB_IN & 0x0F;
        if (inVal != 0) {
            char col;
            if (inVal & 0x01) col = 0;
            if (inVal & 0x02) col = 1;
            if (inVal & 0x04) col = 2;
            if (inVal & 0x08) col = 3;
            
            index = row*4+col-4;
        }
    }
    *KB_OUT = 0;
    if (index == 0xFF) {
        return 0xFF;
    } else {
        return keys[index];
    }
}


void out7seg(unsigned char c) {
    char out = 0;
    if (c<16) {
        char segCodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
        out = segCodes[c];
    }
    *SEG_OUT = out;
}
