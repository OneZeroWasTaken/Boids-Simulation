typedef unsigned char uint8_t;
static uint8_t buffer[8][128];
void pixel(uint8_t x, uint8_t y, uint8_t set);
void clear_buffer();
void draw_buffer();
void init();
unsigned char keyb(void);
void out7seg(unsigned char c);