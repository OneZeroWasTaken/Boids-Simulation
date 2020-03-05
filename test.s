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
  12:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** //#define SIMULATOR
  13:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  14:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define BOID_COUNT 100
  15:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define VIEW_DISTANCE 15
  16:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  17:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define ALIGNMENT_BIAS 0.008
  18:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define COHESION_BIAS 0.1
  19:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define SEPARATION_BIAS 0.06
  20:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #define MAX_SPEED 4
  21:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  22:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** typedef struct tBoid {
  23:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	float x, y;
  24:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	float xVel, yVel;
  25:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
  26:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     void (* draw) (struct tBoid *);
  27:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     void (* updatePos) (struct tBoid *);
  28:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     void (* updateVel) (struct tBoid *);
  29:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** } BOID, *pBOID;
  30:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  31:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** float squaredDistance(pBOID one, pBOID two) {
  77              		.loc 1 31 0
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
  32:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float xD = two->x - one->x;
  91              		.loc 1 32 0
  92 000a 3B68     		ldr	r3, [r7]
  93 000c 1A68     		ldr	r2, [r3]
  94 000e 7B68     		ldr	r3, [r7, #4]
  95 0010 1B68     		ldr	r3, [r3]
  96 0012 191C     		adds	r1, r3, #0
  97 0014 101C     		adds	r0, r2, #0
  98 0016 FFF7FEFF 		bl	__aeabi_fsub
  99              	.LVL0:
 100 001a 031C     		adds	r3, r0, #0
 101 001c FB60     		str	r3, [r7, #12]
  33:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float yD = two->y - one->y;
 102              		.loc 1 33 0
 103 001e 3B68     		ldr	r3, [r7]
 104 0020 5A68     		ldr	r2, [r3, #4]
 105 0022 7B68     		ldr	r3, [r7, #4]
 106 0024 5B68     		ldr	r3, [r3, #4]
 107 0026 191C     		adds	r1, r3, #0
 108 0028 101C     		adds	r0, r2, #0
 109 002a FFF7FEFF 		bl	__aeabi_fsub
 110              	.LVL1:
 111 002e 031C     		adds	r3, r0, #0
 112 0030 BB60     		str	r3, [r7, #8]
  34:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     return xD * xD + yD + yD;
 113              		.loc 1 34 0
 114 0032 F968     		ldr	r1, [r7, #12]
 115 0034 F868     		ldr	r0, [r7, #12]
 116 0036 FFF7FEFF 		bl	__aeabi_fmul
 117              	.LVL2:
 118 003a 031C     		adds	r3, r0, #0
 119 003c B968     		ldr	r1, [r7, #8]
 120 003e 181C     		adds	r0, r3, #0
 121 0040 FFF7FEFF 		bl	__aeabi_fadd
 122              	.LVL3:
 123 0044 031C     		adds	r3, r0, #0
 124 0046 B968     		ldr	r1, [r7, #8]
 125 0048 181C     		adds	r0, r3, #0
 126 004a FFF7FEFF 		bl	__aeabi_fadd
 127              	.LVL4:
 128 004e 031C     		adds	r3, r0, #0
  35:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 129              		.loc 1 35 0
 130 0050 181C     		adds	r0, r3, #0
 131 0052 BD46     		mov	sp, r7
 132 0054 04B0     		add	sp, sp, #16
 133              		@ sp needed
 134 0056 80BD     		pop	{r7, pc}
 135              		.cfi_endproc
 136              	.LFE1:
 138              		.bss
 139              		.align	2
 140              	boids:
 141 0400 00000000 		.space	2800
 141      00000000 
 141      00000000 
 141      00000000 
 141      00000000 
 143              		.global	__aeabi_f2uiz
 144              		.text
 145              		.align	1
 146              		.global	draw
 147              		.syntax unified
 148              		.code	16
 149              		.thumb_func
 150              		.fpu softvfp
 152              	draw:
 153              	.LFB2:
  36:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  37:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  38:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** static BOID boids[BOID_COUNT];
  39:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  40:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void draw(pBOID self) {
 154              		.loc 1 40 0
 155              		.cfi_startproc
 156              		@ args = 0, pretend = 0, frame = 8
 157              		@ frame_needed = 1, uses_anonymous_args = 0
 158 0058 90B5     		push	{r4, r7, lr}
 159              		.cfi_def_cfa_offset 12
 160              		.cfi_offset 4, -12
 161              		.cfi_offset 7, -8
 162              		.cfi_offset 14, -4
 163 005a 83B0     		sub	sp, sp, #12
 164              		.cfi_def_cfa_offset 24
 165 005c 00AF     		add	r7, sp, #0
 166              		.cfi_def_cfa_register 7
 167 005e 7860     		str	r0, [r7, #4]
  41:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     pixel((uint8_t) self->x, (uint8_t) self->y, 1);
 168              		.loc 1 41 0
 169 0060 7B68     		ldr	r3, [r7, #4]
 170 0062 1B68     		ldr	r3, [r3]
 171 0064 181C     		adds	r0, r3, #0
 172 0066 FFF7FEFF 		bl	__aeabi_f2uiz
 173              	.LVL5:
 174 006a 0300     		movs	r3, r0
 175 006c DCB2     		uxtb	r4, r3
 176 006e 7B68     		ldr	r3, [r7, #4]
 177 0070 5B68     		ldr	r3, [r3, #4]
 178 0072 181C     		adds	r0, r3, #0
 179 0074 FFF7FEFF 		bl	__aeabi_f2uiz
 180              	.LVL6:
 181 0078 0300     		movs	r3, r0
 182 007a DBB2     		uxtb	r3, r3
 183 007c 0122     		movs	r2, #1
 184 007e 1900     		movs	r1, r3
 185 0080 2000     		movs	r0, r4
 186 0082 FFF7FEFF 		bl	pixel
  42:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     //old_pixel((uint8_t) self->x, (uint8_t) self->y, 1);
  43:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 187              		.loc 1 43 0
 188 0086 C046     		nop
 189 0088 BD46     		mov	sp, r7
 190 008a 03B0     		add	sp, sp, #12
 191              		@ sp needed
 192 008c 90BD     		pop	{r4, r7, pc}
 193              		.cfi_endproc
 194              	.LFE2:
 196              		.global	__aeabi_fcmplt
 197              		.global	__aeabi_fcmpgt
 198              		.align	1
 199              		.global	updatePos
 200              		.syntax unified
 201              		.code	16
 202              		.thumb_func
 203              		.fpu softvfp
 205              	updatePos:
 206              	.LFB3:
  44:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  45:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void updatePos(pBOID self) {
 207              		.loc 1 45 0
 208              		.cfi_startproc
 209              		@ args = 0, pretend = 0, frame = 8
 210              		@ frame_needed = 1, uses_anonymous_args = 0
 211 008e 80B5     		push	{r7, lr}
 212              		.cfi_def_cfa_offset 8
 213              		.cfi_offset 7, -8
 214              		.cfi_offset 14, -4
 215 0090 82B0     		sub	sp, sp, #8
 216              		.cfi_def_cfa_offset 16
 217 0092 00AF     		add	r7, sp, #0
 218              		.cfi_def_cfa_register 7
 219 0094 7860     		str	r0, [r7, #4]
  46:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     self->x += self->xVel;
 220              		.loc 1 46 0
 221 0096 7B68     		ldr	r3, [r7, #4]
 222 0098 1A68     		ldr	r2, [r3]
 223 009a 7B68     		ldr	r3, [r7, #4]
 224 009c 9B68     		ldr	r3, [r3, #8]
 225 009e 191C     		adds	r1, r3, #0
 226 00a0 101C     		adds	r0, r2, #0
 227 00a2 FFF7FEFF 		bl	__aeabi_fadd
 228              	.LVL7:
 229 00a6 031C     		adds	r3, r0, #0
 230 00a8 1A1C     		adds	r2, r3, #0
 231 00aa 7B68     		ldr	r3, [r7, #4]
 232 00ac 1A60     		str	r2, [r3]
  47:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     self->y += self->yVel;
 233              		.loc 1 47 0
 234 00ae 7B68     		ldr	r3, [r7, #4]
 235 00b0 5A68     		ldr	r2, [r3, #4]
 236 00b2 7B68     		ldr	r3, [r7, #4]
 237 00b4 DB68     		ldr	r3, [r3, #12]
 238 00b6 191C     		adds	r1, r3, #0
 239 00b8 101C     		adds	r0, r2, #0
 240 00ba FFF7FEFF 		bl	__aeabi_fadd
 241              	.LVL8:
 242 00be 031C     		adds	r3, r0, #0
 243 00c0 1A1C     		adds	r2, r3, #0
 244 00c2 7B68     		ldr	r3, [r7, #4]
 245 00c4 5A60     		str	r2, [r3, #4]
  48:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->x < 0) {
 246              		.loc 1 48 0
 247 00c6 0AE0     		b	.L6
 248              	.L7:
  49:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->x += 128;
 249              		.loc 1 49 0
 250 00c8 7B68     		ldr	r3, [r7, #4]
 251 00ca 1B68     		ldr	r3, [r3]
 252 00cc 8621     		movs	r1, #134
 253 00ce C905     		lsls	r1, r1, #23
 254 00d0 181C     		adds	r0, r3, #0
 255 00d2 FFF7FEFF 		bl	__aeabi_fadd
 256              	.LVL9:
 257 00d6 031C     		adds	r3, r0, #0
 258 00d8 1A1C     		adds	r2, r3, #0
 259 00da 7B68     		ldr	r3, [r7, #4]
 260 00dc 1A60     		str	r2, [r3]
 261              	.L6:
  48:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->x < 0) {
 262              		.loc 1 48 0
 263 00de 7B68     		ldr	r3, [r7, #4]
 264 00e0 1B68     		ldr	r3, [r3]
 265 00e2 0021     		movs	r1, #0
 266 00e4 181C     		adds	r0, r3, #0
 267 00e6 FFF7FEFF 		bl	__aeabi_fcmplt
 268              	.LVL10:
 269 00ea 031E     		subs	r3, r0, #0
 270 00ec ECD1     		bne	.L7
  50:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  51:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->x > 127) {
 271              		.loc 1 51 0
 272 00ee 0AE0     		b	.L8
 273              	.L9:
  52:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->x -= 128;
 274              		.loc 1 52 0
 275 00f0 7B68     		ldr	r3, [r7, #4]
 276 00f2 1B68     		ldr	r3, [r3]
 277 00f4 8621     		movs	r1, #134
 278 00f6 C905     		lsls	r1, r1, #23
 279 00f8 181C     		adds	r0, r3, #0
 280 00fa FFF7FEFF 		bl	__aeabi_fsub
 281              	.LVL11:
 282 00fe 031C     		adds	r3, r0, #0
 283 0100 1A1C     		adds	r2, r3, #0
 284 0102 7B68     		ldr	r3, [r7, #4]
 285 0104 1A60     		str	r2, [r3]
 286              	.L8:
  51:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->x -= 128;
 287              		.loc 1 51 0
 288 0106 7B68     		ldr	r3, [r7, #4]
 289 0108 1B68     		ldr	r3, [r3]
 290 010a 1949     		ldr	r1, .L14
 291 010c 181C     		adds	r0, r3, #0
 292 010e FFF7FEFF 		bl	__aeabi_fcmpgt
 293              	.LVL12:
 294 0112 031E     		subs	r3, r0, #0
 295 0114 ECD1     		bne	.L9
  53:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  54:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->y < 0) {
 296              		.loc 1 54 0
 297 0116 0AE0     		b	.L10
 298              	.L11:
  55:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->y += 64;
 299              		.loc 1 55 0
 300 0118 7B68     		ldr	r3, [r7, #4]
 301 011a 5B68     		ldr	r3, [r3, #4]
 302 011c 8521     		movs	r1, #133
 303 011e C905     		lsls	r1, r1, #23
 304 0120 181C     		adds	r0, r3, #0
 305 0122 FFF7FEFF 		bl	__aeabi_fadd
 306              	.LVL13:
 307 0126 031C     		adds	r3, r0, #0
 308 0128 1A1C     		adds	r2, r3, #0
 309 012a 7B68     		ldr	r3, [r7, #4]
 310 012c 5A60     		str	r2, [r3, #4]
 311              	.L10:
  54:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->y += 64;
 312              		.loc 1 54 0
 313 012e 7B68     		ldr	r3, [r7, #4]
 314 0130 5B68     		ldr	r3, [r3, #4]
 315 0132 0021     		movs	r1, #0
 316 0134 181C     		adds	r0, r3, #0
 317 0136 FFF7FEFF 		bl	__aeabi_fcmplt
 318              	.LVL14:
 319 013a 031E     		subs	r3, r0, #0
 320 013c ECD1     		bne	.L11
  56:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  57:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->y > 63) {
 321              		.loc 1 57 0
 322 013e 0AE0     		b	.L12
 323              	.L13:
  58:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->y -= 64;
 324              		.loc 1 58 0
 325 0140 7B68     		ldr	r3, [r7, #4]
 326 0142 5B68     		ldr	r3, [r3, #4]
 327 0144 8521     		movs	r1, #133
 328 0146 C905     		lsls	r1, r1, #23
 329 0148 181C     		adds	r0, r3, #0
 330 014a FFF7FEFF 		bl	__aeabi_fsub
 331              	.LVL15:
 332 014e 031C     		adds	r3, r0, #0
 333 0150 1A1C     		adds	r2, r3, #0
 334 0152 7B68     		ldr	r3, [r7, #4]
 335 0154 5A60     		str	r2, [r3, #4]
 336              	.L12:
  57:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->y -= 64;
 337              		.loc 1 57 0
 338 0156 7B68     		ldr	r3, [r7, #4]
 339 0158 5B68     		ldr	r3, [r3, #4]
 340 015a 0649     		ldr	r1, .L14+4
 341 015c 181C     		adds	r0, r3, #0
 342 015e FFF7FEFF 		bl	__aeabi_fcmpgt
 343              	.LVL16:
 344 0162 031E     		subs	r3, r0, #0
 345 0164 ECD1     		bne	.L13
  59:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
  60:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 346              		.loc 1 60 0
 347 0166 C046     		nop
 348 0168 BD46     		mov	sp, r7
 349 016a 02B0     		add	sp, sp, #8
 350              		@ sp needed
 351 016c 80BD     		pop	{r7, pc}
 352              	.L15:
 353 016e C046     		.align	2
 354              	.L14:
 355 0170 0000FE42 		.word	1123942400
 356 0174 00007C42 		.word	1115422720
 357              		.cfi_endproc
 358              	.LFE3:
 360              		.global	__aeabi_fdiv
 361              		.global	__aeabi_fcmpeq
 362              		.align	1
 363              		.global	root
 364              		.syntax unified
 365              		.code	16
 366              		.thumb_func
 367              		.fpu softvfp
 369              	root:
 370              	.LFB4:
  61:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  62:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** float root(float n){
 371              		.loc 1 62 0
 372              		.cfi_startproc
 373              		@ args = 0, pretend = 0, frame = 24
 374              		@ frame_needed = 1, uses_anonymous_args = 0
 375 0178 80B5     		push	{r7, lr}
 376              		.cfi_def_cfa_offset 8
 377              		.cfi_offset 7, -8
 378              		.cfi_offset 14, -4
 379 017a 86B0     		sub	sp, sp, #24
 380              		.cfi_def_cfa_offset 32
 381 017c 00AF     		add	r7, sp, #0
 382              		.cfi_def_cfa_register 7
 383 017e 7860     		str	r0, [r7, #4]
  63:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****   float lo = 0, hi = n, mid;
 384              		.loc 1 63 0
 385 0180 0023     		movs	r3, #0
 386 0182 7B61     		str	r3, [r7, #20]
 387 0184 7B68     		ldr	r3, [r7, #4]
 388 0186 3B61     		str	r3, [r7, #16]
 389              	.LBB2:
  64:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****   for(int i = 0 ; i < 3 ; i++){
 390              		.loc 1 64 0
 391 0188 0023     		movs	r3, #0
 392 018a BB60     		str	r3, [r7, #8]
 393 018c 2BE0     		b	.L17
 394              	.L24:
  65:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       mid = (lo+hi)/2;
 395              		.loc 1 65 0
 396 018e 3969     		ldr	r1, [r7, #16]
 397 0190 7869     		ldr	r0, [r7, #20]
 398 0192 FFF7FEFF 		bl	__aeabi_fadd
 399              	.LVL17:
 400 0196 031C     		adds	r3, r0, #0
 401 0198 8021     		movs	r1, #128
 402 019a C905     		lsls	r1, r1, #23
 403 019c 181C     		adds	r0, r3, #0
 404 019e FFF7FEFF 		bl	__aeabi_fdiv
 405              	.LVL18:
 406 01a2 031C     		adds	r3, r0, #0
 407 01a4 FB60     		str	r3, [r7, #12]
  66:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       if(mid*mid == n) return mid;
 408              		.loc 1 66 0
 409 01a6 F968     		ldr	r1, [r7, #12]
 410 01a8 F868     		ldr	r0, [r7, #12]
 411 01aa FFF7FEFF 		bl	__aeabi_fmul
 412              	.LVL19:
 413 01ae 031C     		adds	r3, r0, #0
 414 01b0 191C     		adds	r1, r3, #0
 415 01b2 7868     		ldr	r0, [r7, #4]
 416 01b4 FFF7FEFF 		bl	__aeabi_fcmpeq
 417              	.LVL20:
 418 01b8 031E     		subs	r3, r0, #0
 419 01ba 01D0     		beq	.L27
 420              		.loc 1 66 0 is_stmt 0 discriminator 1
 421 01bc FB68     		ldr	r3, [r7, #12]
 422 01be 16E0     		b	.L20
 423              	.L27:
  67:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       if(mid*mid > n) hi = mid;
 424              		.loc 1 67 0 is_stmt 1
 425 01c0 F968     		ldr	r1, [r7, #12]
 426 01c2 F868     		ldr	r0, [r7, #12]
 427 01c4 FFF7FEFF 		bl	__aeabi_fmul
 428              	.LVL21:
 429 01c8 031C     		adds	r3, r0, #0
 430 01ca 191C     		adds	r1, r3, #0
 431 01cc 7868     		ldr	r0, [r7, #4]
 432 01ce FFF7FEFF 		bl	__aeabi_fcmplt
 433              	.LVL22:
 434 01d2 031E     		subs	r3, r0, #0
 435 01d4 02D0     		beq	.L28
 436              		.loc 1 67 0 is_stmt 0 discriminator 1
 437 01d6 FB68     		ldr	r3, [r7, #12]
 438 01d8 3B61     		str	r3, [r7, #16]
 439 01da 01E0     		b	.L23
 440              	.L28:
  68:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       else lo = mid;
 441              		.loc 1 68 0 is_stmt 1
 442 01dc FB68     		ldr	r3, [r7, #12]
 443 01de 7B61     		str	r3, [r7, #20]
 444              	.L23:
  64:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       mid = (lo+hi)/2;
 445              		.loc 1 64 0 discriminator 2
 446 01e0 BB68     		ldr	r3, [r7, #8]
 447 01e2 0133     		adds	r3, r3, #1
 448 01e4 BB60     		str	r3, [r7, #8]
 449              	.L17:
  64:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****       mid = (lo+hi)/2;
 450              		.loc 1 64 0 is_stmt 0 discriminator 1
 451 01e6 BB68     		ldr	r3, [r7, #8]
 452 01e8 022B     		cmp	r3, #2
 453 01ea D0DD     		ble	.L24
 454              	.LBE2:
  69:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****   }
  70:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****   return mid;
 455              		.loc 1 70 0 is_stmt 1
 456 01ec FB68     		ldr	r3, [r7, #12]
 457              	.L20:
  71:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 458              		.loc 1 71 0
 459 01ee 181C     		adds	r0, r3, #0
 460 01f0 BD46     		mov	sp, r7
 461 01f2 06B0     		add	sp, sp, #24
 462              		@ sp needed
 463 01f4 80BD     		pop	{r7, pc}
 464              		.cfi_endproc
 465              	.LFE4:
 467              		.global	__aeabi_f2iz
 468              		.global	__aeabi_i2f
 469              		.global	__aeabi_f2d
 470              		.global	__aeabi_dmul
 471              		.global	__aeabi_dadd
 472              		.global	__aeabi_d2f
 473              		.align	1
 474              		.global	updateVel
 475              		.syntax unified
 476              		.code	16
 477              		.thumb_func
 478              		.fpu softvfp
 480              	updateVel:
 481              	.LFB5:
  72:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  73:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
  74:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void updateVel(pBOID self) {
 482              		.loc 1 74 0
 483              		.cfi_startproc
 484              		@ args = 0, pretend = 0, frame = 104
 485              		@ frame_needed = 1, uses_anonymous_args = 0
 486 01f6 B0B5     		push	{r4, r5, r7, lr}
 487              		.cfi_def_cfa_offset 16
 488              		.cfi_offset 4, -16
 489              		.cfi_offset 5, -12
 490              		.cfi_offset 7, -8
 491              		.cfi_offset 14, -4
 492 01f8 9AB0     		sub	sp, sp, #104
 493              		.cfi_def_cfa_offset 120
 494 01fa 00AF     		add	r7, sp, #0
 495              		.cfi_def_cfa_register 7
 496 01fc F860     		str	r0, [r7, #12]
  75:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     int nearbyCount = 0;
 497              		.loc 1 75 0
 498 01fe 0023     		movs	r3, #0
 499 0200 7B66     		str	r3, [r7, #100]
  76:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float sumXPos = 0, sumYPos = 0;
 500              		.loc 1 76 0
 501 0202 0023     		movs	r3, #0
 502 0204 3B66     		str	r3, [r7, #96]
 503 0206 0023     		movs	r3, #0
 504 0208 FB65     		str	r3, [r7, #92]
  77:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float sumXVel = 0, sumYVel = 0;
 505              		.loc 1 77 0
 506 020a 0023     		movs	r3, #0
 507 020c BB65     		str	r3, [r7, #88]
 508 020e 0023     		movs	r3, #0
 509 0210 3B64     		str	r3, [r7, #64]
  78:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dXSeparation = 0, dYSeparation = 0;
 510              		.loc 1 78 0
 511 0212 0023     		movs	r3, #0
 512 0214 7B65     		str	r3, [r7, #84]
 513 0216 0023     		movs	r3, #0
 514 0218 3B65     		str	r3, [r7, #80]
 515              	.LBB3:
  79:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
  80:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 516              		.loc 1 80 0
 517 021a 0023     		movs	r3, #0
 518 021c FB64     		str	r3, [r7, #76]
 519 021e C0E0     		b	.L30
 520              	.L39:
 521              	.LBB4:
  81:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 522              		.loc 1 81 0
 523 0220 FA6C     		ldr	r2, [r7, #76]
 524 0222 1300     		movs	r3, r2
 525 0224 DB00     		lsls	r3, r3, #3
 526 0226 9B1A     		subs	r3, r3, r2
 527 0228 9B00     		lsls	r3, r3, #2
 528 022a E74A     		ldr	r2, .L48
 529 022c 9B18     		adds	r3, r3, r2
 530 022e FB61     		str	r3, [r7, #28]
  82:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		float dx = other->x - self->x;
 531              		.loc 1 82 0
 532 0230 FB69     		ldr	r3, [r7, #28]
 533 0232 1A68     		ldr	r2, [r3]
 534 0234 FB68     		ldr	r3, [r7, #12]
 535 0236 1B68     		ldr	r3, [r3]
 536 0238 191C     		adds	r1, r3, #0
 537 023a 101C     		adds	r0, r2, #0
 538 023c FFF7FEFF 		bl	__aeabi_fsub
 539              	.LVL23:
 540 0240 031C     		adds	r3, r0, #0
 541 0242 BB64     		str	r3, [r7, #72]
  83:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		float dy = other->y - self->y;
 542              		.loc 1 83 0
 543 0244 FB69     		ldr	r3, [r7, #28]
 544 0246 5A68     		ldr	r2, [r3, #4]
 545 0248 FB68     		ldr	r3, [r7, #12]
 546 024a 5B68     		ldr	r3, [r3, #4]
 547 024c 191C     		adds	r1, r3, #0
 548 024e 101C     		adds	r0, r2, #0
 549 0250 FFF7FEFF 		bl	__aeabi_fsub
 550              	.LVL24:
 551 0254 031C     		adds	r3, r0, #0
 552 0256 7B64     		str	r3, [r7, #68]
  84:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		if (abs(dx) > 63) {
 553              		.loc 1 84 0
 554 0258 B86C     		ldr	r0, [r7, #72]
 555 025a FFF7FEFF 		bl	__aeabi_f2iz
 556              	.LVL25:
 557 025e 0300     		movs	r3, r0
 558 0260 DA17     		asrs	r2, r3, #31
 559 0262 9B18     		adds	r3, r3, r2
 560 0264 5340     		eors	r3, r2
 561 0266 3F2B     		cmp	r3, #63
 562 0268 06DD     		ble	.L31
  85:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			dx = 128 - dx;
 563              		.loc 1 85 0
 564 026a B96C     		ldr	r1, [r7, #72]
 565 026c 8620     		movs	r0, #134
 566 026e C005     		lsls	r0, r0, #23
 567 0270 FFF7FEFF 		bl	__aeabi_fsub
 568              	.LVL26:
 569 0274 031C     		adds	r3, r0, #0
 570 0276 BB64     		str	r3, [r7, #72]
 571              	.L31:
  86:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
  87:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		if (abs(dy) > 31) {
 572              		.loc 1 87 0
 573 0278 786C     		ldr	r0, [r7, #68]
 574 027a FFF7FEFF 		bl	__aeabi_f2iz
 575              	.LVL27:
 576 027e 0300     		movs	r3, r0
 577 0280 DA17     		asrs	r2, r3, #31
 578 0282 9B18     		adds	r3, r3, r2
 579 0284 5340     		eors	r3, r2
 580 0286 1F2B     		cmp	r3, #31
 581 0288 06DD     		ble	.L32
  88:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			dy = 64 - dy;
 582              		.loc 1 88 0
 583 028a 796C     		ldr	r1, [r7, #68]
 584 028c 8520     		movs	r0, #133
 585 028e C005     		lsls	r0, r0, #23
 586 0290 FFF7FEFF 		bl	__aeabi_fsub
 587              	.LVL28:
 588 0294 031C     		adds	r3, r0, #0
 589 0296 7B64     		str	r3, [r7, #68]
 590              	.L32:
  89:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
  90:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         float dSquared = dx * dx + dy * dy;
 591              		.loc 1 90 0
 592 0298 B96C     		ldr	r1, [r7, #72]
 593 029a B86C     		ldr	r0, [r7, #72]
 594 029c FFF7FEFF 		bl	__aeabi_fmul
 595              	.LVL29:
 596 02a0 031C     		adds	r3, r0, #0
 597 02a2 1C1C     		adds	r4, r3, #0
 598 02a4 796C     		ldr	r1, [r7, #68]
 599 02a6 786C     		ldr	r0, [r7, #68]
 600 02a8 FFF7FEFF 		bl	__aeabi_fmul
 601              	.LVL30:
 602 02ac 031C     		adds	r3, r0, #0
 603 02ae 191C     		adds	r1, r3, #0
 604 02b0 201C     		adds	r0, r4, #0
 605 02b2 FFF7FEFF 		bl	__aeabi_fadd
 606              	.LVL31:
 607 02b6 031C     		adds	r3, r0, #0
 608 02b8 BB61     		str	r3, [r7, #24]
  91:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         if (dSquared > VIEW_DISTANCE * VIEW_DISTANCE) {
 609              		.loc 1 91 0
 610 02ba C449     		ldr	r1, .L48+4
 611 02bc B869     		ldr	r0, [r7, #24]
 612 02be FFF7FEFF 		bl	__aeabi_fcmpgt
 613              	.LVL32:
 614 02c2 031E     		subs	r3, r0, #0
 615 02c4 65D1     		bne	.L44
  92:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             continue;
  93:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
  94:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		if (dSquared == 0) {
 616              		.loc 1 94 0
 617 02c6 0021     		movs	r1, #0
 618 02c8 B869     		ldr	r0, [r7, #24]
 619 02ca FFF7FEFF 		bl	__aeabi_fcmpeq
 620              	.LVL33:
 621 02ce 031E     		subs	r3, r0, #0
 622 02d0 61D1     		bne	.L45
  95:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 			continue;
  96:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
  97:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         if (self == other) {
 623              		.loc 1 97 0
 624 02d2 FA68     		ldr	r2, [r7, #12]
 625 02d4 FB69     		ldr	r3, [r7, #28]
 626 02d6 9A42     		cmp	r2, r3
 627 02d8 5FD0     		beq	.L46
  98:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             continue;
  99:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 100:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         nearbyCount++;
 628              		.loc 1 100 0
 629 02da 7B6E     		ldr	r3, [r7, #100]
 630 02dc 0133     		adds	r3, r3, #1
 631 02de 7B66     		str	r3, [r7, #100]
 101:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         
 102:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         // Cohesion
 103:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         sumXPos += self->x+dx;
 632              		.loc 1 103 0
 633 02e0 FB68     		ldr	r3, [r7, #12]
 634 02e2 1B68     		ldr	r3, [r3]
 635 02e4 B96C     		ldr	r1, [r7, #72]
 636 02e6 181C     		adds	r0, r3, #0
 637 02e8 FFF7FEFF 		bl	__aeabi_fadd
 638              	.LVL34:
 639 02ec 031C     		adds	r3, r0, #0
 640 02ee 191C     		adds	r1, r3, #0
 641 02f0 386E     		ldr	r0, [r7, #96]
 642 02f2 FFF7FEFF 		bl	__aeabi_fadd
 643              	.LVL35:
 644 02f6 031C     		adds	r3, r0, #0
 645 02f8 3B66     		str	r3, [r7, #96]
 104:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         sumYPos += self->y+dy;
 646              		.loc 1 104 0
 647 02fa FB68     		ldr	r3, [r7, #12]
 648 02fc 5B68     		ldr	r3, [r3, #4]
 649 02fe 796C     		ldr	r1, [r7, #68]
 650 0300 181C     		adds	r0, r3, #0
 651 0302 FFF7FEFF 		bl	__aeabi_fadd
 652              	.LVL36:
 653 0306 031C     		adds	r3, r0, #0
 654 0308 191C     		adds	r1, r3, #0
 655 030a F86D     		ldr	r0, [r7, #92]
 656 030c FFF7FEFF 		bl	__aeabi_fadd
 657              	.LVL37:
 658 0310 031C     		adds	r3, r0, #0
 659 0312 FB65     		str	r3, [r7, #92]
 105:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         
 106:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         // Alignment
 107:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         sumXVel += self->x+dx;
 660              		.loc 1 107 0
 661 0314 FB68     		ldr	r3, [r7, #12]
 662 0316 1B68     		ldr	r3, [r3]
 663 0318 B96C     		ldr	r1, [r7, #72]
 664 031a 181C     		adds	r0, r3, #0
 665 031c FFF7FEFF 		bl	__aeabi_fadd
 666              	.LVL38:
 667 0320 031C     		adds	r3, r0, #0
 668 0322 191C     		adds	r1, r3, #0
 669 0324 B86D     		ldr	r0, [r7, #88]
 670 0326 FFF7FEFF 		bl	__aeabi_fadd
 671              	.LVL39:
 672 032a 031C     		adds	r3, r0, #0
 673 032c BB65     		str	r3, [r7, #88]
 108:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         sumXVel += self->y+dy;
 674              		.loc 1 108 0
 675 032e FB68     		ldr	r3, [r7, #12]
 676 0330 5B68     		ldr	r3, [r3, #4]
 677 0332 796C     		ldr	r1, [r7, #68]
 678 0334 181C     		adds	r0, r3, #0
 679 0336 FFF7FEFF 		bl	__aeabi_fadd
 680              	.LVL40:
 681 033a 031C     		adds	r3, r0, #0
 682 033c 191C     		adds	r1, r3, #0
 683 033e B86D     		ldr	r0, [r7, #88]
 684 0340 FFF7FEFF 		bl	__aeabi_fadd
 685              	.LVL41:
 686 0344 031C     		adds	r3, r0, #0
 687 0346 BB65     		str	r3, [r7, #88]
 109:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         
 110:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         // Separation
 111:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		float d = root(dSquared);
 688              		.loc 1 111 0
 689 0348 BB69     		ldr	r3, [r7, #24]
 690 034a 181C     		adds	r0, r3, #0
 691 034c FFF7FEFF 		bl	root
 692 0350 031C     		adds	r3, r0, #0
 693 0352 7B61     		str	r3, [r7, #20]
 112:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         dXSeparation += (-dx) / d;
 694              		.loc 1 112 0
 695 0354 BB6C     		ldr	r3, [r7, #72]
 696 0356 8022     		movs	r2, #128
 697 0358 1206     		lsls	r2, r2, #24
 698 035a 5340     		eors	r3, r2
 699 035c 7969     		ldr	r1, [r7, #20]
 700 035e 181C     		adds	r0, r3, #0
 701 0360 FFF7FEFF 		bl	__aeabi_fdiv
 702              	.LVL42:
 703 0364 031C     		adds	r3, r0, #0
 704 0366 191C     		adds	r1, r3, #0
 705 0368 786D     		ldr	r0, [r7, #84]
 706 036a FFF7FEFF 		bl	__aeabi_fadd
 707              	.LVL43:
 708 036e 031C     		adds	r3, r0, #0
 709 0370 7B65     		str	r3, [r7, #84]
 113:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         dYSeparation += (-dy) / d;
 710              		.loc 1 113 0
 711 0372 7B6C     		ldr	r3, [r7, #68]
 712 0374 8022     		movs	r2, #128
 713 0376 1206     		lsls	r2, r2, #24
 714 0378 5340     		eors	r3, r2
 715 037a 7969     		ldr	r1, [r7, #20]
 716 037c 181C     		adds	r0, r3, #0
 717 037e FFF7FEFF 		bl	__aeabi_fdiv
 718              	.LVL44:
 719 0382 031C     		adds	r3, r0, #0
 720 0384 191C     		adds	r1, r3, #0
 721 0386 386D     		ldr	r0, [r7, #80]
 722 0388 FFF7FEFF 		bl	__aeabi_fadd
 723              	.LVL45:
 724 038c 031C     		adds	r3, r0, #0
 725 038e 3B65     		str	r3, [r7, #80]
 726 0390 04E0     		b	.L35
 727              	.L44:
  92:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 728              		.loc 1 92 0
 729 0392 C046     		nop
 730 0394 02E0     		b	.L35
 731              	.L45:
  95:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		}
 732              		.loc 1 95 0
 733 0396 C046     		nop
 734 0398 00E0     		b	.L35
 735              	.L46:
  98:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 736              		.loc 1 98 0
 737 039a C046     		nop
 738              	.L35:
 739              	.LBE4:
  80:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 740              		.loc 1 80 0 discriminator 2
 741 039c FB6C     		ldr	r3, [r7, #76]
 742 039e 0133     		adds	r3, r3, #1
 743 03a0 FB64     		str	r3, [r7, #76]
 744              	.L30:
  80:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         pBOID other = &boids[i];
 745              		.loc 1 80 0 is_stmt 0 discriminator 1
 746 03a2 FB6C     		ldr	r3, [r7, #76]
 747 03a4 632B     		cmp	r3, #99
 748 03a6 00DC     		bgt	.LCB577
 749 03a8 3AE7     		b	.L39	@long jump
 750              	.LCB577:
 751              	.LBE3:
 114:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     }
 115:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 116:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	if (nearbyCount == 0) {
 752              		.loc 1 116 0 is_stmt 1
 753 03aa 7B6E     		ldr	r3, [r7, #100]
 754 03ac 002B     		cmp	r3, #0
 755 03ae 00D1     		bne	.LCB581
 756 03b0 1EE1     		b	.L47	@long jump
 757              	.LCB581:
 117:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		return;
 118:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 119:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 120:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     // Cohesion
 121:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float avgXPos = sumXPos / nearbyCount;
 758              		.loc 1 121 0
 759 03b2 786E     		ldr	r0, [r7, #100]
 760 03b4 FFF7FEFF 		bl	__aeabi_i2f
 761              	.LVL46:
 762 03b8 031C     		adds	r3, r0, #0
 763 03ba 191C     		adds	r1, r3, #0
 764 03bc 386E     		ldr	r0, [r7, #96]
 765 03be FFF7FEFF 		bl	__aeabi_fdiv
 766              	.LVL47:
 767 03c2 031C     		adds	r3, r0, #0
 768 03c4 FB63     		str	r3, [r7, #60]
 122:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float avgYPos = sumYPos / nearbyCount;
 769              		.loc 1 122 0
 770 03c6 786E     		ldr	r0, [r7, #100]
 771 03c8 FFF7FEFF 		bl	__aeabi_i2f
 772              	.LVL48:
 773 03cc 031C     		adds	r3, r0, #0
 774 03ce 191C     		adds	r1, r3, #0
 775 03d0 F86D     		ldr	r0, [r7, #92]
 776 03d2 FFF7FEFF 		bl	__aeabi_fdiv
 777              	.LVL49:
 778 03d6 031C     		adds	r3, r0, #0
 779 03d8 BB63     		str	r3, [r7, #56]
 123:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 124:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dXCohesion = avgXPos - self->x;
 780              		.loc 1 124 0
 781 03da FB68     		ldr	r3, [r7, #12]
 782 03dc 1B68     		ldr	r3, [r3]
 783 03de 191C     		adds	r1, r3, #0
 784 03e0 F86B     		ldr	r0, [r7, #60]
 785 03e2 FFF7FEFF 		bl	__aeabi_fsub
 786              	.LVL50:
 787 03e6 031C     		adds	r3, r0, #0
 788 03e8 7B63     		str	r3, [r7, #52]
 125:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dYCohesion = avgYPos - self->y;
 789              		.loc 1 125 0
 790 03ea FB68     		ldr	r3, [r7, #12]
 791 03ec 5B68     		ldr	r3, [r3, #4]
 792 03ee 191C     		adds	r1, r3, #0
 793 03f0 B86B     		ldr	r0, [r7, #56]
 794 03f2 FFF7FEFF 		bl	__aeabi_fsub
 795              	.LVL51:
 796 03f6 031C     		adds	r3, r0, #0
 797 03f8 3B63     		str	r3, [r7, #48]
 126:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 127:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     // Alignment
 128:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float avgXVel = sumXVel / nearbyCount;
 798              		.loc 1 128 0
 799 03fa 786E     		ldr	r0, [r7, #100]
 800 03fc FFF7FEFF 		bl	__aeabi_i2f
 801              	.LVL52:
 802 0400 031C     		adds	r3, r0, #0
 803 0402 191C     		adds	r1, r3, #0
 804 0404 B86D     		ldr	r0, [r7, #88]
 805 0406 FFF7FEFF 		bl	__aeabi_fdiv
 806              	.LVL53:
 807 040a 031C     		adds	r3, r0, #0
 808 040c FB62     		str	r3, [r7, #44]
 129:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float avgYVel = sumYVel / nearbyCount;
 809              		.loc 1 129 0
 810 040e 786E     		ldr	r0, [r7, #100]
 811 0410 FFF7FEFF 		bl	__aeabi_i2f
 812              	.LVL54:
 813 0414 031C     		adds	r3, r0, #0
 814 0416 191C     		adds	r1, r3, #0
 815 0418 386C     		ldr	r0, [r7, #64]
 816 041a FFF7FEFF 		bl	__aeabi_fdiv
 817              	.LVL55:
 818 041e 031C     		adds	r3, r0, #0
 819 0420 BB62     		str	r3, [r7, #40]
 130:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 131:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dXAlignment = avgXVel - self->xVel;
 820              		.loc 1 131 0
 821 0422 FB68     		ldr	r3, [r7, #12]
 822 0424 9B68     		ldr	r3, [r3, #8]
 823 0426 191C     		adds	r1, r3, #0
 824 0428 F86A     		ldr	r0, [r7, #44]
 825 042a FFF7FEFF 		bl	__aeabi_fsub
 826              	.LVL56:
 827 042e 031C     		adds	r3, r0, #0
 828 0430 7B62     		str	r3, [r7, #36]
 132:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     float dYAlignment = avgYVel - self->yVel;
 829              		.loc 1 132 0
 830 0432 FB68     		ldr	r3, [r7, #12]
 831 0434 DB68     		ldr	r3, [r3, #12]
 832 0436 191C     		adds	r1, r3, #0
 833 0438 B86A     		ldr	r0, [r7, #40]
 834 043a FFF7FEFF 		bl	__aeabi_fsub
 835              	.LVL57:
 836 043e 031C     		adds	r3, r0, #0
 837 0440 3B62     		str	r3, [r7, #32]
 133:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 134:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     // Calculate new acceleration for the Boid
 135:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     self->xVel += dXSeparation * SEPARATION_BIAS + dXCohesion * COHESION_BIAS + dXAlignment * ALIGN
 838              		.loc 1 135 0
 839 0442 FB68     		ldr	r3, [r7, #12]
 840 0444 9B68     		ldr	r3, [r3, #8]
 841 0446 181C     		adds	r0, r3, #0
 842 0448 FFF7FEFF 		bl	__aeabi_f2d
 843              	.LVL58:
 844 044c 0400     		movs	r4, r0
 845 044e 0D00     		movs	r5, r1
 846 0450 786D     		ldr	r0, [r7, #84]
 847 0452 FFF7FEFF 		bl	__aeabi_f2d
 848              	.LVL59:
 849 0456 5E4A     		ldr	r2, .L48+8
 850 0458 5E4B     		ldr	r3, .L48+12
 851 045a FFF7FEFF 		bl	__aeabi_dmul
 852              	.LVL60:
 853 045e 0200     		movs	r2, r0
 854 0460 0B00     		movs	r3, r1
 855 0462 3A60     		str	r2, [r7]
 856 0464 7B60     		str	r3, [r7, #4]
 857 0466 786B     		ldr	r0, [r7, #52]
 858 0468 FFF7FEFF 		bl	__aeabi_f2d
 859              	.LVL61:
 860 046c 5A4A     		ldr	r2, .L48+16
 861 046e 5B4B     		ldr	r3, .L48+20
 862 0470 FFF7FEFF 		bl	__aeabi_dmul
 863              	.LVL62:
 864 0474 0200     		movs	r2, r0
 865 0476 0B00     		movs	r3, r1
 866 0478 3868     		ldr	r0, [r7]
 867 047a 7968     		ldr	r1, [r7, #4]
 868 047c FFF7FEFF 		bl	__aeabi_dadd
 869              	.LVL63:
 870 0480 0200     		movs	r2, r0
 871 0482 0B00     		movs	r3, r1
 872 0484 3A60     		str	r2, [r7]
 873 0486 7B60     		str	r3, [r7, #4]
 874 0488 786A     		ldr	r0, [r7, #36]
 875 048a FFF7FEFF 		bl	__aeabi_f2d
 876              	.LVL64:
 877 048e 544A     		ldr	r2, .L48+24
 878 0490 544B     		ldr	r3, .L48+28
 879 0492 FFF7FEFF 		bl	__aeabi_dmul
 880              	.LVL65:
 881 0496 0200     		movs	r2, r0
 882 0498 0B00     		movs	r3, r1
 883 049a 3868     		ldr	r0, [r7]
 884 049c 7968     		ldr	r1, [r7, #4]
 885 049e FFF7FEFF 		bl	__aeabi_dadd
 886              	.LVL66:
 887 04a2 0200     		movs	r2, r0
 888 04a4 0B00     		movs	r3, r1
 889 04a6 2000     		movs	r0, r4
 890 04a8 2900     		movs	r1, r5
 891 04aa FFF7FEFF 		bl	__aeabi_dadd
 892              	.LVL67:
 893 04ae 0300     		movs	r3, r0
 894 04b0 0C00     		movs	r4, r1
 895 04b2 1800     		movs	r0, r3
 896 04b4 2100     		movs	r1, r4
 897 04b6 FFF7FEFF 		bl	__aeabi_d2f
 898              	.LVL68:
 899 04ba 021C     		adds	r2, r0, #0
 900 04bc FB68     		ldr	r3, [r7, #12]
 901 04be 9A60     		str	r2, [r3, #8]
 136:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     self->yVel += dYSeparation * SEPARATION_BIAS + dYCohesion * COHESION_BIAS + dYAlignment * ALIGN
 902              		.loc 1 136 0
 903 04c0 FB68     		ldr	r3, [r7, #12]
 904 04c2 DB68     		ldr	r3, [r3, #12]
 905 04c4 181C     		adds	r0, r3, #0
 906 04c6 FFF7FEFF 		bl	__aeabi_f2d
 907              	.LVL69:
 908 04ca 0400     		movs	r4, r0
 909 04cc 0D00     		movs	r5, r1
 910 04ce 386D     		ldr	r0, [r7, #80]
 911 04d0 FFF7FEFF 		bl	__aeabi_f2d
 912              	.LVL70:
 913 04d4 3E4A     		ldr	r2, .L48+8
 914 04d6 3F4B     		ldr	r3, .L48+12
 915 04d8 FFF7FEFF 		bl	__aeabi_dmul
 916              	.LVL71:
 917 04dc 0200     		movs	r2, r0
 918 04de 0B00     		movs	r3, r1
 919 04e0 3A60     		str	r2, [r7]
 920 04e2 7B60     		str	r3, [r7, #4]
 921 04e4 386B     		ldr	r0, [r7, #48]
 922 04e6 FFF7FEFF 		bl	__aeabi_f2d
 923              	.LVL72:
 924 04ea 3B4A     		ldr	r2, .L48+16
 925 04ec 3B4B     		ldr	r3, .L48+20
 926 04ee FFF7FEFF 		bl	__aeabi_dmul
 927              	.LVL73:
 928 04f2 0200     		movs	r2, r0
 929 04f4 0B00     		movs	r3, r1
 930 04f6 3868     		ldr	r0, [r7]
 931 04f8 7968     		ldr	r1, [r7, #4]
 932 04fa FFF7FEFF 		bl	__aeabi_dadd
 933              	.LVL74:
 934 04fe 0200     		movs	r2, r0
 935 0500 0B00     		movs	r3, r1
 936 0502 3A60     		str	r2, [r7]
 937 0504 7B60     		str	r3, [r7, #4]
 938 0506 386A     		ldr	r0, [r7, #32]
 939 0508 FFF7FEFF 		bl	__aeabi_f2d
 940              	.LVL75:
 941 050c 344A     		ldr	r2, .L48+24
 942 050e 354B     		ldr	r3, .L48+28
 943 0510 FFF7FEFF 		bl	__aeabi_dmul
 944              	.LVL76:
 945 0514 0200     		movs	r2, r0
 946 0516 0B00     		movs	r3, r1
 947 0518 3868     		ldr	r0, [r7]
 948 051a 7968     		ldr	r1, [r7, #4]
 949 051c FFF7FEFF 		bl	__aeabi_dadd
 950              	.LVL77:
 951 0520 0200     		movs	r2, r0
 952 0522 0B00     		movs	r3, r1
 953 0524 2000     		movs	r0, r4
 954 0526 2900     		movs	r1, r5
 955 0528 FFF7FEFF 		bl	__aeabi_dadd
 956              	.LVL78:
 957 052c 0300     		movs	r3, r0
 958 052e 0C00     		movs	r4, r1
 959 0530 1800     		movs	r0, r3
 960 0532 2100     		movs	r1, r4
 961 0534 FFF7FEFF 		bl	__aeabi_d2f
 962              	.LVL79:
 963 0538 021C     		adds	r2, r0, #0
 964 053a FB68     		ldr	r3, [r7, #12]
 965 053c DA60     		str	r2, [r3, #12]
 137:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 138:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	while (self->xVel * self->xVel + self->yVel * self->yVel > MAX_SPEED * MAX_SPEED) {
 966              		.loc 1 138 0
 967 053e 23E0     		b	.L42
 968              	.L43:
 139:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->xVel *= 0.9;
 969              		.loc 1 139 0
 970 0540 FB68     		ldr	r3, [r7, #12]
 971 0542 9B68     		ldr	r3, [r3, #8]
 972 0544 181C     		adds	r0, r3, #0
 973 0546 FFF7FEFF 		bl	__aeabi_f2d
 974              	.LVL80:
 975 054a 274A     		ldr	r2, .L48+32
 976 054c 274B     		ldr	r3, .L48+36
 977 054e FFF7FEFF 		bl	__aeabi_dmul
 978              	.LVL81:
 979 0552 0300     		movs	r3, r0
 980 0554 0C00     		movs	r4, r1
 981 0556 1800     		movs	r0, r3
 982 0558 2100     		movs	r1, r4
 983 055a FFF7FEFF 		bl	__aeabi_d2f
 984              	.LVL82:
 985 055e 021C     		adds	r2, r0, #0
 986 0560 FB68     		ldr	r3, [r7, #12]
 987 0562 9A60     		str	r2, [r3, #8]
 140:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->yVel *= 0.9;
 988              		.loc 1 140 0
 989 0564 FB68     		ldr	r3, [r7, #12]
 990 0566 DB68     		ldr	r3, [r3, #12]
 991 0568 181C     		adds	r0, r3, #0
 992 056a FFF7FEFF 		bl	__aeabi_f2d
 993              	.LVL83:
 994 056e 1E4A     		ldr	r2, .L48+32
 995 0570 1E4B     		ldr	r3, .L48+36
 996 0572 FFF7FEFF 		bl	__aeabi_dmul
 997              	.LVL84:
 998 0576 0300     		movs	r3, r0
 999 0578 0C00     		movs	r4, r1
 1000 057a 1800     		movs	r0, r3
 1001 057c 2100     		movs	r1, r4
 1002 057e FFF7FEFF 		bl	__aeabi_d2f
 1003              	.LVL85:
 1004 0582 021C     		adds	r2, r0, #0
 1005 0584 FB68     		ldr	r3, [r7, #12]
 1006 0586 DA60     		str	r2, [r3, #12]
 1007              	.L42:
 138:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		self->xVel *= 0.9;
 1008              		.loc 1 138 0
 1009 0588 FB68     		ldr	r3, [r7, #12]
 1010 058a 9A68     		ldr	r2, [r3, #8]
 1011 058c FB68     		ldr	r3, [r7, #12]
 1012 058e 9B68     		ldr	r3, [r3, #8]
 1013 0590 191C     		adds	r1, r3, #0
 1014 0592 101C     		adds	r0, r2, #0
 1015 0594 FFF7FEFF 		bl	__aeabi_fmul
 1016              	.LVL86:
 1017 0598 031C     		adds	r3, r0, #0
 1018 059a 1C1C     		adds	r4, r3, #0
 1019 059c FB68     		ldr	r3, [r7, #12]
 1020 059e DA68     		ldr	r2, [r3, #12]
 1021 05a0 FB68     		ldr	r3, [r7, #12]
 1022 05a2 DB68     		ldr	r3, [r3, #12]
 1023 05a4 191C     		adds	r1, r3, #0
 1024 05a6 101C     		adds	r0, r2, #0
 1025 05a8 FFF7FEFF 		bl	__aeabi_fmul
 1026              	.LVL87:
 1027 05ac 031C     		adds	r3, r0, #0
 1028 05ae 191C     		adds	r1, r3, #0
 1029 05b0 201C     		adds	r0, r4, #0
 1030 05b2 FFF7FEFF 		bl	__aeabi_fadd
 1031              	.LVL88:
 1032 05b6 031C     		adds	r3, r0, #0
 1033 05b8 8321     		movs	r1, #131
 1034 05ba C905     		lsls	r1, r1, #23
 1035 05bc 181C     		adds	r0, r3, #0
 1036 05be FFF7FEFF 		bl	__aeabi_fcmpgt
 1037              	.LVL89:
 1038 05c2 031E     		subs	r3, r0, #0
 1039 05c4 BCD1     		bne	.L43
 1040 05c6 14E0     		b	.L29
 1041              	.L49:
 1042              		.align	2
 1043              	.L48:
 1044 05c8 00040000 		.word	boids
 1045 05cc 00006143 		.word	1130430464
 1046 05d0 B81E85EB 		.word	-343597384
 1047 05d4 51B8AE3F 		.word	1068415057
 1048 05d8 9A999999 		.word	-1717986918
 1049 05dc 9999B93F 		.word	1069128089
 1050 05e0 FCA9F1D2 		.word	-755914244
 1051 05e4 4D62803F 		.word	1065378381
 1052 05e8 CDCCCCCC 		.word	-858993459
 1053 05ec CCCCEC3F 		.word	1072483532
 1054              	.L47:
 117:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 1055              		.loc 1 117 0
 1056 05f0 C046     		nop
 1057              	.L29:
 141:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	}
 142:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 1058              		.loc 1 142 0
 1059 05f2 BD46     		mov	sp, r7
 1060 05f4 1AB0     		add	sp, sp, #104
 1061              		@ sp needed
 1062 05f6 B0BD     		pop	{r4, r5, r7, pc}
 1063              		.cfi_endproc
 1064              	.LFE5:
 1066              		.global	__aeabi_i2d
 1067              		.align	1
 1068              		.global	createBoids
 1069              		.syntax unified
 1070              		.code	16
 1071              		.thumb_func
 1072              		.fpu softvfp
 1074              	createBoids:
 1075              	.LFB6:
 143:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 144:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void createBoids() {
 1076              		.loc 1 144 0
 1077              		.cfi_startproc
 1078              		@ args = 0, pretend = 0, frame = 8
 1079              		@ frame_needed = 1, uses_anonymous_args = 0
 1080 05f8 90B5     		push	{r4, r7, lr}
 1081              		.cfi_def_cfa_offset 12
 1082              		.cfi_offset 4, -12
 1083              		.cfi_offset 7, -8
 1084              		.cfi_offset 14, -4
 1085 05fa 83B0     		sub	sp, sp, #12
 1086              		.cfi_def_cfa_offset 24
 1087 05fc 00AF     		add	r7, sp, #0
 1088              		.cfi_def_cfa_register 7
 1089              	.LBB5:
 145:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     for (int i = 0; i < BOID_COUNT; i++) {
 1090              		.loc 1 145 0
 1091 05fe 0023     		movs	r3, #0
 1092 0600 7B60     		str	r3, [r7, #4]
 1093 0602 6AE0     		b	.L51
 1094              	.L52:
 146:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         //boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
 147:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         boids[i] = (BOID) { 
 148:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .x = (i * 105 + 10.0), 
 1095              		.loc 1 148 0 discriminator 3
 1096 0604 7A68     		ldr	r2, [r7, #4]
 1097 0606 1300     		movs	r3, r2
 1098 0608 DB00     		lsls	r3, r3, #3
 1099 060a 9B1A     		subs	r3, r3, r2
 1100 060c 1A01     		lsls	r2, r3, #4
 1101 060e D31A     		subs	r3, r2, r3
 1102 0610 1800     		movs	r0, r3
 1103 0612 FFF7FEFF 		bl	__aeabi_i2d
 1104              	.LVL90:
 1105 0616 0022     		movs	r2, #0
 1106 0618 334B     		ldr	r3, .L53
 1107 061a FFF7FEFF 		bl	__aeabi_dadd
 1108              	.LVL91:
 1109 061e 0300     		movs	r3, r0
 1110 0620 0C00     		movs	r4, r1
 1111 0622 1800     		movs	r0, r3
 1112 0624 2100     		movs	r1, r4
 1113 0626 FFF7FEFF 		bl	__aeabi_d2f
 1114              	.LVL92:
 1115 062a 041C     		adds	r4, r0, #0
 149:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .y = (i * 10 + 10.0), 
 1116              		.loc 1 149 0 discriminator 3
 1117 062c 7A68     		ldr	r2, [r7, #4]
 1118 062e 1300     		movs	r3, r2
 1119 0630 9B00     		lsls	r3, r3, #2
 1120 0632 9B18     		adds	r3, r3, r2
 1121 0634 5B00     		lsls	r3, r3, #1
 1122 0636 1800     		movs	r0, r3
 1123 0638 FFF7FEFF 		bl	__aeabi_i2d
 1124              	.LVL93:
 1125 063c 0022     		movs	r2, #0
 1126 063e 2A4B     		ldr	r3, .L53
 1127 0640 FFF7FEFF 		bl	__aeabi_dadd
 1128              	.LVL94:
 1129 0644 0200     		movs	r2, r0
 1130 0646 0B00     		movs	r3, r1
 1131 0648 1000     		movs	r0, r2
 1132 064a 1900     		movs	r1, r3
 1133 064c FFF7FEFF 		bl	__aeabi_d2f
 1134              	.LVL95:
 147:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .x = (i * 105 + 10.0), 
 1135              		.loc 1 147 0 discriminator 3
 1136 0650 2649     		ldr	r1, .L53+4
 1137 0652 7A68     		ldr	r2, [r7, #4]
 1138 0654 1300     		movs	r3, r2
 1139 0656 DB00     		lsls	r3, r3, #3
 1140 0658 9B1A     		subs	r3, r3, r2
 1141 065a 9B00     		lsls	r3, r3, #2
 1142 065c 5C50     		str	r4, [r3, r1]
 1143 065e 2349     		ldr	r1, .L53+4
 1144 0660 7A68     		ldr	r2, [r7, #4]
 1145 0662 1300     		movs	r3, r2
 1146 0664 DB00     		lsls	r3, r3, #3
 1147 0666 9B1A     		subs	r3, r3, r2
 1148 0668 9B00     		lsls	r3, r3, #2
 1149 066a CB18     		adds	r3, r1, r3
 1150 066c 0433     		adds	r3, r3, #4
 1151 066e 1860     		str	r0, [r3]
 1152 0670 1E49     		ldr	r1, .L53+4
 1153 0672 7A68     		ldr	r2, [r7, #4]
 1154 0674 1300     		movs	r3, r2
 1155 0676 DB00     		lsls	r3, r3, #3
 1156 0678 9B1A     		subs	r3, r3, r2
 1157 067a 9B00     		lsls	r3, r3, #2
 1158 067c CB18     		adds	r3, r1, r3
 1159 067e 0833     		adds	r3, r3, #8
 1160 0680 0022     		movs	r2, #0
 1161 0682 1A60     		str	r2, [r3]
 1162 0684 1949     		ldr	r1, .L53+4
 1163 0686 7A68     		ldr	r2, [r7, #4]
 1164 0688 1300     		movs	r3, r2
 1165 068a DB00     		lsls	r3, r3, #3
 1166 068c 9B1A     		subs	r3, r3, r2
 1167 068e 9B00     		lsls	r3, r3, #2
 1168 0690 CB18     		adds	r3, r1, r3
 1169 0692 0C33     		adds	r3, r3, #12
 1170 0694 0022     		movs	r2, #0
 1171 0696 1A60     		str	r2, [r3]
 1172 0698 1449     		ldr	r1, .L53+4
 1173 069a 7A68     		ldr	r2, [r7, #4]
 1174 069c 1300     		movs	r3, r2
 1175 069e DB00     		lsls	r3, r3, #3
 1176 06a0 9B1A     		subs	r3, r3, r2
 1177 06a2 9B00     		lsls	r3, r3, #2
 1178 06a4 CB18     		adds	r3, r1, r3
 1179 06a6 1033     		adds	r3, r3, #16
 1180 06a8 114A     		ldr	r2, .L53+8
 1181 06aa 1A60     		str	r2, [r3]
 1182 06ac 0F49     		ldr	r1, .L53+4
 1183 06ae 7A68     		ldr	r2, [r7, #4]
 1184 06b0 1300     		movs	r3, r2
 1185 06b2 DB00     		lsls	r3, r3, #3
 1186 06b4 9B1A     		subs	r3, r3, r2
 1187 06b6 9B00     		lsls	r3, r3, #2
 1188 06b8 CB18     		adds	r3, r1, r3
 1189 06ba 1433     		adds	r3, r3, #20
 1190 06bc 0D4A     		ldr	r2, .L53+12
 1191 06be 1A60     		str	r2, [r3]
 1192 06c0 0A49     		ldr	r1, .L53+4
 1193 06c2 7A68     		ldr	r2, [r7, #4]
 1194 06c4 1300     		movs	r3, r2
 1195 06c6 DB00     		lsls	r3, r3, #3
 1196 06c8 9B1A     		subs	r3, r3, r2
 1197 06ca 9B00     		lsls	r3, r3, #2
 1198 06cc CB18     		adds	r3, r1, r3
 1199 06ce 1833     		adds	r3, r3, #24
 1200 06d0 094A     		ldr	r2, .L53+16
 1201 06d2 1A60     		str	r2, [r3]
 145:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         //boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
 1202              		.loc 1 145 0 discriminator 3
 1203 06d4 7B68     		ldr	r3, [r7, #4]
 1204 06d6 0133     		adds	r3, r3, #1
 1205 06d8 7B60     		str	r3, [r7, #4]
 1206              	.L51:
 145:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         //boids[i] = (BOID) { 8.0, 31.0, 0.0, 0.0, draw, updatePos, updateVel };
 1207              		.loc 1 145 0 is_stmt 0 discriminator 1
 1208 06da 7B68     		ldr	r3, [r7, #4]
 1209 06dc 632B     		cmp	r3, #99
 1210 06de 91DD     		ble	.L52
 1211              	.LBE5:
 150:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .xVel = 0.0, 
 151:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             .yVel = 0.0,
 152:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             draw,
 153:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             updatePos,
 154:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             updateVel
 155:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         };
 156:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     }
 157:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** }
 1212              		.loc 1 157 0 is_stmt 1
 1213 06e0 C046     		nop
 1214 06e2 BD46     		mov	sp, r7
 1215 06e4 03B0     		add	sp, sp, #12
 1216              		@ sp needed
 1217 06e6 90BD     		pop	{r4, r7, pc}
 1218              	.L54:
 1219              		.align	2
 1220              	.L53:
 1221 06e8 00002440 		.word	1076101120
 1222 06ec 00040000 		.word	boids
 1223 06f0 00000000 		.word	draw
 1224 06f4 00000000 		.word	updatePos
 1225 06f8 00000000 		.word	updateVel
 1226              		.cfi_endproc
 1227              	.LFE6:
 1229              		.align	1
 1230              		.global	main
 1231              		.syntax unified
 1232              		.code	16
 1233              		.thumb_func
 1234              		.fpu softvfp
 1236              	main:
 1237              	.LFB7:
 158:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 159:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 160:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** void main(void) {
 1238              		.loc 1 160 0
 1239              		.cfi_startproc
 1240              		@ args = 0, pretend = 0, frame = 8
 1241              		@ frame_needed = 1, uses_anonymous_args = 0
 1242 06fc 80B5     		push	{r7, lr}
 1243              		.cfi_def_cfa_offset 8
 1244              		.cfi_offset 7, -8
 1245              		.cfi_offset 14, -4
 1246 06fe 82B0     		sub	sp, sp, #8
 1247              		.cfi_def_cfa_offset 16
 1248 0700 00AF     		add	r7, sp, #0
 1249              		.cfi_def_cfa_register 7
 161:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	init();
 1250              		.loc 1 161 0
 1251 0702 FFF7FEFF 		bl	init
 162:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 163:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	clear_buffer();
 1252              		.loc 1 163 0
 1253 0706 FFF7FEFF 		bl	clear_buffer
 164:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #ifndef SIMULATOR
 165:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	draw_buffer();
 1254              		.loc 1 165 0
 1255 070a FFF7FEFF 		bl	draw_buffer
 166:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** #endif
 167:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 
 168:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     createBoids();
 1256              		.loc 1 168 0
 1257 070e FFF7FEFF 		bl	createBoids
 1258              	.L60:
 1259              	.LBB6:
 169:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     
 170:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 	
 171:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****     while (1) {
 172:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		clear_buffer();
 1260              		.loc 1 172 0
 1261 0712 FFF7FEFF 		bl	clear_buffer
 1262              	.LBB7:
 173:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1263              		.loc 1 173 0
 1264 0716 0023     		movs	r3, #0
 1265 0718 7B60     		str	r3, [r7, #4]
 1266 071a 14E0     		b	.L56
 1267              	.L57:
 174:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             boids[i].updateVel(&boids[i]);
 1268              		.loc 1 174 0 discriminator 3
 1269 071c 2549     		ldr	r1, .L61
 1270 071e 7A68     		ldr	r2, [r7, #4]
 1271 0720 1300     		movs	r3, r2
 1272 0722 DB00     		lsls	r3, r3, #3
 1273 0724 9B1A     		subs	r3, r3, r2
 1274 0726 9B00     		lsls	r3, r3, #2
 1275 0728 CB18     		adds	r3, r1, r3
 1276 072a 1833     		adds	r3, r3, #24
 1277 072c 1968     		ldr	r1, [r3]
 1278 072e 7A68     		ldr	r2, [r7, #4]
 1279 0730 1300     		movs	r3, r2
 1280 0732 DB00     		lsls	r3, r3, #3
 1281 0734 9B1A     		subs	r3, r3, r2
 1282 0736 9B00     		lsls	r3, r3, #2
 1283 0738 1E4A     		ldr	r2, .L61
 1284 073a 9B18     		adds	r3, r3, r2
 1285 073c 1800     		movs	r0, r3
 1286 073e 8847     		blx	r1
 1287              	.LVL96:
 173:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1288              		.loc 1 173 0 discriminator 3
 1289 0740 7B68     		ldr	r3, [r7, #4]
 1290 0742 0133     		adds	r3, r3, #1
 1291 0744 7B60     		str	r3, [r7, #4]
 1292              	.L56:
 173:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1293              		.loc 1 173 0 is_stmt 0 discriminator 1
 1294 0746 7B68     		ldr	r3, [r7, #4]
 1295 0748 632B     		cmp	r3, #99
 1296 074a E7DD     		ble	.L57
 1297              	.LBE7:
 1298              	.LBB8:
 175:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 176:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         for (int i = 0; i < BOID_COUNT; i++) {
 1299              		.loc 1 176 0 is_stmt 1
 1300 074c 0023     		movs	r3, #0
 1301 074e 3B60     		str	r3, [r7]
 1302 0750 26E0     		b	.L58
 1303              	.L59:
 177:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 1304              		.loc 1 177 0 discriminator 3
 1305 0752 1849     		ldr	r1, .L61
 1306 0754 3A68     		ldr	r2, [r7]
 1307 0756 1300     		movs	r3, r2
 1308 0758 DB00     		lsls	r3, r3, #3
 1309 075a 9B1A     		subs	r3, r3, r2
 1310 075c 9B00     		lsls	r3, r3, #2
 1311 075e CB18     		adds	r3, r1, r3
 1312 0760 1433     		adds	r3, r3, #20
 1313 0762 1968     		ldr	r1, [r3]
 1314 0764 3A68     		ldr	r2, [r7]
 1315 0766 1300     		movs	r3, r2
 1316 0768 DB00     		lsls	r3, r3, #3
 1317 076a 9B1A     		subs	r3, r3, r2
 1318 076c 9B00     		lsls	r3, r3, #2
 1319 076e 114A     		ldr	r2, .L61
 1320 0770 9B18     		adds	r3, r3, r2
 1321 0772 1800     		movs	r0, r3
 1322 0774 8847     		blx	r1
 1323              	.LVL97:
 178:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             boids[i].draw(&boids[i]);
 1324              		.loc 1 178 0 discriminator 3
 1325 0776 0F49     		ldr	r1, .L61
 1326 0778 3A68     		ldr	r2, [r7]
 1327 077a 1300     		movs	r3, r2
 1328 077c DB00     		lsls	r3, r3, #3
 1329 077e 9B1A     		subs	r3, r3, r2
 1330 0780 9B00     		lsls	r3, r3, #2
 1331 0782 CB18     		adds	r3, r1, r3
 1332 0784 1033     		adds	r3, r3, #16
 1333 0786 1968     		ldr	r1, [r3]
 1334 0788 3A68     		ldr	r2, [r7]
 1335 078a 1300     		movs	r3, r2
 1336 078c DB00     		lsls	r3, r3, #3
 1337 078e 9B1A     		subs	r3, r3, r2
 1338 0790 9B00     		lsls	r3, r3, #2
 1339 0792 084A     		ldr	r2, .L61
 1340 0794 9B18     		adds	r3, r3, r2
 1341 0796 1800     		movs	r0, r3
 1342 0798 8847     		blx	r1
 1343              	.LVL98:
 176:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 1344              		.loc 1 176 0 discriminator 3
 1345 079a 3B68     		ldr	r3, [r7]
 1346 079c 0133     		adds	r3, r3, #1
 1347 079e 3B60     		str	r3, [r7]
 1348              	.L58:
 176:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****             boids[i].updatePos(&boids[i]);
 1349              		.loc 1 176 0 is_stmt 0 discriminator 1
 1350 07a0 3B68     		ldr	r3, [r7]
 1351 07a2 632B     		cmp	r3, #99
 1352 07a4 D5DD     		ble	.L59
 1353              	.LBE8:
 179:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         }
 180:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         
 181:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c ****         draw_buffer();
 1354              		.loc 1 181 0 is_stmt 1
 1355 07a6 FFF7FEFF 		bl	draw_buffer
 182:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		delay_milli(2);
 1356              		.loc 1 182 0
 1357 07aa 0220     		movs	r0, #2
 1358 07ac FFF7FEFF 		bl	delay_milli
 1359              	.LBE6:
 171:C:/Users/oskargi/Downloads/boids/Boids-Simulation\startup.c **** 		clear_buffer();
 1360              		.loc 1 171 0
 1361 07b0 AFE7     		b	.L60
 1362              	.L62:
 1363 07b2 C046     		.align	2
 1364              	.L61:
 1365 07b4 00040000 		.word	boids
 1366              		.cfi_endproc
 1367              	.LFE7:
 1369              	.Letext0:
 1370              		.file 2 "C:/Users/oskargi/Downloads/boids/Boids-Simulation/drivers.h"
 1371              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 1372              		.file 4 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 1373              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\7.2.1\\include\\stddef.h"
 1374              		.file 6 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
