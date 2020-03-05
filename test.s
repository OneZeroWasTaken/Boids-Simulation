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
  30              		.file 1 "C:/Users/oskargi/Downloads/boids/Boids-Simulation/startup.c"
   1:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #include "drivers.h"
   2:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #include <stdlib.h>
   3:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
   4:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** __attribute__((naked)) __attribute__((section (".start_section")) )
   5:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void startup ( void )
   6:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** {
  31              		.loc 1 6 0
  32              		.cfi_startproc
  33              		@ Naked Function: prologue and epilogue provided by programmer.
  34              		@ args = 0, pretend = 0, frame = 0
  35              		@ frame_needed = 1, uses_anonymous_args = 0
   7:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** __asm__ volatile(" LDR R0,=0x2001C000\n");		/* set stack */
  36              		.loc 1 7 0
  37              		.syntax divided
  38              	@ 7 "C:/Users/oskargi/Downloads/boids/Boids-Simulation/startup.c" 1
  39 0000 0248     		 LDR R0,=0x2001C000
  40              	
  41              	@ 0 "" 2
   8:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** __asm__ volatile(" MOV SP,R0\n");
  42              		.loc 1 8 0
  43              	@ 8 "C:/Users/oskargi/Downloads/boids/Boids-Simulation/startup.c" 1
  44 0002 8546     		 MOV SP,R0
  45              	
  46              	@ 0 "" 2
   9:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** __asm__ volatile(" BL main\n");					/* call main */
  47              		.loc 1 9 0
  48              	@ 9 "C:/Users/oskargi/Downloads/boids/Boids-Simulation/startup.c" 1
  49 0004 FFF7FEFF 		 BL main
  50              	
  51              	@ 0 "" 2
  10:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** __asm__ volatile(".L1: B .L1\n");				/* never return */
  52              		.loc 1 10 0
  53              	@ 10 "C:/Users/oskargi/Downloads/boids/Boids-Simulation/startup.c" 1
  54 0008 FEE7     		.L1: B .L1
  55              	
  56              	@ 0 "" 2
  11:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
  57              		.loc 1 11 0
  58              		.thumb
  59              		.syntax unified
  60 000a C046     		nop
  61              		.cfi_endproc
  62              	.LFE0:
  64              		.data
  65              		.align	2
  68              	ball:
  69 0000 3F000000 		.word	63
  70 0004 1F000000 		.word	31
  71 0008 02000000 		.word	2
  72              		.text
  73              		.align	1
  74              		.global	drawBall
  75              		.syntax unified
  76              		.code	16
  77              		.thumb_func
  78              		.fpu softvfp
  80              	drawBall:
  81              	.LFB1:
  12:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** //#define SIMULATOR
  13:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  14:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define BOID_COUNT 100
  15:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define VIEW_DISTANCE 15
  16:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  17:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define ALIGNMENT_BIAS 0.33
  18:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define COHESION_BIAS 0.1
  19:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define SEPARATION_BIAS 0.05
  20:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define MAX_SPEED 14
  21:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define MIN_SPEED 1
  22:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define BALL_FORCE 50
  23:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define BALL_SPEED 5
  24:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  25:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  26:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** typedef struct tBall {
  27:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	int x, y;
  28:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	int radius;
  29:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** } BALL, *pBALL;
  30:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  31:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** static BALL ball = {63, 31, 2};
  32:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  33:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void drawBall() {
  82              		.loc 1 33 0
  83              		.cfi_startproc
  84              		@ args = 0, pretend = 0, frame = 8
  85              		@ frame_needed = 1, uses_anonymous_args = 0
  86 0000 80B5     		push	{r7, lr}
  87              		.cfi_def_cfa_offset 8
  88              		.cfi_offset 7, -8
  89              		.cfi_offset 14, -4
  90 0002 82B0     		sub	sp, sp, #8
  91              		.cfi_def_cfa_offset 16
  92 0004 00AF     		add	r7, sp, #0
  93              		.cfi_def_cfa_register 7
  94              	.LBB2:
  34:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	for (int y = -ball.radius; y < ball.radius; y++) {
  95              		.loc 1 34 0
  96 0006 1F4B     		ldr	r3, .L8
  97 0008 9B68     		ldr	r3, [r3, #8]
  98 000a 5B42     		rsbs	r3, r3, #0
  99 000c 7B60     		str	r3, [r7, #4]
 100 000e 2FE0     		b	.L3
 101              	.L7:
 102              	.LBB3:
  35:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		for (int x = -ball.radius; x < ball.radius; x++) {
 103              		.loc 1 35 0
 104 0010 1C4B     		ldr	r3, .L8
 105 0012 9B68     		ldr	r3, [r3, #8]
 106 0014 5B42     		rsbs	r3, r3, #0
 107 0016 3B60     		str	r3, [r7]
 108 0018 22E0     		b	.L4
 109              	.L6:
  36:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			if (x*x+y*y < ball.radius*ball.radius) {
 110              		.loc 1 36 0
 111 001a 3B68     		ldr	r3, [r7]
 112 001c 3A68     		ldr	r2, [r7]
 113 001e 5A43     		muls	r2, r3
 114 0020 7B68     		ldr	r3, [r7, #4]
 115 0022 7968     		ldr	r1, [r7, #4]
 116 0024 4B43     		muls	r3, r1
 117 0026 D218     		adds	r2, r2, r3
 118 0028 164B     		ldr	r3, .L8
 119 002a 9968     		ldr	r1, [r3, #8]
 120 002c 154B     		ldr	r3, .L8
 121 002e 9B68     		ldr	r3, [r3, #8]
 122 0030 4B43     		muls	r3, r1
 123 0032 9A42     		cmp	r2, r3
 124 0034 11DA     		bge	.L5
  37:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 				pixel(ball.x+x, ball.y+y, 1);
 125              		.loc 1 37 0
 126 0036 134B     		ldr	r3, .L8
 127 0038 1B68     		ldr	r3, [r3]
 128 003a DAB2     		uxtb	r2, r3
 129 003c 3B68     		ldr	r3, [r7]
 130 003e DBB2     		uxtb	r3, r3
 131 0040 D318     		adds	r3, r2, r3
 132 0042 D8B2     		uxtb	r0, r3
 133 0044 0F4B     		ldr	r3, .L8
 134 0046 5B68     		ldr	r3, [r3, #4]
 135 0048 DAB2     		uxtb	r2, r3
 136 004a 7B68     		ldr	r3, [r7, #4]
 137 004c DBB2     		uxtb	r3, r3
 138 004e D318     		adds	r3, r2, r3
 139 0050 DBB2     		uxtb	r3, r3
 140 0052 0122     		movs	r2, #1
 141 0054 1900     		movs	r1, r3
 142 0056 FFF7FEFF 		bl	pixel
 143              	.L5:
  35:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		for (int x = -ball.radius; x < ball.radius; x++) {
 144              		.loc 1 35 0 discriminator 2
 145 005a 3B68     		ldr	r3, [r7]
 146 005c 0133     		adds	r3, r3, #1
 147 005e 3B60     		str	r3, [r7]
 148              	.L4:
  35:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		for (int x = -ball.radius; x < ball.radius; x++) {
 149              		.loc 1 35 0 is_stmt 0 discriminator 1
 150 0060 084B     		ldr	r3, .L8
 151 0062 9B68     		ldr	r3, [r3, #8]
 152 0064 3A68     		ldr	r2, [r7]
 153 0066 9A42     		cmp	r2, r3
 154 0068 D7DB     		blt	.L6
 155              	.LBE3:
  34:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		for (int x = -ball.radius; x < ball.radius; x++) {
 156              		.loc 1 34 0 is_stmt 1 discriminator 2
 157 006a 7B68     		ldr	r3, [r7, #4]
 158 006c 0133     		adds	r3, r3, #1
 159 006e 7B60     		str	r3, [r7, #4]
 160              	.L3:
  34:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		for (int x = -ball.radius; x < ball.radius; x++) {
 161              		.loc 1 34 0 is_stmt 0 discriminator 1
 162 0070 044B     		ldr	r3, .L8
 163 0072 9B68     		ldr	r3, [r3, #8]
 164 0074 7A68     		ldr	r2, [r7, #4]
 165 0076 9A42     		cmp	r2, r3
 166 0078 CADB     		blt	.L7
 167              	.LBE2:
  38:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			}
  39:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
  40:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  41:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 168              		.loc 1 41 0 is_stmt 1
 169 007a C046     		nop
 170 007c BD46     		mov	sp, r7
 171 007e 02B0     		add	sp, sp, #8
 172              		@ sp needed
 173 0080 80BD     		pop	{r7, pc}
 174              	.L9:
 175 0082 C046     		.align	2
 176              	.L8:
 177 0084 00000000 		.word	ball
 178              		.cfi_endproc
 179              	.LFE1:
 181              		.align	1
 182              		.global	updateBall
 183              		.syntax unified
 184              		.code	16
 185              		.thumb_func
 186              		.fpu softvfp
 188              	updateBall:
 189              	.LFB2:
  42:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  43:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void updateBall() {
 190              		.loc 1 43 0
 191              		.cfi_startproc
 192              		@ args = 0, pretend = 0, frame = 0
 193              		@ frame_needed = 1, uses_anonymous_args = 0
 194 0088 80B5     		push	{r7, lr}
 195              		.cfi_def_cfa_offset 8
 196              		.cfi_offset 7, -8
 197              		.cfi_offset 14, -4
 198 008a 00AF     		add	r7, sp, #0
 199              		.cfi_def_cfa_register 7
  44:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	switch (keyb()) {
 200              		.loc 1 44 0
 201 008c FFF7FEFF 		bl	keyb
 202 0090 0300     		movs	r3, r0
 203 0092 042B     		cmp	r3, #4
 204 0094 0ED0     		beq	.L12
 205 0096 02DC     		bgt	.L13
 206 0098 022B     		cmp	r3, #2
 207 009a 05D0     		beq	.L14
 208 009c 1CE0     		b	.L11
 209              	.L13:
 210 009e 052B     		cmp	r3, #5
 211 00a0 0ED0     		beq	.L15
 212 00a2 062B     		cmp	r3, #6
 213 00a4 12D0     		beq	.L16
 214 00a6 17E0     		b	.L11
 215              	.L14:
  45:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		case 2:
  46:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			ball.y -= BALL_SPEED;
 216              		.loc 1 46 0
 217 00a8 1B4B     		ldr	r3, .L19
 218 00aa 5B68     		ldr	r3, [r3, #4]
 219 00ac 5A1F     		subs	r2, r3, #5
 220 00ae 1A4B     		ldr	r3, .L19
 221 00b0 5A60     		str	r2, [r3, #4]
  47:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			break;
 222              		.loc 1 47 0
 223 00b2 11E0     		b	.L11
 224              	.L12:
  48:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		case 4:
  49:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			ball.x -= BALL_SPEED;
 225              		.loc 1 49 0
 226 00b4 184B     		ldr	r3, .L19
 227 00b6 1B68     		ldr	r3, [r3]
 228 00b8 5A1F     		subs	r2, r3, #5
 229 00ba 174B     		ldr	r3, .L19
 230 00bc 1A60     		str	r2, [r3]
  50:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			break;
 231              		.loc 1 50 0
 232 00be 0BE0     		b	.L11
 233              	.L15:
  51:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		case 5:
  52:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			ball.y += BALL_SPEED;
 234              		.loc 1 52 0
 235 00c0 154B     		ldr	r3, .L19
 236 00c2 5B68     		ldr	r3, [r3, #4]
 237 00c4 5A1D     		adds	r2, r3, #5
 238 00c6 144B     		ldr	r3, .L19
 239 00c8 5A60     		str	r2, [r3, #4]
  53:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			break;
 240              		.loc 1 53 0
 241 00ca 05E0     		b	.L11
 242              	.L16:
  54:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		case 6:
  55:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			ball.x += BALL_SPEED;
 243              		.loc 1 55 0
 244 00cc 124B     		ldr	r3, .L19
 245 00ce 1B68     		ldr	r3, [r3]
 246 00d0 5A1D     		adds	r2, r3, #5
 247 00d2 114B     		ldr	r3, .L19
 248 00d4 1A60     		str	r2, [r3]
  56:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			break;
 249              		.loc 1 56 0
 250 00d6 C046     		nop
 251              	.L11:
  57:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  58:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	ball.x = (ball.x + 128) % 128;
 252              		.loc 1 58 0
 253 00d8 0F4B     		ldr	r3, .L19
 254 00da 1B68     		ldr	r3, [r3]
 255 00dc 8033     		adds	r3, r3, #128
 256 00de 0F4A     		ldr	r2, .L19+4
 257 00e0 1340     		ands	r3, r2
 258 00e2 04D5     		bpl	.L17
 259 00e4 013B     		subs	r3, r3, #1
 260 00e6 8022     		movs	r2, #128
 261 00e8 5242     		rsbs	r2, r2, #0
 262 00ea 1343     		orrs	r3, r2
 263 00ec 0133     		adds	r3, r3, #1
 264              	.L17:
 265 00ee 1A00     		movs	r2, r3
 266 00f0 094B     		ldr	r3, .L19
 267 00f2 1A60     		str	r2, [r3]
  59:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	ball.y = (ball.y + 64) % 64;
 268              		.loc 1 59 0
 269 00f4 084B     		ldr	r3, .L19
 270 00f6 5B68     		ldr	r3, [r3, #4]
 271 00f8 4033     		adds	r3, r3, #64
 272 00fa 094A     		ldr	r2, .L19+8
 273 00fc 1340     		ands	r3, r2
 274 00fe 04D5     		bpl	.L18
 275 0100 013B     		subs	r3, r3, #1
 276 0102 4022     		movs	r2, #64
 277 0104 5242     		rsbs	r2, r2, #0
 278 0106 1343     		orrs	r3, r2
 279 0108 0133     		adds	r3, r3, #1
 280              	.L18:
 281 010a 1A00     		movs	r2, r3
 282 010c 024B     		ldr	r3, .L19
 283 010e 5A60     		str	r2, [r3, #4]
  60:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 284              		.loc 1 60 0
 285 0110 C046     		nop
 286 0112 BD46     		mov	sp, r7
 287              		@ sp needed
 288 0114 80BD     		pop	{r7, pc}
 289              	.L20:
 290 0116 C046     		.align	2
 291              	.L19:
 292 0118 00000000 		.word	ball
 293 011c 7F000080 		.word	-2147483521
 294 0120 3F000080 		.word	-2147483585
 295              		.cfi_endproc
 296              	.LFE2:
 298              		.global	__aeabi_fsub
 299              		.global	__aeabi_fmul
 300              		.global	__aeabi_fadd
 301              		.align	1
 302              		.global	squaredDistance
 303              		.syntax unified
 304              		.code	16
 305              		.thumb_func
 306              		.fpu softvfp
 308              	squaredDistance:
 309              	.LFB3:
  61:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  62:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** typedef struct tBoid {
  63:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	float x, y;
  64:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	float xVel, yVel;
  65:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
  66:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     void (* draw) (struct tBoid *);
  67:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     void (* updatePos) (struct tBoid *);
  68:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     void (* updateVel) (struct tBoid *);
  69:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** } BOID, *pBOID;
  70:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  71:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** float squaredDistance(pBOID one, pBOID two) {
 310              		.loc 1 71 0
 311              		.cfi_startproc
 312              		@ args = 0, pretend = 0, frame = 16
 313              		@ frame_needed = 1, uses_anonymous_args = 0
 314 0124 80B5     		push	{r7, lr}
 315              		.cfi_def_cfa_offset 8
 316              		.cfi_offset 7, -8
 317              		.cfi_offset 14, -4
 318 0126 84B0     		sub	sp, sp, #16
 319              		.cfi_def_cfa_offset 24
 320 0128 00AF     		add	r7, sp, #0
 321              		.cfi_def_cfa_register 7
 322 012a 7860     		str	r0, [r7, #4]
 323 012c 3960     		str	r1, [r7]
  72:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float xD = two->x - one->x;
 324              		.loc 1 72 0
 325 012e 3B68     		ldr	r3, [r7]
 326 0130 1A68     		ldr	r2, [r3]
 327 0132 7B68     		ldr	r3, [r7, #4]
 328 0134 1B68     		ldr	r3, [r3]
 329 0136 191C     		adds	r1, r3, #0
 330 0138 101C     		adds	r0, r2, #0
 331 013a FFF7FEFF 		bl	__aeabi_fsub
 332              	.LVL0:
 333 013e 031C     		adds	r3, r0, #0
 334 0140 FB60     		str	r3, [r7, #12]
  73:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float yD = two->y - one->y;
 335              		.loc 1 73 0
 336 0142 3B68     		ldr	r3, [r7]
 337 0144 5A68     		ldr	r2, [r3, #4]
 338 0146 7B68     		ldr	r3, [r7, #4]
 339 0148 5B68     		ldr	r3, [r3, #4]
 340 014a 191C     		adds	r1, r3, #0
 341 014c 101C     		adds	r0, r2, #0
 342 014e FFF7FEFF 		bl	__aeabi_fsub
 343              	.LVL1:
 344 0152 031C     		adds	r3, r0, #0
 345 0154 BB60     		str	r3, [r7, #8]
  74:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     return xD * xD + yD + yD;
 346              		.loc 1 74 0
 347 0156 F968     		ldr	r1, [r7, #12]
 348 0158 F868     		ldr	r0, [r7, #12]
 349 015a FFF7FEFF 		bl	__aeabi_fmul
 350              	.LVL2:
 351 015e 031C     		adds	r3, r0, #0
 352 0160 B968     		ldr	r1, [r7, #8]
 353 0162 181C     		adds	r0, r3, #0
 354 0164 FFF7FEFF 		bl	__aeabi_fadd
 355              	.LVL3:
 356 0168 031C     		adds	r3, r0, #0
 357 016a B968     		ldr	r1, [r7, #8]
 358 016c 181C     		adds	r0, r3, #0
 359 016e FFF7FEFF 		bl	__aeabi_fadd
 360              	.LVL4:
 361 0172 031C     		adds	r3, r0, #0
  75:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 362              		.loc 1 75 0
 363 0174 181C     		adds	r0, r3, #0
 364 0176 BD46     		mov	sp, r7
 365 0178 04B0     		add	sp, sp, #16
 366              		@ sp needed
 367 017a 80BD     		pop	{r7, pc}
 368              		.cfi_endproc
 369              	.LFE3:
 371              		.bss
 372              		.align	2
 373              	boids:
 374 0400 00000000 		.space	2800
 374      00000000 
 374      00000000 
 374      00000000 
 374      00000000 
 376              		.global	__aeabi_f2uiz
 377              		.text
 378              		.align	1
 379              		.global	draw
 380              		.syntax unified
 381              		.code	16
 382              		.thumb_func
 383              		.fpu softvfp
 385              	draw:
 386              	.LFB4:
  76:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  77:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  78:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** static BOID boids[BOID_COUNT];
  79:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  80:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void draw(pBOID self) {
 387              		.loc 1 80 0
 388              		.cfi_startproc
 389              		@ args = 0, pretend = 0, frame = 8
 390              		@ frame_needed = 1, uses_anonymous_args = 0
 391 017c 90B5     		push	{r4, r7, lr}
 392              		.cfi_def_cfa_offset 12
 393              		.cfi_offset 4, -12
 394              		.cfi_offset 7, -8
 395              		.cfi_offset 14, -4
 396 017e 83B0     		sub	sp, sp, #12
 397              		.cfi_def_cfa_offset 24
 398 0180 00AF     		add	r7, sp, #0
 399              		.cfi_def_cfa_register 7
 400 0182 7860     		str	r0, [r7, #4]
  81:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     pixel((uint8_t) self->x, (uint8_t) self->y, 1);
 401              		.loc 1 81 0
 402 0184 7B68     		ldr	r3, [r7, #4]
 403 0186 1B68     		ldr	r3, [r3]
 404 0188 181C     		adds	r0, r3, #0
 405 018a FFF7FEFF 		bl	__aeabi_f2uiz
 406              	.LVL5:
 407 018e 0300     		movs	r3, r0
 408 0190 DCB2     		uxtb	r4, r3
 409 0192 7B68     		ldr	r3, [r7, #4]
 410 0194 5B68     		ldr	r3, [r3, #4]
 411 0196 181C     		adds	r0, r3, #0
 412 0198 FFF7FEFF 		bl	__aeabi_f2uiz
 413              	.LVL6:
 414 019c 0300     		movs	r3, r0
 415 019e DBB2     		uxtb	r3, r3
 416 01a0 0122     		movs	r2, #1
 417 01a2 1900     		movs	r1, r3
 418 01a4 2000     		movs	r0, r4
 419 01a6 FFF7FEFF 		bl	pixel
  82:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     //old_pixel((uint8_t) self->x, (uint8_t) self->y, 1);
  83:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 420              		.loc 1 83 0
 421 01aa C046     		nop
 422 01ac BD46     		mov	sp, r7
 423 01ae 03B0     		add	sp, sp, #12
 424              		@ sp needed
 425 01b0 90BD     		pop	{r4, r7, pc}
 426              		.cfi_endproc
 427              	.LFE4:
 429              		.global	__aeabi_fcmplt
 430              		.global	__aeabi_fcmpgt
 431              		.align	1
 432              		.global	updatePos
 433              		.syntax unified
 434              		.code	16
 435              		.thumb_func
 436              		.fpu softvfp
 438              	updatePos:
 439              	.LFB5:
  84:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  85:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void updatePos(pBOID self) {
 440              		.loc 1 85 0
 441              		.cfi_startproc
 442              		@ args = 0, pretend = 0, frame = 8
 443              		@ frame_needed = 1, uses_anonymous_args = 0
 444 01b2 80B5     		push	{r7, lr}
 445              		.cfi_def_cfa_offset 8
 446              		.cfi_offset 7, -8
 447              		.cfi_offset 14, -4
 448 01b4 82B0     		sub	sp, sp, #8
 449              		.cfi_def_cfa_offset 16
 450 01b6 00AF     		add	r7, sp, #0
 451              		.cfi_def_cfa_register 7
 452 01b8 7860     		str	r0, [r7, #4]
  86:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     self->x += self->xVel;
 453              		.loc 1 86 0
 454 01ba 7B68     		ldr	r3, [r7, #4]
 455 01bc 1A68     		ldr	r2, [r3]
 456 01be 7B68     		ldr	r3, [r7, #4]
 457 01c0 9B68     		ldr	r3, [r3, #8]
 458 01c2 191C     		adds	r1, r3, #0
 459 01c4 101C     		adds	r0, r2, #0
 460 01c6 FFF7FEFF 		bl	__aeabi_fadd
 461              	.LVL7:
 462 01ca 031C     		adds	r3, r0, #0
 463 01cc 1A1C     		adds	r2, r3, #0
 464 01ce 7B68     		ldr	r3, [r7, #4]
 465 01d0 1A60     		str	r2, [r3]
  87:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     self->y += self->yVel;
 466              		.loc 1 87 0
 467 01d2 7B68     		ldr	r3, [r7, #4]
 468 01d4 5A68     		ldr	r2, [r3, #4]
 469 01d6 7B68     		ldr	r3, [r7, #4]
 470 01d8 DB68     		ldr	r3, [r3, #12]
 471 01da 191C     		adds	r1, r3, #0
 472 01dc 101C     		adds	r0, r2, #0
 473 01de FFF7FEFF 		bl	__aeabi_fadd
 474              	.LVL8:
 475 01e2 031C     		adds	r3, r0, #0
 476 01e4 1A1C     		adds	r2, r3, #0
 477 01e6 7B68     		ldr	r3, [r7, #4]
 478 01e8 5A60     		str	r2, [r3, #4]
  88:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->x < 0) {
 479              		.loc 1 88 0
 480 01ea 0AE0     		b	.L25
 481              	.L26:
  89:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->x += 128;
 482              		.loc 1 89 0
 483 01ec 7B68     		ldr	r3, [r7, #4]
 484 01ee 1B68     		ldr	r3, [r3]
 485 01f0 8621     		movs	r1, #134
 486 01f2 C905     		lsls	r1, r1, #23
 487 01f4 181C     		adds	r0, r3, #0
 488 01f6 FFF7FEFF 		bl	__aeabi_fadd
 489              	.LVL9:
 490 01fa 031C     		adds	r3, r0, #0
 491 01fc 1A1C     		adds	r2, r3, #0
 492 01fe 7B68     		ldr	r3, [r7, #4]
 493 0200 1A60     		str	r2, [r3]
 494              	.L25:
  88:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->x < 0) {
 495              		.loc 1 88 0
 496 0202 7B68     		ldr	r3, [r7, #4]
 497 0204 1B68     		ldr	r3, [r3]
 498 0206 0021     		movs	r1, #0
 499 0208 181C     		adds	r0, r3, #0
 500 020a FFF7FEFF 		bl	__aeabi_fcmplt
 501              	.LVL10:
 502 020e 031E     		subs	r3, r0, #0
 503 0210 ECD1     		bne	.L26
  90:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  91:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->x > 127) {
 504              		.loc 1 91 0
 505 0212 0AE0     		b	.L27
 506              	.L28:
  92:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->x -= 128;
 507              		.loc 1 92 0
 508 0214 7B68     		ldr	r3, [r7, #4]
 509 0216 1B68     		ldr	r3, [r3]
 510 0218 8621     		movs	r1, #134
 511 021a C905     		lsls	r1, r1, #23
 512 021c 181C     		adds	r0, r3, #0
 513 021e FFF7FEFF 		bl	__aeabi_fsub
 514              	.LVL11:
 515 0222 031C     		adds	r3, r0, #0
 516 0224 1A1C     		adds	r2, r3, #0
 517 0226 7B68     		ldr	r3, [r7, #4]
 518 0228 1A60     		str	r2, [r3]
 519              	.L27:
  91:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->x -= 128;
 520              		.loc 1 91 0
 521 022a 7B68     		ldr	r3, [r7, #4]
 522 022c 1B68     		ldr	r3, [r3]
 523 022e 1949     		ldr	r1, .L33
 524 0230 181C     		adds	r0, r3, #0
 525 0232 FFF7FEFF 		bl	__aeabi_fcmpgt
 526              	.LVL12:
 527 0236 031E     		subs	r3, r0, #0
 528 0238 ECD1     		bne	.L28
  93:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  94:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->y < 0) {
 529              		.loc 1 94 0
 530 023a 0AE0     		b	.L29
 531              	.L30:
  95:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->y += 64;
 532              		.loc 1 95 0
 533 023c 7B68     		ldr	r3, [r7, #4]
 534 023e 5B68     		ldr	r3, [r3, #4]
 535 0240 8521     		movs	r1, #133
 536 0242 C905     		lsls	r1, r1, #23
 537 0244 181C     		adds	r0, r3, #0
 538 0246 FFF7FEFF 		bl	__aeabi_fadd
 539              	.LVL13:
 540 024a 031C     		adds	r3, r0, #0
 541 024c 1A1C     		adds	r2, r3, #0
 542 024e 7B68     		ldr	r3, [r7, #4]
 543 0250 5A60     		str	r2, [r3, #4]
 544              	.L29:
  94:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->y += 64;
 545              		.loc 1 94 0
 546 0252 7B68     		ldr	r3, [r7, #4]
 547 0254 5B68     		ldr	r3, [r3, #4]
 548 0256 0021     		movs	r1, #0
 549 0258 181C     		adds	r0, r3, #0
 550 025a FFF7FEFF 		bl	__aeabi_fcmplt
 551              	.LVL14:
 552 025e 031E     		subs	r3, r0, #0
 553 0260 ECD1     		bne	.L30
  96:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  97:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->y > 63) {
 554              		.loc 1 97 0
 555 0262 0AE0     		b	.L31
 556              	.L32:
  98:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->y -= 64;
 557              		.loc 1 98 0
 558 0264 7B68     		ldr	r3, [r7, #4]
 559 0266 5B68     		ldr	r3, [r3, #4]
 560 0268 8521     		movs	r1, #133
 561 026a C905     		lsls	r1, r1, #23
 562 026c 181C     		adds	r0, r3, #0
 563 026e FFF7FEFF 		bl	__aeabi_fsub
 564              	.LVL15:
 565 0272 031C     		adds	r3, r0, #0
 566 0274 1A1C     		adds	r2, r3, #0
 567 0276 7B68     		ldr	r3, [r7, #4]
 568 0278 5A60     		str	r2, [r3, #4]
 569              	.L31:
  97:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->y -= 64;
 570              		.loc 1 97 0
 571 027a 7B68     		ldr	r3, [r7, #4]
 572 027c 5B68     		ldr	r3, [r3, #4]
 573 027e 0649     		ldr	r1, .L33+4
 574 0280 181C     		adds	r0, r3, #0
 575 0282 FFF7FEFF 		bl	__aeabi_fcmpgt
 576              	.LVL16:
 577 0286 031E     		subs	r3, r0, #0
 578 0288 ECD1     		bne	.L32
  99:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 100:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 579              		.loc 1 100 0
 580 028a C046     		nop
 581 028c BD46     		mov	sp, r7
 582 028e 02B0     		add	sp, sp, #8
 583              		@ sp needed
 584 0290 80BD     		pop	{r7, pc}
 585              	.L34:
 586 0292 C046     		.align	2
 587              	.L33:
 588 0294 0000FE42 		.word	1123942400
 589 0298 00007C42 		.word	1115422720
 590              		.cfi_endproc
 591              	.LFE5:
 593              		.global	__aeabi_fdiv
 594              		.global	__aeabi_fcmpeq
 595              		.align	1
 596              		.global	root
 597              		.syntax unified
 598              		.code	16
 599              		.thumb_func
 600              		.fpu softvfp
 602              	root:
 603              	.LFB6:
 101:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 102:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** float root(float n){
 604              		.loc 1 102 0
 605              		.cfi_startproc
 606              		@ args = 0, pretend = 0, frame = 24
 607              		@ frame_needed = 1, uses_anonymous_args = 0
 608 029c 80B5     		push	{r7, lr}
 609              		.cfi_def_cfa_offset 8
 610              		.cfi_offset 7, -8
 611              		.cfi_offset 14, -4
 612 029e 86B0     		sub	sp, sp, #24
 613              		.cfi_def_cfa_offset 32
 614 02a0 00AF     		add	r7, sp, #0
 615              		.cfi_def_cfa_register 7
 616 02a2 7860     		str	r0, [r7, #4]
 103:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****   float lo = 0, hi = n, mid;
 617              		.loc 1 103 0
 618 02a4 0023     		movs	r3, #0
 619 02a6 7B61     		str	r3, [r7, #20]
 620 02a8 7B68     		ldr	r3, [r7, #4]
 621 02aa 3B61     		str	r3, [r7, #16]
 622              	.LBB4:
 104:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****   for(int i = 0 ; i < 3 ; i++){
 623              		.loc 1 104 0
 624 02ac 0023     		movs	r3, #0
 625 02ae BB60     		str	r3, [r7, #8]
 626 02b0 2BE0     		b	.L36
 627              	.L43:
 105:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       mid = (lo+hi)/2;
 628              		.loc 1 105 0
 629 02b2 3969     		ldr	r1, [r7, #16]
 630 02b4 7869     		ldr	r0, [r7, #20]
 631 02b6 FFF7FEFF 		bl	__aeabi_fadd
 632              	.LVL17:
 633 02ba 031C     		adds	r3, r0, #0
 634 02bc 8021     		movs	r1, #128
 635 02be C905     		lsls	r1, r1, #23
 636 02c0 181C     		adds	r0, r3, #0
 637 02c2 FFF7FEFF 		bl	__aeabi_fdiv
 638              	.LVL18:
 639 02c6 031C     		adds	r3, r0, #0
 640 02c8 FB60     		str	r3, [r7, #12]
 106:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       if(mid*mid == n) return mid;
 641              		.loc 1 106 0
 642 02ca F968     		ldr	r1, [r7, #12]
 643 02cc F868     		ldr	r0, [r7, #12]
 644 02ce FFF7FEFF 		bl	__aeabi_fmul
 645              	.LVL19:
 646 02d2 031C     		adds	r3, r0, #0
 647 02d4 191C     		adds	r1, r3, #0
 648 02d6 7868     		ldr	r0, [r7, #4]
 649 02d8 FFF7FEFF 		bl	__aeabi_fcmpeq
 650              	.LVL20:
 651 02dc 031E     		subs	r3, r0, #0
 652 02de 01D0     		beq	.L46
 653              		.loc 1 106 0 is_stmt 0 discriminator 1
 654 02e0 FB68     		ldr	r3, [r7, #12]
 655 02e2 16E0     		b	.L39
 656              	.L46:
 107:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       if(mid*mid > n) hi = mid;
 657              		.loc 1 107 0 is_stmt 1
 658 02e4 F968     		ldr	r1, [r7, #12]
 659 02e6 F868     		ldr	r0, [r7, #12]
 660 02e8 FFF7FEFF 		bl	__aeabi_fmul
 661              	.LVL21:
 662 02ec 031C     		adds	r3, r0, #0
 663 02ee 191C     		adds	r1, r3, #0
 664 02f0 7868     		ldr	r0, [r7, #4]
 665 02f2 FFF7FEFF 		bl	__aeabi_fcmplt
 666              	.LVL22:
 667 02f6 031E     		subs	r3, r0, #0
 668 02f8 02D0     		beq	.L47
 669              		.loc 1 107 0 is_stmt 0 discriminator 1
 670 02fa FB68     		ldr	r3, [r7, #12]
 671 02fc 3B61     		str	r3, [r7, #16]
 672 02fe 01E0     		b	.L42
 673              	.L47:
 108:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       else lo = mid;
 674              		.loc 1 108 0 is_stmt 1
 675 0300 FB68     		ldr	r3, [r7, #12]
 676 0302 7B61     		str	r3, [r7, #20]
 677              	.L42:
 104:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       mid = (lo+hi)/2;
 678              		.loc 1 104 0 discriminator 2
 679 0304 BB68     		ldr	r3, [r7, #8]
 680 0306 0133     		adds	r3, r3, #1
 681 0308 BB60     		str	r3, [r7, #8]
 682              	.L36:
 104:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       mid = (lo+hi)/2;
 683              		.loc 1 104 0 is_stmt 0 discriminator 1
 684 030a BB68     		ldr	r3, [r7, #8]
 685 030c 022B     		cmp	r3, #2
 686 030e D0DD     		ble	.L43
 687              	.LBE4:
 109:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****   }
 110:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****   return mid;
 688              		.loc 1 110 0 is_stmt 1
 689 0310 FB68     		ldr	r3, [r7, #12]
 690              	.L39:
 111:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 691              		.loc 1 111 0
 692 0312 181C     		adds	r0, r3, #0
 693 0314 BD46     		mov	sp, r7
 694 0316 06B0     		add	sp, sp, #24
 695              		@ sp needed
 696 0318 80BD     		pop	{r7, pc}
 697              		.cfi_endproc
 698              	.LFE6:
 700              		.global	__aeabi_f2iz
 701              		.global	__aeabi_i2f
 702              		.global	__aeabi_fcmple
 703              		.global	__aeabi_f2d
 704              		.global	__aeabi_dmul
 705              		.global	__aeabi_dadd
 706              		.global	__aeabi_d2f
 707              		.align	1
 708              		.global	updateVel
 709              		.syntax unified
 710              		.code	16
 711              		.thumb_func
 712              		.fpu softvfp
 714              	updateVel:
 715              	.LFB7:
 112:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 113:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 114:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void updateVel(pBOID self) {
 716              		.loc 1 114 0
 717              		.cfi_startproc
 718              		@ args = 0, pretend = 0, frame = 120
 719              		@ frame_needed = 1, uses_anonymous_args = 0
 720 031a B0B5     		push	{r4, r5, r7, lr}
 721              		.cfi_def_cfa_offset 16
 722              		.cfi_offset 4, -16
 723              		.cfi_offset 5, -12
 724              		.cfi_offset 7, -8
 725              		.cfi_offset 14, -4
 726 031c 9EB0     		sub	sp, sp, #120
 727              		.cfi_def_cfa_offset 136
 728 031e 00AF     		add	r7, sp, #0
 729              		.cfi_def_cfa_register 7
 730 0320 F860     		str	r0, [r7, #12]
 115:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     int nearbyCount = 0;
 731              		.loc 1 115 0
 732 0322 0023     		movs	r3, #0
 733 0324 7B67     		str	r3, [r7, #116]
 116:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float sumXPos = 0, sumYPos = 0;
 734              		.loc 1 116 0
 735 0326 0023     		movs	r3, #0
 736 0328 3B67     		str	r3, [r7, #112]
 737 032a 0023     		movs	r3, #0
 738 032c FB66     		str	r3, [r7, #108]
 117:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float sumXVel = 0, sumYVel = 0;
 739              		.loc 1 117 0
 740 032e 0023     		movs	r3, #0
 741 0330 BB66     		str	r3, [r7, #104]
 742 0332 0023     		movs	r3, #0
 743 0334 BB64     		str	r3, [r7, #72]
 118:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dXSeparation = 0, dYSeparation = 0;
 744              		.loc 1 118 0
 745 0336 0023     		movs	r3, #0
 746 0338 7B66     		str	r3, [r7, #100]
 747 033a 0023     		movs	r3, #0
 748 033c 3B66     		str	r3, [r7, #96]
 749              	.LBB5:
 119:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 120:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 750              		.loc 1 120 0
 751 033e 0023     		movs	r3, #0
 752 0340 FB65     		str	r3, [r7, #92]
 753 0342 BBE0     		b	.L49
 754              	.L58:
 755              	.LBB6:
 121:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 756              		.loc 1 121 0
 757 0344 FA6D     		ldr	r2, [r7, #92]
 758 0346 1300     		movs	r3, r2
 759 0348 DB00     		lsls	r3, r3, #3
 760 034a 9B1A     		subs	r3, r3, r2
 761 034c 9B00     		lsls	r3, r3, #2
 762 034e 574A     		ldr	r2, .L74
 763 0350 9B18     		adds	r3, r3, r2
 764 0352 FB61     		str	r3, [r7, #28]
 122:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		float dx = other->x - self->x;
 765              		.loc 1 122 0
 766 0354 FB69     		ldr	r3, [r7, #28]
 767 0356 1A68     		ldr	r2, [r3]
 768 0358 FB68     		ldr	r3, [r7, #12]
 769 035a 1B68     		ldr	r3, [r3]
 770 035c 191C     		adds	r1, r3, #0
 771 035e 101C     		adds	r0, r2, #0
 772 0360 FFF7FEFF 		bl	__aeabi_fsub
 773              	.LVL23:
 774 0364 031C     		adds	r3, r0, #0
 775 0366 BB65     		str	r3, [r7, #88]
 123:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		float dy = other->y - self->y;
 776              		.loc 1 123 0
 777 0368 FB69     		ldr	r3, [r7, #28]
 778 036a 5A68     		ldr	r2, [r3, #4]
 779 036c FB68     		ldr	r3, [r7, #12]
 780 036e 5B68     		ldr	r3, [r3, #4]
 781 0370 191C     		adds	r1, r3, #0
 782 0372 101C     		adds	r0, r2, #0
 783 0374 FFF7FEFF 		bl	__aeabi_fsub
 784              	.LVL24:
 785 0378 031C     		adds	r3, r0, #0
 786 037a 7B65     		str	r3, [r7, #84]
 124:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		if (abs(dx) > 63) {
 787              		.loc 1 124 0
 788 037c B86D     		ldr	r0, [r7, #88]
 789 037e FFF7FEFF 		bl	__aeabi_f2iz
 790              	.LVL25:
 791 0382 0300     		movs	r3, r0
 792 0384 DA17     		asrs	r2, r3, #31
 793 0386 9B18     		adds	r3, r3, r2
 794 0388 5340     		eors	r3, r2
 795 038a 3F2B     		cmp	r3, #63
 796 038c 06DD     		ble	.L50
 125:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			dx = 128 - dx;
 797              		.loc 1 125 0
 798 038e B96D     		ldr	r1, [r7, #88]
 799 0390 8620     		movs	r0, #134
 800 0392 C005     		lsls	r0, r0, #23
 801 0394 FFF7FEFF 		bl	__aeabi_fsub
 802              	.LVL26:
 803 0398 031C     		adds	r3, r0, #0
 804 039a BB65     		str	r3, [r7, #88]
 805              	.L50:
 126:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
 127:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		if (abs(dy) > 31) {
 806              		.loc 1 127 0
 807 039c 786D     		ldr	r0, [r7, #84]
 808 039e FFF7FEFF 		bl	__aeabi_f2iz
 809              	.LVL27:
 810 03a2 0300     		movs	r3, r0
 811 03a4 DA17     		asrs	r2, r3, #31
 812 03a6 9B18     		adds	r3, r3, r2
 813 03a8 5340     		eors	r3, r2
 814 03aa 1F2B     		cmp	r3, #31
 815 03ac 06DD     		ble	.L51
 128:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			dy = 64 - dy;
 816              		.loc 1 128 0
 817 03ae 796D     		ldr	r1, [r7, #84]
 818 03b0 8520     		movs	r0, #133
 819 03b2 C005     		lsls	r0, r0, #23
 820 03b4 FFF7FEFF 		bl	__aeabi_fsub
 821              	.LVL28:
 822 03b8 031C     		adds	r3, r0, #0
 823 03ba 7B65     		str	r3, [r7, #84]
 824              	.L51:
 129:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
 130:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         float dSquared = dx * dx + dy * dy;
 825              		.loc 1 130 0
 826 03bc B96D     		ldr	r1, [r7, #88]
 827 03be B86D     		ldr	r0, [r7, #88]
 828 03c0 FFF7FEFF 		bl	__aeabi_fmul
 829              	.LVL29:
 830 03c4 031C     		adds	r3, r0, #0
 831 03c6 1C1C     		adds	r4, r3, #0
 832 03c8 796D     		ldr	r1, [r7, #84]
 833 03ca 786D     		ldr	r0, [r7, #84]
 834 03cc FFF7FEFF 		bl	__aeabi_fmul
 835              	.LVL30:
 836 03d0 031C     		adds	r3, r0, #0
 837 03d2 191C     		adds	r1, r3, #0
 838 03d4 201C     		adds	r0, r4, #0
 839 03d6 FFF7FEFF 		bl	__aeabi_fadd
 840              	.LVL31:
 841 03da 031C     		adds	r3, r0, #0
 842 03dc BB61     		str	r3, [r7, #24]
 131:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         if (dSquared > VIEW_DISTANCE * VIEW_DISTANCE) {
 843              		.loc 1 131 0
 844 03de 3449     		ldr	r1, .L74+4
 845 03e0 B869     		ldr	r0, [r7, #24]
 846 03e2 FFF7FEFF 		bl	__aeabi_fcmpgt
 847              	.LVL32:
 848 03e6 031E     		subs	r3, r0, #0
 849 03e8 5BD1     		bne	.L70
 132:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             continue;
 133:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 134:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		if (dSquared == 0) {
 850              		.loc 1 134 0
 851 03ea 0021     		movs	r1, #0
 852 03ec B869     		ldr	r0, [r7, #24]
 853 03ee FFF7FEFF 		bl	__aeabi_fcmpeq
 854              	.LVL33:
 855 03f2 031E     		subs	r3, r0, #0
 856 03f4 57D1     		bne	.L71
 135:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			continue;
 136:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
 137:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         if (self == other) {
 857              		.loc 1 137 0
 858 03f6 FA68     		ldr	r2, [r7, #12]
 859 03f8 FB69     		ldr	r3, [r7, #28]
 860 03fa 9A42     		cmp	r2, r3
 861 03fc 5AD0     		beq	.L72
 138:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             continue;
 139:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 140:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         nearbyCount++;
 862              		.loc 1 140 0
 863 03fe 7B6F     		ldr	r3, [r7, #116]
 864 0400 0133     		adds	r3, r3, #1
 865 0402 7B67     		str	r3, [r7, #116]
 141:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         
 142:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         // Cohesion
 143:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         sumXPos += self->x+dx;
 866              		.loc 1 143 0
 867 0404 FB68     		ldr	r3, [r7, #12]
 868 0406 1B68     		ldr	r3, [r3]
 869 0408 B96D     		ldr	r1, [r7, #88]
 870 040a 181C     		adds	r0, r3, #0
 871 040c FFF7FEFF 		bl	__aeabi_fadd
 872              	.LVL34:
 873 0410 031C     		adds	r3, r0, #0
 874 0412 191C     		adds	r1, r3, #0
 875 0414 386F     		ldr	r0, [r7, #112]
 876 0416 FFF7FEFF 		bl	__aeabi_fadd
 877              	.LVL35:
 878 041a 031C     		adds	r3, r0, #0
 879 041c 3B67     		str	r3, [r7, #112]
 144:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         sumYPos += self->y+dy;
 880              		.loc 1 144 0
 881 041e FB68     		ldr	r3, [r7, #12]
 882 0420 5B68     		ldr	r3, [r3, #4]
 883 0422 796D     		ldr	r1, [r7, #84]
 884 0424 181C     		adds	r0, r3, #0
 885 0426 FFF7FEFF 		bl	__aeabi_fadd
 886              	.LVL36:
 887 042a 031C     		adds	r3, r0, #0
 888 042c 191C     		adds	r1, r3, #0
 889 042e F86E     		ldr	r0, [r7, #108]
 890 0430 FFF7FEFF 		bl	__aeabi_fadd
 891              	.LVL37:
 892 0434 031C     		adds	r3, r0, #0
 893 0436 FB66     		str	r3, [r7, #108]
 145:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         
 146:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         // Alignment
 147:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         sumXVel += other->xVel;
 894              		.loc 1 147 0
 895 0438 FB69     		ldr	r3, [r7, #28]
 896 043a 9B68     		ldr	r3, [r3, #8]
 897 043c 191C     		adds	r1, r3, #0
 898 043e B86E     		ldr	r0, [r7, #104]
 899 0440 FFF7FEFF 		bl	__aeabi_fadd
 900              	.LVL38:
 901 0444 031C     		adds	r3, r0, #0
 902 0446 BB66     		str	r3, [r7, #104]
 148:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         sumXVel += other->yVel;
 903              		.loc 1 148 0
 904 0448 FB69     		ldr	r3, [r7, #28]
 905 044a DB68     		ldr	r3, [r3, #12]
 906 044c 191C     		adds	r1, r3, #0
 907 044e B86E     		ldr	r0, [r7, #104]
 908 0450 FFF7FEFF 		bl	__aeabi_fadd
 909              	.LVL39:
 910 0454 031C     		adds	r3, r0, #0
 911 0456 BB66     		str	r3, [r7, #104]
 149:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         
 150:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         // Separation
 151:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		float d = root(dSquared);
 912              		.loc 1 151 0
 913 0458 BB69     		ldr	r3, [r7, #24]
 914 045a 181C     		adds	r0, r3, #0
 915 045c FFF7FEFF 		bl	root
 916 0460 031C     		adds	r3, r0, #0
 917 0462 7B61     		str	r3, [r7, #20]
 152:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         dXSeparation += (-dx) / d;
 918              		.loc 1 152 0
 919 0464 BB6D     		ldr	r3, [r7, #88]
 920 0466 8022     		movs	r2, #128
 921 0468 1206     		lsls	r2, r2, #24
 922 046a 5340     		eors	r3, r2
 923 046c 7969     		ldr	r1, [r7, #20]
 924 046e 181C     		adds	r0, r3, #0
 925 0470 FFF7FEFF 		bl	__aeabi_fdiv
 926              	.LVL40:
 927 0474 031C     		adds	r3, r0, #0
 928 0476 191C     		adds	r1, r3, #0
 929 0478 786E     		ldr	r0, [r7, #100]
 930 047a FFF7FEFF 		bl	__aeabi_fadd
 931              	.LVL41:
 932 047e 031C     		adds	r3, r0, #0
 933 0480 7B66     		str	r3, [r7, #100]
 153:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         dYSeparation += (-dy) / d;
 934              		.loc 1 153 0
 935 0482 7B6D     		ldr	r3, [r7, #84]
 936 0484 8022     		movs	r2, #128
 937 0486 1206     		lsls	r2, r2, #24
 938 0488 5340     		eors	r3, r2
 939 048a 7969     		ldr	r1, [r7, #20]
 940 048c 181C     		adds	r0, r3, #0
 941 048e FFF7FEFF 		bl	__aeabi_fdiv
 942              	.LVL42:
 943 0492 031C     		adds	r3, r0, #0
 944 0494 191C     		adds	r1, r3, #0
 945 0496 386E     		ldr	r0, [r7, #96]
 946 0498 FFF7FEFF 		bl	__aeabi_fadd
 947              	.LVL43:
 948 049c 031C     		adds	r3, r0, #0
 949 049e 3B66     		str	r3, [r7, #96]
 950 04a0 09E0     		b	.L54
 951              	.L70:
 132:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 952              		.loc 1 132 0
 953 04a2 C046     		nop
 954 04a4 07E0     		b	.L54
 955              	.L71:
 135:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
 956              		.loc 1 135 0
 957 04a6 C046     		nop
 958 04a8 05E0     		b	.L54
 959              	.L75:
 960 04aa C046     		.align	2
 961              	.L74:
 962 04ac 00040000 		.word	boids
 963 04b0 00006143 		.word	1130430464
 964              	.L72:
 138:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 965              		.loc 1 138 0
 966 04b4 C046     		nop
 967              	.L54:
 968              	.LBE6:
 120:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 969              		.loc 1 120 0 discriminator 2
 970 04b6 FB6D     		ldr	r3, [r7, #92]
 971 04b8 0133     		adds	r3, r3, #1
 972 04ba FB65     		str	r3, [r7, #92]
 973              	.L49:
 120:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 974              		.loc 1 120 0 is_stmt 0 discriminator 1
 975 04bc FB6D     		ldr	r3, [r7, #92]
 976 04be 632B     		cmp	r3, #99
 977 04c0 00DC     		bgt	.LCB792
 978 04c2 3FE7     		b	.L58	@long jump
 979              	.LCB792:
 980              	.LBE5:
 154:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     }
 155:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 156:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	float dx = ball.x - self->x;
 981              		.loc 1 156 0 is_stmt 1
 982 04c4 EA4B     		ldr	r3, .L76
 983 04c6 1B68     		ldr	r3, [r3]
 984 04c8 1800     		movs	r0, r3
 985 04ca FFF7FEFF 		bl	__aeabi_i2f
 986              	.LVL44:
 987 04ce 021C     		adds	r2, r0, #0
 988 04d0 FB68     		ldr	r3, [r7, #12]
 989 04d2 1B68     		ldr	r3, [r3]
 990 04d4 191C     		adds	r1, r3, #0
 991 04d6 101C     		adds	r0, r2, #0
 992 04d8 FFF7FEFF 		bl	__aeabi_fsub
 993              	.LVL45:
 994 04dc 031C     		adds	r3, r0, #0
 995 04de 3B65     		str	r3, [r7, #80]
 157:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	float dy = ball.y - self->y;
 996              		.loc 1 157 0
 997 04e0 E34B     		ldr	r3, .L76
 998 04e2 5B68     		ldr	r3, [r3, #4]
 999 04e4 1800     		movs	r0, r3
 1000 04e6 FFF7FEFF 		bl	__aeabi_i2f
 1001              	.LVL46:
 1002 04ea 021C     		adds	r2, r0, #0
 1003 04ec FB68     		ldr	r3, [r7, #12]
 1004 04ee 5B68     		ldr	r3, [r3, #4]
 1005 04f0 191C     		adds	r1, r3, #0
 1006 04f2 101C     		adds	r0, r2, #0
 1007 04f4 FFF7FEFF 		bl	__aeabi_fsub
 1008              	.LVL47:
 1009 04f8 031C     		adds	r3, r0, #0
 1010 04fa FB64     		str	r3, [r7, #76]
 158:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	if (abs(dx) > 63) {
 1011              		.loc 1 158 0
 1012 04fc 386D     		ldr	r0, [r7, #80]
 1013 04fe FFF7FEFF 		bl	__aeabi_f2iz
 1014              	.LVL48:
 1015 0502 0300     		movs	r3, r0
 1016 0504 DA17     		asrs	r2, r3, #31
 1017 0506 9B18     		adds	r3, r3, r2
 1018 0508 5340     		eors	r3, r2
 1019 050a 3F2B     		cmp	r3, #63
 1020 050c 06DD     		ble	.L59
 159:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		dx = 128 - dx;
 1021              		.loc 1 159 0
 1022 050e 396D     		ldr	r1, [r7, #80]
 1023 0510 8620     		movs	r0, #134
 1024 0512 C005     		lsls	r0, r0, #23
 1025 0514 FFF7FEFF 		bl	__aeabi_fsub
 1026              	.LVL49:
 1027 0518 031C     		adds	r3, r0, #0
 1028 051a 3B65     		str	r3, [r7, #80]
 1029              	.L59:
 160:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 161:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	if (abs(dy) > 31) {
 1030              		.loc 1 161 0
 1031 051c F86C     		ldr	r0, [r7, #76]
 1032 051e FFF7FEFF 		bl	__aeabi_f2iz
 1033              	.LVL50:
 1034 0522 0300     		movs	r3, r0
 1035 0524 DA17     		asrs	r2, r3, #31
 1036 0526 9B18     		adds	r3, r3, r2
 1037 0528 5340     		eors	r3, r2
 1038 052a 1F2B     		cmp	r3, #31
 1039 052c 06DD     		ble	.L60
 162:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		dy = 64 - dy;
 1040              		.loc 1 162 0
 1041 052e F96C     		ldr	r1, [r7, #76]
 1042 0530 8520     		movs	r0, #133
 1043 0532 C005     		lsls	r0, r0, #23
 1044 0534 FFF7FEFF 		bl	__aeabi_fsub
 1045              	.LVL51:
 1046 0538 031C     		adds	r3, r0, #0
 1047 053a FB64     		str	r3, [r7, #76]
 1048              	.L60:
 163:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 164:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	float dSquared = dx * dx + dy * dy;
 1049              		.loc 1 164 0
 1050 053c 396D     		ldr	r1, [r7, #80]
 1051 053e 386D     		ldr	r0, [r7, #80]
 1052 0540 FFF7FEFF 		bl	__aeabi_fmul
 1053              	.LVL52:
 1054 0544 031C     		adds	r3, r0, #0
 1055 0546 1C1C     		adds	r4, r3, #0
 1056 0548 F96C     		ldr	r1, [r7, #76]
 1057 054a F86C     		ldr	r0, [r7, #76]
 1058 054c FFF7FEFF 		bl	__aeabi_fmul
 1059              	.LVL53:
 1060 0550 031C     		adds	r3, r0, #0
 1061 0552 191C     		adds	r1, r3, #0
 1062 0554 201C     		adds	r0, r4, #0
 1063 0556 FFF7FEFF 		bl	__aeabi_fadd
 1064              	.LVL54:
 1065 055a 031C     		adds	r3, r0, #0
 1066 055c 7B64     		str	r3, [r7, #68]
 165:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	if (dSquared <= VIEW_DISTANCE * VIEW_DISTANCE) {
 1067              		.loc 1 165 0
 1068 055e C549     		ldr	r1, .L76+4
 1069 0560 786C     		ldr	r0, [r7, #68]
 1070 0562 FFF7FEFF 		bl	__aeabi_fcmple
 1071              	.LVL55:
 1072 0566 031E     		subs	r3, r0, #0
 1073 0568 30D0     		beq	.L61
 1074              	.LBB7:
 166:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		float d = root(dSquared);
 1075              		.loc 1 166 0
 1076 056a 7B6C     		ldr	r3, [r7, #68]
 1077 056c 181C     		adds	r0, r3, #0
 1078 056e FFF7FEFF 		bl	root
 1079 0572 031C     		adds	r3, r0, #0
 1080 0574 3B64     		str	r3, [r7, #64]
 167:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		dXSeparation += ((-dx) / d)*BALL_FORCE;
 1081              		.loc 1 167 0
 1082 0576 3B6D     		ldr	r3, [r7, #80]
 1083 0578 8022     		movs	r2, #128
 1084 057a 1206     		lsls	r2, r2, #24
 1085 057c 5340     		eors	r3, r2
 1086 057e 396C     		ldr	r1, [r7, #64]
 1087 0580 181C     		adds	r0, r3, #0
 1088 0582 FFF7FEFF 		bl	__aeabi_fdiv
 1089              	.LVL56:
 1090 0586 031C     		adds	r3, r0, #0
 1091 0588 BB49     		ldr	r1, .L76+8
 1092 058a 181C     		adds	r0, r3, #0
 1093 058c FFF7FEFF 		bl	__aeabi_fmul
 1094              	.LVL57:
 1095 0590 031C     		adds	r3, r0, #0
 1096 0592 191C     		adds	r1, r3, #0
 1097 0594 786E     		ldr	r0, [r7, #100]
 1098 0596 FFF7FEFF 		bl	__aeabi_fadd
 1099              	.LVL58:
 1100 059a 031C     		adds	r3, r0, #0
 1101 059c 7B66     		str	r3, [r7, #100]
 168:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		dYSeparation += ((-dy) / d)*BALL_FORCE;
 1102              		.loc 1 168 0
 1103 059e FB6C     		ldr	r3, [r7, #76]
 1104 05a0 8022     		movs	r2, #128
 1105 05a2 1206     		lsls	r2, r2, #24
 1106 05a4 5340     		eors	r3, r2
 1107 05a6 396C     		ldr	r1, [r7, #64]
 1108 05a8 181C     		adds	r0, r3, #0
 1109 05aa FFF7FEFF 		bl	__aeabi_fdiv
 1110              	.LVL59:
 1111 05ae 031C     		adds	r3, r0, #0
 1112 05b0 B149     		ldr	r1, .L76+8
 1113 05b2 181C     		adds	r0, r3, #0
 1114 05b4 FFF7FEFF 		bl	__aeabi_fmul
 1115              	.LVL60:
 1116 05b8 031C     		adds	r3, r0, #0
 1117 05ba 191C     		adds	r1, r3, #0
 1118 05bc 386E     		ldr	r0, [r7, #96]
 1119 05be FFF7FEFF 		bl	__aeabi_fadd
 1120              	.LVL61:
 1121 05c2 031C     		adds	r3, r0, #0
 1122 05c4 3B66     		str	r3, [r7, #96]
 169:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		nearbyCount++;
 1123              		.loc 1 169 0
 1124 05c6 7B6F     		ldr	r3, [r7, #116]
 1125 05c8 0133     		adds	r3, r3, #1
 1126 05ca 7B67     		str	r3, [r7, #116]
 1127              	.L61:
 1128              	.LBE7:
 170:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 171:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 172:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 173:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 174:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	if (nearbyCount == 0) {
 1129              		.loc 1 174 0
 1130 05cc 7B6F     		ldr	r3, [r7, #116]
 1131 05ce 002B     		cmp	r3, #0
 1132 05d0 00D1     		bne	.LCB918
 1133 05d2 65E1     		b	.L73	@long jump
 1134              	.LCB918:
 175:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		return;
 176:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 177:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 178:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     // Cohesion
 179:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float avgXPos = sumXPos / nearbyCount;
 1135              		.loc 1 179 0
 1136 05d4 786F     		ldr	r0, [r7, #116]
 1137 05d6 FFF7FEFF 		bl	__aeabi_i2f
 1138              	.LVL62:
 1139 05da 031C     		adds	r3, r0, #0
 1140 05dc 191C     		adds	r1, r3, #0
 1141 05de 386F     		ldr	r0, [r7, #112]
 1142 05e0 FFF7FEFF 		bl	__aeabi_fdiv
 1143              	.LVL63:
 1144 05e4 031C     		adds	r3, r0, #0
 1145 05e6 FB63     		str	r3, [r7, #60]
 180:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float avgYPos = sumYPos / nearbyCount;
 1146              		.loc 1 180 0
 1147 05e8 786F     		ldr	r0, [r7, #116]
 1148 05ea FFF7FEFF 		bl	__aeabi_i2f
 1149              	.LVL64:
 1150 05ee 031C     		adds	r3, r0, #0
 1151 05f0 191C     		adds	r1, r3, #0
 1152 05f2 F86E     		ldr	r0, [r7, #108]
 1153 05f4 FFF7FEFF 		bl	__aeabi_fdiv
 1154              	.LVL65:
 1155 05f8 031C     		adds	r3, r0, #0
 1156 05fa BB63     		str	r3, [r7, #56]
 181:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 182:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dXCohesion = avgXPos - self->x;
 1157              		.loc 1 182 0
 1158 05fc FB68     		ldr	r3, [r7, #12]
 1159 05fe 1B68     		ldr	r3, [r3]
 1160 0600 191C     		adds	r1, r3, #0
 1161 0602 F86B     		ldr	r0, [r7, #60]
 1162 0604 FFF7FEFF 		bl	__aeabi_fsub
 1163              	.LVL66:
 1164 0608 031C     		adds	r3, r0, #0
 1165 060a 7B63     		str	r3, [r7, #52]
 183:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dYCohesion = avgYPos - self->y;
 1166              		.loc 1 183 0
 1167 060c FB68     		ldr	r3, [r7, #12]
 1168 060e 5B68     		ldr	r3, [r3, #4]
 1169 0610 191C     		adds	r1, r3, #0
 1170 0612 B86B     		ldr	r0, [r7, #56]
 1171 0614 FFF7FEFF 		bl	__aeabi_fsub
 1172              	.LVL67:
 1173 0618 031C     		adds	r3, r0, #0
 1174 061a 3B63     		str	r3, [r7, #48]
 184:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 185:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     // Alignment
 186:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float avgXVel = sumXVel / nearbyCount;
 1175              		.loc 1 186 0
 1176 061c 786F     		ldr	r0, [r7, #116]
 1177 061e FFF7FEFF 		bl	__aeabi_i2f
 1178              	.LVL68:
 1179 0622 031C     		adds	r3, r0, #0
 1180 0624 191C     		adds	r1, r3, #0
 1181 0626 B86E     		ldr	r0, [r7, #104]
 1182 0628 FFF7FEFF 		bl	__aeabi_fdiv
 1183              	.LVL69:
 1184 062c 031C     		adds	r3, r0, #0
 1185 062e FB62     		str	r3, [r7, #44]
 187:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float avgYVel = sumYVel / nearbyCount;
 1186              		.loc 1 187 0
 1187 0630 786F     		ldr	r0, [r7, #116]
 1188 0632 FFF7FEFF 		bl	__aeabi_i2f
 1189              	.LVL70:
 1190 0636 031C     		adds	r3, r0, #0
 1191 0638 191C     		adds	r1, r3, #0
 1192 063a B86C     		ldr	r0, [r7, #72]
 1193 063c FFF7FEFF 		bl	__aeabi_fdiv
 1194              	.LVL71:
 1195 0640 031C     		adds	r3, r0, #0
 1196 0642 BB62     		str	r3, [r7, #40]
 188:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 189:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dXAlignment = avgXVel - self->xVel;
 1197              		.loc 1 189 0
 1198 0644 FB68     		ldr	r3, [r7, #12]
 1199 0646 9B68     		ldr	r3, [r3, #8]
 1200 0648 191C     		adds	r1, r3, #0
 1201 064a F86A     		ldr	r0, [r7, #44]
 1202 064c FFF7FEFF 		bl	__aeabi_fsub
 1203              	.LVL72:
 1204 0650 031C     		adds	r3, r0, #0
 1205 0652 7B62     		str	r3, [r7, #36]
 190:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dYAlignment = avgYVel - self->yVel;
 1206              		.loc 1 190 0
 1207 0654 FB68     		ldr	r3, [r7, #12]
 1208 0656 DB68     		ldr	r3, [r3, #12]
 1209 0658 191C     		adds	r1, r3, #0
 1210 065a B86A     		ldr	r0, [r7, #40]
 1211 065c FFF7FEFF 		bl	__aeabi_fsub
 1212              	.LVL73:
 1213 0660 031C     		adds	r3, r0, #0
 1214 0662 3B62     		str	r3, [r7, #32]
 191:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 192:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     // Calculate new acceleration for the Boid
 193:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     self->xVel += dXSeparation * SEPARATION_BIAS + dXCohesion * COHESION_BIAS + dXAlignment * ALIGN
 1215              		.loc 1 193 0
 1216 0664 FB68     		ldr	r3, [r7, #12]
 1217 0666 9B68     		ldr	r3, [r3, #8]
 1218 0668 181C     		adds	r0, r3, #0
 1219 066a FFF7FEFF 		bl	__aeabi_f2d
 1220              	.LVL74:
 1221 066e 0400     		movs	r4, r0
 1222 0670 0D00     		movs	r5, r1
 1223 0672 786E     		ldr	r0, [r7, #100]
 1224 0674 FFF7FEFF 		bl	__aeabi_f2d
 1225              	.LVL75:
 1226 0678 804A     		ldr	r2, .L76+12
 1227 067a 814B     		ldr	r3, .L76+16
 1228 067c FFF7FEFF 		bl	__aeabi_dmul
 1229              	.LVL76:
 1230 0680 0200     		movs	r2, r0
 1231 0682 0B00     		movs	r3, r1
 1232 0684 3A60     		str	r2, [r7]
 1233 0686 7B60     		str	r3, [r7, #4]
 1234 0688 786B     		ldr	r0, [r7, #52]
 1235 068a FFF7FEFF 		bl	__aeabi_f2d
 1236              	.LVL77:
 1237 068e 7B4A     		ldr	r2, .L76+12
 1238 0690 7C4B     		ldr	r3, .L76+20
 1239 0692 FFF7FEFF 		bl	__aeabi_dmul
 1240              	.LVL78:
 1241 0696 0200     		movs	r2, r0
 1242 0698 0B00     		movs	r3, r1
 1243 069a 3868     		ldr	r0, [r7]
 1244 069c 7968     		ldr	r1, [r7, #4]
 1245 069e FFF7FEFF 		bl	__aeabi_dadd
 1246              	.LVL79:
 1247 06a2 0200     		movs	r2, r0
 1248 06a4 0B00     		movs	r3, r1
 1249 06a6 3A60     		str	r2, [r7]
 1250 06a8 7B60     		str	r3, [r7, #4]
 1251 06aa 786A     		ldr	r0, [r7, #36]
 1252 06ac FFF7FEFF 		bl	__aeabi_f2d
 1253              	.LVL80:
 1254 06b0 754A     		ldr	r2, .L76+24
 1255 06b2 764B     		ldr	r3, .L76+28
 1256 06b4 FFF7FEFF 		bl	__aeabi_dmul
 1257              	.LVL81:
 1258 06b8 0200     		movs	r2, r0
 1259 06ba 0B00     		movs	r3, r1
 1260 06bc 3868     		ldr	r0, [r7]
 1261 06be 7968     		ldr	r1, [r7, #4]
 1262 06c0 FFF7FEFF 		bl	__aeabi_dadd
 1263              	.LVL82:
 1264 06c4 0200     		movs	r2, r0
 1265 06c6 0B00     		movs	r3, r1
 1266 06c8 2000     		movs	r0, r4
 1267 06ca 2900     		movs	r1, r5
 1268 06cc FFF7FEFF 		bl	__aeabi_dadd
 1269              	.LVL83:
 1270 06d0 0300     		movs	r3, r0
 1271 06d2 0C00     		movs	r4, r1
 1272 06d4 1800     		movs	r0, r3
 1273 06d6 2100     		movs	r1, r4
 1274 06d8 FFF7FEFF 		bl	__aeabi_d2f
 1275              	.LVL84:
 1276 06dc 021C     		adds	r2, r0, #0
 1277 06de FB68     		ldr	r3, [r7, #12]
 1278 06e0 9A60     		str	r2, [r3, #8]
 194:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     self->yVel += dYSeparation * SEPARATION_BIAS + dYCohesion * COHESION_BIAS + dYAlignment * ALIGN
 1279              		.loc 1 194 0
 1280 06e2 FB68     		ldr	r3, [r7, #12]
 1281 06e4 DB68     		ldr	r3, [r3, #12]
 1282 06e6 181C     		adds	r0, r3, #0
 1283 06e8 FFF7FEFF 		bl	__aeabi_f2d
 1284              	.LVL85:
 1285 06ec 0400     		movs	r4, r0
 1286 06ee 0D00     		movs	r5, r1
 1287 06f0 386E     		ldr	r0, [r7, #96]
 1288 06f2 FFF7FEFF 		bl	__aeabi_f2d
 1289              	.LVL86:
 1290 06f6 614A     		ldr	r2, .L76+12
 1291 06f8 614B     		ldr	r3, .L76+16
 1292 06fa FFF7FEFF 		bl	__aeabi_dmul
 1293              	.LVL87:
 1294 06fe 0200     		movs	r2, r0
 1295 0700 0B00     		movs	r3, r1
 1296 0702 3A60     		str	r2, [r7]
 1297 0704 7B60     		str	r3, [r7, #4]
 1298 0706 386B     		ldr	r0, [r7, #48]
 1299 0708 FFF7FEFF 		bl	__aeabi_f2d
 1300              	.LVL88:
 1301 070c 5B4A     		ldr	r2, .L76+12
 1302 070e 5D4B     		ldr	r3, .L76+20
 1303 0710 FFF7FEFF 		bl	__aeabi_dmul
 1304              	.LVL89:
 1305 0714 0200     		movs	r2, r0
 1306 0716 0B00     		movs	r3, r1
 1307 0718 3868     		ldr	r0, [r7]
 1308 071a 7968     		ldr	r1, [r7, #4]
 1309 071c FFF7FEFF 		bl	__aeabi_dadd
 1310              	.LVL90:
 1311 0720 0200     		movs	r2, r0
 1312 0722 0B00     		movs	r3, r1
 1313 0724 3A60     		str	r2, [r7]
 1314 0726 7B60     		str	r3, [r7, #4]
 1315 0728 386A     		ldr	r0, [r7, #32]
 1316 072a FFF7FEFF 		bl	__aeabi_f2d
 1317              	.LVL91:
 1318 072e 564A     		ldr	r2, .L76+24
 1319 0730 564B     		ldr	r3, .L76+28
 1320 0732 FFF7FEFF 		bl	__aeabi_dmul
 1321              	.LVL92:
 1322 0736 0200     		movs	r2, r0
 1323 0738 0B00     		movs	r3, r1
 1324 073a 3868     		ldr	r0, [r7]
 1325 073c 7968     		ldr	r1, [r7, #4]
 1326 073e FFF7FEFF 		bl	__aeabi_dadd
 1327              	.LVL93:
 1328 0742 0200     		movs	r2, r0
 1329 0744 0B00     		movs	r3, r1
 1330 0746 2000     		movs	r0, r4
 1331 0748 2900     		movs	r1, r5
 1332 074a FFF7FEFF 		bl	__aeabi_dadd
 1333              	.LVL94:
 1334 074e 0300     		movs	r3, r0
 1335 0750 0C00     		movs	r4, r1
 1336 0752 1800     		movs	r0, r3
 1337 0754 2100     		movs	r1, r4
 1338 0756 FFF7FEFF 		bl	__aeabi_d2f
 1339              	.LVL95:
 1340 075a 021C     		adds	r2, r0, #0
 1341 075c FB68     		ldr	r3, [r7, #12]
 1342 075e DA60     		str	r2, [r3, #12]
 195:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 196:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->xVel * self->xVel + self->yVel * self->yVel > MAX_SPEED * MAX_SPEED) {
 1343              		.loc 1 196 0
 1344 0760 23E0     		b	.L65
 1345              	.L66:
 197:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->xVel *= 0.9;
 1346              		.loc 1 197 0
 1347 0762 FB68     		ldr	r3, [r7, #12]
 1348 0764 9B68     		ldr	r3, [r3, #8]
 1349 0766 181C     		adds	r0, r3, #0
 1350 0768 FFF7FEFF 		bl	__aeabi_f2d
 1351              	.LVL96:
 1352 076c 484A     		ldr	r2, .L76+32
 1353 076e 494B     		ldr	r3, .L76+36
 1354 0770 FFF7FEFF 		bl	__aeabi_dmul
 1355              	.LVL97:
 1356 0774 0300     		movs	r3, r0
 1357 0776 0C00     		movs	r4, r1
 1358 0778 1800     		movs	r0, r3
 1359 077a 2100     		movs	r1, r4
 1360 077c FFF7FEFF 		bl	__aeabi_d2f
 1361              	.LVL98:
 1362 0780 021C     		adds	r2, r0, #0
 1363 0782 FB68     		ldr	r3, [r7, #12]
 1364 0784 9A60     		str	r2, [r3, #8]
 198:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->yVel *= 0.9;
 1365              		.loc 1 198 0
 1366 0786 FB68     		ldr	r3, [r7, #12]
 1367 0788 DB68     		ldr	r3, [r3, #12]
 1368 078a 181C     		adds	r0, r3, #0
 1369 078c FFF7FEFF 		bl	__aeabi_f2d
 1370              	.LVL99:
 1371 0790 3F4A     		ldr	r2, .L76+32
 1372 0792 404B     		ldr	r3, .L76+36
 1373 0794 FFF7FEFF 		bl	__aeabi_dmul
 1374              	.LVL100:
 1375 0798 0300     		movs	r3, r0
 1376 079a 0C00     		movs	r4, r1
 1377 079c 1800     		movs	r0, r3
 1378 079e 2100     		movs	r1, r4
 1379 07a0 FFF7FEFF 		bl	__aeabi_d2f
 1380              	.LVL101:
 1381 07a4 021C     		adds	r2, r0, #0
 1382 07a6 FB68     		ldr	r3, [r7, #12]
 1383 07a8 DA60     		str	r2, [r3, #12]
 1384              	.L65:
 196:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->xVel *= 0.9;
 1385              		.loc 1 196 0
 1386 07aa FB68     		ldr	r3, [r7, #12]
 1387 07ac 9A68     		ldr	r2, [r3, #8]
 1388 07ae FB68     		ldr	r3, [r7, #12]
 1389 07b0 9B68     		ldr	r3, [r3, #8]
 1390 07b2 191C     		adds	r1, r3, #0
 1391 07b4 101C     		adds	r0, r2, #0
 1392 07b6 FFF7FEFF 		bl	__aeabi_fmul
 1393              	.LVL102:
 1394 07ba 031C     		adds	r3, r0, #0
 1395 07bc 1C1C     		adds	r4, r3, #0
 1396 07be FB68     		ldr	r3, [r7, #12]
 1397 07c0 DA68     		ldr	r2, [r3, #12]
 1398 07c2 FB68     		ldr	r3, [r7, #12]
 1399 07c4 DB68     		ldr	r3, [r3, #12]
 1400 07c6 191C     		adds	r1, r3, #0
 1401 07c8 101C     		adds	r0, r2, #0
 1402 07ca FFF7FEFF 		bl	__aeabi_fmul
 1403              	.LVL103:
 1404 07ce 031C     		adds	r3, r0, #0
 1405 07d0 191C     		adds	r1, r3, #0
 1406 07d2 201C     		adds	r0, r4, #0
 1407 07d4 FFF7FEFF 		bl	__aeabi_fadd
 1408              	.LVL104:
 1409 07d8 031C     		adds	r3, r0, #0
 1410 07da 2F49     		ldr	r1, .L76+40
 1411 07dc 181C     		adds	r0, r3, #0
 1412 07de FFF7FEFF 		bl	__aeabi_fcmpgt
 1413              	.LVL105:
 1414 07e2 031E     		subs	r3, r0, #0
 1415 07e4 BDD1     		bne	.L66
 199:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 200:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->xVel * self->xVel + self->yVel * self->yVel < MIN_SPEED * MIN_SPEED) {
 1416              		.loc 1 200 0
 1417 07e6 23E0     		b	.L67
 1418              	.L68:
 201:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->xVel *= 1.1;
 1419              		.loc 1 201 0
 1420 07e8 FB68     		ldr	r3, [r7, #12]
 1421 07ea 9B68     		ldr	r3, [r3, #8]
 1422 07ec 181C     		adds	r0, r3, #0
 1423 07ee FFF7FEFF 		bl	__aeabi_f2d
 1424              	.LVL106:
 1425 07f2 224A     		ldr	r2, .L76+12
 1426 07f4 294B     		ldr	r3, .L76+44
 1427 07f6 FFF7FEFF 		bl	__aeabi_dmul
 1428              	.LVL107:
 1429 07fa 0300     		movs	r3, r0
 1430 07fc 0C00     		movs	r4, r1
 1431 07fe 1800     		movs	r0, r3
 1432 0800 2100     		movs	r1, r4
 1433 0802 FFF7FEFF 		bl	__aeabi_d2f
 1434              	.LVL108:
 1435 0806 021C     		adds	r2, r0, #0
 1436 0808 FB68     		ldr	r3, [r7, #12]
 1437 080a 9A60     		str	r2, [r3, #8]
 202:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->yVel *= 1.1;
 1438              		.loc 1 202 0
 1439 080c FB68     		ldr	r3, [r7, #12]
 1440 080e DB68     		ldr	r3, [r3, #12]
 1441 0810 181C     		adds	r0, r3, #0
 1442 0812 FFF7FEFF 		bl	__aeabi_f2d
 1443              	.LVL109:
 1444 0816 194A     		ldr	r2, .L76+12
 1445 0818 204B     		ldr	r3, .L76+44
 1446 081a FFF7FEFF 		bl	__aeabi_dmul
 1447              	.LVL110:
 1448 081e 0300     		movs	r3, r0
 1449 0820 0C00     		movs	r4, r1
 1450 0822 1800     		movs	r0, r3
 1451 0824 2100     		movs	r1, r4
 1452 0826 FFF7FEFF 		bl	__aeabi_d2f
 1453              	.LVL111:
 1454 082a 021C     		adds	r2, r0, #0
 1455 082c FB68     		ldr	r3, [r7, #12]
 1456 082e DA60     		str	r2, [r3, #12]
 1457              	.L67:
 200:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->xVel *= 1.1;
 1458              		.loc 1 200 0
 1459 0830 FB68     		ldr	r3, [r7, #12]
 1460 0832 9A68     		ldr	r2, [r3, #8]
 1461 0834 FB68     		ldr	r3, [r7, #12]
 1462 0836 9B68     		ldr	r3, [r3, #8]
 1463 0838 191C     		adds	r1, r3, #0
 1464 083a 101C     		adds	r0, r2, #0
 1465 083c FFF7FEFF 		bl	__aeabi_fmul
 1466              	.LVL112:
 1467 0840 031C     		adds	r3, r0, #0
 1468 0842 1C1C     		adds	r4, r3, #0
 1469 0844 FB68     		ldr	r3, [r7, #12]
 1470 0846 DA68     		ldr	r2, [r3, #12]
 1471 0848 FB68     		ldr	r3, [r7, #12]
 1472 084a DB68     		ldr	r3, [r3, #12]
 1473 084c 191C     		adds	r1, r3, #0
 1474 084e 101C     		adds	r0, r2, #0
 1475 0850 FFF7FEFF 		bl	__aeabi_fmul
 1476              	.LVL113:
 1477 0854 031C     		adds	r3, r0, #0
 1478 0856 191C     		adds	r1, r3, #0
 1479 0858 201C     		adds	r0, r4, #0
 1480 085a FFF7FEFF 		bl	__aeabi_fadd
 1481              	.LVL114:
 1482 085e 031C     		adds	r3, r0, #0
 1483 0860 FE21     		movs	r1, #254
 1484 0862 8905     		lsls	r1, r1, #22
 1485 0864 181C     		adds	r0, r3, #0
 1486 0866 FFF7FEFF 		bl	__aeabi_fcmplt
 1487              	.LVL115:
 1488 086a 031E     		subs	r3, r0, #0
 1489 086c BCD1     		bne	.L68
 1490 086e 18E0     		b	.L48
 1491              	.L77:
 1492              		.align	2
 1493              	.L76:
 1494 0870 00000000 		.word	ball
 1495 0874 00006143 		.word	1130430464
 1496 0878 00004842 		.word	1112014848
 1497 087c 9A999999 		.word	-1717986918
 1498 0880 9999A93F 		.word	1068079513
 1499 0884 9999B93F 		.word	1069128089
 1500 0888 1F85EB51 		.word	1374389535
 1501 088c B81ED53F 		.word	1070931640
 1502 0890 CDCCCCCC 		.word	-858993459
 1503 0894 CCCCEC3F 		.word	1072483532
 1504 0898 00004443 		.word	1128529920
 1505 089c 9999F13F 		.word	1072798105
 1506              	.L73:
 175:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 1507              		.loc 1 175 0
 1508 08a0 C046     		nop
 1509              	.L48:
 203:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 204:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 1510              		.loc 1 204 0
 1511 08a2 BD46     		mov	sp, r7
 1512 08a4 1EB0     		add	sp, sp, #120
 1513              		@ sp needed
 1514 08a6 B0BD     		pop	{r4, r5, r7, pc}
 1515              		.cfi_endproc
 1516              	.LFE7:
 1518              		.global	__aeabi_i2d
 1519              		.global	__aeabi_dsub
 1520              		.global	__aeabi_idivmod
 1521              		.align	1
 1522              		.global	createBoids
 1523              		.syntax unified
 1524              		.code	16
 1525              		.thumb_func
 1526              		.fpu softvfp
 1528              	createBoids:
 1529              	.LFB8:
 205:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 206:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void createBoids() {
 1530              		.loc 1 206 0
 1531              		.cfi_startproc
 1532              		@ args = 0, pretend = 0, frame = 8
 1533              		@ frame_needed = 1, uses_anonymous_args = 0
 1534 08a8 F0B5     		push	{r4, r5, r6, r7, lr}
 1535              		.cfi_def_cfa_offset 20
 1536              		.cfi_offset 4, -20
 1537              		.cfi_offset 5, -16
 1538              		.cfi_offset 6, -12
 1539              		.cfi_offset 7, -8
 1540              		.cfi_offset 14, -4
 1541 08aa 83B0     		sub	sp, sp, #12
 1542              		.cfi_def_cfa_offset 32
 1543 08ac 00AF     		add	r7, sp, #0
 1544              		.cfi_def_cfa_register 7
 1545              	.LBB8:
 207:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 1546              		.loc 1 207 0
 1547 08ae 0023     		movs	r3, #0
 1548 08b0 7B60     		str	r3, [r7, #4]
 1549 08b2 93E0     		b	.L79
 1550              	.L81:
 208:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         //boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
 209:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         boids[i] = (BOID) { 
 210:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .x = (i * 105 + 10.0), 
 1551              		.loc 1 210 0 discriminator 3
 1552 08b4 7A68     		ldr	r2, [r7, #4]
 1553 08b6 1300     		movs	r3, r2
 1554 08b8 DB00     		lsls	r3, r3, #3
 1555 08ba 9B1A     		subs	r3, r3, r2
 1556 08bc 1A01     		lsls	r2, r3, #4
 1557 08be D31A     		subs	r3, r2, r3
 1558 08c0 1800     		movs	r0, r3
 1559 08c2 FFF7FEFF 		bl	__aeabi_i2d
 1560              	.LVL116:
 1561 08c6 0022     		movs	r2, #0
 1562 08c8 484B     		ldr	r3, .L82
 1563 08ca FFF7FEFF 		bl	__aeabi_dadd
 1564              	.LVL117:
 1565 08ce 0300     		movs	r3, r0
 1566 08d0 0C00     		movs	r4, r1
 1567 08d2 1800     		movs	r0, r3
 1568 08d4 2100     		movs	r1, r4
 1569 08d6 FFF7FEFF 		bl	__aeabi_d2f
 1570              	.LVL118:
 1571 08da 061C     		adds	r6, r0, #0
 211:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .y = (i * 10 + 10.0), 
 1572              		.loc 1 211 0 discriminator 3
 1573 08dc 7A68     		ldr	r2, [r7, #4]
 1574 08de 1300     		movs	r3, r2
 1575 08e0 9B00     		lsls	r3, r3, #2
 1576 08e2 9B18     		adds	r3, r3, r2
 1577 08e4 5B00     		lsls	r3, r3, #1
 1578 08e6 1800     		movs	r0, r3
 1579 08e8 FFF7FEFF 		bl	__aeabi_i2d
 1580              	.LVL119:
 1581 08ec 0022     		movs	r2, #0
 1582 08ee 3F4B     		ldr	r3, .L82
 1583 08f0 FFF7FEFF 		bl	__aeabi_dadd
 1584              	.LVL120:
 1585 08f4 0300     		movs	r3, r0
 1586 08f6 0C00     		movs	r4, r1
 1587 08f8 1800     		movs	r0, r3
 1588 08fa 2100     		movs	r1, r4
 1589 08fc FFF7FEFF 		bl	__aeabi_d2f
 1590              	.LVL121:
 1591 0900 051C     		adds	r5, r0, #0
 212:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .xVel = (i%2)-0.5,
 1592              		.loc 1 212 0 discriminator 3
 1593 0902 7B68     		ldr	r3, [r7, #4]
 1594 0904 3A4A     		ldr	r2, .L82+4
 1595 0906 1340     		ands	r3, r2
 1596 0908 04D5     		bpl	.L80
 1597 090a 013B     		subs	r3, r3, #1
 1598 090c 0222     		movs	r2, #2
 1599 090e 5242     		rsbs	r2, r2, #0
 1600 0910 1343     		orrs	r3, r2
 1601 0912 0133     		adds	r3, r3, #1
 1602              	.L80:
 1603 0914 1800     		movs	r0, r3
 1604 0916 FFF7FEFF 		bl	__aeabi_i2d
 1605              	.LVL122:
 1606 091a 0022     		movs	r2, #0
 1607 091c 354B     		ldr	r3, .L82+8
 1608 091e FFF7FEFF 		bl	__aeabi_dsub
 1609              	.LVL123:
 1610 0922 0300     		movs	r3, r0
 1611 0924 0C00     		movs	r4, r1
 1612 0926 1800     		movs	r0, r3
 1613 0928 2100     		movs	r1, r4
 1614 092a FFF7FEFF 		bl	__aeabi_d2f
 1615              	.LVL124:
 1616 092e 041C     		adds	r4, r0, #0
 213:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .yVel = (i%3)-0.75,
 1617              		.loc 1 213 0 discriminator 3
 1618 0930 7B68     		ldr	r3, [r7, #4]
 1619 0932 0321     		movs	r1, #3
 1620 0934 1800     		movs	r0, r3
 1621 0936 FFF7FEFF 		bl	__aeabi_idivmod
 1622              	.LVL125:
 1623 093a 0B00     		movs	r3, r1
 1624 093c 1800     		movs	r0, r3
 1625 093e FFF7FEFF 		bl	__aeabi_i2d
 1626              	.LVL126:
 1627 0942 0022     		movs	r2, #0
 1628 0944 2C4B     		ldr	r3, .L82+12
 1629 0946 FFF7FEFF 		bl	__aeabi_dsub
 1630              	.LVL127:
 1631 094a 0200     		movs	r2, r0
 1632 094c 0B00     		movs	r3, r1
 1633 094e 1000     		movs	r0, r2
 1634 0950 1900     		movs	r1, r3
 1635 0952 FFF7FEFF 		bl	__aeabi_d2f
 1636              	.LVL128:
 209:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .x = (i * 105 + 10.0), 
 1637              		.loc 1 209 0 discriminator 3
 1638 0956 2949     		ldr	r1, .L82+16
 1639 0958 7A68     		ldr	r2, [r7, #4]
 1640 095a 1300     		movs	r3, r2
 1641 095c DB00     		lsls	r3, r3, #3
 1642 095e 9B1A     		subs	r3, r3, r2
 1643 0960 9B00     		lsls	r3, r3, #2
 1644 0962 5E50     		str	r6, [r3, r1]
 1645 0964 2549     		ldr	r1, .L82+16
 1646 0966 7A68     		ldr	r2, [r7, #4]
 1647 0968 1300     		movs	r3, r2
 1648 096a DB00     		lsls	r3, r3, #3
 1649 096c 9B1A     		subs	r3, r3, r2
 1650 096e 9B00     		lsls	r3, r3, #2
 1651 0970 CB18     		adds	r3, r1, r3
 1652 0972 0433     		adds	r3, r3, #4
 1653 0974 1D60     		str	r5, [r3]
 1654 0976 2149     		ldr	r1, .L82+16
 1655 0978 7A68     		ldr	r2, [r7, #4]
 1656 097a 1300     		movs	r3, r2
 1657 097c DB00     		lsls	r3, r3, #3
 1658 097e 9B1A     		subs	r3, r3, r2
 1659 0980 9B00     		lsls	r3, r3, #2
 1660 0982 CB18     		adds	r3, r1, r3
 1661 0984 0833     		adds	r3, r3, #8
 1662 0986 1C60     		str	r4, [r3]
 1663 0988 1C49     		ldr	r1, .L82+16
 1664 098a 7A68     		ldr	r2, [r7, #4]
 1665 098c 1300     		movs	r3, r2
 1666 098e DB00     		lsls	r3, r3, #3
 1667 0990 9B1A     		subs	r3, r3, r2
 1668 0992 9B00     		lsls	r3, r3, #2
 1669 0994 CB18     		adds	r3, r1, r3
 1670 0996 0C33     		adds	r3, r3, #12
 1671 0998 1860     		str	r0, [r3]
 1672 099a 1849     		ldr	r1, .L82+16
 1673 099c 7A68     		ldr	r2, [r7, #4]
 1674 099e 1300     		movs	r3, r2
 1675 09a0 DB00     		lsls	r3, r3, #3
 1676 09a2 9B1A     		subs	r3, r3, r2
 1677 09a4 9B00     		lsls	r3, r3, #2
 1678 09a6 CB18     		adds	r3, r1, r3
 1679 09a8 1033     		adds	r3, r3, #16
 1680 09aa 154A     		ldr	r2, .L82+20
 1681 09ac 1A60     		str	r2, [r3]
 1682 09ae 1349     		ldr	r1, .L82+16
 1683 09b0 7A68     		ldr	r2, [r7, #4]
 1684 09b2 1300     		movs	r3, r2
 1685 09b4 DB00     		lsls	r3, r3, #3
 1686 09b6 9B1A     		subs	r3, r3, r2
 1687 09b8 9B00     		lsls	r3, r3, #2
 1688 09ba CB18     		adds	r3, r1, r3
 1689 09bc 1433     		adds	r3, r3, #20
 1690 09be 114A     		ldr	r2, .L82+24
 1691 09c0 1A60     		str	r2, [r3]
 1692 09c2 0E49     		ldr	r1, .L82+16
 1693 09c4 7A68     		ldr	r2, [r7, #4]
 1694 09c6 1300     		movs	r3, r2
 1695 09c8 DB00     		lsls	r3, r3, #3
 1696 09ca 9B1A     		subs	r3, r3, r2
 1697 09cc 9B00     		lsls	r3, r3, #2
 1698 09ce CB18     		adds	r3, r1, r3
 1699 09d0 1833     		adds	r3, r3, #24
 1700 09d2 0D4A     		ldr	r2, .L82+28
 1701 09d4 1A60     		str	r2, [r3]
 207:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         //boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
 1702              		.loc 1 207 0 discriminator 3
 1703 09d6 7B68     		ldr	r3, [r7, #4]
 1704 09d8 0133     		adds	r3, r3, #1
 1705 09da 7B60     		str	r3, [r7, #4]
 1706              	.L79:
 207:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         //boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
 1707              		.loc 1 207 0 is_stmt 0 discriminator 1
 1708 09dc 7B68     		ldr	r3, [r7, #4]
 1709 09de 632B     		cmp	r3, #99
 1710 09e0 00DC     		bgt	.LCB1405
 1711 09e2 67E7     		b	.L81	@long jump
 1712              	.LCB1405:
 1713              	.LBE8:
 214:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             draw,
 215:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             updatePos,
 216:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             updateVel
 217:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         };
 218:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     }
 219:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 1714              		.loc 1 219 0 is_stmt 1
 1715 09e4 C046     		nop
 1716 09e6 BD46     		mov	sp, r7
 1717 09e8 03B0     		add	sp, sp, #12
 1718              		@ sp needed
 1719 09ea F0BD     		pop	{r4, r5, r6, r7, pc}
 1720              	.L83:
 1721              		.align	2
 1722              	.L82:
 1723 09ec 00002440 		.word	1076101120
 1724 09f0 01000080 		.word	-2147483647
 1725 09f4 0000E03F 		.word	1071644672
 1726 09f8 0000E83F 		.word	1072168960
 1727 09fc 00040000 		.word	boids
 1728 0a00 00000000 		.word	draw
 1729 0a04 00000000 		.word	updatePos
 1730 0a08 00000000 		.word	updateVel
 1731              		.cfi_endproc
 1732              	.LFE8:
 1734              		.align	1
 1735              		.global	main
 1736              		.syntax unified
 1737              		.code	16
 1738              		.thumb_func
 1739              		.fpu softvfp
 1741              	main:
 1742              	.LFB9:
 220:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 221:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 222:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void main(void) {
 1743              		.loc 1 222 0
 1744              		.cfi_startproc
 1745              		@ args = 0, pretend = 0, frame = 8
 1746              		@ frame_needed = 1, uses_anonymous_args = 0
 1747 0a0c 80B5     		push	{r7, lr}
 1748              		.cfi_def_cfa_offset 8
 1749              		.cfi_offset 7, -8
 1750              		.cfi_offset 14, -4
 1751 0a0e 82B0     		sub	sp, sp, #8
 1752              		.cfi_def_cfa_offset 16
 1753 0a10 00AF     		add	r7, sp, #0
 1754              		.cfi_def_cfa_register 7
 223:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	init();
 1755              		.loc 1 223 0
 1756 0a12 FFF7FEFF 		bl	init
 224:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 225:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	clear_buffer();
 1757              		.loc 1 225 0
 1758 0a16 FFF7FEFF 		bl	clear_buffer
 226:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #ifndef SIMULATOR
 227:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	draw_buffer();
 1759              		.loc 1 227 0
 1760 0a1a FFF7FEFF 		bl	draw_buffer
 228:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #endif
 229:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	createBoids();
 1761              		.loc 1 229 0
 1762 0a1e FFF7FEFF 		bl	createBoids
 1763              	.L90:
 1764              	.LBB9:
 230:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 231:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     while (1) {
 232:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		clear_buffer();
 1765              		.loc 1 232 0
 1766 0a22 FFF7FEFF 		bl	clear_buffer
 233:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		if (keyb() == 0x0D) {
 1767              		.loc 1 233 0
 1768 0a26 FFF7FEFF 		bl	keyb
 1769 0a2a 0300     		movs	r3, r0
 1770 0a2c 0D2B     		cmp	r3, #13
 1771 0a2e 01D1     		bne	.L85
 234:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			createBoids();
 1772              		.loc 1 234 0
 1773 0a30 FFF7FEFF 		bl	createBoids
 1774              	.L85:
 235:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
 236:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		updateBall();
 1775              		.loc 1 236 0
 1776 0a34 FFF7FEFF 		bl	updateBall
 1777              	.LBB10:
 237:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1778              		.loc 1 237 0
 1779 0a38 0023     		movs	r3, #0
 1780 0a3a 7B60     		str	r3, [r7, #4]
 1781 0a3c 14E0     		b	.L86
 1782              	.L87:
 238:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			boids[i].updateVel(&boids[i]);
 1783              		.loc 1 238 0 discriminator 3
 1784 0a3e 2649     		ldr	r1, .L91
 1785 0a40 7A68     		ldr	r2, [r7, #4]
 1786 0a42 1300     		movs	r3, r2
 1787 0a44 DB00     		lsls	r3, r3, #3
 1788 0a46 9B1A     		subs	r3, r3, r2
 1789 0a48 9B00     		lsls	r3, r3, #2
 1790 0a4a CB18     		adds	r3, r1, r3
 1791 0a4c 1833     		adds	r3, r3, #24
 1792 0a4e 1968     		ldr	r1, [r3]
 1793 0a50 7A68     		ldr	r2, [r7, #4]
 1794 0a52 1300     		movs	r3, r2
 1795 0a54 DB00     		lsls	r3, r3, #3
 1796 0a56 9B1A     		subs	r3, r3, r2
 1797 0a58 9B00     		lsls	r3, r3, #2
 1798 0a5a 1F4A     		ldr	r2, .L91
 1799 0a5c 9B18     		adds	r3, r3, r2
 1800 0a5e 1800     		movs	r0, r3
 1801 0a60 8847     		blx	r1
 1802              	.LVL129:
 237:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1803              		.loc 1 237 0 discriminator 3
 1804 0a62 7B68     		ldr	r3, [r7, #4]
 1805 0a64 0133     		adds	r3, r3, #1
 1806 0a66 7B60     		str	r3, [r7, #4]
 1807              	.L86:
 237:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1808              		.loc 1 237 0 is_stmt 0 discriminator 1
 1809 0a68 7B68     		ldr	r3, [r7, #4]
 1810 0a6a 632B     		cmp	r3, #99
 1811 0a6c E7DD     		ble	.L87
 1812              	.LBE10:
 239:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 240:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		drawBall();
 1813              		.loc 1 240 0 is_stmt 1
 1814 0a6e FFF7FEFF 		bl	drawBall
 1815              	.LBB11:
 241:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1816              		.loc 1 241 0
 1817 0a72 0023     		movs	r3, #0
 1818 0a74 3B60     		str	r3, [r7]
 1819 0a76 26E0     		b	.L88
 1820              	.L89:
 242:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 1821              		.loc 1 242 0 discriminator 3
 1822 0a78 1749     		ldr	r1, .L91
 1823 0a7a 3A68     		ldr	r2, [r7]
 1824 0a7c 1300     		movs	r3, r2
 1825 0a7e DB00     		lsls	r3, r3, #3
 1826 0a80 9B1A     		subs	r3, r3, r2
 1827 0a82 9B00     		lsls	r3, r3, #2
 1828 0a84 CB18     		adds	r3, r1, r3
 1829 0a86 1433     		adds	r3, r3, #20
 1830 0a88 1968     		ldr	r1, [r3]
 1831 0a8a 3A68     		ldr	r2, [r7]
 1832 0a8c 1300     		movs	r3, r2
 1833 0a8e DB00     		lsls	r3, r3, #3
 1834 0a90 9B1A     		subs	r3, r3, r2
 1835 0a92 9B00     		lsls	r3, r3, #2
 1836 0a94 104A     		ldr	r2, .L91
 1837 0a96 9B18     		adds	r3, r3, r2
 1838 0a98 1800     		movs	r0, r3
 1839 0a9a 8847     		blx	r1
 1840              	.LVL130:
 243:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             boids[i].draw(&boids[i]);
 1841              		.loc 1 243 0 discriminator 3
 1842 0a9c 0E49     		ldr	r1, .L91
 1843 0a9e 3A68     		ldr	r2, [r7]
 1844 0aa0 1300     		movs	r3, r2
 1845 0aa2 DB00     		lsls	r3, r3, #3
 1846 0aa4 9B1A     		subs	r3, r3, r2
 1847 0aa6 9B00     		lsls	r3, r3, #2
 1848 0aa8 CB18     		adds	r3, r1, r3
 1849 0aaa 1033     		adds	r3, r3, #16
 1850 0aac 1968     		ldr	r1, [r3]
 1851 0aae 3A68     		ldr	r2, [r7]
 1852 0ab0 1300     		movs	r3, r2
 1853 0ab2 DB00     		lsls	r3, r3, #3
 1854 0ab4 9B1A     		subs	r3, r3, r2
 1855 0ab6 9B00     		lsls	r3, r3, #2
 1856 0ab8 074A     		ldr	r2, .L91
 1857 0aba 9B18     		adds	r3, r3, r2
 1858 0abc 1800     		movs	r0, r3
 1859 0abe 8847     		blx	r1
 1860              	.LVL131:
 241:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1861              		.loc 1 241 0 discriminator 3
 1862 0ac0 3B68     		ldr	r3, [r7]
 1863 0ac2 0133     		adds	r3, r3, #1
 1864 0ac4 3B60     		str	r3, [r7]
 1865              	.L88:
 241:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1866              		.loc 1 241 0 is_stmt 0 discriminator 1
 1867 0ac6 3B68     		ldr	r3, [r7]
 1868 0ac8 632B     		cmp	r3, #99
 1869 0aca D5DD     		ble	.L89
 1870              	.LBE11:
 244:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 245:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         
 246:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         draw_buffer();
 1871              		.loc 1 246 0 is_stmt 1
 1872 0acc FFF7FEFF 		bl	draw_buffer
 247:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		delay_milli(2);
 1873              		.loc 1 247 0
 1874 0ad0 0220     		movs	r0, #2
 1875 0ad2 FFF7FEFF 		bl	delay_milli
 1876              	.LBE9:
 231:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		clear_buffer();
 1877              		.loc 1 231 0
 1878 0ad6 A4E7     		b	.L90
 1879              	.L92:
 1880              		.align	2
 1881              	.L91:
 1882 0ad8 00040000 		.word	boids
 1883              		.cfi_endproc
 1884              	.LFE9:
 1886              	.Letext0:
 1887              		.file 2 "C:/Users/oskargi/Downloads/boids/Boids-Simulation/drivers.h"
 1888              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 1889              		.file 4 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 1890              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\7.2.1\\include\\stddef.h"
 1891              		.file 6 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
