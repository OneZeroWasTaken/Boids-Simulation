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
  30              		.file 1 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/startup.c"
   1:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #include "drivers.h"
   2:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
   3:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** __attribute__((naked)) __attribute__((section (".start_section")) )
   4:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void startup ( void )
   5:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** {
  31              		.loc 1 5 1
  32              		.cfi_startproc
  33              		@ Naked Function: prologue and epilogue provided by programmer.
  34              		@ args = 0, pretend = 0, frame = 0
  35              		@ frame_needed = 1, uses_anonymous_args = 0
   6:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** __asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
  36              		.loc 1 6 1
  37              		.syntax divided
  38              	@ 6 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/startup.c" 1
  39 0000 0248     		 LDR R0,=0x2001C000
  40              	
  41              	@ 0 "" 2
   7:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** __asm__ volatile(" MOV SP,R0\n");
  42              		.loc 1 7 1
  43              	@ 7 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/startup.c" 1
  44 0002 8546     		 MOV SP,R0
  45              	
  46              	@ 0 "" 2
   8:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** __asm__ volatile(" BL main\n");					/* call main */
  47              		.loc 1 8 1
  48              	@ 8 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/startup.c" 1
  49 0004 FFF7FEFF 		 BL main
  50              	
  51              	@ 0 "" 2
   9:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** __asm__ volatile(".L1: B .L1\n");				/* never return */
  52              		.loc 1 9 1
  53              	@ 9 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/startup.c" 1
  54 0008 FEE7     		.L1: B .L1
  55              	
  56              	@ 0 "" 2
  10:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
  57              		.loc 1 10 1
  58              		.thumb
  59              		.syntax unified
  60 000a C046     		nop
  61              		.cfi_endproc
  62              	.LFE0:
  64              		.global	__aeabi_fsub
  65              		.global	__aeabi_fmul
  66              		.global	__aeabi_fadd
  67              		.text
  68              		.align	1
  69              		.global	squaredDistance
  70              		.syntax unified
  71              		.code	16
  72              		.thumb_func
  73              		.fpu softvfp
  75              	squaredDistance:
  76              	.LFB1:
  11:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define SIMULATOR
  12:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  13:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define BOID_COUNT 2
  14:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define VIEW_DISTANCE 8
  15:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  16:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define ALIGNMENT_BIAS 0.0253
  17:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define COHESION_BIAS 0.0253
  18:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define SEPARATION_BIAS 0.253
  19:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  20:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** typedef struct tBoid {
  21:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	float x, y;
  22:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	float xVel, yVel;
  23:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  24:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     void (* draw) (struct tBoid *);
  25:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     void (* updatePos) (struct tBoid *);
  26:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     void (* updateVel) (struct tBoid *);
  27:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** } BOID, *pBOID;
  28:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  29:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** float squaredDistance(pBOID one, pBOID two) {
  77              		.loc 1 29 45
  78              		.cfi_startproc
  79              		@ args = 0, pretend = 0, frame = 16
  80              		@ frame_needed = 1, uses_anonymous_args = 0
  81 0000 80B5     		push	{r7, lr}
  82              		.cfi_def_cfa_offset 8
  83              		.cfi_offset 7, -8
  84              		.cfi_offset 14, -4
  85 0002 84B0     		sub	sp, sp, #16
  86              		.cfi_def_cfa_offset 24
  87 0004 00AF     		add	r7, sp, #0
  88              		.cfi_def_cfa_register 7
  89 0006 7860     		str	r0, [r7, #4]
  90 0008 3960     		str	r1, [r7]
  30:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float xD = two->x - one->x;
  91              		.loc 1 30 19
  92 000a 3B68     		ldr	r3, [r7]
  93 000c 1A68     		ldr	r2, [r3]
  94              		.loc 1 30 28
  95 000e 7B68     		ldr	r3, [r7, #4]
  96 0010 1B68     		ldr	r3, [r3]
  97              		.loc 1 30 11
  98 0012 191C     		adds	r1, r3, #0
  99 0014 101C     		adds	r0, r2, #0
 100 0016 FFF7FEFF 		bl	__aeabi_fsub
 101              	.LVL0:
 102 001a 031C     		adds	r3, r0, #0
 103 001c FB60     		str	r3, [r7, #12]
  31:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float yD = two->y - one->y;
 104              		.loc 1 31 19
 105 001e 3B68     		ldr	r3, [r7]
 106 0020 5A68     		ldr	r2, [r3, #4]
 107              		.loc 1 31 28
 108 0022 7B68     		ldr	r3, [r7, #4]
 109 0024 5B68     		ldr	r3, [r3, #4]
 110              		.loc 1 31 11
 111 0026 191C     		adds	r1, r3, #0
 112 0028 101C     		adds	r0, r2, #0
 113 002a FFF7FEFF 		bl	__aeabi_fsub
 114              	.LVL1:
 115 002e 031C     		adds	r3, r0, #0
 116 0030 BB60     		str	r3, [r7, #8]
  32:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     return xD * xD + yD + yD;
 117              		.loc 1 32 15
 118 0032 F968     		ldr	r1, [r7, #12]
 119 0034 F868     		ldr	r0, [r7, #12]
 120 0036 FFF7FEFF 		bl	__aeabi_fmul
 121              	.LVL2:
 122 003a 031C     		adds	r3, r0, #0
 123              		.loc 1 32 20
 124 003c B968     		ldr	r1, [r7, #8]
 125 003e 181C     		adds	r0, r3, #0
 126 0040 FFF7FEFF 		bl	__aeabi_fadd
 127              	.LVL3:
 128 0044 031C     		adds	r3, r0, #0
 129              		.loc 1 32 25
 130 0046 B968     		ldr	r1, [r7, #8]
 131 0048 181C     		adds	r0, r3, #0
 132 004a FFF7FEFF 		bl	__aeabi_fadd
 133              	.LVL4:
 134 004e 031C     		adds	r3, r0, #0
  33:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 135              		.loc 1 33 1
 136 0050 181C     		adds	r0, r3, #0
 137 0052 BD46     		mov	sp, r7
 138 0054 04B0     		add	sp, sp, #16
 139              		@ sp needed
 140 0056 80BD     		pop	{r7, pc}
 141              		.cfi_endproc
 142              	.LFE1:
 144              		.bss
 145              		.align	2
 146              	boids:
 147 0400 00000000 		.space	56
 147      00000000 
 147      00000000 
 147      00000000 
 147      00000000 
 149              		.global	__aeabi_f2uiz
 150              		.text
 151              		.align	1
 152              		.global	draw
 153              		.syntax unified
 154              		.code	16
 155              		.thumb_func
 156              		.fpu softvfp
 158              	draw:
 159              	.LFB2:
  34:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  35:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  36:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** static BOID boids[BOID_COUNT];
  37:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  38:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void draw(pBOID self) {
 160              		.loc 1 38 23
 161              		.cfi_startproc
 162              		@ args = 0, pretend = 0, frame = 8
 163              		@ frame_needed = 1, uses_anonymous_args = 0
 164 0058 90B5     		push	{r4, r7, lr}
 165              		.cfi_def_cfa_offset 12
 166              		.cfi_offset 4, -12
 167              		.cfi_offset 7, -8
 168              		.cfi_offset 14, -4
 169 005a 83B0     		sub	sp, sp, #12
 170              		.cfi_def_cfa_offset 24
 171 005c 00AF     		add	r7, sp, #0
 172              		.cfi_def_cfa_register 7
 173 005e 7860     		str	r0, [r7, #4]
  39:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     //pixel((uint8_t) self->x, (uint8_t) self->y, 1);
  40:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     old_pixel((uint8_t) self->x, (uint8_t) self->y, 1);
 174              		.loc 1 40 29
 175 0060 7B68     		ldr	r3, [r7, #4]
 176 0062 1B68     		ldr	r3, [r3]
 177              		.loc 1 40 15
 178 0064 181C     		adds	r0, r3, #0
 179 0066 FFF7FEFF 		bl	__aeabi_f2uiz
 180              	.LVL5:
 181 006a 0300     		movs	r3, r0
 182 006c DBB2     		uxtb	r3, r3
 183              		.loc 1 40 5
 184 006e 1C00     		movs	r4, r3
 185              		.loc 1 40 48
 186 0070 7B68     		ldr	r3, [r7, #4]
 187 0072 5B68     		ldr	r3, [r3, #4]
 188              		.loc 1 40 34
 189 0074 181C     		adds	r0, r3, #0
 190 0076 FFF7FEFF 		bl	__aeabi_f2uiz
 191              	.LVL6:
 192 007a 0300     		movs	r3, r0
 193 007c DBB2     		uxtb	r3, r3
 194              		.loc 1 40 5
 195 007e 0122     		movs	r2, #1
 196 0080 1900     		movs	r1, r3
 197 0082 2000     		movs	r0, r4
 198 0084 FFF7FEFF 		bl	old_pixel
  41:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 199              		.loc 1 41 1
 200 0088 C046     		nop
 201 008a BD46     		mov	sp, r7
 202 008c 03B0     		add	sp, sp, #12
 203              		@ sp needed
 204 008e 90BD     		pop	{r4, r7, pc}
 205              		.cfi_endproc
 206              	.LFE2:
 208              		.align	1
 209              		.global	updatePos
 210              		.syntax unified
 211              		.code	16
 212              		.thumb_func
 213              		.fpu softvfp
 215              	updatePos:
 216              	.LFB3:
  42:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  43:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void updatePos(pBOID self) {
 217              		.loc 1 43 28
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 8
 220              		@ frame_needed = 1, uses_anonymous_args = 0
 221 0090 80B5     		push	{r7, lr}
 222              		.cfi_def_cfa_offset 8
 223              		.cfi_offset 7, -8
 224              		.cfi_offset 14, -4
 225 0092 82B0     		sub	sp, sp, #8
 226              		.cfi_def_cfa_offset 16
 227 0094 00AF     		add	r7, sp, #0
 228              		.cfi_def_cfa_register 7
 229 0096 7860     		str	r0, [r7, #4]
  44:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     self->x += self->xVel;
 230              		.loc 1 44 13
 231 0098 7B68     		ldr	r3, [r7, #4]
 232 009a 1A68     		ldr	r2, [r3]
 233              		.loc 1 44 20
 234 009c 7B68     		ldr	r3, [r7, #4]
 235 009e 9B68     		ldr	r3, [r3, #8]
 236              		.loc 1 44 13
 237 00a0 191C     		adds	r1, r3, #0
 238 00a2 101C     		adds	r0, r2, #0
 239 00a4 FFF7FEFF 		bl	__aeabi_fadd
 240              	.LVL7:
 241 00a8 031C     		adds	r3, r0, #0
 242 00aa 1A1C     		adds	r2, r3, #0
 243 00ac 7B68     		ldr	r3, [r7, #4]
 244 00ae 1A60     		str	r2, [r3]
  45:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     self->y += self->yVel;
 245              		.loc 1 45 13
 246 00b0 7B68     		ldr	r3, [r7, #4]
 247 00b2 5A68     		ldr	r2, [r3, #4]
 248              		.loc 1 45 20
 249 00b4 7B68     		ldr	r3, [r7, #4]
 250 00b6 DB68     		ldr	r3, [r3, #12]
 251              		.loc 1 45 13
 252 00b8 191C     		adds	r1, r3, #0
 253 00ba 101C     		adds	r0, r2, #0
 254 00bc FFF7FEFF 		bl	__aeabi_fadd
 255              	.LVL8:
 256 00c0 031C     		adds	r3, r0, #0
 257 00c2 1A1C     		adds	r2, r3, #0
 258 00c4 7B68     		ldr	r3, [r7, #4]
 259 00c6 5A60     		str	r2, [r3, #4]
  46:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 260              		.loc 1 46 1
 261 00c8 C046     		nop
 262 00ca BD46     		mov	sp, r7
 263 00cc 02B0     		add	sp, sp, #8
 264              		@ sp needed
 265 00ce 80BD     		pop	{r7, pc}
 266              		.cfi_endproc
 267              	.LFE3:
 269              		.global	__aeabi_fcmpgt
 270              		.global	__aeabi_fdiv
 271              		.global	__aeabi_i2f
 272              		.global	__aeabi_f2d
 273              		.global	__aeabi_dmul
 274              		.global	__aeabi_dadd
 275              		.global	__aeabi_d2f
 276              		.align	1
 277              		.global	updateVel
 278              		.syntax unified
 279              		.code	16
 280              		.thumb_func
 281              		.fpu softvfp
 283              	updateVel:
 284              	.LFB4:
  47:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  48:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void updateVel(pBOID self) {
 285              		.loc 1 48 28
 286              		.cfi_startproc
 287              		@ args = 0, pretend = 0, frame = 88
 288              		@ frame_needed = 1, uses_anonymous_args = 0
 289 00d0 B0B5     		push	{r4, r5, r7, lr}
 290              		.cfi_def_cfa_offset 16
 291              		.cfi_offset 4, -16
 292              		.cfi_offset 5, -12
 293              		.cfi_offset 7, -8
 294              		.cfi_offset 14, -4
 295 00d2 96B0     		sub	sp, sp, #88
 296              		.cfi_def_cfa_offset 104
 297 00d4 00AF     		add	r7, sp, #0
 298              		.cfi_def_cfa_register 7
 299 00d6 F860     		str	r0, [r7, #12]
  49:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     int nearbyCount = 0;
 300              		.loc 1 49 9
 301 00d8 0023     		movs	r3, #0
 302 00da 7B65     		str	r3, [r7, #84]
  50:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float sumXPos = 0, sumYPos = 0;
 303              		.loc 1 50 11
 304 00dc 0023     		movs	r3, #0
 305 00de 3B65     		str	r3, [r7, #80]
 306              		.loc 1 50 24
 307 00e0 0023     		movs	r3, #0
 308 00e2 FB64     		str	r3, [r7, #76]
  51:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float sumXVel = 0, sumYVel = 0;
 309              		.loc 1 51 11
 310 00e4 0023     		movs	r3, #0
 311 00e6 BB64     		str	r3, [r7, #72]
 312              		.loc 1 51 24
 313 00e8 0023     		movs	r3, #0
 314 00ea BB63     		str	r3, [r7, #56]
  52:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dXSeparation = 0, dYSeparation = 0;
 315              		.loc 1 52 11
 316 00ec 0023     		movs	r3, #0
 317 00ee 7B64     		str	r3, [r7, #68]
 318              		.loc 1 52 29
 319 00f0 0023     		movs	r3, #0
 320 00f2 3B64     		str	r3, [r7, #64]
 321              	.LBB2:
  53:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  54:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 322              		.loc 1 54 14
 323 00f4 0023     		movs	r3, #0
 324 00f6 FB63     		str	r3, [r7, #60]
 325              		.loc 1 54 5
 326 00f8 6CE0     		b	.L7
 327              	.L12:
 328              	.LBB3:
  55:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 329              		.loc 1 55 15
 330 00fa FA6B     		ldr	r2, [r7, #60]
 331 00fc 1300     		movs	r3, r2
 332 00fe DB00     		lsls	r3, r3, #3
 333 0100 9B1A     		subs	r3, r3, r2
 334 0102 9B00     		lsls	r3, r3, #2
 335 0104 9A4A     		ldr	r2, .L15
 336 0106 9B18     		adds	r3, r3, r2
 337 0108 7B61     		str	r3, [r7, #20]
  56:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         float dSquared = squaredDistance(self, other);
 338              		.loc 1 56 26
 339 010a 7A69     		ldr	r2, [r7, #20]
 340 010c FB68     		ldr	r3, [r7, #12]
 341 010e 1100     		movs	r1, r2
 342 0110 1800     		movs	r0, r3
 343 0112 FFF7FEFF 		bl	squaredDistance
 344 0116 031C     		adds	r3, r0, #0
 345 0118 3B61     		str	r3, [r7, #16]
  57:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         if (dSquared > VIEW_DISTANCE * VIEW_DISTANCE) {
 346              		.loc 1 57 12
 347 011a 8521     		movs	r1, #133
 348 011c C905     		lsls	r1, r1, #23
 349 011e 3869     		ldr	r0, [r7, #16]
 350 0120 FFF7FEFF 		bl	__aeabi_fcmpgt
 351              	.LVL9:
 352 0124 031E     		subs	r3, r0, #0
 353 0126 4FD1     		bne	.L13
  58:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             continue;
  59:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
  60:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         if (self == other) {
 354              		.loc 1 60 12
 355 0128 FA68     		ldr	r2, [r7, #12]
 356 012a 7B69     		ldr	r3, [r7, #20]
 357 012c 9A42     		cmp	r2, r3
 358 012e 4DD0     		beq	.L14
  61:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             continue;
  62:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
  63:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         nearbyCount++;
 359              		.loc 1 63 20
 360 0130 7B6D     		ldr	r3, [r7, #84]
 361 0132 0133     		adds	r3, r3, #1
 362 0134 7B65     		str	r3, [r7, #84]
  64:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         
  65:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         // Cohesion
  66:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         sumXPos += other->x;
 363              		.loc 1 66 25
 364 0136 7B69     		ldr	r3, [r7, #20]
 365 0138 1B68     		ldr	r3, [r3]
 366              		.loc 1 66 17
 367 013a 191C     		adds	r1, r3, #0
 368 013c 386D     		ldr	r0, [r7, #80]
 369 013e FFF7FEFF 		bl	__aeabi_fadd
 370              	.LVL10:
 371 0142 031C     		adds	r3, r0, #0
 372 0144 3B65     		str	r3, [r7, #80]
  67:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         sumYPos += other->y;
 373              		.loc 1 67 25
 374 0146 7B69     		ldr	r3, [r7, #20]
 375 0148 5B68     		ldr	r3, [r3, #4]
 376              		.loc 1 67 17
 377 014a 191C     		adds	r1, r3, #0
 378 014c F86C     		ldr	r0, [r7, #76]
 379 014e FFF7FEFF 		bl	__aeabi_fadd
 380              	.LVL11:
 381 0152 031C     		adds	r3, r0, #0
 382 0154 FB64     		str	r3, [r7, #76]
  68:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         
  69:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         // Alignment
  70:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         sumXVel += other->x;
 383              		.loc 1 70 25
 384 0156 7B69     		ldr	r3, [r7, #20]
 385 0158 1B68     		ldr	r3, [r3]
 386              		.loc 1 70 17
 387 015a 191C     		adds	r1, r3, #0
 388 015c B86C     		ldr	r0, [r7, #72]
 389 015e FFF7FEFF 		bl	__aeabi_fadd
 390              	.LVL12:
 391 0162 031C     		adds	r3, r0, #0
 392 0164 BB64     		str	r3, [r7, #72]
  71:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         sumXVel += other->y;
 393              		.loc 1 71 25
 394 0166 7B69     		ldr	r3, [r7, #20]
 395 0168 5B68     		ldr	r3, [r3, #4]
 396              		.loc 1 71 17
 397 016a 191C     		adds	r1, r3, #0
 398 016c B86C     		ldr	r0, [r7, #72]
 399 016e FFF7FEFF 		bl	__aeabi_fadd
 400              	.LVL13:
 401 0172 031C     		adds	r3, r0, #0
 402 0174 BB64     		str	r3, [r7, #72]
  72:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         
  73:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         // Separation
  74:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         dXSeparation += (self->x - other->x) / dSquared;
 403              		.loc 1 74 30
 404 0176 FB68     		ldr	r3, [r7, #12]
 405 0178 1A68     		ldr	r2, [r3]
 406              		.loc 1 74 41
 407 017a 7B69     		ldr	r3, [r7, #20]
 408 017c 1B68     		ldr	r3, [r3]
 409              		.loc 1 74 34
 410 017e 191C     		adds	r1, r3, #0
 411 0180 101C     		adds	r0, r2, #0
 412 0182 FFF7FEFF 		bl	__aeabi_fsub
 413              	.LVL14:
 414 0186 031C     		adds	r3, r0, #0
 415              		.loc 1 74 46
 416 0188 3969     		ldr	r1, [r7, #16]
 417 018a 181C     		adds	r0, r3, #0
 418 018c FFF7FEFF 		bl	__aeabi_fdiv
 419              	.LVL15:
 420 0190 031C     		adds	r3, r0, #0
 421              		.loc 1 74 22
 422 0192 191C     		adds	r1, r3, #0
 423 0194 786C     		ldr	r0, [r7, #68]
 424 0196 FFF7FEFF 		bl	__aeabi_fadd
 425              	.LVL16:
 426 019a 031C     		adds	r3, r0, #0
 427 019c 7B64     		str	r3, [r7, #68]
  75:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         dYSeparation += (self->y - other->y) / dSquared;
 428              		.loc 1 75 30
 429 019e FB68     		ldr	r3, [r7, #12]
 430 01a0 5A68     		ldr	r2, [r3, #4]
 431              		.loc 1 75 41
 432 01a2 7B69     		ldr	r3, [r7, #20]
 433 01a4 5B68     		ldr	r3, [r3, #4]
 434              		.loc 1 75 34
 435 01a6 191C     		adds	r1, r3, #0
 436 01a8 101C     		adds	r0, r2, #0
 437 01aa FFF7FEFF 		bl	__aeabi_fsub
 438              	.LVL17:
 439 01ae 031C     		adds	r3, r0, #0
 440              		.loc 1 75 46
 441 01b0 3969     		ldr	r1, [r7, #16]
 442 01b2 181C     		adds	r0, r3, #0
 443 01b4 FFF7FEFF 		bl	__aeabi_fdiv
 444              	.LVL18:
 445 01b8 031C     		adds	r3, r0, #0
 446              		.loc 1 75 22
 447 01ba 191C     		adds	r1, r3, #0
 448 01bc 386C     		ldr	r0, [r7, #64]
 449 01be FFF7FEFF 		bl	__aeabi_fadd
 450              	.LVL19:
 451 01c2 031C     		adds	r3, r0, #0
 452 01c4 3B64     		str	r3, [r7, #64]
 453 01c6 02E0     		b	.L10
 454              	.L13:
  58:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
 455              		.loc 1 58 13
 456 01c8 C046     		nop
 457 01ca 00E0     		b	.L10
 458              	.L14:
  61:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
 459              		.loc 1 61 13
 460 01cc C046     		nop
 461              	.L10:
 462              	.LBE3:
  54:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 463              		.loc 1 54 38 discriminator 2
 464 01ce FB6B     		ldr	r3, [r7, #60]
 465 01d0 0133     		adds	r3, r3, #1
 466 01d2 FB63     		str	r3, [r7, #60]
 467              	.L7:
  54:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 468              		.loc 1 54 5 discriminator 1
 469 01d4 FB6B     		ldr	r3, [r7, #60]
 470 01d6 012B     		cmp	r3, #1
 471 01d8 8FDD     		ble	.L12
 472              	.LBE2:
  76:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     }
  77:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  78:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     // Cohesion
  79:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float avgXPos = sumXPos / nearbyCount;
 473              		.loc 1 79 29
 474 01da 786D     		ldr	r0, [r7, #84]
 475 01dc FFF7FEFF 		bl	__aeabi_i2f
 476              	.LVL20:
 477 01e0 031C     		adds	r3, r0, #0
 478              		.loc 1 79 11
 479 01e2 191C     		adds	r1, r3, #0
 480 01e4 386D     		ldr	r0, [r7, #80]
 481 01e6 FFF7FEFF 		bl	__aeabi_fdiv
 482              	.LVL21:
 483 01ea 031C     		adds	r3, r0, #0
 484 01ec 7B63     		str	r3, [r7, #52]
  80:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float avgYPos = sumYPos / nearbyCount;
 485              		.loc 1 80 29
 486 01ee 786D     		ldr	r0, [r7, #84]
 487 01f0 FFF7FEFF 		bl	__aeabi_i2f
 488              	.LVL22:
 489 01f4 031C     		adds	r3, r0, #0
 490              		.loc 1 80 11
 491 01f6 191C     		adds	r1, r3, #0
 492 01f8 F86C     		ldr	r0, [r7, #76]
 493 01fa FFF7FEFF 		bl	__aeabi_fdiv
 494              	.LVL23:
 495 01fe 031C     		adds	r3, r0, #0
 496 0200 3B63     		str	r3, [r7, #48]
  81:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  82:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dXCohesion = avgXPos - self->x;
 497              		.loc 1 82 38
 498 0202 FB68     		ldr	r3, [r7, #12]
 499 0204 1B68     		ldr	r3, [r3]
 500              		.loc 1 82 11
 501 0206 191C     		adds	r1, r3, #0
 502 0208 786B     		ldr	r0, [r7, #52]
 503 020a FFF7FEFF 		bl	__aeabi_fsub
 504              	.LVL24:
 505 020e 031C     		adds	r3, r0, #0
 506 0210 FB62     		str	r3, [r7, #44]
  83:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dYCohesion = avgYPos - self->y;
 507              		.loc 1 83 38
 508 0212 FB68     		ldr	r3, [r7, #12]
 509 0214 5B68     		ldr	r3, [r3, #4]
 510              		.loc 1 83 11
 511 0216 191C     		adds	r1, r3, #0
 512 0218 386B     		ldr	r0, [r7, #48]
 513 021a FFF7FEFF 		bl	__aeabi_fsub
 514              	.LVL25:
 515 021e 031C     		adds	r3, r0, #0
 516 0220 BB62     		str	r3, [r7, #40]
  84:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  85:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     // Alignment
  86:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float avgXVel = sumXVel / nearbyCount;
 517              		.loc 1 86 29
 518 0222 786D     		ldr	r0, [r7, #84]
 519 0224 FFF7FEFF 		bl	__aeabi_i2f
 520              	.LVL26:
 521 0228 031C     		adds	r3, r0, #0
 522              		.loc 1 86 11
 523 022a 191C     		adds	r1, r3, #0
 524 022c B86C     		ldr	r0, [r7, #72]
 525 022e FFF7FEFF 		bl	__aeabi_fdiv
 526              	.LVL27:
 527 0232 031C     		adds	r3, r0, #0
 528 0234 7B62     		str	r3, [r7, #36]
  87:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float avgYVel = sumYVel / nearbyCount;
 529              		.loc 1 87 29
 530 0236 786D     		ldr	r0, [r7, #84]
 531 0238 FFF7FEFF 		bl	__aeabi_i2f
 532              	.LVL28:
 533 023c 031C     		adds	r3, r0, #0
 534              		.loc 1 87 11
 535 023e 191C     		adds	r1, r3, #0
 536 0240 B86B     		ldr	r0, [r7, #56]
 537 0242 FFF7FEFF 		bl	__aeabi_fdiv
 538              	.LVL29:
 539 0246 031C     		adds	r3, r0, #0
 540 0248 3B62     		str	r3, [r7, #32]
  88:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  89:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dXAlignment = avgXVel - self->xVel;
 541              		.loc 1 89 39
 542 024a FB68     		ldr	r3, [r7, #12]
 543 024c 9B68     		ldr	r3, [r3, #8]
 544              		.loc 1 89 11
 545 024e 191C     		adds	r1, r3, #0
 546 0250 786A     		ldr	r0, [r7, #36]
 547 0252 FFF7FEFF 		bl	__aeabi_fsub
 548              	.LVL30:
 549 0256 031C     		adds	r3, r0, #0
 550 0258 FB61     		str	r3, [r7, #28]
  90:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dYAlignment = avgYVel - self->yVel;
 551              		.loc 1 90 39
 552 025a FB68     		ldr	r3, [r7, #12]
 553 025c DB68     		ldr	r3, [r3, #12]
 554              		.loc 1 90 11
 555 025e 191C     		adds	r1, r3, #0
 556 0260 386A     		ldr	r0, [r7, #32]
 557 0262 FFF7FEFF 		bl	__aeabi_fsub
 558              	.LVL31:
 559 0266 031C     		adds	r3, r0, #0
 560 0268 BB61     		str	r3, [r7, #24]
  91:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  92:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     // Calculate new acceleration for the Boid
  93:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     self->xVel += dXSeparation * SEPARATION_BIAS + dXCohesion * COHESION_BIAS + dXAlignment * ALIGN
 561              		.loc 1 93 16
 562 026a FB68     		ldr	r3, [r7, #12]
 563 026c 9B68     		ldr	r3, [r3, #8]
 564 026e 181C     		adds	r0, r3, #0
 565 0270 FFF7FEFF 		bl	__aeabi_f2d
 566              	.LVL32:
 567 0274 0400     		movs	r4, r0
 568 0276 0D00     		movs	r5, r1
 569              		.loc 1 93 32
 570 0278 786C     		ldr	r0, [r7, #68]
 571 027a FFF7FEFF 		bl	__aeabi_f2d
 572              	.LVL33:
 573 027e 3D4A     		ldr	r2, .L15+4
 574 0280 3D4B     		ldr	r3, .L15+8
 575 0282 FFF7FEFF 		bl	__aeabi_dmul
 576              	.LVL34:
 577 0286 0200     		movs	r2, r0
 578 0288 0B00     		movs	r3, r1
 579 028a 3A60     		str	r2, [r7]
 580 028c 7B60     		str	r3, [r7, #4]
 581              		.loc 1 93 63
 582 028e F86A     		ldr	r0, [r7, #44]
 583 0290 FFF7FEFF 		bl	__aeabi_f2d
 584              	.LVL35:
 585 0294 394A     		ldr	r2, .L15+12
 586 0296 3A4B     		ldr	r3, .L15+16
 587 0298 FFF7FEFF 		bl	__aeabi_dmul
 588              	.LVL36:
 589 029c 0200     		movs	r2, r0
 590 029e 0B00     		movs	r3, r1
 591              		.loc 1 93 50
 592 02a0 3868     		ldr	r0, [r7]
 593 02a2 7968     		ldr	r1, [r7, #4]
 594 02a4 FFF7FEFF 		bl	__aeabi_dadd
 595              	.LVL37:
 596 02a8 0200     		movs	r2, r0
 597 02aa 0B00     		movs	r3, r1
 598 02ac 3A60     		str	r2, [r7]
 599 02ae 7B60     		str	r3, [r7, #4]
 600              		.loc 1 93 93
 601 02b0 F869     		ldr	r0, [r7, #28]
 602 02b2 FFF7FEFF 		bl	__aeabi_f2d
 603              	.LVL38:
 604 02b6 314A     		ldr	r2, .L15+12
 605 02b8 314B     		ldr	r3, .L15+16
 606 02ba FFF7FEFF 		bl	__aeabi_dmul
 607              	.LVL39:
 608 02be 0200     		movs	r2, r0
 609 02c0 0B00     		movs	r3, r1
 610              		.loc 1 93 79
 611 02c2 3868     		ldr	r0, [r7]
 612 02c4 7968     		ldr	r1, [r7, #4]
 613 02c6 FFF7FEFF 		bl	__aeabi_dadd
 614              	.LVL40:
 615 02ca 0200     		movs	r2, r0
 616 02cc 0B00     		movs	r3, r1
 617              		.loc 1 93 16
 618 02ce 2000     		movs	r0, r4
 619 02d0 2900     		movs	r1, r5
 620 02d2 FFF7FEFF 		bl	__aeabi_dadd
 621              	.LVL41:
 622 02d6 0200     		movs	r2, r0
 623 02d8 0B00     		movs	r3, r1
 624 02da 1000     		movs	r0, r2
 625 02dc 1900     		movs	r1, r3
 626 02de FFF7FEFF 		bl	__aeabi_d2f
 627              	.LVL42:
 628 02e2 021C     		adds	r2, r0, #0
 629 02e4 FB68     		ldr	r3, [r7, #12]
 630 02e6 9A60     		str	r2, [r3, #8]
  94:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     self->yVel += dYSeparation * SEPARATION_BIAS + dYCohesion * COHESION_BIAS + dYAlignment * ALIGN
 631              		.loc 1 94 16
 632 02e8 FB68     		ldr	r3, [r7, #12]
 633 02ea DB68     		ldr	r3, [r3, #12]
 634 02ec 181C     		adds	r0, r3, #0
 635 02ee FFF7FEFF 		bl	__aeabi_f2d
 636              	.LVL43:
 637 02f2 0400     		movs	r4, r0
 638 02f4 0D00     		movs	r5, r1
 639              		.loc 1 94 32
 640 02f6 386C     		ldr	r0, [r7, #64]
 641 02f8 FFF7FEFF 		bl	__aeabi_f2d
 642              	.LVL44:
 643 02fc 1D4A     		ldr	r2, .L15+4
 644 02fe 1E4B     		ldr	r3, .L15+8
 645 0300 FFF7FEFF 		bl	__aeabi_dmul
 646              	.LVL45:
 647 0304 0200     		movs	r2, r0
 648 0306 0B00     		movs	r3, r1
 649 0308 3A60     		str	r2, [r7]
 650 030a 7B60     		str	r3, [r7, #4]
 651              		.loc 1 94 63
 652 030c B86A     		ldr	r0, [r7, #40]
 653 030e FFF7FEFF 		bl	__aeabi_f2d
 654              	.LVL46:
 655 0312 1A4A     		ldr	r2, .L15+12
 656 0314 1A4B     		ldr	r3, .L15+16
 657 0316 FFF7FEFF 		bl	__aeabi_dmul
 658              	.LVL47:
 659 031a 0200     		movs	r2, r0
 660 031c 0B00     		movs	r3, r1
 661              		.loc 1 94 50
 662 031e 3868     		ldr	r0, [r7]
 663 0320 7968     		ldr	r1, [r7, #4]
 664 0322 FFF7FEFF 		bl	__aeabi_dadd
 665              	.LVL48:
 666 0326 0200     		movs	r2, r0
 667 0328 0B00     		movs	r3, r1
 668 032a 3A60     		str	r2, [r7]
 669 032c 7B60     		str	r3, [r7, #4]
 670              		.loc 1 94 93
 671 032e B869     		ldr	r0, [r7, #24]
 672 0330 FFF7FEFF 		bl	__aeabi_f2d
 673              	.LVL49:
 674 0334 114A     		ldr	r2, .L15+12
 675 0336 124B     		ldr	r3, .L15+16
 676 0338 FFF7FEFF 		bl	__aeabi_dmul
 677              	.LVL50:
 678 033c 0200     		movs	r2, r0
 679 033e 0B00     		movs	r3, r1
 680              		.loc 1 94 79
 681 0340 3868     		ldr	r0, [r7]
 682 0342 7968     		ldr	r1, [r7, #4]
 683 0344 FFF7FEFF 		bl	__aeabi_dadd
 684              	.LVL51:
 685 0348 0200     		movs	r2, r0
 686 034a 0B00     		movs	r3, r1
 687              		.loc 1 94 16
 688 034c 2000     		movs	r0, r4
 689 034e 2900     		movs	r1, r5
 690 0350 FFF7FEFF 		bl	__aeabi_dadd
 691              	.LVL52:
 692 0354 0200     		movs	r2, r0
 693 0356 0B00     		movs	r3, r1
 694 0358 1000     		movs	r0, r2
 695 035a 1900     		movs	r1, r3
 696 035c FFF7FEFF 		bl	__aeabi_d2f
 697              	.LVL53:
 698 0360 021C     		adds	r2, r0, #0
 699 0362 FB68     		ldr	r3, [r7, #12]
 700 0364 DA60     		str	r2, [r3, #12]
  95:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 701              		.loc 1 95 1
 702 0366 C046     		nop
 703 0368 BD46     		mov	sp, r7
 704 036a 16B0     		add	sp, sp, #88
 705              		@ sp needed
 706 036c B0BD     		pop	{r4, r5, r7, pc}
 707              	.L16:
 708 036e C046     		.align	2
 709              	.L15:
 710 0370 00040000 		.word	boids
 711 0374 FED478E9 		.word	-377957122
 712 0378 2631D03F 		.word	1070608678
 713 037c 63EE5A42 		.word	1113255523
 714 0380 3EE8993F 		.word	1067051070
 715              		.cfi_endproc
 716              	.LFE4:
 718              		.section	.rodata
 719              		.align	2
 720              	.LC3:
 721 0000 00000041 		.word	1090519040
 722 0004 0000F841 		.word	1106771968
 723 0008 00000000 		.word	0
 724 000c 00000000 		.word	0
 725 0010 00000000 		.word	draw
 726 0014 00000000 		.word	updatePos
 727 0018 00000000 		.word	updateVel
 728              		.text
 729              		.align	1
 730              		.global	createBoids
 731              		.syntax unified
 732              		.code	16
 733              		.thumb_func
 734              		.fpu softvfp
 736              	createBoids:
 737              	.LFB5:
  96:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  97:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void createBoids() {
 738              		.loc 1 97 20
 739              		.cfi_startproc
 740              		@ args = 0, pretend = 0, frame = 32
 741              		@ frame_needed = 1, uses_anonymous_args = 0
 742 0384 90B5     		push	{r4, r7, lr}
 743              		.cfi_def_cfa_offset 12
 744              		.cfi_offset 4, -12
 745              		.cfi_offset 7, -8
 746              		.cfi_offset 14, -4
 747 0386 89B0     		sub	sp, sp, #36
 748              		.cfi_def_cfa_offset 48
 749 0388 00AF     		add	r7, sp, #0
 750              		.cfi_def_cfa_register 7
 751              	.LBB4:
  98:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 752              		.loc 1 98 14
 753 038a 0023     		movs	r3, #0
 754 038c FB61     		str	r3, [r7, #28]
 755              		.loc 1 98 5
 756 038e 10E0     		b	.L18
 757              	.L19:
 758              	.LBB5:
  99:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
 759              		.loc 1 99 18 discriminator 3
 760 0390 0C49     		ldr	r1, .L20
 761 0392 FA69     		ldr	r2, [r7, #28]
 762 0394 1300     		movs	r3, r2
 763 0396 DB00     		lsls	r3, r3, #3
 764 0398 9B1A     		subs	r3, r3, r2
 765 039a 9B00     		lsls	r3, r3, #2
 766 039c 0A4A     		ldr	r2, .L20+4
 767 039e CB18     		adds	r3, r1, r3
 768 03a0 13CA     		ldmia	r2!, {r0, r1, r4}
 769 03a2 13C3     		stmia	r3!, {r0, r1, r4}
 770 03a4 13CA     		ldmia	r2!, {r0, r1, r4}
 771 03a6 13C3     		stmia	r3!, {r0, r1, r4}
 772 03a8 1268     		ldr	r2, [r2]
 773 03aa 1A60     		str	r2, [r3]
 774              	.LBE5:
  98:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 775              		.loc 1 98 38 discriminator 3
 776 03ac FB69     		ldr	r3, [r7, #28]
 777 03ae 0133     		adds	r3, r3, #1
 778 03b0 FB61     		str	r3, [r7, #28]
 779              	.L18:
  98:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 780              		.loc 1 98 5 discriminator 1
 781 03b2 FB69     		ldr	r3, [r7, #28]
 782 03b4 012B     		cmp	r3, #1
 783 03b6 EBDD     		ble	.L19
 784              	.LBE4:
 100:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         /*boids[i] = (BOID) { 
 101:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             .x = i * 5.0 + 1.0, 
 102:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             .y = 31.0, 
 103:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             .xVel = 0.0, 
 104:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             .yVel = 0.0,
 105:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             draw,
 106:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             updatePos,
 107:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             updateVel
 108:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         };*/
 109:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     }
 110:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 785              		.loc 1 110 1
 786 03b8 C046     		nop
 787 03ba C046     		nop
 788 03bc BD46     		mov	sp, r7
 789 03be 09B0     		add	sp, sp, #36
 790              		@ sp needed
 791 03c0 90BD     		pop	{r4, r7, pc}
 792              	.L21:
 793 03c2 C046     		.align	2
 794              	.L20:
 795 03c4 00040000 		.word	boids
 796 03c8 00000000 		.word	.LC3
 797              		.cfi_endproc
 798              	.LFE5:
 800              		.align	1
 801              		.global	main
 802              		.syntax unified
 803              		.code	16
 804              		.thumb_func
 805              		.fpu softvfp
 807              	main:
 808              	.LFB6:
 111:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
 112:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
 113:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void main(void) {
 809              		.loc 1 113 17
 810              		.cfi_startproc
 811              		@ args = 0, pretend = 0, frame = 8
 812              		@ frame_needed = 1, uses_anonymous_args = 0
 813 03cc 80B5     		push	{r7, lr}
 814              		.cfi_def_cfa_offset 8
 815              		.cfi_offset 7, -8
 816              		.cfi_offset 14, -4
 817 03ce 82B0     		sub	sp, sp, #8
 818              		.cfi_def_cfa_offset 16
 819 03d0 00AF     		add	r7, sp, #0
 820              		.cfi_def_cfa_register 7
 114:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	init();
 821              		.loc 1 114 2
 822 03d2 FFF7FEFF 		bl	init
 115:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
 116:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     old_pixel(5, 5, 1);
 823              		.loc 1 116 5
 824 03d6 0122     		movs	r2, #1
 825 03d8 0521     		movs	r1, #5
 826 03da 0520     		movs	r0, #5
 827 03dc FFF7FEFF 		bl	old_pixel
 117:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	clear_buffer();
 828              		.loc 1 117 2
 829 03e0 FFF7FEFF 		bl	clear_buffer
 118:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #ifndef SIMULATOR
 119:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	draw_buffer();
 120:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #endif
 121:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
 122:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     createBoids();
 830              		.loc 1 122 5
 831 03e4 FFF7FEFF 		bl	createBoids
 832              	.L27:
 833              	.LBB6:
 834              	.LBB7:
 123:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
 124:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	
 125:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     while (1) {
 126:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 835              		.loc 1 126 18
 836 03e8 0023     		movs	r3, #0
 837 03ea 7B60     		str	r3, [r7, #4]
 838              		.loc 1 126 9
 839 03ec 02E0     		b	.L23
 840              	.L24:
 841              		.loc 1 126 42 discriminator 3
 842 03ee 7B68     		ldr	r3, [r7, #4]
 843 03f0 0133     		adds	r3, r3, #1
 844 03f2 7B60     		str	r3, [r7, #4]
 845              	.L23:
 846              		.loc 1 126 9 discriminator 1
 847 03f4 7B68     		ldr	r3, [r7, #4]
 848 03f6 012B     		cmp	r3, #1
 849 03f8 F9DD     		ble	.L24
 850              	.LBE7:
 851              	.LBB8:
 127:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             //boids[i].updateVel(&boids[i]);
 128:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
 129:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 852              		.loc 1 129 18
 853 03fa 0023     		movs	r3, #0
 854 03fc 3B60     		str	r3, [r7]
 855              		.loc 1 129 9
 856 03fe 26E0     		b	.L25
 857              	.L26:
 130:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 858              		.loc 1 130 21 discriminator 3
 859 0400 1649     		ldr	r1, .L28
 860 0402 3A68     		ldr	r2, [r7]
 861 0404 1300     		movs	r3, r2
 862 0406 DB00     		lsls	r3, r3, #3
 863 0408 9B1A     		subs	r3, r3, r2
 864 040a 9B00     		lsls	r3, r3, #2
 865 040c CB18     		adds	r3, r1, r3
 866 040e 1433     		adds	r3, r3, #20
 867 0410 1968     		ldr	r1, [r3]
 868              		.loc 1 130 32 discriminator 3
 869 0412 3A68     		ldr	r2, [r7]
 870 0414 1300     		movs	r3, r2
 871 0416 DB00     		lsls	r3, r3, #3
 872 0418 9B1A     		subs	r3, r3, r2
 873 041a 9B00     		lsls	r3, r3, #2
 874 041c 0F4A     		ldr	r2, .L28
 875 041e 9B18     		adds	r3, r3, r2
 876              		.loc 1 130 13 discriminator 3
 877 0420 1800     		movs	r0, r3
 878 0422 8847     		blx	r1
 879              	.LVL54:
 131:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].draw(&boids[i]);
 880              		.loc 1 131 21 discriminator 3
 881 0424 0D49     		ldr	r1, .L28
 882 0426 3A68     		ldr	r2, [r7]
 883 0428 1300     		movs	r3, r2
 884 042a DB00     		lsls	r3, r3, #3
 885 042c 9B1A     		subs	r3, r3, r2
 886 042e 9B00     		lsls	r3, r3, #2
 887 0430 CB18     		adds	r3, r1, r3
 888 0432 1033     		adds	r3, r3, #16
 889 0434 1968     		ldr	r1, [r3]
 890              		.loc 1 131 27 discriminator 3
 891 0436 3A68     		ldr	r2, [r7]
 892 0438 1300     		movs	r3, r2
 893 043a DB00     		lsls	r3, r3, #3
 894 043c 9B1A     		subs	r3, r3, r2
 895 043e 9B00     		lsls	r3, r3, #2
 896 0440 064A     		ldr	r2, .L28
 897 0442 9B18     		adds	r3, r3, r2
 898              		.loc 1 131 13 discriminator 3
 899 0444 1800     		movs	r0, r3
 900 0446 8847     		blx	r1
 901              	.LVL55:
 129:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 902              		.loc 1 129 42 discriminator 3
 903 0448 3B68     		ldr	r3, [r7]
 904 044a 0133     		adds	r3, r3, #1
 905 044c 3B60     		str	r3, [r7]
 906              	.L25:
 129:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 907              		.loc 1 129 9 discriminator 1
 908 044e 3B68     		ldr	r3, [r7]
 909 0450 012B     		cmp	r3, #1
 910 0452 D5DD     		ble	.L26
 911              	.LBE8:
 132:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
 133:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         
 134:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         //draw_buffer();
 135:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 		delay_milli(20);
 912              		.loc 1 135 3
 913 0454 1420     		movs	r0, #20
 914 0456 FFF7FEFF 		bl	delay_milli
 915              	.LBE6:
 125:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 916              		.loc 1 125 15
 917 045a C5E7     		b	.L27
 918              	.L29:
 919              		.align	2
 920              	.L28:
 921 045c 00040000 		.word	boids
 922              		.cfi_endproc
 923              	.LFE6:
 925              	.Letext0:
 926              		.file 2 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/drivers.h"
