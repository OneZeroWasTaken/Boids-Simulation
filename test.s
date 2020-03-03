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
  11:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  12:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define BOID_COUNT 3
  13:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define VIEW_DISTANCE 8
  14:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  15:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define ALIGNMENT_BIAS 0.0253
  16:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define COHESION_BIAS 0.0253
  17:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #define SEPARATION_BIAS 0.253
  18:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  19:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** typedef struct tBoid {
  20:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	float x, y;
  21:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	float xVel, yVel;
  22:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  23:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     void (* draw) (struct tBoid *);
  24:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     void (* updatePos) (struct tBoid *);
  25:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     void (* updateVel) (struct tBoid *);
  26:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** } BOID, *pBOID;
  27:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  28:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** float squaredDistance(pBOID one, pBOID two) {
  77              		.loc 1 28 45
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
  29:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float xD = two->x - one->x;
  91              		.loc 1 29 19
  92 000a 3B68     		ldr	r3, [r7]
  93 000c 1A68     		ldr	r2, [r3]
  94              		.loc 1 29 28
  95 000e 7B68     		ldr	r3, [r7, #4]
  96 0010 1B68     		ldr	r3, [r3]
  97              		.loc 1 29 11
  98 0012 191C     		adds	r1, r3, #0
  99 0014 101C     		adds	r0, r2, #0
 100 0016 FFF7FEFF 		bl	__aeabi_fsub
 101              	.LVL0:
 102 001a 031C     		adds	r3, r0, #0
 103 001c FB60     		str	r3, [r7, #12]
  30:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float yD = two->y - one->y;
 104              		.loc 1 30 19
 105 001e 3B68     		ldr	r3, [r7]
 106 0020 5A68     		ldr	r2, [r3, #4]
 107              		.loc 1 30 28
 108 0022 7B68     		ldr	r3, [r7, #4]
 109 0024 5B68     		ldr	r3, [r3, #4]
 110              		.loc 1 30 11
 111 0026 191C     		adds	r1, r3, #0
 112 0028 101C     		adds	r0, r2, #0
 113 002a FFF7FEFF 		bl	__aeabi_fsub
 114              	.LVL1:
 115 002e 031C     		adds	r3, r0, #0
 116 0030 BB60     		str	r3, [r7, #8]
  31:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     return xD * xD + yD + yD;
 117              		.loc 1 31 15
 118 0032 F968     		ldr	r1, [r7, #12]
 119 0034 F868     		ldr	r0, [r7, #12]
 120 0036 FFF7FEFF 		bl	__aeabi_fmul
 121              	.LVL2:
 122 003a 031C     		adds	r3, r0, #0
 123              		.loc 1 31 20
 124 003c B968     		ldr	r1, [r7, #8]
 125 003e 181C     		adds	r0, r3, #0
 126 0040 FFF7FEFF 		bl	__aeabi_fadd
 127              	.LVL3:
 128 0044 031C     		adds	r3, r0, #0
 129              		.loc 1 31 25
 130 0046 B968     		ldr	r1, [r7, #8]
 131 0048 181C     		adds	r0, r3, #0
 132 004a FFF7FEFF 		bl	__aeabi_fadd
 133              	.LVL4:
 134 004e 031C     		adds	r3, r0, #0
  32:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 135              		.loc 1 32 1
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
 147 0400 00000000 		.space	84
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
  33:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  34:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  35:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** static BOID boids[BOID_COUNT];
  36:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  37:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void draw(pBOID self) {
 160              		.loc 1 37 23
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
  38:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     pixel((uint8_t) self->x, (uint8_t) self->y, 1);
 174              		.loc 1 38 25
 175 0060 7B68     		ldr	r3, [r7, #4]
 176 0062 1B68     		ldr	r3, [r3]
 177              		.loc 1 38 5
 178 0064 181C     		adds	r0, r3, #0
 179 0066 FFF7FEFF 		bl	__aeabi_f2uiz
 180              	.LVL5:
 181 006a 0300     		movs	r3, r0
 182 006c DCB2     		uxtb	r4, r3
 183              		.loc 1 38 44
 184 006e 7B68     		ldr	r3, [r7, #4]
 185 0070 5B68     		ldr	r3, [r3, #4]
 186              		.loc 1 38 5
 187 0072 181C     		adds	r0, r3, #0
 188 0074 FFF7FEFF 		bl	__aeabi_f2uiz
 189              	.LVL6:
 190 0078 0300     		movs	r3, r0
 191 007a DBB2     		uxtb	r3, r3
 192 007c 0122     		movs	r2, #1
 193 007e 1900     		movs	r1, r3
 194 0080 2000     		movs	r0, r4
 195 0082 FFF7FEFF 		bl	pixel
  39:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 196              		.loc 1 39 1
 197 0086 C046     		nop
 198 0088 BD46     		mov	sp, r7
 199 008a 03B0     		add	sp, sp, #12
 200              		@ sp needed
 201 008c 90BD     		pop	{r4, r7, pc}
 202              		.cfi_endproc
 203              	.LFE2:
 205              		.align	1
 206              		.global	updatePos
 207              		.syntax unified
 208              		.code	16
 209              		.thumb_func
 210              		.fpu softvfp
 212              	updatePos:
 213              	.LFB3:
  40:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  41:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void updatePos(pBOID self) {
 214              		.loc 1 41 28
 215              		.cfi_startproc
 216              		@ args = 0, pretend = 0, frame = 8
 217              		@ frame_needed = 1, uses_anonymous_args = 0
 218 008e 80B5     		push	{r7, lr}
 219              		.cfi_def_cfa_offset 8
 220              		.cfi_offset 7, -8
 221              		.cfi_offset 14, -4
 222 0090 82B0     		sub	sp, sp, #8
 223              		.cfi_def_cfa_offset 16
 224 0092 00AF     		add	r7, sp, #0
 225              		.cfi_def_cfa_register 7
 226 0094 7860     		str	r0, [r7, #4]
  42:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     self->x += self->xVel;
 227              		.loc 1 42 13
 228 0096 7B68     		ldr	r3, [r7, #4]
 229 0098 1A68     		ldr	r2, [r3]
 230              		.loc 1 42 20
 231 009a 7B68     		ldr	r3, [r7, #4]
 232 009c 9B68     		ldr	r3, [r3, #8]
 233              		.loc 1 42 13
 234 009e 191C     		adds	r1, r3, #0
 235 00a0 101C     		adds	r0, r2, #0
 236 00a2 FFF7FEFF 		bl	__aeabi_fadd
 237              	.LVL7:
 238 00a6 031C     		adds	r3, r0, #0
 239 00a8 1A1C     		adds	r2, r3, #0
 240 00aa 7B68     		ldr	r3, [r7, #4]
 241 00ac 1A60     		str	r2, [r3]
  43:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     self->y += self->yVel;
 242              		.loc 1 43 13
 243 00ae 7B68     		ldr	r3, [r7, #4]
 244 00b0 5A68     		ldr	r2, [r3, #4]
 245              		.loc 1 43 20
 246 00b2 7B68     		ldr	r3, [r7, #4]
 247 00b4 DB68     		ldr	r3, [r3, #12]
 248              		.loc 1 43 13
 249 00b6 191C     		adds	r1, r3, #0
 250 00b8 101C     		adds	r0, r2, #0
 251 00ba FFF7FEFF 		bl	__aeabi_fadd
 252              	.LVL8:
 253 00be 031C     		adds	r3, r0, #0
 254 00c0 1A1C     		adds	r2, r3, #0
 255 00c2 7B68     		ldr	r3, [r7, #4]
 256 00c4 5A60     		str	r2, [r3, #4]
  44:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 257              		.loc 1 44 1
 258 00c6 C046     		nop
 259 00c8 BD46     		mov	sp, r7
 260 00ca 02B0     		add	sp, sp, #8
 261              		@ sp needed
 262 00cc 80BD     		pop	{r7, pc}
 263              		.cfi_endproc
 264              	.LFE3:
 266              		.global	__aeabi_fcmpgt
 267              		.global	__aeabi_fdiv
 268              		.global	__aeabi_i2f
 269              		.global	__aeabi_f2d
 270              		.global	__aeabi_dmul
 271              		.global	__aeabi_dadd
 272              		.global	__aeabi_d2f
 273              		.align	1
 274              		.global	updateVel
 275              		.syntax unified
 276              		.code	16
 277              		.thumb_func
 278              		.fpu softvfp
 280              	updateVel:
 281              	.LFB4:
  45:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  46:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void updateVel(pBOID self) {
 282              		.loc 1 46 28
 283              		.cfi_startproc
 284              		@ args = 0, pretend = 0, frame = 88
 285              		@ frame_needed = 1, uses_anonymous_args = 0
 286 00ce B0B5     		push	{r4, r5, r7, lr}
 287              		.cfi_def_cfa_offset 16
 288              		.cfi_offset 4, -16
 289              		.cfi_offset 5, -12
 290              		.cfi_offset 7, -8
 291              		.cfi_offset 14, -4
 292 00d0 96B0     		sub	sp, sp, #88
 293              		.cfi_def_cfa_offset 104
 294 00d2 00AF     		add	r7, sp, #0
 295              		.cfi_def_cfa_register 7
 296 00d4 F860     		str	r0, [r7, #12]
  47:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     int nearbyCount = 0;
 297              		.loc 1 47 9
 298 00d6 0023     		movs	r3, #0
 299 00d8 7B65     		str	r3, [r7, #84]
  48:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float sumXPos = 0, sumYPos = 0;
 300              		.loc 1 48 11
 301 00da 0023     		movs	r3, #0
 302 00dc 3B65     		str	r3, [r7, #80]
 303              		.loc 1 48 24
 304 00de 0023     		movs	r3, #0
 305 00e0 FB64     		str	r3, [r7, #76]
  49:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float sumXVel = 0, sumYVel = 0;
 306              		.loc 1 49 11
 307 00e2 0023     		movs	r3, #0
 308 00e4 BB64     		str	r3, [r7, #72]
 309              		.loc 1 49 24
 310 00e6 0023     		movs	r3, #0
 311 00e8 BB63     		str	r3, [r7, #56]
  50:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dXSeparation = 0, dYSeparation = 0;
 312              		.loc 1 50 11
 313 00ea 0023     		movs	r3, #0
 314 00ec 7B64     		str	r3, [r7, #68]
 315              		.loc 1 50 29
 316 00ee 0023     		movs	r3, #0
 317 00f0 3B64     		str	r3, [r7, #64]
 318              	.LBB2:
  51:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  52:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 319              		.loc 1 52 14
 320 00f2 0023     		movs	r3, #0
 321 00f4 FB63     		str	r3, [r7, #60]
 322              		.loc 1 52 5
 323 00f6 6CE0     		b	.L7
 324              	.L12:
 325              	.LBB3:
  53:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 326              		.loc 1 53 15
 327 00f8 FA6B     		ldr	r2, [r7, #60]
 328 00fa 1300     		movs	r3, r2
 329 00fc DB00     		lsls	r3, r3, #3
 330 00fe 9B1A     		subs	r3, r3, r2
 331 0100 9B00     		lsls	r3, r3, #2
 332 0102 9A4A     		ldr	r2, .L15
 333 0104 9B18     		adds	r3, r3, r2
 334 0106 7B61     		str	r3, [r7, #20]
  54:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         float dSquared = squaredDistance(self, other);
 335              		.loc 1 54 26
 336 0108 7A69     		ldr	r2, [r7, #20]
 337 010a FB68     		ldr	r3, [r7, #12]
 338 010c 1100     		movs	r1, r2
 339 010e 1800     		movs	r0, r3
 340 0110 FFF7FEFF 		bl	squaredDistance
 341 0114 031C     		adds	r3, r0, #0
 342 0116 3B61     		str	r3, [r7, #16]
  55:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         if (dSquared > VIEW_DISTANCE * VIEW_DISTANCE) {
 343              		.loc 1 55 12
 344 0118 8521     		movs	r1, #133
 345 011a C905     		lsls	r1, r1, #23
 346 011c 3869     		ldr	r0, [r7, #16]
 347 011e FFF7FEFF 		bl	__aeabi_fcmpgt
 348              	.LVL9:
 349 0122 031E     		subs	r3, r0, #0
 350 0124 4FD1     		bne	.L13
  56:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             continue;
  57:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
  58:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         if (self == other) {
 351              		.loc 1 58 12
 352 0126 FA68     		ldr	r2, [r7, #12]
 353 0128 7B69     		ldr	r3, [r7, #20]
 354 012a 9A42     		cmp	r2, r3
 355 012c 4DD0     		beq	.L14
  59:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             continue;
  60:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
  61:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         nearbyCount++;
 356              		.loc 1 61 20
 357 012e 7B6D     		ldr	r3, [r7, #84]
 358 0130 0133     		adds	r3, r3, #1
 359 0132 7B65     		str	r3, [r7, #84]
  62:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         
  63:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         // Cohesion
  64:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         sumXPos += other->x;
 360              		.loc 1 64 25
 361 0134 7B69     		ldr	r3, [r7, #20]
 362 0136 1B68     		ldr	r3, [r3]
 363              		.loc 1 64 17
 364 0138 191C     		adds	r1, r3, #0
 365 013a 386D     		ldr	r0, [r7, #80]
 366 013c FFF7FEFF 		bl	__aeabi_fadd
 367              	.LVL10:
 368 0140 031C     		adds	r3, r0, #0
 369 0142 3B65     		str	r3, [r7, #80]
  65:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         sumYPos += other->y;
 370              		.loc 1 65 25
 371 0144 7B69     		ldr	r3, [r7, #20]
 372 0146 5B68     		ldr	r3, [r3, #4]
 373              		.loc 1 65 17
 374 0148 191C     		adds	r1, r3, #0
 375 014a F86C     		ldr	r0, [r7, #76]
 376 014c FFF7FEFF 		bl	__aeabi_fadd
 377              	.LVL11:
 378 0150 031C     		adds	r3, r0, #0
 379 0152 FB64     		str	r3, [r7, #76]
  66:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         
  67:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         // Alignment
  68:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         sumXVel += other->x;
 380              		.loc 1 68 25
 381 0154 7B69     		ldr	r3, [r7, #20]
 382 0156 1B68     		ldr	r3, [r3]
 383              		.loc 1 68 17
 384 0158 191C     		adds	r1, r3, #0
 385 015a B86C     		ldr	r0, [r7, #72]
 386 015c FFF7FEFF 		bl	__aeabi_fadd
 387              	.LVL12:
 388 0160 031C     		adds	r3, r0, #0
 389 0162 BB64     		str	r3, [r7, #72]
  69:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         sumXVel += other->y;
 390              		.loc 1 69 25
 391 0164 7B69     		ldr	r3, [r7, #20]
 392 0166 5B68     		ldr	r3, [r3, #4]
 393              		.loc 1 69 17
 394 0168 191C     		adds	r1, r3, #0
 395 016a B86C     		ldr	r0, [r7, #72]
 396 016c FFF7FEFF 		bl	__aeabi_fadd
 397              	.LVL13:
 398 0170 031C     		adds	r3, r0, #0
 399 0172 BB64     		str	r3, [r7, #72]
  70:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         
  71:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         // Separation
  72:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         dXSeparation += (self->x - other->x) / dSquared;
 400              		.loc 1 72 30
 401 0174 FB68     		ldr	r3, [r7, #12]
 402 0176 1A68     		ldr	r2, [r3]
 403              		.loc 1 72 41
 404 0178 7B69     		ldr	r3, [r7, #20]
 405 017a 1B68     		ldr	r3, [r3]
 406              		.loc 1 72 34
 407 017c 191C     		adds	r1, r3, #0
 408 017e 101C     		adds	r0, r2, #0
 409 0180 FFF7FEFF 		bl	__aeabi_fsub
 410              	.LVL14:
 411 0184 031C     		adds	r3, r0, #0
 412              		.loc 1 72 46
 413 0186 3969     		ldr	r1, [r7, #16]
 414 0188 181C     		adds	r0, r3, #0
 415 018a FFF7FEFF 		bl	__aeabi_fdiv
 416              	.LVL15:
 417 018e 031C     		adds	r3, r0, #0
 418              		.loc 1 72 22
 419 0190 191C     		adds	r1, r3, #0
 420 0192 786C     		ldr	r0, [r7, #68]
 421 0194 FFF7FEFF 		bl	__aeabi_fadd
 422              	.LVL16:
 423 0198 031C     		adds	r3, r0, #0
 424 019a 7B64     		str	r3, [r7, #68]
  73:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         dYSeparation += (self->y - other->y) / dSquared;
 425              		.loc 1 73 30
 426 019c FB68     		ldr	r3, [r7, #12]
 427 019e 5A68     		ldr	r2, [r3, #4]
 428              		.loc 1 73 41
 429 01a0 7B69     		ldr	r3, [r7, #20]
 430 01a2 5B68     		ldr	r3, [r3, #4]
 431              		.loc 1 73 34
 432 01a4 191C     		adds	r1, r3, #0
 433 01a6 101C     		adds	r0, r2, #0
 434 01a8 FFF7FEFF 		bl	__aeabi_fsub
 435              	.LVL17:
 436 01ac 031C     		adds	r3, r0, #0
 437              		.loc 1 73 46
 438 01ae 3969     		ldr	r1, [r7, #16]
 439 01b0 181C     		adds	r0, r3, #0
 440 01b2 FFF7FEFF 		bl	__aeabi_fdiv
 441              	.LVL18:
 442 01b6 031C     		adds	r3, r0, #0
 443              		.loc 1 73 22
 444 01b8 191C     		adds	r1, r3, #0
 445 01ba 386C     		ldr	r0, [r7, #64]
 446 01bc FFF7FEFF 		bl	__aeabi_fadd
 447              	.LVL19:
 448 01c0 031C     		adds	r3, r0, #0
 449 01c2 3B64     		str	r3, [r7, #64]
 450 01c4 02E0     		b	.L10
 451              	.L13:
  56:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
 452              		.loc 1 56 13
 453 01c6 C046     		nop
 454 01c8 00E0     		b	.L10
 455              	.L14:
  59:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
 456              		.loc 1 59 13
 457 01ca C046     		nop
 458              	.L10:
 459              	.LBE3:
  52:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 460              		.loc 1 52 38 discriminator 2
 461 01cc FB6B     		ldr	r3, [r7, #60]
 462 01ce 0133     		adds	r3, r3, #1
 463 01d0 FB63     		str	r3, [r7, #60]
 464              	.L7:
  52:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 465              		.loc 1 52 5 discriminator 1
 466 01d2 FB6B     		ldr	r3, [r7, #60]
 467 01d4 022B     		cmp	r3, #2
 468 01d6 8FDD     		ble	.L12
 469              	.LBE2:
  74:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     }
  75:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  76:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     // Cohesion
  77:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float avgXPos = sumXPos / nearbyCount;
 470              		.loc 1 77 29
 471 01d8 786D     		ldr	r0, [r7, #84]
 472 01da FFF7FEFF 		bl	__aeabi_i2f
 473              	.LVL20:
 474 01de 031C     		adds	r3, r0, #0
 475              		.loc 1 77 11
 476 01e0 191C     		adds	r1, r3, #0
 477 01e2 386D     		ldr	r0, [r7, #80]
 478 01e4 FFF7FEFF 		bl	__aeabi_fdiv
 479              	.LVL21:
 480 01e8 031C     		adds	r3, r0, #0
 481 01ea 7B63     		str	r3, [r7, #52]
  78:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float avgYPos = sumYPos / nearbyCount;
 482              		.loc 1 78 29
 483 01ec 786D     		ldr	r0, [r7, #84]
 484 01ee FFF7FEFF 		bl	__aeabi_i2f
 485              	.LVL22:
 486 01f2 031C     		adds	r3, r0, #0
 487              		.loc 1 78 11
 488 01f4 191C     		adds	r1, r3, #0
 489 01f6 F86C     		ldr	r0, [r7, #76]
 490 01f8 FFF7FEFF 		bl	__aeabi_fdiv
 491              	.LVL23:
 492 01fc 031C     		adds	r3, r0, #0
 493 01fe 3B63     		str	r3, [r7, #48]
  79:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  80:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dXCohesion = avgXPos - self->x;
 494              		.loc 1 80 38
 495 0200 FB68     		ldr	r3, [r7, #12]
 496 0202 1B68     		ldr	r3, [r3]
 497              		.loc 1 80 11
 498 0204 191C     		adds	r1, r3, #0
 499 0206 786B     		ldr	r0, [r7, #52]
 500 0208 FFF7FEFF 		bl	__aeabi_fsub
 501              	.LVL24:
 502 020c 031C     		adds	r3, r0, #0
 503 020e FB62     		str	r3, [r7, #44]
  81:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dYCohesion = avgYPos - self->y;
 504              		.loc 1 81 38
 505 0210 FB68     		ldr	r3, [r7, #12]
 506 0212 5B68     		ldr	r3, [r3, #4]
 507              		.loc 1 81 11
 508 0214 191C     		adds	r1, r3, #0
 509 0216 386B     		ldr	r0, [r7, #48]
 510 0218 FFF7FEFF 		bl	__aeabi_fsub
 511              	.LVL25:
 512 021c 031C     		adds	r3, r0, #0
 513 021e BB62     		str	r3, [r7, #40]
  82:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  83:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     // Alignment
  84:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float avgXVel = sumXVel / nearbyCount;
 514              		.loc 1 84 29
 515 0220 786D     		ldr	r0, [r7, #84]
 516 0222 FFF7FEFF 		bl	__aeabi_i2f
 517              	.LVL26:
 518 0226 031C     		adds	r3, r0, #0
 519              		.loc 1 84 11
 520 0228 191C     		adds	r1, r3, #0
 521 022a B86C     		ldr	r0, [r7, #72]
 522 022c FFF7FEFF 		bl	__aeabi_fdiv
 523              	.LVL27:
 524 0230 031C     		adds	r3, r0, #0
 525 0232 7B62     		str	r3, [r7, #36]
  85:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float avgYVel = sumYVel / nearbyCount;
 526              		.loc 1 85 29
 527 0234 786D     		ldr	r0, [r7, #84]
 528 0236 FFF7FEFF 		bl	__aeabi_i2f
 529              	.LVL28:
 530 023a 031C     		adds	r3, r0, #0
 531              		.loc 1 85 11
 532 023c 191C     		adds	r1, r3, #0
 533 023e B86B     		ldr	r0, [r7, #56]
 534 0240 FFF7FEFF 		bl	__aeabi_fdiv
 535              	.LVL29:
 536 0244 031C     		adds	r3, r0, #0
 537 0246 3B62     		str	r3, [r7, #32]
  86:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  87:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dXAlignment = avgXVel - self->xVel;
 538              		.loc 1 87 39
 539 0248 FB68     		ldr	r3, [r7, #12]
 540 024a 9B68     		ldr	r3, [r3, #8]
 541              		.loc 1 87 11
 542 024c 191C     		adds	r1, r3, #0
 543 024e 786A     		ldr	r0, [r7, #36]
 544 0250 FFF7FEFF 		bl	__aeabi_fsub
 545              	.LVL30:
 546 0254 031C     		adds	r3, r0, #0
 547 0256 FB61     		str	r3, [r7, #28]
  88:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     float dYAlignment = avgYVel - self->yVel;
 548              		.loc 1 88 39
 549 0258 FB68     		ldr	r3, [r7, #12]
 550 025a DB68     		ldr	r3, [r3, #12]
 551              		.loc 1 88 11
 552 025c 191C     		adds	r1, r3, #0
 553 025e 386A     		ldr	r0, [r7, #32]
 554 0260 FFF7FEFF 		bl	__aeabi_fsub
 555              	.LVL31:
 556 0264 031C     		adds	r3, r0, #0
 557 0266 BB61     		str	r3, [r7, #24]
  89:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
  90:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     // Calculate new acceleration for the Boid
  91:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     self->xVel += dXSeparation * SEPARATION_BIAS + dXCohesion * COHESION_BIAS + dXAlignment * ALIGN
 558              		.loc 1 91 16
 559 0268 FB68     		ldr	r3, [r7, #12]
 560 026a 9B68     		ldr	r3, [r3, #8]
 561 026c 181C     		adds	r0, r3, #0
 562 026e FFF7FEFF 		bl	__aeabi_f2d
 563              	.LVL32:
 564 0272 0400     		movs	r4, r0
 565 0274 0D00     		movs	r5, r1
 566              		.loc 1 91 32
 567 0276 786C     		ldr	r0, [r7, #68]
 568 0278 FFF7FEFF 		bl	__aeabi_f2d
 569              	.LVL33:
 570 027c 3C4A     		ldr	r2, .L15+4
 571 027e 3D4B     		ldr	r3, .L15+8
 572 0280 FFF7FEFF 		bl	__aeabi_dmul
 573              	.LVL34:
 574 0284 0200     		movs	r2, r0
 575 0286 0B00     		movs	r3, r1
 576 0288 3A60     		str	r2, [r7]
 577 028a 7B60     		str	r3, [r7, #4]
 578              		.loc 1 91 63
 579 028c F86A     		ldr	r0, [r7, #44]
 580 028e FFF7FEFF 		bl	__aeabi_f2d
 581              	.LVL35:
 582 0292 394A     		ldr	r2, .L15+12
 583 0294 394B     		ldr	r3, .L15+16
 584 0296 FFF7FEFF 		bl	__aeabi_dmul
 585              	.LVL36:
 586 029a 0200     		movs	r2, r0
 587 029c 0B00     		movs	r3, r1
 588              		.loc 1 91 50
 589 029e 3868     		ldr	r0, [r7]
 590 02a0 7968     		ldr	r1, [r7, #4]
 591 02a2 FFF7FEFF 		bl	__aeabi_dadd
 592              	.LVL37:
 593 02a6 0200     		movs	r2, r0
 594 02a8 0B00     		movs	r3, r1
 595 02aa 3A60     		str	r2, [r7]
 596 02ac 7B60     		str	r3, [r7, #4]
 597              		.loc 1 91 93
 598 02ae F869     		ldr	r0, [r7, #28]
 599 02b0 FFF7FEFF 		bl	__aeabi_f2d
 600              	.LVL38:
 601 02b4 304A     		ldr	r2, .L15+12
 602 02b6 314B     		ldr	r3, .L15+16
 603 02b8 FFF7FEFF 		bl	__aeabi_dmul
 604              	.LVL39:
 605 02bc 0200     		movs	r2, r0
 606 02be 0B00     		movs	r3, r1
 607              		.loc 1 91 79
 608 02c0 3868     		ldr	r0, [r7]
 609 02c2 7968     		ldr	r1, [r7, #4]
 610 02c4 FFF7FEFF 		bl	__aeabi_dadd
 611              	.LVL40:
 612 02c8 0200     		movs	r2, r0
 613 02ca 0B00     		movs	r3, r1
 614              		.loc 1 91 16
 615 02cc 2000     		movs	r0, r4
 616 02ce 2900     		movs	r1, r5
 617 02d0 FFF7FEFF 		bl	__aeabi_dadd
 618              	.LVL41:
 619 02d4 0200     		movs	r2, r0
 620 02d6 0B00     		movs	r3, r1
 621 02d8 1000     		movs	r0, r2
 622 02da 1900     		movs	r1, r3
 623 02dc FFF7FEFF 		bl	__aeabi_d2f
 624              	.LVL42:
 625 02e0 021C     		adds	r2, r0, #0
 626 02e2 FB68     		ldr	r3, [r7, #12]
 627 02e4 9A60     		str	r2, [r3, #8]
  92:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     self->yVel += dYSeparation * SEPARATION_BIAS + dYCohesion * COHESION_BIAS + dYAlignment * ALIGN
 628              		.loc 1 92 16
 629 02e6 FB68     		ldr	r3, [r7, #12]
 630 02e8 DB68     		ldr	r3, [r3, #12]
 631 02ea 181C     		adds	r0, r3, #0
 632 02ec FFF7FEFF 		bl	__aeabi_f2d
 633              	.LVL43:
 634 02f0 0400     		movs	r4, r0
 635 02f2 0D00     		movs	r5, r1
 636              		.loc 1 92 32
 637 02f4 386C     		ldr	r0, [r7, #64]
 638 02f6 FFF7FEFF 		bl	__aeabi_f2d
 639              	.LVL44:
 640 02fa 1D4A     		ldr	r2, .L15+4
 641 02fc 1D4B     		ldr	r3, .L15+8
 642 02fe FFF7FEFF 		bl	__aeabi_dmul
 643              	.LVL45:
 644 0302 0200     		movs	r2, r0
 645 0304 0B00     		movs	r3, r1
 646 0306 3A60     		str	r2, [r7]
 647 0308 7B60     		str	r3, [r7, #4]
 648              		.loc 1 92 63
 649 030a B86A     		ldr	r0, [r7, #40]
 650 030c FFF7FEFF 		bl	__aeabi_f2d
 651              	.LVL46:
 652 0310 194A     		ldr	r2, .L15+12
 653 0312 1A4B     		ldr	r3, .L15+16
 654 0314 FFF7FEFF 		bl	__aeabi_dmul
 655              	.LVL47:
 656 0318 0200     		movs	r2, r0
 657 031a 0B00     		movs	r3, r1
 658              		.loc 1 92 50
 659 031c 3868     		ldr	r0, [r7]
 660 031e 7968     		ldr	r1, [r7, #4]
 661 0320 FFF7FEFF 		bl	__aeabi_dadd
 662              	.LVL48:
 663 0324 0200     		movs	r2, r0
 664 0326 0B00     		movs	r3, r1
 665 0328 3A60     		str	r2, [r7]
 666 032a 7B60     		str	r3, [r7, #4]
 667              		.loc 1 92 93
 668 032c B869     		ldr	r0, [r7, #24]
 669 032e FFF7FEFF 		bl	__aeabi_f2d
 670              	.LVL49:
 671 0332 114A     		ldr	r2, .L15+12
 672 0334 114B     		ldr	r3, .L15+16
 673 0336 FFF7FEFF 		bl	__aeabi_dmul
 674              	.LVL50:
 675 033a 0200     		movs	r2, r0
 676 033c 0B00     		movs	r3, r1
 677              		.loc 1 92 79
 678 033e 3868     		ldr	r0, [r7]
 679 0340 7968     		ldr	r1, [r7, #4]
 680 0342 FFF7FEFF 		bl	__aeabi_dadd
 681              	.LVL51:
 682 0346 0200     		movs	r2, r0
 683 0348 0B00     		movs	r3, r1
 684              		.loc 1 92 16
 685 034a 2000     		movs	r0, r4
 686 034c 2900     		movs	r1, r5
 687 034e FFF7FEFF 		bl	__aeabi_dadd
 688              	.LVL52:
 689 0352 0200     		movs	r2, r0
 690 0354 0B00     		movs	r3, r1
 691 0356 1000     		movs	r0, r2
 692 0358 1900     		movs	r1, r3
 693 035a FFF7FEFF 		bl	__aeabi_d2f
 694              	.LVL53:
 695 035e 021C     		adds	r2, r0, #0
 696 0360 FB68     		ldr	r3, [r7, #12]
 697 0362 DA60     		str	r2, [r3, #12]
  93:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 698              		.loc 1 93 1
 699 0364 C046     		nop
 700 0366 BD46     		mov	sp, r7
 701 0368 16B0     		add	sp, sp, #88
 702              		@ sp needed
 703 036a B0BD     		pop	{r4, r5, r7, pc}
 704              	.L16:
 705              		.align	2
 706              	.L15:
 707 036c 00040000 		.word	boids
 708 0370 FED478E9 		.word	-377957122
 709 0374 2631D03F 		.word	1070608678
 710 0378 63EE5A42 		.word	1113255523
 711 037c 3EE8993F 		.word	1067051070
 712              		.cfi_endproc
 713              	.LFE4:
 715              		.global	__aeabi_i2d
 716              		.align	1
 717              		.global	createBoids
 718              		.syntax unified
 719              		.code	16
 720              		.thumb_func
 721              		.fpu softvfp
 723              	createBoids:
 724              	.LFB5:
  94:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
  95:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void createBoids() {
 725              		.loc 1 95 20
 726              		.cfi_startproc
 727              		@ args = 0, pretend = 0, frame = 32
 728              		@ frame_needed = 1, uses_anonymous_args = 0
 729 0380 80B5     		push	{r7, lr}
 730              		.cfi_def_cfa_offset 8
 731              		.cfi_offset 7, -8
 732              		.cfi_offset 14, -4
 733 0382 88B0     		sub	sp, sp, #32
 734              		.cfi_def_cfa_offset 40
 735 0384 00AF     		add	r7, sp, #0
 736              		.cfi_def_cfa_register 7
 737              	.LBB4:
  96:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 738              		.loc 1 96 14
 739 0386 0023     		movs	r3, #0
 740 0388 FB61     		str	r3, [r7, #28]
 741              		.loc 1 96 5
 742 038a 5AE0     		b	.L18
 743              	.L19:
 744              	.LBB5:
  97:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         boids[i] = (BOID) { 
  98:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             .x = i * 5.0 + 1.0, 
 745              		.loc 1 98 20 discriminator 3
 746 038c F869     		ldr	r0, [r7, #28]
 747 038e FFF7FEFF 		bl	__aeabi_i2d
 748              	.LVL54:
 749 0392 0022     		movs	r2, #0
 750 0394 2F4B     		ldr	r3, .L20
 751 0396 FFF7FEFF 		bl	__aeabi_dmul
 752              	.LVL55:
 753 039a 0200     		movs	r2, r0
 754 039c 0B00     		movs	r3, r1
 755 039e 1000     		movs	r0, r2
 756 03a0 1900     		movs	r1, r3
 757              		.loc 1 98 26 discriminator 3
 758 03a2 0022     		movs	r2, #0
 759 03a4 2C4B     		ldr	r3, .L20+4
 760 03a6 FFF7FEFF 		bl	__aeabi_dadd
 761              	.LVL56:
 762 03aa 0200     		movs	r2, r0
 763 03ac 0B00     		movs	r3, r1
 764 03ae 1000     		movs	r0, r2
 765 03b0 1900     		movs	r1, r3
 766 03b2 FFF7FEFF 		bl	__aeabi_d2f
 767              	.LVL57:
  97:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         boids[i] = (BOID) { 
 768              		.loc 1 97 18 discriminator 3
 769 03b6 2949     		ldr	r1, .L20+8
 770 03b8 FA69     		ldr	r2, [r7, #28]
 771 03ba 1300     		movs	r3, r2
 772 03bc DB00     		lsls	r3, r3, #3
 773 03be 9B1A     		subs	r3, r3, r2
 774 03c0 9B00     		lsls	r3, r3, #2
 775 03c2 5850     		str	r0, [r3, r1]
 776 03c4 2549     		ldr	r1, .L20+8
 777 03c6 FA69     		ldr	r2, [r7, #28]
 778 03c8 1300     		movs	r3, r2
 779 03ca DB00     		lsls	r3, r3, #3
 780 03cc 9B1A     		subs	r3, r3, r2
 781 03ce 9B00     		lsls	r3, r3, #2
 782 03d0 CB18     		adds	r3, r1, r3
 783 03d2 0433     		adds	r3, r3, #4
 784 03d4 224A     		ldr	r2, .L20+12
 785 03d6 1A60     		str	r2, [r3]
 786 03d8 2049     		ldr	r1, .L20+8
 787 03da FA69     		ldr	r2, [r7, #28]
 788 03dc 1300     		movs	r3, r2
 789 03de DB00     		lsls	r3, r3, #3
 790 03e0 9B1A     		subs	r3, r3, r2
 791 03e2 9B00     		lsls	r3, r3, #2
 792 03e4 CB18     		adds	r3, r1, r3
 793 03e6 0833     		adds	r3, r3, #8
 794 03e8 0022     		movs	r2, #0
 795 03ea 1A60     		str	r2, [r3]
 796 03ec 1B49     		ldr	r1, .L20+8
 797 03ee FA69     		ldr	r2, [r7, #28]
 798 03f0 1300     		movs	r3, r2
 799 03f2 DB00     		lsls	r3, r3, #3
 800 03f4 9B1A     		subs	r3, r3, r2
 801 03f6 9B00     		lsls	r3, r3, #2
 802 03f8 CB18     		adds	r3, r1, r3
 803 03fa 0C33     		adds	r3, r3, #12
 804 03fc 0022     		movs	r2, #0
 805 03fe 1A60     		str	r2, [r3]
 806 0400 1649     		ldr	r1, .L20+8
 807 0402 FA69     		ldr	r2, [r7, #28]
 808 0404 1300     		movs	r3, r2
 809 0406 DB00     		lsls	r3, r3, #3
 810 0408 9B1A     		subs	r3, r3, r2
 811 040a 9B00     		lsls	r3, r3, #2
 812 040c CB18     		adds	r3, r1, r3
 813 040e 1033     		adds	r3, r3, #16
 814 0410 144A     		ldr	r2, .L20+16
 815 0412 1A60     		str	r2, [r3]
 816 0414 1149     		ldr	r1, .L20+8
 817 0416 FA69     		ldr	r2, [r7, #28]
 818 0418 1300     		movs	r3, r2
 819 041a DB00     		lsls	r3, r3, #3
 820 041c 9B1A     		subs	r3, r3, r2
 821 041e 9B00     		lsls	r3, r3, #2
 822 0420 CB18     		adds	r3, r1, r3
 823 0422 1433     		adds	r3, r3, #20
 824 0424 104A     		ldr	r2, .L20+20
 825 0426 1A60     		str	r2, [r3]
 826 0428 0C49     		ldr	r1, .L20+8
 827 042a FA69     		ldr	r2, [r7, #28]
 828 042c 1300     		movs	r3, r2
 829 042e DB00     		lsls	r3, r3, #3
 830 0430 9B1A     		subs	r3, r3, r2
 831 0432 9B00     		lsls	r3, r3, #2
 832 0434 CB18     		adds	r3, r1, r3
 833 0436 1833     		adds	r3, r3, #24
 834 0438 0C4A     		ldr	r2, .L20+24
 835 043a 1A60     		str	r2, [r3]
 836              	.LBE5:
  96:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 837              		.loc 1 96 38 discriminator 3
 838 043c FB69     		ldr	r3, [r7, #28]
 839 043e 0133     		adds	r3, r3, #1
 840 0440 FB61     		str	r3, [r7, #28]
 841              	.L18:
  96:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 842              		.loc 1 96 5 discriminator 1
 843 0442 FB69     		ldr	r3, [r7, #28]
 844 0444 022B     		cmp	r3, #2
 845 0446 A1DD     		ble	.L19
 846              	.LBE4:
  99:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             .y = 31.0, 
 100:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             .xVel = 0.0, 
 101:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             .yVel = 0.0,
 102:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             draw,
 103:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             updatePos,
 104:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             updateVel
 105:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         };
 106:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     }
 107:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** }
 847              		.loc 1 107 1
 848 0448 C046     		nop
 849 044a C046     		nop
 850 044c BD46     		mov	sp, r7
 851 044e 08B0     		add	sp, sp, #32
 852              		@ sp needed
 853 0450 80BD     		pop	{r7, pc}
 854              	.L21:
 855 0452 C046     		.align	2
 856              	.L20:
 857 0454 00001440 		.word	1075052544
 858 0458 0000F03F 		.word	1072693248
 859 045c 00040000 		.word	boids
 860 0460 0000F841 		.word	1106771968
 861 0464 00000000 		.word	draw
 862 0468 00000000 		.word	updatePos
 863 046c 00000000 		.word	updateVel
 864              		.cfi_endproc
 865              	.LFE5:
 867              		.align	1
 868              		.global	main
 869              		.syntax unified
 870              		.code	16
 871              		.thumb_func
 872              		.fpu softvfp
 874              	main:
 875              	.LFB6:
 108:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
 109:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
 110:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** void main(void) {
 876              		.loc 1 110 17
 877              		.cfi_startproc
 878              		@ args = 0, pretend = 0, frame = 8
 879              		@ frame_needed = 1, uses_anonymous_args = 0
 880 0470 80B5     		push	{r7, lr}
 881              		.cfi_def_cfa_offset 8
 882              		.cfi_offset 7, -8
 883              		.cfi_offset 14, -4
 884 0472 82B0     		sub	sp, sp, #8
 885              		.cfi_def_cfa_offset 16
 886 0474 00AF     		add	r7, sp, #0
 887              		.cfi_def_cfa_register 7
 111:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	init();
 888              		.loc 1 111 2
 889 0476 FFF7FEFF 		bl	init
 112:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	clear_buffer();
 890              		.loc 1 112 2
 891 047a FFF7FEFF 		bl	clear_buffer
 113:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #ifndef SIMULATOR
 114:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	draw_buffer();
 892              		.loc 1 114 2
 893 047e FFF7FEFF 		bl	draw_buffer
 115:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** #endif
 116:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 
 117:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     createBoids();
 894              		.loc 1 117 5
 895 0482 FFF7FEFF 		bl	createBoids
 896              	.L27:
 897              	.LBB6:
 898              	.LBB7:
 118:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     
 119:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 	
 120:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****     while (1) {
 121:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 899              		.loc 1 121 18
 900 0486 0023     		movs	r3, #0
 901 0488 7B60     		str	r3, [r7, #4]
 902              		.loc 1 121 9
 903 048a 14E0     		b	.L23
 904              	.L24:
 122:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updateVel(&boids[i]);
 905              		.loc 1 122 21 discriminator 3
 906 048c 2549     		ldr	r1, .L28
 907 048e 7A68     		ldr	r2, [r7, #4]
 908 0490 1300     		movs	r3, r2
 909 0492 DB00     		lsls	r3, r3, #3
 910 0494 9B1A     		subs	r3, r3, r2
 911 0496 9B00     		lsls	r3, r3, #2
 912 0498 CB18     		adds	r3, r1, r3
 913 049a 1833     		adds	r3, r3, #24
 914 049c 1968     		ldr	r1, [r3]
 915              		.loc 1 122 32 discriminator 3
 916 049e 7A68     		ldr	r2, [r7, #4]
 917 04a0 1300     		movs	r3, r2
 918 04a2 DB00     		lsls	r3, r3, #3
 919 04a4 9B1A     		subs	r3, r3, r2
 920 04a6 9B00     		lsls	r3, r3, #2
 921 04a8 1E4A     		ldr	r2, .L28
 922 04aa 9B18     		adds	r3, r3, r2
 923              		.loc 1 122 13 discriminator 3
 924 04ac 1800     		movs	r0, r3
 925 04ae 8847     		blx	r1
 926              	.LVL58:
 121:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updateVel(&boids[i]);
 927              		.loc 1 121 42 discriminator 3
 928 04b0 7B68     		ldr	r3, [r7, #4]
 929 04b2 0133     		adds	r3, r3, #1
 930 04b4 7B60     		str	r3, [r7, #4]
 931              	.L23:
 121:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updateVel(&boids[i]);
 932              		.loc 1 121 9 discriminator 1
 933 04b6 7B68     		ldr	r3, [r7, #4]
 934 04b8 022B     		cmp	r3, #2
 935 04ba E7DD     		ble	.L24
 936              	.LBE7:
 937              	.LBB8:
 123:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
 124:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 938              		.loc 1 124 18
 939 04bc 0023     		movs	r3, #0
 940 04be 3B60     		str	r3, [r7]
 941              		.loc 1 124 9
 942 04c0 26E0     		b	.L25
 943              	.L26:
 125:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 944              		.loc 1 125 21 discriminator 3
 945 04c2 1849     		ldr	r1, .L28
 946 04c4 3A68     		ldr	r2, [r7]
 947 04c6 1300     		movs	r3, r2
 948 04c8 DB00     		lsls	r3, r3, #3
 949 04ca 9B1A     		subs	r3, r3, r2
 950 04cc 9B00     		lsls	r3, r3, #2
 951 04ce CB18     		adds	r3, r1, r3
 952 04d0 1433     		adds	r3, r3, #20
 953 04d2 1968     		ldr	r1, [r3]
 954              		.loc 1 125 32 discriminator 3
 955 04d4 3A68     		ldr	r2, [r7]
 956 04d6 1300     		movs	r3, r2
 957 04d8 DB00     		lsls	r3, r3, #3
 958 04da 9B1A     		subs	r3, r3, r2
 959 04dc 9B00     		lsls	r3, r3, #2
 960 04de 114A     		ldr	r2, .L28
 961 04e0 9B18     		adds	r3, r3, r2
 962              		.loc 1 125 13 discriminator 3
 963 04e2 1800     		movs	r0, r3
 964 04e4 8847     		blx	r1
 965              	.LVL59:
 126:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].draw(&boids[i]);
 966              		.loc 1 126 21 discriminator 3
 967 04e6 0F49     		ldr	r1, .L28
 968 04e8 3A68     		ldr	r2, [r7]
 969 04ea 1300     		movs	r3, r2
 970 04ec DB00     		lsls	r3, r3, #3
 971 04ee 9B1A     		subs	r3, r3, r2
 972 04f0 9B00     		lsls	r3, r3, #2
 973 04f2 CB18     		adds	r3, r1, r3
 974 04f4 1033     		adds	r3, r3, #16
 975 04f6 1968     		ldr	r1, [r3]
 976              		.loc 1 126 27 discriminator 3
 977 04f8 3A68     		ldr	r2, [r7]
 978 04fa 1300     		movs	r3, r2
 979 04fc DB00     		lsls	r3, r3, #3
 980 04fe 9B1A     		subs	r3, r3, r2
 981 0500 9B00     		lsls	r3, r3, #2
 982 0502 084A     		ldr	r2, .L28
 983 0504 9B18     		adds	r3, r3, r2
 984              		.loc 1 126 13 discriminator 3
 985 0506 1800     		movs	r0, r3
 986 0508 8847     		blx	r1
 987              	.LVL60:
 124:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 988              		.loc 1 124 42 discriminator 3
 989 050a 3B68     		ldr	r3, [r7]
 990 050c 0133     		adds	r3, r3, #1
 991 050e 3B60     		str	r3, [r7]
 992              	.L25:
 124:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 993              		.loc 1 124 9 discriminator 1
 994 0510 3B68     		ldr	r3, [r7]
 995 0512 022B     		cmp	r3, #2
 996 0514 D5DD     		ble	.L26
 997              	.LBE8:
 127:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         }
 128:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         
 129:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         draw_buffer();
 998              		.loc 1 129 9
 999 0516 FFF7FEFF 		bl	draw_buffer
 130:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c **** 		delay_milli(20);
 1000              		.loc 1 130 3
 1001 051a 1420     		movs	r0, #20
 1002 051c FFF7FEFF 		bl	delay_milli
 1003              	.LBE6:
 120:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1004              		.loc 1 120 15
 1005 0520 B1E7     		b	.L27
 1006              	.L29:
 1007 0522 C046     		.align	2
 1008              	.L28:
 1009 0524 00040000 		.word	boids
 1010              		.cfi_endproc
 1011              	.LFE6:
 1013              	.Letext0:
 1014              		.file 2 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/drivers.h"
