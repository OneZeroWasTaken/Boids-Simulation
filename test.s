   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.bss
  16              		.align	2
  17              	buffer:
  18 0000 00000000 		.space	1024
  18      00000000 
  18      00000000 
  18      00000000 
  18      00000000 
  20              		.section	.start_section,"ax",%progbits
  21              		.align	1
  22              		.global	startup
  23              		.syntax unified
  24              		.code	16
  25              		.thumb_func
  26              		.fpu softvfp
  28              	startup:
  29              	.LFB0:
  30              		.file 1 "C:/Users/oskargi/Documents/mop/Boids/startup.c"
   1:C:/Users/oskargi/Documents/mop/Boids\startup.c **** #include "drivers.h"
   2:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
   3:C:/Users/oskargi/Documents/mop/Boids\startup.c **** __attribute__((naked)) __attribute__((section (".start_section")) )
   4:C:/Users/oskargi/Documents/mop/Boids\startup.c **** void startup ( void )
   5:C:/Users/oskargi/Documents/mop/Boids\startup.c **** {
  31              		.loc 1 5 0
  32              		.cfi_startproc
  33              		@ Naked Function: prologue and epilogue provided by programmer.
  34              		@ args = 0, pretend = 0, frame = 0
  35              		@ frame_needed = 1, uses_anonymous_args = 0
   6:C:/Users/oskargi/Documents/mop/Boids\startup.c **** __asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
  36              		.loc 1 6 0
  37              		.syntax divided
  38              	@ 6 "C:/Users/oskargi/Documents/mop/Boids/startup.c" 1
  39 0000 0248     		 LDR R0,=0x2001C000
  40              	
  41              	@ 0 "" 2
   7:C:/Users/oskargi/Documents/mop/Boids\startup.c **** __asm__ volatile(" MOV SP,R0\n");
  42              		.loc 1 7 0
  43              	@ 7 "C:/Users/oskargi/Documents/mop/Boids/startup.c" 1
  44 0002 8546     		 MOV SP,R0
  45              	
  46              	@ 0 "" 2
   8:C:/Users/oskargi/Documents/mop/Boids\startup.c **** __asm__ volatile(" BL main\n");					/* call main */
  47              		.loc 1 8 0
  48              	@ 8 "C:/Users/oskargi/Documents/mop/Boids/startup.c" 1
  49 0004 FFF7FEFF 		 BL main
  50              	
  51              	@ 0 "" 2
   9:C:/Users/oskargi/Documents/mop/Boids\startup.c **** __asm__ volatile(".L1: B .L1\n");				/* never return */
  52              		.loc 1 9 0
  53              	@ 9 "C:/Users/oskargi/Documents/mop/Boids/startup.c" 1
  54 0008 FEE7     		.L1: B .L1
  55              	
  56              	@ 0 "" 2
  10:C:/Users/oskargi/Documents/mop/Boids\startup.c **** }
  57              		.loc 1 10 0
  58              		.thumb
  59              		.syntax unified
  60 000a C046     		nop
  61              		.cfi_endproc
  62              	.LFE0:
  64              		.text
  65              		.align	1
  66              		.global	set_object_speed
  67              		.syntax unified
  68              		.code	16
  69              		.thumb_func
  70              		.fpu softvfp
  72              	set_object_speed:
  73              	.LFB1:
  11:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  12:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  13:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  14:C:/Users/oskargi/Documents/mop/Boids\startup.c **** typedef struct tPoint {
  15:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     uint8_t x;
  16:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     uint8_t y;
  17:C:/Users/oskargi/Documents/mop/Boids\startup.c **** } POINT;
  18:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  19:C:/Users/oskargi/Documents/mop/Boids\startup.c **** #define MAX_POINTS 20
  20:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  21:C:/Users/oskargi/Documents/mop/Boids\startup.c **** typedef struct tGeometry {
  22:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int numpoints;
  23:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int sizex;
  24:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int sizey;
  25:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     POINT px[MAX_POINTS];
  26:C:/Users/oskargi/Documents/mop/Boids\startup.c **** } GEOMETRY, *PGEOMETRY;
  27:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  28:C:/Users/oskargi/Documents/mop/Boids\startup.c **** typedef struct tObj {
  29:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     PGEOMETRY geo;
  30:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int dirx, diry;
  31:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int posx, posy;
  32:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     void (* draw) (struct tObj *);
  33:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     void (* clear) (struct tObj *);
  34:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     void (* move) (struct tObj *);
  35:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     void (* set_speed) (struct tObj *, int, int);
  36:C:/Users/oskargi/Documents/mop/Boids\startup.c **** } OBJECT, *POBJECT;
  37:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  38:C:/Users/oskargi/Documents/mop/Boids\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy) {
  74              		.loc 1 38 0
  75              		.cfi_startproc
  76              		@ args = 0, pretend = 0, frame = 16
  77              		@ frame_needed = 1, uses_anonymous_args = 0
  78 0000 80B5     		push	{r7, lr}
  79              		.cfi_def_cfa_offset 8
  80              		.cfi_offset 7, -8
  81              		.cfi_offset 14, -4
  82 0002 84B0     		sub	sp, sp, #16
  83              		.cfi_def_cfa_offset 24
  84 0004 00AF     		add	r7, sp, #0
  85              		.cfi_def_cfa_register 7
  86 0006 F860     		str	r0, [r7, #12]
  87 0008 B960     		str	r1, [r7, #8]
  88 000a 7A60     		str	r2, [r7, #4]
  39:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     o->dirx = speedx;
  89              		.loc 1 39 0
  90 000c FB68     		ldr	r3, [r7, #12]
  91 000e BA68     		ldr	r2, [r7, #8]
  92 0010 5A60     		str	r2, [r3, #4]
  40:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     o->diry = speedy;
  93              		.loc 1 40 0
  94 0012 FB68     		ldr	r3, [r7, #12]
  95 0014 7A68     		ldr	r2, [r7, #4]
  96 0016 9A60     		str	r2, [r3, #8]
  41:C:/Users/oskargi/Documents/mop/Boids\startup.c **** }
  97              		.loc 1 41 0
  98 0018 C046     		nop
  99 001a BD46     		mov	sp, r7
 100 001c 04B0     		add	sp, sp, #16
 101              		@ sp needed
 102 001e 80BD     		pop	{r7, pc}
 103              		.cfi_endproc
 104              	.LFE1:
 106              		.align	1
 107              		.global	draw_object
 108              		.syntax unified
 109              		.code	16
 110              		.thumb_func
 111              		.fpu softvfp
 113              	draw_object:
 114              	.LFB2:
  42:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  43:C:/Users/oskargi/Documents/mop/Boids\startup.c **** void draw_object(POBJECT o) {
 115              		.loc 1 43 0
 116              		.cfi_startproc
 117              		@ args = 0, pretend = 0, frame = 8
 118              		@ frame_needed = 1, uses_anonymous_args = 0
 119 0020 80B5     		push	{r7, lr}
 120              		.cfi_def_cfa_offset 8
 121              		.cfi_offset 7, -8
 122              		.cfi_offset 14, -4
 123 0022 82B0     		sub	sp, sp, #8
 124              		.cfi_def_cfa_offset 16
 125 0024 00AF     		add	r7, sp, #0
 126              		.cfi_def_cfa_register 7
 127 0026 7860     		str	r0, [r7, #4]
  44:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	/*
  45:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int numpoints = o->geo->numpoints;
  46:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     for (int i = 0; i < numpoints; i++) {
  47:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         POINT p = o->geo->px[i];
  48:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(o->posx + p.x, o->posy + p.y, 1);
  49:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
  50:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	*/
  51:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	 paint(o, 1);
 128              		.loc 1 51 0
 129 0028 7B68     		ldr	r3, [r7, #4]
 130 002a 0121     		movs	r1, #1
 131 002c 1800     		movs	r0, r3
 132 002e FFF7FEFF 		bl	paint
  52:C:/Users/oskargi/Documents/mop/Boids\startup.c **** }
 133              		.loc 1 52 0
 134 0032 C046     		nop
 135 0034 BD46     		mov	sp, r7
 136 0036 02B0     		add	sp, sp, #8
 137              		@ sp needed
 138 0038 80BD     		pop	{r7, pc}
 139              		.cfi_endproc
 140              	.LFE2:
 142              		.align	1
 143              		.global	clear_object
 144              		.syntax unified
 145              		.code	16
 146              		.thumb_func
 147              		.fpu softvfp
 149              	clear_object:
 150              	.LFB3:
  53:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  54:C:/Users/oskargi/Documents/mop/Boids\startup.c **** void clear_object(POBJECT o) {
 151              		.loc 1 54 0
 152              		.cfi_startproc
 153              		@ args = 0, pretend = 0, frame = 8
 154              		@ frame_needed = 1, uses_anonymous_args = 0
 155 003a 80B5     		push	{r7, lr}
 156              		.cfi_def_cfa_offset 8
 157              		.cfi_offset 7, -8
 158              		.cfi_offset 14, -4
 159 003c 82B0     		sub	sp, sp, #8
 160              		.cfi_def_cfa_offset 16
 161 003e 00AF     		add	r7, sp, #0
 162              		.cfi_def_cfa_register 7
 163 0040 7860     		str	r0, [r7, #4]
  55:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	/*
  56:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int numpoints = o->geo->numpoints;
  57:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     for (int i = 0; i < numpoints; i++) {
  58:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         POINT p = o->geo->px[i];
  59:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(o->posx + p.x, o->posy + p.y, 0);
  60:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
  61:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	 * */
  62:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	 paint(o, 0);
 164              		.loc 1 62 0
 165 0042 7B68     		ldr	r3, [r7, #4]
 166 0044 0021     		movs	r1, #0
 167 0046 1800     		movs	r0, r3
 168 0048 FFF7FEFF 		bl	paint
  63:C:/Users/oskargi/Documents/mop/Boids\startup.c **** }
 169              		.loc 1 63 0
 170 004c C046     		nop
 171 004e BD46     		mov	sp, r7
 172 0050 02B0     		add	sp, sp, #8
 173              		@ sp needed
 174 0052 80BD     		pop	{r7, pc}
 175              		.cfi_endproc
 176              	.LFE3:
 178              		.align	1
 179              		.global	paint
 180              		.syntax unified
 181              		.code	16
 182              		.thumb_func
 183              		.fpu softvfp
 185              	paint:
 186              	.LFB4:
  64:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  65:C:/Users/oskargi/Documents/mop/Boids\startup.c **** void paint(POBJECT o, int color) {
 187              		.loc 1 65 0
 188              		.cfi_startproc
 189              		@ args = 0, pretend = 0, frame = 40
 190              		@ frame_needed = 1, uses_anonymous_args = 0
 191 0054 80B5     		push	{r7, lr}
 192              		.cfi_def_cfa_offset 8
 193              		.cfi_offset 7, -8
 194              		.cfi_offset 14, -4
 195 0056 8AB0     		sub	sp, sp, #40
 196              		.cfi_def_cfa_offset 48
 197 0058 00AF     		add	r7, sp, #0
 198              		.cfi_def_cfa_register 7
 199 005a 7860     		str	r0, [r7, #4]
 200 005c 3960     		str	r1, [r7]
  66:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int width = o->geo->sizex;
 201              		.loc 1 66 0
 202 005e 7B68     		ldr	r3, [r7, #4]
 203 0060 1B68     		ldr	r3, [r3]
 204 0062 5B68     		ldr	r3, [r3, #4]
 205 0064 FB61     		str	r3, [r7, #28]
  67:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int height = o->geo->sizey;
 206              		.loc 1 67 0
 207 0066 7B68     		ldr	r3, [r7, #4]
 208 0068 1B68     		ldr	r3, [r3]
 209 006a 9B68     		ldr	r3, [r3, #8]
 210 006c BB61     		str	r3, [r7, #24]
  68:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	int r = width/2;
 211              		.loc 1 68 0
 212 006e FB69     		ldr	r3, [r7, #28]
 213 0070 002B     		cmp	r3, #0
 214 0072 00DA     		bge	.L6
 215 0074 0133     		adds	r3, r3, #1
 216              	.L6:
 217 0076 5B10     		asrs	r3, r3, #1
 218 0078 7B61     		str	r3, [r7, #20]
 219              	.LBB2:
  69:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	for (int y=0; y<height; y++) {
 220              		.loc 1 69 0
 221 007a 0023     		movs	r3, #0
 222 007c 7B62     		str	r3, [r7, #36]
 223 007e 3FE0     		b	.L7
 224              	.L13:
 225              	.LBB3:
  70:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		for (int x=0; x<width; x++) {
 226              		.loc 1 70 0
 227 0080 0023     		movs	r3, #0
 228 0082 3B62     		str	r3, [r7, #32]
 229 0084 35E0     		b	.L8
 230              	.L12:
 231              	.LBB4:
  71:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			int xr = x-width/2;
 232              		.loc 1 71 0
 233 0086 FB69     		ldr	r3, [r7, #28]
 234 0088 002B     		cmp	r3, #0
 235 008a 00DA     		bge	.L9
 236 008c 0133     		adds	r3, r3, #1
 237              	.L9:
 238 008e 5B10     		asrs	r3, r3, #1
 239 0090 5B42     		rsbs	r3, r3, #0
 240 0092 1A00     		movs	r2, r3
 241 0094 3B6A     		ldr	r3, [r7, #32]
 242 0096 9B18     		adds	r3, r3, r2
 243 0098 3B61     		str	r3, [r7, #16]
  72:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			int yr = y-height/2;
 244              		.loc 1 72 0
 245 009a BB69     		ldr	r3, [r7, #24]
 246 009c 002B     		cmp	r3, #0
 247 009e 00DA     		bge	.L10
 248 00a0 0133     		adds	r3, r3, #1
 249              	.L10:
 250 00a2 5B10     		asrs	r3, r3, #1
 251 00a4 5B42     		rsbs	r3, r3, #0
 252 00a6 1A00     		movs	r2, r3
 253 00a8 7B6A     		ldr	r3, [r7, #36]
 254 00aa 9B18     		adds	r3, r3, r2
 255 00ac FB60     		str	r3, [r7, #12]
  73:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			if (xr*xr+yr*yr < r*r)
 256              		.loc 1 73 0
 257 00ae 3B69     		ldr	r3, [r7, #16]
 258 00b0 3A69     		ldr	r2, [r7, #16]
 259 00b2 5A43     		muls	r2, r3
 260 00b4 FB68     		ldr	r3, [r7, #12]
 261 00b6 F968     		ldr	r1, [r7, #12]
 262 00b8 4B43     		muls	r3, r1
 263 00ba D218     		adds	r2, r2, r3
 264 00bc 7B69     		ldr	r3, [r7, #20]
 265 00be 7969     		ldr	r1, [r7, #20]
 266 00c0 4B43     		muls	r3, r1
 267 00c2 9A42     		cmp	r2, r3
 268 00c4 12DA     		bge	.L11
  74:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 				pixel(o->posx + x, o->posy + y, color);
 269              		.loc 1 74 0
 270 00c6 7B68     		ldr	r3, [r7, #4]
 271 00c8 DB68     		ldr	r3, [r3, #12]
 272 00ca DAB2     		uxtb	r2, r3
 273 00cc 3B6A     		ldr	r3, [r7, #32]
 274 00ce DBB2     		uxtb	r3, r3
 275 00d0 D318     		adds	r3, r2, r3
 276 00d2 D8B2     		uxtb	r0, r3
 277 00d4 7B68     		ldr	r3, [r7, #4]
 278 00d6 1B69     		ldr	r3, [r3, #16]
 279 00d8 DAB2     		uxtb	r2, r3
 280 00da 7B6A     		ldr	r3, [r7, #36]
 281 00dc DBB2     		uxtb	r3, r3
 282 00de D318     		adds	r3, r2, r3
 283 00e0 DBB2     		uxtb	r3, r3
 284 00e2 3A68     		ldr	r2, [r7]
 285 00e4 D2B2     		uxtb	r2, r2
 286 00e6 1900     		movs	r1, r3
 287 00e8 FFF7FEFF 		bl	pixel
 288              	.L11:
 289              	.LBE4:
  70:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			int xr = x-width/2;
 290              		.loc 1 70 0 discriminator 2
 291 00ec 3B6A     		ldr	r3, [r7, #32]
 292 00ee 0133     		adds	r3, r3, #1
 293 00f0 3B62     		str	r3, [r7, #32]
 294              	.L8:
  70:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			int xr = x-width/2;
 295              		.loc 1 70 0 is_stmt 0 discriminator 1
 296 00f2 3A6A     		ldr	r2, [r7, #32]
 297 00f4 FB69     		ldr	r3, [r7, #28]
 298 00f6 9A42     		cmp	r2, r3
 299 00f8 C5DB     		blt	.L12
 300              	.LBE3:
  69:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		for (int x=0; x<width; x++) {
 301              		.loc 1 69 0 is_stmt 1 discriminator 2
 302 00fa 7B6A     		ldr	r3, [r7, #36]
 303 00fc 0133     		adds	r3, r3, #1
 304 00fe 7B62     		str	r3, [r7, #36]
 305              	.L7:
  69:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		for (int x=0; x<width; x++) {
 306              		.loc 1 69 0 is_stmt 0 discriminator 1
 307 0100 7A6A     		ldr	r2, [r7, #36]
 308 0102 BB69     		ldr	r3, [r7, #24]
 309 0104 9A42     		cmp	r2, r3
 310 0106 BBDB     		blt	.L13
 311              	.LBE2:
  75:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		}
  76:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	}
  77:C:/Users/oskargi/Documents/mop/Boids\startup.c **** }
 312              		.loc 1 77 0 is_stmt 1
 313 0108 C046     		nop
 314 010a BD46     		mov	sp, r7
 315 010c 0AB0     		add	sp, sp, #40
 316              		@ sp needed
 317 010e 80BD     		pop	{r7, pc}
 318              		.cfi_endproc
 319              	.LFE4:
 321              		.align	1
 322              		.global	move_object
 323              		.syntax unified
 324              		.code	16
 325              		.thumb_func
 326              		.fpu softvfp
 328              	move_object:
 329              	.LFB5:
  78:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
  79:C:/Users/oskargi/Documents/mop/Boids\startup.c **** void move_object(POBJECT o) {
 330              		.loc 1 79 0
 331              		.cfi_startproc
 332              		@ args = 0, pretend = 0, frame = 24
 333              		@ frame_needed = 1, uses_anonymous_args = 0
 334 0110 80B5     		push	{r7, lr}
 335              		.cfi_def_cfa_offset 8
 336              		.cfi_offset 7, -8
 337              		.cfi_offset 14, -4
 338 0112 86B0     		sub	sp, sp, #24
 339              		.cfi_def_cfa_offset 32
 340 0114 00AF     		add	r7, sp, #0
 341              		.cfi_def_cfa_register 7
 342 0116 7860     		str	r0, [r7, #4]
  80:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     clear_object(o);
 343              		.loc 1 80 0
 344 0118 7B68     		ldr	r3, [r7, #4]
 345 011a 1800     		movs	r0, r3
 346 011c FFF7FEFF 		bl	clear_object
  81:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int newx = o->posx + o->dirx;
 347              		.loc 1 81 0
 348 0120 7B68     		ldr	r3, [r7, #4]
 349 0122 DA68     		ldr	r2, [r3, #12]
 350 0124 7B68     		ldr	r3, [r7, #4]
 351 0126 5B68     		ldr	r3, [r3, #4]
 352 0128 D318     		adds	r3, r2, r3
 353 012a 7B61     		str	r3, [r7, #20]
  82:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int newy = o->posy + o->diry;
 354              		.loc 1 82 0
 355 012c 7B68     		ldr	r3, [r7, #4]
 356 012e 1A69     		ldr	r2, [r3, #16]
 357 0130 7B68     		ldr	r3, [r7, #4]
 358 0132 9B68     		ldr	r3, [r3, #8]
 359 0134 D318     		adds	r3, r2, r3
 360 0136 3B61     		str	r3, [r7, #16]
  83:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int width = o->geo->sizex;
 361              		.loc 1 83 0
 362 0138 7B68     		ldr	r3, [r7, #4]
 363 013a 1B68     		ldr	r3, [r3]
 364 013c 5B68     		ldr	r3, [r3, #4]
 365 013e FB60     		str	r3, [r7, #12]
  84:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     int height = o->geo->sizey;
 366              		.loc 1 84 0
 367 0140 7B68     		ldr	r3, [r7, #4]
 368 0142 1B68     		ldr	r3, [r3]
 369 0144 9B68     		ldr	r3, [r3, #8]
 370 0146 BB60     		str	r3, [r7, #8]
  85:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     o->posx = newx;
 371              		.loc 1 85 0
 372 0148 7B68     		ldr	r3, [r7, #4]
 373 014a 7A69     		ldr	r2, [r7, #20]
 374 014c DA60     		str	r2, [r3, #12]
  86:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     o->posy = newy;
 375              		.loc 1 86 0
 376 014e 7B68     		ldr	r3, [r7, #4]
 377 0150 3A69     		ldr	r2, [r7, #16]
 378 0152 1A61     		str	r2, [r3, #16]
  87:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     if (newx < 1) {
 379              		.loc 1 87 0
 380 0154 7B69     		ldr	r3, [r7, #20]
 381 0156 002B     		cmp	r3, #0
 382 0158 04DC     		bgt	.L15
  88:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         o->dirx *= -1;
 383              		.loc 1 88 0
 384 015a 7B68     		ldr	r3, [r7, #4]
 385 015c 5B68     		ldr	r3, [r3, #4]
 386 015e 5A42     		rsbs	r2, r3, #0
 387 0160 7B68     		ldr	r3, [r7, #4]
 388 0162 5A60     		str	r2, [r3, #4]
 389              	.L15:
  89:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
  90:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     if (newx + width > 128) {
 390              		.loc 1 90 0
 391 0164 7A69     		ldr	r2, [r7, #20]
 392 0166 FB68     		ldr	r3, [r7, #12]
 393 0168 D318     		adds	r3, r2, r3
 394 016a 802B     		cmp	r3, #128
 395 016c 04DD     		ble	.L16
  91:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         o->dirx *= -1;
 396              		.loc 1 91 0
 397 016e 7B68     		ldr	r3, [r7, #4]
 398 0170 5B68     		ldr	r3, [r3, #4]
 399 0172 5A42     		rsbs	r2, r3, #0
 400 0174 7B68     		ldr	r3, [r7, #4]
 401 0176 5A60     		str	r2, [r3, #4]
 402              	.L16:
  92:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
  93:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     if (newy < 1) {
 403              		.loc 1 93 0
 404 0178 3B69     		ldr	r3, [r7, #16]
 405 017a 002B     		cmp	r3, #0
 406 017c 04DC     		bgt	.L17
  94:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         o->diry *= -1;
 407              		.loc 1 94 0
 408 017e 7B68     		ldr	r3, [r7, #4]
 409 0180 9B68     		ldr	r3, [r3, #8]
 410 0182 5A42     		rsbs	r2, r3, #0
 411 0184 7B68     		ldr	r3, [r7, #4]
 412 0186 9A60     		str	r2, [r3, #8]
 413              	.L17:
  95:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
  96:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     if (newy + height > 64) {
 414              		.loc 1 96 0
 415 0188 3A69     		ldr	r2, [r7, #16]
 416 018a BB68     		ldr	r3, [r7, #8]
 417 018c D318     		adds	r3, r2, r3
 418 018e 402B     		cmp	r3, #64
 419 0190 04DD     		ble	.L18
  97:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         o->diry *= -1;
 420              		.loc 1 97 0
 421 0192 7B68     		ldr	r3, [r7, #4]
 422 0194 9B68     		ldr	r3, [r3, #8]
 423 0196 5A42     		rsbs	r2, r3, #0
 424 0198 7B68     		ldr	r3, [r7, #4]
 425 019a 9A60     		str	r2, [r3, #8]
 426              	.L18:
  98:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
  99:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     draw_object(o);
 427              		.loc 1 99 0
 428 019c 7B68     		ldr	r3, [r7, #4]
 429 019e 1800     		movs	r0, r3
 430 01a0 FFF7FEFF 		bl	draw_object
 100:C:/Users/oskargi/Documents/mop/Boids\startup.c **** }
 431              		.loc 1 100 0
 432 01a4 C046     		nop
 433 01a6 BD46     		mov	sp, r7
 434 01a8 06B0     		add	sp, sp, #24
 435              		@ sp needed
 436 01aa 80BD     		pop	{r7, pc}
 437              		.cfi_endproc
 438              	.LFE5:
 440              		.global	ball_geometry
 441              		.data
 442              		.align	2
 445              	ball_geometry:
 446 0000 0C000000 		.word	12
 447 0004 1E000000 		.word	30
 448 0008 1E000000 		.word	30
 449 000c 00       		.byte	0
 450 000d 01       		.byte	1
 451 000e 00       		.byte	0
 452 000f 02       		.byte	2
 453 0010 01       		.byte	1
 454 0011 00       		.byte	0
 455 0012 01       		.byte	1
 456 0013 01       		.byte	1
 457 0014 01       		.byte	1
 458 0015 02       		.byte	2
 459 0016 01       		.byte	1
 460 0017 03       		.byte	3
 461 0018 02       		.byte	2
 462 0019 00       		.byte	0
 463 001a 02       		.byte	2
 464 001b 01       		.byte	1
 465 001c 02       		.byte	2
 466 001d 02       		.byte	2
 467 001e 02       		.byte	2
 468 001f 03       		.byte	3
 469 0020 03       		.byte	3
 470 0021 01       		.byte	1
 471 0022 03       		.byte	3
 472 0023 02       		.byte	2
 473 0024 00000000 		.space	16
 473      00000000 
 473      00000000 
 473      00000000 
 474              		.align	2
 477              	ball:
 478 0034 00000000 		.word	ball_geometry
 479 0038 01000000 		.word	1
 480 003c 01000000 		.word	1
 481 0040 32000000 		.word	50
 482 0044 1E000000 		.word	30
 483 0048 00000000 		.word	draw_object
 484 004c 00000000 		.word	clear_object
 485 0050 00000000 		.word	move_object
 486 0054 00000000 		.word	set_object_speed
 487              		.text
 488              		.align	1
 489              		.global	main
 490              		.syntax unified
 491              		.code	16
 492              		.thumb_func
 493              		.fpu softvfp
 495              	main:
 496              	.LFB6:
 101:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
 102:C:/Users/oskargi/Documents/mop/Boids\startup.c **** GEOMETRY ball_geometry = {
 103:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     12,
 104:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     30,30,
 105:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     {
 106:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         {0,1}, {0,2}, {1,0}, {1,1}, {1,2},
 107:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         {1,3}, {2,0}, {2,1}, {2,2}, {2,3},
 108:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         {3,1}, {3,2}
 109:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
 110:C:/Users/oskargi/Documents/mop/Boids\startup.c **** };
 111:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
 112:C:/Users/oskargi/Documents/mop/Boids\startup.c **** static OBJECT ball = {
 113:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     &ball_geometry,
 114:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     1,1,
 115:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     50,30,
 116:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     draw_object,
 117:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     clear_object,
 118:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     move_object,
 119:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     set_object_speed
 120:C:/Users/oskargi/Documents/mop/Boids\startup.c **** };
 121:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
 122:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
 123:C:/Users/oskargi/Documents/mop/Boids\startup.c **** void main(void) {
 497              		.loc 1 123 0
 498              		.cfi_startproc
 499              		@ args = 0, pretend = 0, frame = 24
 500              		@ frame_needed = 1, uses_anonymous_args = 0
 501 01ac 80B5     		push	{r7, lr}
 502              		.cfi_def_cfa_offset 8
 503              		.cfi_offset 7, -8
 504              		.cfi_offset 14, -4
 505 01ae 86B0     		sub	sp, sp, #24
 506              		.cfi_def_cfa_offset 32
 507 01b0 00AF     		add	r7, sp, #0
 508              		.cfi_def_cfa_register 7
 124:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     POBJECT p = &ball;
 509              		.loc 1 124 0
 510 01b2 434B     		ldr	r3, .L31
 511 01b4 FB60     		str	r3, [r7, #12]
 125:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	init();
 512              		.loc 1 125 0
 513 01b6 FFF7FEFF 		bl	init
 126:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	/*
 127:C:/Users/oskargi/Documents/mop/Boids\startup.c **** #ifndef SIMULATOR
 128:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     graphic_clear_screen();
 129:C:/Users/oskargi/Documents/mop/Boids\startup.c **** #endif
 130:C:/Users/oskargi/Documents/mop/Boids\startup.c ****  */
 131:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	
 132:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	clear_buffer();
 514              		.loc 1 132 0
 515 01ba FFF7FEFF 		bl	clear_buffer
 133:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	pixel(0, 1, 1);
 516              		.loc 1 133 0
 517 01be 0122     		movs	r2, #1
 518 01c0 0121     		movs	r1, #1
 519 01c2 0020     		movs	r0, #0
 520 01c4 FFF7FEFF 		bl	pixel
 134:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	uint8_t data = buffer[0][0];
 521              		.loc 1 134 0
 522 01c8 0B23     		movs	r3, #11
 523 01ca FB18     		adds	r3, r7, r3
 524 01cc 3D4A     		ldr	r2, .L31+4
 525 01ce 1278     		ldrb	r2, [r2]
 526 01d0 1A70     		strb	r2, [r3]
 135:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	draw_buffer();
 527              		.loc 1 135 0
 528 01d2 FFF7FEFF 		bl	draw_buffer
 529              	.LBB5:
 136:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 
 137:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     for (int i = 0; i < 128; i++) {
 530              		.loc 1 137 0
 531 01d6 0023     		movs	r3, #0
 532 01d8 7B61     		str	r3, [r7, #20]
 533 01da 10E0     		b	.L20
 534              	.L21:
 138:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(i, 0, 1);
 535              		.loc 1 138 0 discriminator 3
 536 01dc 7B69     		ldr	r3, [r7, #20]
 537 01de DBB2     		uxtb	r3, r3
 538 01e0 0122     		movs	r2, #1
 539 01e2 0021     		movs	r1, #0
 540 01e4 1800     		movs	r0, r3
 541 01e6 FFF7FEFF 		bl	pixel
 139:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(i, 63, 1);
 542              		.loc 1 139 0 discriminator 3
 543 01ea 7B69     		ldr	r3, [r7, #20]
 544 01ec DBB2     		uxtb	r3, r3
 545 01ee 0122     		movs	r2, #1
 546 01f0 3F21     		movs	r1, #63
 547 01f2 1800     		movs	r0, r3
 548 01f4 FFF7FEFF 		bl	pixel
 137:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(i, 0, 1);
 549              		.loc 1 137 0 discriminator 3
 550 01f8 7B69     		ldr	r3, [r7, #20]
 551 01fa 0133     		adds	r3, r3, #1
 552 01fc 7B61     		str	r3, [r7, #20]
 553              	.L20:
 137:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(i, 0, 1);
 554              		.loc 1 137 0 is_stmt 0 discriminator 1
 555 01fe 7B69     		ldr	r3, [r7, #20]
 556 0200 7F2B     		cmp	r3, #127
 557 0202 EBDD     		ble	.L21
 558              	.LBE5:
 559              	.LBB6:
 140:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
 141:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     for (int i = 0; i < 64; i++) {
 560              		.loc 1 141 0 is_stmt 1
 561 0204 0023     		movs	r3, #0
 562 0206 3B61     		str	r3, [r7, #16]
 563 0208 10E0     		b	.L22
 564              	.L23:
 142:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(0, i, 1);
 565              		.loc 1 142 0 discriminator 3
 566 020a 3B69     		ldr	r3, [r7, #16]
 567 020c DBB2     		uxtb	r3, r3
 568 020e 0122     		movs	r2, #1
 569 0210 1900     		movs	r1, r3
 570 0212 0020     		movs	r0, #0
 571 0214 FFF7FEFF 		bl	pixel
 143:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(127, i, 1);
 572              		.loc 1 143 0 discriminator 3
 573 0218 3B69     		ldr	r3, [r7, #16]
 574 021a DBB2     		uxtb	r3, r3
 575 021c 0122     		movs	r2, #1
 576 021e 1900     		movs	r1, r3
 577 0220 7F20     		movs	r0, #127
 578 0222 FFF7FEFF 		bl	pixel
 141:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(0, i, 1);
 579              		.loc 1 141 0 discriminator 3
 580 0226 3B69     		ldr	r3, [r7, #16]
 581 0228 0133     		adds	r3, r3, #1
 582 022a 3B61     		str	r3, [r7, #16]
 583              	.L22:
 141:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         pixel(0, i, 1);
 584              		.loc 1 141 0 is_stmt 0 discriminator 1
 585 022c 3B69     		ldr	r3, [r7, #16]
 586 022e 3F2B     		cmp	r3, #63
 587 0230 EBDD     		ble	.L23
 588              	.LBE6:
 144:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     }
 145:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	
 146:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	int speed = 4;
 589              		.loc 1 146 0 is_stmt 1
 590 0232 0423     		movs	r3, #4
 591 0234 7B60     		str	r3, [r7, #4]
 147:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     p->set_speed(p, speed, 0);
 592              		.loc 1 147 0
 593 0236 FB68     		ldr	r3, [r7, #12]
 594 0238 1B6A     		ldr	r3, [r3, #32]
 595 023a 7968     		ldr	r1, [r7, #4]
 596 023c F868     		ldr	r0, [r7, #12]
 597 023e 0022     		movs	r2, #0
 598 0240 9847     		blx	r3
 599              	.LVL0:
 600              	.L30:
 601              	.LBB7:
 148:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	char c;
 149:C:/Users/oskargi/Documents/mop/Boids\startup.c ****     while(1) {
 150:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         p->move(p);
 602              		.loc 1 150 0
 603 0242 FB68     		ldr	r3, [r7, #12]
 604 0244 DB69     		ldr	r3, [r3, #28]
 605 0246 FA68     		ldr	r2, [r7, #12]
 606 0248 1000     		movs	r0, r2
 607 024a 9847     		blx	r3
 608              	.LVL1:
 151:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		c = keyb();
 609              		.loc 1 151 0
 610 024c FFF7FEFF 		bl	keyb
 611 0250 0200     		movs	r2, r0
 612 0252 FB1C     		adds	r3, r7, #3
 613 0254 1A70     		strb	r2, [r3]
 152:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		out7seg(c);
 614              		.loc 1 152 0
 615 0256 FB1C     		adds	r3, r7, #3
 616 0258 1B78     		ldrb	r3, [r3]
 617 025a 1800     		movs	r0, r3
 618 025c FFF7FEFF 		bl	out7seg
 153:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		switch (c) {
 619              		.loc 1 153 0
 620 0260 FB1C     		adds	r3, r7, #3
 621 0262 1B78     		ldrb	r3, [r3]
 622 0264 042B     		cmp	r3, #4
 623 0266 16D0     		beq	.L25
 624 0268 02DC     		bgt	.L26
 625 026a 022B     		cmp	r3, #2
 626 026c 0BD0     		beq	.L27
 627 026e 21E0     		b	.L24
 628              	.L26:
 629 0270 052B     		cmp	r3, #5
 630 0272 18D0     		beq	.L28
 631 0274 062B     		cmp	r3, #6
 632 0276 1DD1     		bne	.L24
 154:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			case 6: p->set_speed(p, speed, 0); break;
 633              		.loc 1 154 0
 634 0278 FB68     		ldr	r3, [r7, #12]
 635 027a 1B6A     		ldr	r3, [r3, #32]
 636 027c 7968     		ldr	r1, [r7, #4]
 637 027e F868     		ldr	r0, [r7, #12]
 638 0280 0022     		movs	r2, #0
 639 0282 9847     		blx	r3
 640              	.LVL2:
 641 0284 16E0     		b	.L24
 642              	.L27:
 155:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			case 2: p->set_speed(p, 0, -speed); break;
 643              		.loc 1 155 0
 644 0286 FB68     		ldr	r3, [r7, #12]
 645 0288 1B6A     		ldr	r3, [r3, #32]
 646 028a 7A68     		ldr	r2, [r7, #4]
 647 028c 5242     		rsbs	r2, r2, #0
 648 028e F868     		ldr	r0, [r7, #12]
 649 0290 0021     		movs	r1, #0
 650 0292 9847     		blx	r3
 651              	.LVL3:
 652 0294 0EE0     		b	.L24
 653              	.L25:
 156:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			case 4: p->set_speed(p, -speed, 0); break;
 654              		.loc 1 156 0
 655 0296 FB68     		ldr	r3, [r7, #12]
 656 0298 1B6A     		ldr	r3, [r3, #32]
 657 029a 7A68     		ldr	r2, [r7, #4]
 658 029c 5142     		rsbs	r1, r2, #0
 659 029e F868     		ldr	r0, [r7, #12]
 660 02a0 0022     		movs	r2, #0
 661 02a2 9847     		blx	r3
 662              	.LVL4:
 663 02a4 06E0     		b	.L24
 664              	.L28:
 157:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 			case 5: p->set_speed(p, 0, speed); break;
 665              		.loc 1 157 0
 666 02a6 FB68     		ldr	r3, [r7, #12]
 667 02a8 1B6A     		ldr	r3, [r3, #32]
 668 02aa 7A68     		ldr	r2, [r7, #4]
 669 02ac F868     		ldr	r0, [r7, #12]
 670 02ae 0021     		movs	r1, #0
 671 02b0 9847     		blx	r3
 672              	.LVL5:
 673 02b2 C046     		nop
 674              	.L24:
 158:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		}
 159:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 	draw_buffer();
 675              		.loc 1 159 0
 676 02b4 FFF7FEFF 		bl	draw_buffer
 160:C:/Users/oskargi/Documents/mop/Boids\startup.c **** 		delay_milli(20);
 677              		.loc 1 160 0
 678 02b8 1420     		movs	r0, #20
 679 02ba FFF7FEFF 		bl	delay_milli
 680              	.LBE7:
 149:C:/Users/oskargi/Documents/mop/Boids\startup.c ****         p->move(p);
 681              		.loc 1 149 0
 682 02be C0E7     		b	.L30
 683              	.L32:
 684              		.align	2
 685              	.L31:
 686 02c0 34000000 		.word	ball
 687 02c4 00000000 		.word	buffer
 688              		.cfi_endproc
 689              	.LFE6:
 691              	.Letext0:
 692              		.file 2 "C:/Users/oskargi/Documents/mop/Boids/drivers.h"
