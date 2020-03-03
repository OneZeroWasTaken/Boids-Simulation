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
  11              		.file	"drivers.c"
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
  20              		.text
  21              		.align	1
  22              		.syntax unified
  23              		.code	16
  24              		.thumb_func
  25              		.fpu softvfp
  27              	delay_250ns:
  28              	.LFB0:
  29              		.file 1 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/drivers.c"
   1:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #include "drivers.h"
   2:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
   3:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** //#define USBDM
   4:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define SIMULATOR
   5:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
   6:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define PORT_BASE   ((volatile unsigned int *) 0x40021000)
   7:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
   8:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define portModer   ((volatile unsigned int *) 0x40021000)
   9:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define portOtyper  ((volatile unsigned int *) 0x40021004)
  10:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define portOspeedr ((volatile unsigned int *) 0x40021008)
  11:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define portPupdr   ((volatile unsigned int *) 0x4002100C)
  12:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  13:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define portIdrLow  ((volatile unsigned char *) 0x40021010)
  14:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define portIdrHigh ((volatile unsigned char *) 0x40021011)
  15:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define portOdrLow  ((volatile unsigned char *) 0x40021014)
  16:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define portOdrHigh ((volatile unsigned char *) 0x40021015)
  17:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  18:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define B_E         0x40
  19:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define B_SELECT    4
  20:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define B_RW        2
  21:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define B_RS        1
  22:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  23:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define B_RST       0x20
  24:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define B_CS2       0x10
  25:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define B_CS1       0x08
  26:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  27:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define LCD_ON          0b00111111
  28:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define LCD_OFF         0b00111110
  29:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define LCD_SET_ADD     0b01000000
  30:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define LCD_SET_PAGE    0b10111000
  31:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define LCD_DISP_START  0b11000000
  32:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define LCD_BUSY        0b10000000
  33:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  34:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  35:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define STK_CTRL    ((volatile unsigned int *) 0xE000E010)
  36:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define STK_LOAD    ((volatile unsigned int *) 0xE000E014)
  37:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define STK_VAL     ((volatile unsigned int *) 0xE000E018)
  38:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  39:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  40:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  41:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define GPIO_D_MODER    (volatile unsigned int *) (0x40020C00)
  42:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define GPIO_D_OTYPER   (volatile unsigned int *) (0x40020C04)
  43:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define GPIO_D_OSPEEDR  (volatile unsigned int *) (0x40020C08)
  44:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define GPIO_D_PUPDR    (volatile unsigned int *) (0x40020C0C)
  45:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define GPIO_D_IDR      (volatile unsigned int *) (0x40020C10)
  46:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define GPIO_D_ODR      (volatile unsigned int *) (0x40020C14)
  47:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  48:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define KB_OUT  (volatile unsigned char *) (0x40020C15)
  49:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define KB_IN   (volatile unsigned char *) (0x40020C11)
  50:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  51:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** #define SEG_OUT (unsigned char *) GPIO_D_ODR
  52:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  53:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void delay_250ns(void) {
  30              		.loc 1 53 31
  31              		.cfi_startproc
  32              		@ args = 0, pretend = 0, frame = 0
  33              		@ frame_needed = 1, uses_anonymous_args = 0
  34 0000 80B5     		push	{r7, lr}
  35              		.cfi_def_cfa_offset 8
  36              		.cfi_offset 7, -8
  37              		.cfi_offset 14, -4
  38 0002 00AF     		add	r7, sp, #0
  39              		.cfi_def_cfa_register 7
  54:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *STK_CTRL = 0;
  40              		.loc 1 54 5
  41 0004 0C4B     		ldr	r3, .L3
  42              		.loc 1 54 15
  43 0006 0022     		movs	r2, #0
  44 0008 1A60     		str	r2, [r3]
  55:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *STK_LOAD = (168/4)-1;
  45              		.loc 1 55 5
  46 000a 0C4B     		ldr	r3, .L3+4
  47              		.loc 1 55 15
  48 000c 2922     		movs	r2, #41
  49 000e 1A60     		str	r2, [r3]
  56:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *STK_VAL = 0;
  50              		.loc 1 56 5
  51 0010 0B4B     		ldr	r3, .L3+8
  52              		.loc 1 56 14
  53 0012 0022     		movs	r2, #0
  54 0014 1A60     		str	r2, [r3]
  57:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *STK_CTRL = 5;
  55              		.loc 1 57 5
  56 0016 084B     		ldr	r3, .L3
  57              		.loc 1 57 15
  58 0018 0522     		movs	r2, #5
  59 001a 1A60     		str	r2, [r3]
  58:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     while((*STK_CTRL & 0x10000) == 0);
  60              		.loc 1 58 10
  61 001c C046     		nop
  62              	.L2:
  63              		.loc 1 58 12 discriminator 1
  64 001e 064B     		ldr	r3, .L3
  65 0020 1A68     		ldr	r2, [r3]
  66              		.loc 1 58 22 discriminator 1
  67 0022 8023     		movs	r3, #128
  68 0024 5B02     		lsls	r3, r3, #9
  69 0026 1340     		ands	r3, r2
  70              		.loc 1 58 10 discriminator 1
  71 0028 F9D0     		beq	.L2
  59:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *STK_CTRL = 0;
  72              		.loc 1 59 5
  73 002a 034B     		ldr	r3, .L3
  74              		.loc 1 59 15
  75 002c 0022     		movs	r2, #0
  76 002e 1A60     		str	r2, [r3]
  60:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
  77              		.loc 1 60 1
  78 0030 C046     		nop
  79 0032 BD46     		mov	sp, r7
  80              		@ sp needed
  81 0034 80BD     		pop	{r7, pc}
  82              	.L4:
  83 0036 C046     		.align	2
  84              	.L3:
  85 0038 10E000E0 		.word	-536813552
  86 003c 14E000E0 		.word	-536813548
  87 0040 18E000E0 		.word	-536813544
  88              		.cfi_endproc
  89              	.LFE0:
  91              		.align	1
  92              		.syntax unified
  93              		.code	16
  94              		.thumb_func
  95              		.fpu softvfp
  97              	delay_500ns:
  98              	.LFB1:
  61:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  62:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void delay_500ns(void) {
  99              		.loc 1 62 31
 100              		.cfi_startproc
 101              		@ args = 0, pretend = 0, frame = 0
 102              		@ frame_needed = 1, uses_anonymous_args = 0
 103 0044 80B5     		push	{r7, lr}
 104              		.cfi_def_cfa_offset 8
 105              		.cfi_offset 7, -8
 106              		.cfi_offset 14, -4
 107 0046 00AF     		add	r7, sp, #0
 108              		.cfi_def_cfa_register 7
  63:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_250ns();
 109              		.loc 1 63 5
 110 0048 FFF7DAFF 		bl	delay_250ns
  64:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_250ns();
 111              		.loc 1 64 5
 112 004c FFF7D8FF 		bl	delay_250ns
  65:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 113              		.loc 1 65 1
 114 0050 C046     		nop
 115 0052 BD46     		mov	sp, r7
 116              		@ sp needed
 117 0054 80BD     		pop	{r7, pc}
 118              		.cfi_endproc
 119              	.LFE1:
 121              		.align	1
 122              		.global	delay_mikro
 123              		.syntax unified
 124              		.code	16
 125              		.thumb_func
 126              		.fpu softvfp
 128              	delay_mikro:
 129              	.LFB2:
  66:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  67:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** void delay_mikro(unsigned int us) {
 130              		.loc 1 67 35
 131              		.cfi_startproc
 132              		@ args = 0, pretend = 0, frame = 8
 133              		@ frame_needed = 1, uses_anonymous_args = 0
 134 0056 80B5     		push	{r7, lr}
 135              		.cfi_def_cfa_offset 8
 136              		.cfi_offset 7, -8
 137              		.cfi_offset 14, -4
 138 0058 82B0     		sub	sp, sp, #8
 139              		.cfi_def_cfa_offset 16
 140 005a 00AF     		add	r7, sp, #0
 141              		.cfi_def_cfa_register 7
 142 005c 7860     		str	r0, [r7, #4]
  68:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     #ifdef SIMULATOR
  69:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         if (us > 500) {
 143              		.loc 1 69 12
 144 005e 7A68     		ldr	r2, [r7, #4]
 145 0060 FA23     		movs	r3, #250
 146 0062 5B00     		lsls	r3, r3, #1
 147 0064 9A42     		cmp	r2, r3
 148 0066 0DD9     		bls	.L8
  70:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             us = 1;
 149              		.loc 1 70 16
 150 0068 0123     		movs	r3, #1
 151 006a 7B60     		str	r3, [r7, #4]
  71:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         }
  72:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     #endif
  73:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     while (us > 0) {
 152              		.loc 1 73 11
 153 006c 0AE0     		b	.L8
 154              	.L9:
  74:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_250ns();
 155              		.loc 1 74 9
 156 006e FFF7C7FF 		bl	delay_250ns
  75:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_250ns();
 157              		.loc 1 75 9
 158 0072 FFF7C5FF 		bl	delay_250ns
  76:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_250ns();
 159              		.loc 1 76 9
 160 0076 FFF7C3FF 		bl	delay_250ns
  77:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_250ns();
 161              		.loc 1 77 9
 162 007a FFF7C1FF 		bl	delay_250ns
  78:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         us--;
 163              		.loc 1 78 11
 164 007e 7B68     		ldr	r3, [r7, #4]
 165 0080 013B     		subs	r3, r3, #1
 166 0082 7B60     		str	r3, [r7, #4]
 167              	.L8:
  73:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_250ns();
 168              		.loc 1 73 11
 169 0084 7B68     		ldr	r3, [r7, #4]
 170 0086 002B     		cmp	r3, #0
 171 0088 F1D1     		bne	.L9
  79:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
  80:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 172              		.loc 1 80 1
 173 008a C046     		nop
 174 008c C046     		nop
 175 008e BD46     		mov	sp, r7
 176 0090 02B0     		add	sp, sp, #8
 177              		@ sp needed
 178 0092 80BD     		pop	{r7, pc}
 179              		.cfi_endproc
 180              	.LFE2:
 182              		.align	1
 183              		.global	delay_milli
 184              		.syntax unified
 185              		.code	16
 186              		.thumb_func
 187              		.fpu softvfp
 189              	delay_milli:
 190              	.LFB3:
  81:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  82:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** void delay_milli(unsigned int ms) {
 191              		.loc 1 82 35
 192              		.cfi_startproc
 193              		@ args = 0, pretend = 0, frame = 8
 194              		@ frame_needed = 1, uses_anonymous_args = 0
 195 0094 80B5     		push	{r7, lr}
 196              		.cfi_def_cfa_offset 8
 197              		.cfi_offset 7, -8
 198              		.cfi_offset 14, -4
 199 0096 82B0     		sub	sp, sp, #8
 200              		.cfi_def_cfa_offset 16
 201 0098 00AF     		add	r7, sp, #0
 202              		.cfi_def_cfa_register 7
 203 009a 7860     		str	r0, [r7, #4]
  83:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     #ifdef SIMULATOR
  84:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         ms = 1;
 204              		.loc 1 84 12
 205 009c 0123     		movs	r3, #1
 206 009e 7B60     		str	r3, [r7, #4]
  85:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     #endif
  86:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     while (ms > 0) {
 207              		.loc 1 86 11
 208 00a0 07E0     		b	.L11
 209              	.L12:
  87:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_mikro(1000);
 210              		.loc 1 87 9
 211 00a2 FA23     		movs	r3, #250
 212 00a4 9B00     		lsls	r3, r3, #2
 213 00a6 1800     		movs	r0, r3
 214 00a8 FFF7FEFF 		bl	delay_mikro
  88:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         ms--;
 215              		.loc 1 88 11
 216 00ac 7B68     		ldr	r3, [r7, #4]
 217 00ae 013B     		subs	r3, r3, #1
 218 00b0 7B60     		str	r3, [r7, #4]
 219              	.L11:
  86:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_mikro(1000);
 220              		.loc 1 86 11
 221 00b2 7B68     		ldr	r3, [r7, #4]
 222 00b4 002B     		cmp	r3, #0
 223 00b6 F4D1     		bne	.L12
  89:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
  90:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 224              		.loc 1 90 1
 225 00b8 C046     		nop
 226 00ba C046     		nop
 227 00bc BD46     		mov	sp, r7
 228 00be 02B0     		add	sp, sp, #8
 229              		@ sp needed
 230 00c0 80BD     		pop	{r7, pc}
 231              		.cfi_endproc
 232              	.LFE3:
 234              		.align	1
 235              		.syntax unified
 236              		.code	16
 237              		.thumb_func
 238              		.fpu softvfp
 240              	graphic_ctrl_bit_set:
 241              	.LFB4:
  91:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  92:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  93:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** typedef unsigned char uint8_t;
  94:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
  95:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void graphic_ctrl_bit_set(uint8_t x) {
 242              		.loc 1 95 45
 243              		.cfi_startproc
 244              		@ args = 0, pretend = 0, frame = 16
 245              		@ frame_needed = 1, uses_anonymous_args = 0
 246 00c2 80B5     		push	{r7, lr}
 247              		.cfi_def_cfa_offset 8
 248              		.cfi_offset 7, -8
 249              		.cfi_offset 14, -4
 250 00c4 84B0     		sub	sp, sp, #16
 251              		.cfi_def_cfa_offset 24
 252 00c6 00AF     		add	r7, sp, #0
 253              		.cfi_def_cfa_register 7
 254 00c8 0200     		movs	r2, r0
 255 00ca FB1D     		adds	r3, r7, #7
 256 00cc 1A70     		strb	r2, [r3]
  96:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     uint8_t c;
  97:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c = *portOdrLow;
 257              		.loc 1 97 9
 258 00ce 104A     		ldr	r2, .L14
 259              		.loc 1 97 7
 260 00d0 0F20     		movs	r0, #15
 261 00d2 3B18     		adds	r3, r7, r0
 262 00d4 1278     		ldrb	r2, [r2]
 263 00d6 1A70     		strb	r2, [r3]
  98:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c &= ~B_SELECT;
 264              		.loc 1 98 7
 265 00d8 3B18     		adds	r3, r7, r0
 266 00da 3A18     		adds	r2, r7, r0
 267 00dc 1278     		ldrb	r2, [r2]
 268 00de 0421     		movs	r1, #4
 269 00e0 8A43     		bics	r2, r1
 270 00e2 1A70     		strb	r2, [r3]
  99:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c |= (~B_SELECT & x);
 271              		.loc 1 99 21
 272 00e4 FB1D     		adds	r3, r7, #7
 273 00e6 1B78     		ldrb	r3, [r3]
 274 00e8 5BB2     		sxtb	r3, r3
 275 00ea 0422     		movs	r2, #4
 276 00ec 9343     		bics	r3, r2
 277 00ee 5AB2     		sxtb	r2, r3
 278              		.loc 1 99 7
 279 00f0 3B18     		adds	r3, r7, r0
 280 00f2 1B78     		ldrb	r3, [r3]
 281 00f4 5BB2     		sxtb	r3, r3
 282 00f6 1343     		orrs	r3, r2
 283 00f8 5AB2     		sxtb	r2, r3
 284 00fa 3B18     		adds	r3, r7, r0
 285 00fc 1A70     		strb	r2, [r3]
 100:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portOdrLow = c;
 286              		.loc 1 100 5
 287 00fe 044A     		ldr	r2, .L14
 288              		.loc 1 100 17
 289 0100 3B18     		adds	r3, r7, r0
 290 0102 1B78     		ldrb	r3, [r3]
 291 0104 1370     		strb	r3, [r2]
 101:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 292              		.loc 1 101 1
 293 0106 C046     		nop
 294 0108 BD46     		mov	sp, r7
 295 010a 04B0     		add	sp, sp, #16
 296              		@ sp needed
 297 010c 80BD     		pop	{r7, pc}
 298              	.L15:
 299 010e C046     		.align	2
 300              	.L14:
 301 0110 14100240 		.word	1073877012
 302              		.cfi_endproc
 303              	.LFE4:
 305              		.align	1
 306              		.syntax unified
 307              		.code	16
 308              		.thumb_func
 309              		.fpu softvfp
 311              	graphic_ctrl_bit_clear:
 312              	.LFB5:
 102:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 103:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void graphic_ctrl_bit_clear(uint8_t x) {
 313              		.loc 1 103 47
 314              		.cfi_startproc
 315              		@ args = 0, pretend = 0, frame = 16
 316              		@ frame_needed = 1, uses_anonymous_args = 0
 317 0114 80B5     		push	{r7, lr}
 318              		.cfi_def_cfa_offset 8
 319              		.cfi_offset 7, -8
 320              		.cfi_offset 14, -4
 321 0116 84B0     		sub	sp, sp, #16
 322              		.cfi_def_cfa_offset 24
 323 0118 00AF     		add	r7, sp, #0
 324              		.cfi_def_cfa_register 7
 325 011a 0200     		movs	r2, r0
 326 011c FB1D     		adds	r3, r7, #7
 327 011e 1A70     		strb	r2, [r3]
 104:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     uint8_t c;
 105:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c = *portOdrLow;
 328              		.loc 1 105 9
 329 0120 0F4A     		ldr	r2, .L17
 330              		.loc 1 105 7
 331 0122 0F20     		movs	r0, #15
 332 0124 3B18     		adds	r3, r7, r0
 333 0126 1278     		ldrb	r2, [r2]
 334 0128 1A70     		strb	r2, [r3]
 106:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c &= ~B_SELECT;
 335              		.loc 1 106 7
 336 012a 3B18     		adds	r3, r7, r0
 337 012c 3A18     		adds	r2, r7, r0
 338 012e 1278     		ldrb	r2, [r2]
 339 0130 0421     		movs	r1, #4
 340 0132 8A43     		bics	r2, r1
 341 0134 1A70     		strb	r2, [r3]
 107:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c &= ~x;
 342              		.loc 1 107 7
 343 0136 FB1D     		adds	r3, r7, #7
 344 0138 1B78     		ldrb	r3, [r3]
 345 013a 5BB2     		sxtb	r3, r3
 346 013c DB43     		mvns	r3, r3
 347 013e 5BB2     		sxtb	r3, r3
 348 0140 3A18     		adds	r2, r7, r0
 349 0142 1278     		ldrb	r2, [r2]
 350 0144 52B2     		sxtb	r2, r2
 351 0146 1340     		ands	r3, r2
 352 0148 5AB2     		sxtb	r2, r3
 353 014a 3B18     		adds	r3, r7, r0
 354 014c 1A70     		strb	r2, [r3]
 108:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portOdrLow = c;
 355              		.loc 1 108 5
 356 014e 044A     		ldr	r2, .L17
 357              		.loc 1 108 17
 358 0150 3B18     		adds	r3, r7, r0
 359 0152 1B78     		ldrb	r3, [r3]
 360 0154 1370     		strb	r3, [r2]
 109:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 361              		.loc 1 109 1
 362 0156 C046     		nop
 363 0158 BD46     		mov	sp, r7
 364 015a 04B0     		add	sp, sp, #16
 365              		@ sp needed
 366 015c 80BD     		pop	{r7, pc}
 367              	.L18:
 368 015e C046     		.align	2
 369              	.L17:
 370 0160 14100240 		.word	1073877012
 371              		.cfi_endproc
 372              	.LFE5:
 374              		.align	1
 375              		.syntax unified
 376              		.code	16
 377              		.thumb_func
 378              		.fpu softvfp
 380              	select_controller:
 381              	.LFB6:
 110:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 111:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void select_controller(uint8_t controller) {
 382              		.loc 1 111 51
 383              		.cfi_startproc
 384              		@ args = 0, pretend = 0, frame = 16
 385              		@ frame_needed = 1, uses_anonymous_args = 0
 386 0164 80B5     		push	{r7, lr}
 387              		.cfi_def_cfa_offset 8
 388              		.cfi_offset 7, -8
 389              		.cfi_offset 14, -4
 390 0166 84B0     		sub	sp, sp, #16
 391              		.cfi_def_cfa_offset 24
 392 0168 00AF     		add	r7, sp, #0
 393              		.cfi_def_cfa_register 7
 394 016a 0200     		movs	r2, r0
 395 016c FB1D     		adds	r3, r7, #7
 396 016e 1A70     		strb	r2, [r3]
 112:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     uint8_t mask = (B_CS1 | B_CS2);
 397              		.loc 1 112 13
 398 0170 0F20     		movs	r0, #15
 399 0172 3B18     		adds	r3, r7, r0
 400 0174 1822     		movs	r2, #24
 401 0176 1A70     		strb	r2, [r3]
 113:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     controller &= mask;
 402              		.loc 1 113 16
 403 0178 FB1D     		adds	r3, r7, #7
 404 017a FA1D     		adds	r2, r7, #7
 405 017c 3918     		adds	r1, r7, r0
 406 017e 1278     		ldrb	r2, [r2]
 407 0180 0978     		ldrb	r1, [r1]
 408 0182 0A40     		ands	r2, r1
 409 0184 1A70     		strb	r2, [r3]
 114:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     
 115:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     uint8_t c;
 116:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c = *portOdrLow;
 410              		.loc 1 116 9
 411 0186 104A     		ldr	r2, .L20
 412              		.loc 1 116 7
 413 0188 0E21     		movs	r1, #14
 414 018a 7B18     		adds	r3, r7, r1
 415 018c 1278     		ldrb	r2, [r2]
 416 018e 1A70     		strb	r2, [r3]
 117:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c &= ~mask;     //Set CS1 and CS2 to 0
 417              		.loc 1 117 7
 418 0190 3B18     		adds	r3, r7, r0
 419 0192 1B78     		ldrb	r3, [r3]
 420 0194 5BB2     		sxtb	r3, r3
 421 0196 DB43     		mvns	r3, r3
 422 0198 5BB2     		sxtb	r3, r3
 423 019a 7A18     		adds	r2, r7, r1
 424 019c 1278     		ldrb	r2, [r2]
 425 019e 52B2     		sxtb	r2, r2
 426 01a0 1340     		ands	r3, r2
 427 01a2 5AB2     		sxtb	r2, r3
 428 01a4 7B18     		adds	r3, r7, r1
 429 01a6 1A70     		strb	r2, [r3]
 118:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     c |= controller;//OR in CS1 and CS2 from controller
 430              		.loc 1 118 7
 431 01a8 7B18     		adds	r3, r7, r1
 432 01aa 0800     		movs	r0, r1
 433 01ac 7918     		adds	r1, r7, r1
 434 01ae FA1D     		adds	r2, r7, #7
 435 01b0 0978     		ldrb	r1, [r1]
 436 01b2 1278     		ldrb	r2, [r2]
 437 01b4 0A43     		orrs	r2, r1
 438 01b6 1A70     		strb	r2, [r3]
 119:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portOdrLow = c;
 439              		.loc 1 119 5
 440 01b8 034A     		ldr	r2, .L20
 441              		.loc 1 119 17
 442 01ba 3B18     		adds	r3, r7, r0
 443 01bc 1B78     		ldrb	r3, [r3]
 444 01be 1370     		strb	r3, [r2]
 120:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 445              		.loc 1 120 1
 446 01c0 C046     		nop
 447 01c2 BD46     		mov	sp, r7
 448 01c4 04B0     		add	sp, sp, #16
 449              		@ sp needed
 450 01c6 80BD     		pop	{r7, pc}
 451              	.L21:
 452              		.align	2
 453              	.L20:
 454 01c8 14100240 		.word	1073877012
 455              		.cfi_endproc
 456              	.LFE6:
 458              		.align	1
 459              		.syntax unified
 460              		.code	16
 461              		.thumb_func
 462              		.fpu softvfp
 464              	graphic_wait_ready:
 465              	.LFB7:
 121:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 122:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void graphic_wait_ready(void) {
 466              		.loc 1 122 38
 467              		.cfi_startproc
 468              		@ args = 0, pretend = 0, frame = 8
 469              		@ frame_needed = 1, uses_anonymous_args = 0
 470 01cc 80B5     		push	{r7, lr}
 471              		.cfi_def_cfa_offset 8
 472              		.cfi_offset 7, -8
 473              		.cfi_offset 14, -4
 474 01ce 82B0     		sub	sp, sp, #8
 475              		.cfi_def_cfa_offset 16
 476 01d0 00AF     		add	r7, sp, #0
 477              		.cfi_def_cfa_register 7
 123:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_E);
 478              		.loc 1 123 5
 479 01d2 4020     		movs	r0, #64
 480 01d4 FFF79EFF 		bl	graphic_ctrl_bit_clear
 124:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portModer = 0x00005555;
 481              		.loc 1 124 5
 482 01d8 144B     		ldr	r3, .L23
 483              		.loc 1 124 16
 484 01da 154A     		ldr	r2, .L23+4
 485 01dc 1A60     		str	r2, [r3]
 125:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_RS);
 486              		.loc 1 125 5
 487 01de 0120     		movs	r0, #1
 488 01e0 FFF798FF 		bl	graphic_ctrl_bit_clear
 126:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_RW);
 489              		.loc 1 126 5
 490 01e4 0220     		movs	r0, #2
 491 01e6 FFF76CFF 		bl	graphic_ctrl_bit_set
 127:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_500ns();
 492              		.loc 1 127 5
 493 01ea FFF72BFF 		bl	delay_500ns
 494              	.LBB2:
 128:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     
 129:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     while(1) {
 130:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         graphic_ctrl_bit_set(B_E);
 495              		.loc 1 130 9
 496 01ee 4020     		movs	r0, #64
 497 01f0 FFF767FF 		bl	graphic_ctrl_bit_set
 131:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_500ns();
 498              		.loc 1 131 9
 499 01f4 FFF726FF 		bl	delay_500ns
 132:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         graphic_ctrl_bit_clear(B_E);
 500              		.loc 1 132 9
 501 01f8 4020     		movs	r0, #64
 502 01fa FFF78BFF 		bl	graphic_ctrl_bit_clear
 133:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         delay_500ns();
 503              		.loc 1 133 9
 504 01fe FFF721FF 		bl	delay_500ns
 134:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         uint8_t busy = *portIdrHigh;
 505              		.loc 1 134 24
 506 0202 0C4A     		ldr	r2, .L23+8
 507              		.loc 1 134 17
 508 0204 FB1D     		adds	r3, r7, #7
 509 0206 1278     		ldrb	r2, [r2]
 510 0208 1A70     		strb	r2, [r3]
 135:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         busy &= LCD_BUSY;
 511              		.loc 1 135 14
 512 020a FB1D     		adds	r3, r7, #7
 513 020c FA1D     		adds	r2, r7, #7
 514 020e 1278     		ldrb	r2, [r2]
 515 0210 7F21     		movs	r1, #127
 516 0212 8A43     		bics	r2, r1
 517 0214 1A70     		strb	r2, [r3]
 136:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         if (~busy) {
 137:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             break;
 518              		.loc 1 137 13
 519 0216 C046     		nop
 520              	.LBE2:
 138:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         }
 139:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
 140:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_E);
 521              		.loc 1 140 5
 522 0218 4020     		movs	r0, #64
 523 021a FFF752FF 		bl	graphic_ctrl_bit_set
 141:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portModer = 0x55555555;
 524              		.loc 1 141 5
 525 021e 034B     		ldr	r3, .L23
 526              		.loc 1 141 16
 527 0220 054A     		ldr	r2, .L23+12
 528 0222 1A60     		str	r2, [r3]
 142:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 529              		.loc 1 142 1
 530 0224 C046     		nop
 531 0226 BD46     		mov	sp, r7
 532 0228 02B0     		add	sp, sp, #8
 533              		@ sp needed
 534 022a 80BD     		pop	{r7, pc}
 535              	.L24:
 536              		.align	2
 537              	.L23:
 538 022c 00100240 		.word	1073876992
 539 0230 55550000 		.word	21845
 540 0234 11100240 		.word	1073877009
 541 0238 55555555 		.word	1431655765
 542              		.cfi_endproc
 543              	.LFE7:
 545              		.align	1
 546              		.syntax unified
 547              		.code	16
 548              		.thumb_func
 549              		.fpu softvfp
 551              	graphic_read:
 552              	.LFB8:
 143:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 144:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static uint8_t graphic_read(uint8_t controller) {
 553              		.loc 1 144 49
 554              		.cfi_startproc
 555              		@ args = 0, pretend = 0, frame = 16
 556              		@ frame_needed = 1, uses_anonymous_args = 0
 557 023c 80B5     		push	{r7, lr}
 558              		.cfi_def_cfa_offset 8
 559              		.cfi_offset 7, -8
 560              		.cfi_offset 14, -4
 561 023e 84B0     		sub	sp, sp, #16
 562              		.cfi_def_cfa_offset 24
 563 0240 00AF     		add	r7, sp, #0
 564              		.cfi_def_cfa_register 7
 565 0242 0200     		movs	r2, r0
 566 0244 FB1D     		adds	r3, r7, #7
 567 0246 1A70     		strb	r2, [r3]
 145:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_E);
 568              		.loc 1 145 5
 569 0248 4020     		movs	r0, #64
 570 024a FFF763FF 		bl	graphic_ctrl_bit_clear
 146:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portModer = 0x00005555;
 571              		.loc 1 146 5
 572 024e 1B4B     		ldr	r3, .L29
 573              		.loc 1 146 16
 574 0250 1B4A     		ldr	r2, .L29+4
 575 0252 1A60     		str	r2, [r3]
 147:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_RS);
 576              		.loc 1 147 5
 577 0254 0120     		movs	r0, #1
 578 0256 FFF734FF 		bl	graphic_ctrl_bit_set
 148:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_RW);
 579              		.loc 1 148 5
 580 025a 0220     		movs	r0, #2
 581 025c FFF731FF 		bl	graphic_ctrl_bit_set
 149:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     select_controller(controller);
 582              		.loc 1 149 5
 583 0260 FB1D     		adds	r3, r7, #7
 584 0262 1B78     		ldrb	r3, [r3]
 585 0264 1800     		movs	r0, r3
 586 0266 FFF77DFF 		bl	select_controller
 150:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_500ns();
 587              		.loc 1 150 5
 588 026a FFF7EBFE 		bl	delay_500ns
 151:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_E);
 589              		.loc 1 151 5
 590 026e 4020     		movs	r0, #64
 591 0270 FFF727FF 		bl	graphic_ctrl_bit_set
 152:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_500ns();
 592              		.loc 1 152 5
 593 0274 FFF7E6FE 		bl	delay_500ns
 153:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     uint8_t rv = *portIdrHigh;
 594              		.loc 1 153 18
 595 0278 124A     		ldr	r2, .L29+8
 596              		.loc 1 153 13
 597 027a 0F23     		movs	r3, #15
 598 027c FB18     		adds	r3, r7, r3
 599 027e 1278     		ldrb	r2, [r2]
 600 0280 1A70     		strb	r2, [r3]
 154:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_E);
 601              		.loc 1 154 5
 602 0282 4020     		movs	r0, #64
 603 0284 FFF746FF 		bl	graphic_ctrl_bit_clear
 155:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portModer = 0x55555555;
 604              		.loc 1 155 5
 605 0288 0C4B     		ldr	r3, .L29
 606              		.loc 1 155 16
 607 028a 0F4A     		ldr	r2, .L29+12
 608 028c 1A60     		str	r2, [r3]
 156:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     if (controller == B_CS1 || controller == B_CS2) {
 609              		.loc 1 156 8
 610 028e FB1D     		adds	r3, r7, #7
 611 0290 1B78     		ldrb	r3, [r3]
 612 0292 082B     		cmp	r3, #8
 613 0294 03D0     		beq	.L26
 614              		.loc 1 156 29 discriminator 1
 615 0296 FB1D     		adds	r3, r7, #7
 616 0298 1B78     		ldrb	r3, [r3]
 617 029a 102B     		cmp	r3, #16
 618 029c 06D1     		bne	.L27
 619              	.L26:
 157:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         select_controller(controller);
 620              		.loc 1 157 9
 621 029e FB1D     		adds	r3, r7, #7
 622 02a0 1B78     		ldrb	r3, [r3]
 623 02a2 1800     		movs	r0, r3
 624 02a4 FFF75EFF 		bl	select_controller
 158:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         graphic_wait_ready();
 625              		.loc 1 158 9
 626 02a8 FFF790FF 		bl	graphic_wait_ready
 627              	.L27:
 159:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
 160:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     return rv;
 628              		.loc 1 160 12
 629 02ac 0F23     		movs	r3, #15
 630 02ae FB18     		adds	r3, r7, r3
 631 02b0 1B78     		ldrb	r3, [r3]
 161:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 632              		.loc 1 161 1
 633 02b2 1800     		movs	r0, r3
 634 02b4 BD46     		mov	sp, r7
 635 02b6 04B0     		add	sp, sp, #16
 636              		@ sp needed
 637 02b8 80BD     		pop	{r7, pc}
 638              	.L30:
 639 02ba C046     		.align	2
 640              	.L29:
 641 02bc 00100240 		.word	1073876992
 642 02c0 55550000 		.word	21845
 643 02c4 11100240 		.word	1073877009
 644 02c8 55555555 		.word	1431655765
 645              		.cfi_endproc
 646              	.LFE8:
 648              		.align	1
 649              		.syntax unified
 650              		.code	16
 651              		.thumb_func
 652              		.fpu softvfp
 654              	graphic_write:
 655              	.LFB9:
 162:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 163:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void graphic_write(uint8_t value, uint8_t controller) {
 656              		.loc 1 163 62
 657              		.cfi_startproc
 658              		@ args = 0, pretend = 0, frame = 8
 659              		@ frame_needed = 1, uses_anonymous_args = 0
 660 02cc 80B5     		push	{r7, lr}
 661              		.cfi_def_cfa_offset 8
 662              		.cfi_offset 7, -8
 663              		.cfi_offset 14, -4
 664 02ce 82B0     		sub	sp, sp, #8
 665              		.cfi_def_cfa_offset 16
 666 02d0 00AF     		add	r7, sp, #0
 667              		.cfi_def_cfa_register 7
 668 02d2 0200     		movs	r2, r0
 669 02d4 FB1D     		adds	r3, r7, #7
 670 02d6 1A70     		strb	r2, [r3]
 671 02d8 BB1D     		adds	r3, r7, #6
 672 02da 0A1C     		adds	r2, r1, #0
 673 02dc 1A70     		strb	r2, [r3]
 164:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portOdrHigh = value;
 674              		.loc 1 164 5
 675 02de 174A     		ldr	r2, .L34
 676              		.loc 1 164 18
 677 02e0 FB1D     		adds	r3, r7, #7
 678 02e2 1B78     		ldrb	r3, [r3]
 679 02e4 1370     		strb	r3, [r2]
 165:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     select_controller(controller);
 680              		.loc 1 165 5
 681 02e6 BB1D     		adds	r3, r7, #6
 682 02e8 1B78     		ldrb	r3, [r3]
 683 02ea 1800     		movs	r0, r3
 684 02ec FFF73AFF 		bl	select_controller
 166:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_500ns();
 685              		.loc 1 166 5
 686 02f0 FFF7A8FE 		bl	delay_500ns
 167:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_E);
 687              		.loc 1 167 5
 688 02f4 4020     		movs	r0, #64
 689 02f6 FFF7E4FE 		bl	graphic_ctrl_bit_set
 168:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_500ns();
 690              		.loc 1 168 5
 691 02fa FFF7A3FE 		bl	delay_500ns
 169:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_E);
 692              		.loc 1 169 5
 693 02fe 4020     		movs	r0, #64
 694 0300 FFF708FF 		bl	graphic_ctrl_bit_clear
 170:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     
 171:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     if (controller == B_CS1 || controller == B_CS2) {
 695              		.loc 1 171 8
 696 0304 BB1D     		adds	r3, r7, #6
 697 0306 1B78     		ldrb	r3, [r3]
 698 0308 082B     		cmp	r3, #8
 699 030a 03D0     		beq	.L32
 700              		.loc 1 171 29 discriminator 1
 701 030c BB1D     		adds	r3, r7, #6
 702 030e 1B78     		ldrb	r3, [r3]
 703 0310 102B     		cmp	r3, #16
 704 0312 06D1     		bne	.L33
 705              	.L32:
 172:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         select_controller(controller);
 706              		.loc 1 172 9
 707 0314 BB1D     		adds	r3, r7, #6
 708 0316 1B78     		ldrb	r3, [r3]
 709 0318 1800     		movs	r0, r3
 710 031a FFF723FF 		bl	select_controller
 173:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         graphic_wait_ready();
 711              		.loc 1 173 9
 712 031e FFF755FF 		bl	graphic_wait_ready
 713              	.L33:
 174:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
 175:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     
 176:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portOdrHigh = 0;
 714              		.loc 1 176 5
 715 0322 064B     		ldr	r3, .L34
 716              		.loc 1 176 18
 717 0324 0022     		movs	r2, #0
 718 0326 1A70     		strb	r2, [r3]
 177:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_E);
 719              		.loc 1 177 5
 720 0328 4020     		movs	r0, #64
 721 032a FFF7CAFE 		bl	graphic_ctrl_bit_set
 178:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     select_controller(0);
 722              		.loc 1 178 5
 723 032e 0020     		movs	r0, #0
 724 0330 FFF718FF 		bl	select_controller
 179:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 725              		.loc 1 179 1
 726 0334 C046     		nop
 727 0336 BD46     		mov	sp, r7
 728 0338 02B0     		add	sp, sp, #8
 729              		@ sp needed
 730 033a 80BD     		pop	{r7, pc}
 731              	.L35:
 732              		.align	2
 733              	.L34:
 734 033c 15100240 		.word	1073877013
 735              		.cfi_endproc
 736              	.LFE9:
 738              		.align	1
 739              		.syntax unified
 740              		.code	16
 741              		.thumb_func
 742              		.fpu softvfp
 744              	graphic_write_command:
 745              	.LFB10:
 180:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 181:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void graphic_write_command(uint8_t command, uint8_t controller) {
 746              		.loc 1 181 72
 747              		.cfi_startproc
 748              		@ args = 0, pretend = 0, frame = 8
 749              		@ frame_needed = 1, uses_anonymous_args = 0
 750 0340 80B5     		push	{r7, lr}
 751              		.cfi_def_cfa_offset 8
 752              		.cfi_offset 7, -8
 753              		.cfi_offset 14, -4
 754 0342 82B0     		sub	sp, sp, #8
 755              		.cfi_def_cfa_offset 16
 756 0344 00AF     		add	r7, sp, #0
 757              		.cfi_def_cfa_register 7
 758 0346 0200     		movs	r2, r0
 759 0348 FB1D     		adds	r3, r7, #7
 760 034a 1A70     		strb	r2, [r3]
 761 034c BB1D     		adds	r3, r7, #6
 762 034e 0A1C     		adds	r2, r1, #0
 763 0350 1A70     		strb	r2, [r3]
 182:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_E);
 764              		.loc 1 182 5
 765 0352 4020     		movs	r0, #64
 766 0354 FFF7DEFE 		bl	graphic_ctrl_bit_clear
 183:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     select_controller(controller);
 767              		.loc 1 183 5
 768 0358 BB1D     		adds	r3, r7, #6
 769 035a 1B78     		ldrb	r3, [r3]
 770 035c 1800     		movs	r0, r3
 771 035e FFF701FF 		bl	select_controller
 184:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_RS);
 772              		.loc 1 184 5
 773 0362 0120     		movs	r0, #1
 774 0364 FFF7D6FE 		bl	graphic_ctrl_bit_clear
 185:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_RW);
 775              		.loc 1 185 5
 776 0368 0220     		movs	r0, #2
 777 036a FFF7D3FE 		bl	graphic_ctrl_bit_clear
 186:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_write(command, controller);
 778              		.loc 1 186 5
 779 036e BB1D     		adds	r3, r7, #6
 780 0370 1A78     		ldrb	r2, [r3]
 781 0372 FB1D     		adds	r3, r7, #7
 782 0374 1B78     		ldrb	r3, [r3]
 783 0376 1100     		movs	r1, r2
 784 0378 1800     		movs	r0, r3
 785 037a FFF7A7FF 		bl	graphic_write
 187:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 786              		.loc 1 187 1
 787 037e C046     		nop
 788 0380 BD46     		mov	sp, r7
 789 0382 02B0     		add	sp, sp, #8
 790              		@ sp needed
 791 0384 80BD     		pop	{r7, pc}
 792              		.cfi_endproc
 793              	.LFE10:
 795              		.align	1
 796              		.syntax unified
 797              		.code	16
 798              		.thumb_func
 799              		.fpu softvfp
 801              	graphic_write_data:
 802              	.LFB11:
 188:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 189:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void graphic_write_data(uint8_t data, uint8_t controller) {
 803              		.loc 1 189 66
 804              		.cfi_startproc
 805              		@ args = 0, pretend = 0, frame = 8
 806              		@ frame_needed = 1, uses_anonymous_args = 0
 807 0386 80B5     		push	{r7, lr}
 808              		.cfi_def_cfa_offset 8
 809              		.cfi_offset 7, -8
 810              		.cfi_offset 14, -4
 811 0388 82B0     		sub	sp, sp, #8
 812              		.cfi_def_cfa_offset 16
 813 038a 00AF     		add	r7, sp, #0
 814              		.cfi_def_cfa_register 7
 815 038c 0200     		movs	r2, r0
 816 038e FB1D     		adds	r3, r7, #7
 817 0390 1A70     		strb	r2, [r3]
 818 0392 BB1D     		adds	r3, r7, #6
 819 0394 0A1C     		adds	r2, r1, #0
 820 0396 1A70     		strb	r2, [r3]
 190:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_E);
 821              		.loc 1 190 5
 822 0398 4020     		movs	r0, #64
 823 039a FFF7BBFE 		bl	graphic_ctrl_bit_clear
 191:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     select_controller(controller);
 824              		.loc 1 191 5
 825 039e BB1D     		adds	r3, r7, #6
 826 03a0 1B78     		ldrb	r3, [r3]
 827 03a2 1800     		movs	r0, r3
 828 03a4 FFF7DEFE 		bl	select_controller
 192:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_RS);
 829              		.loc 1 192 5
 830 03a8 0120     		movs	r0, #1
 831 03aa FFF78AFE 		bl	graphic_ctrl_bit_set
 193:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_RW);
 832              		.loc 1 193 5
 833 03ae 0220     		movs	r0, #2
 834 03b0 FFF7B0FE 		bl	graphic_ctrl_bit_clear
 194:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_write(data, controller);
 835              		.loc 1 194 5
 836 03b4 BB1D     		adds	r3, r7, #6
 837 03b6 1A78     		ldrb	r2, [r3]
 838 03b8 FB1D     		adds	r3, r7, #7
 839 03ba 1B78     		ldrb	r3, [r3]
 840 03bc 1100     		movs	r1, r2
 841 03be 1800     		movs	r0, r3
 842 03c0 FFF784FF 		bl	graphic_write
 195:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 843              		.loc 1 195 1
 844 03c4 C046     		nop
 845 03c6 BD46     		mov	sp, r7
 846 03c8 02B0     		add	sp, sp, #8
 847              		@ sp needed
 848 03ca 80BD     		pop	{r7, pc}
 849              		.cfi_endproc
 850              	.LFE11:
 852              		.align	1
 853              		.syntax unified
 854              		.code	16
 855              		.thumb_func
 856              		.fpu softvfp
 858              	graphic_read_data:
 859              	.LFB12:
 196:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 197:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static uint8_t graphic_read_data(uint8_t controller) {
 860              		.loc 1 197 54
 861              		.cfi_startproc
 862              		@ args = 0, pretend = 0, frame = 8
 863              		@ frame_needed = 1, uses_anonymous_args = 0
 864 03cc 80B5     		push	{r7, lr}
 865              		.cfi_def_cfa_offset 8
 866              		.cfi_offset 7, -8
 867              		.cfi_offset 14, -4
 868 03ce 82B0     		sub	sp, sp, #8
 869              		.cfi_def_cfa_offset 16
 870 03d0 00AF     		add	r7, sp, #0
 871              		.cfi_def_cfa_register 7
 872 03d2 0200     		movs	r2, r0
 873 03d4 FB1D     		adds	r3, r7, #7
 874 03d6 1A70     		strb	r2, [r3]
 198:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_read(controller);
 875              		.loc 1 198 5
 876 03d8 FB1D     		adds	r3, r7, #7
 877 03da 1B78     		ldrb	r3, [r3]
 878 03dc 1800     		movs	r0, r3
 879 03de FFF72DFF 		bl	graphic_read
 199:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     return graphic_read(controller);
 880              		.loc 1 199 12
 881 03e2 FB1D     		adds	r3, r7, #7
 882 03e4 1B78     		ldrb	r3, [r3]
 883 03e6 1800     		movs	r0, r3
 884 03e8 FFF728FF 		bl	graphic_read
 885 03ec 0300     		movs	r3, r0
 200:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 886              		.loc 1 200 1
 887 03ee 1800     		movs	r0, r3
 888 03f0 BD46     		mov	sp, r7
 889 03f2 02B0     		add	sp, sp, #8
 890              		@ sp needed
 891 03f4 80BD     		pop	{r7, pc}
 892              		.cfi_endproc
 893              	.LFE12:
 895              		.align	1
 896              		.syntax unified
 897              		.code	16
 898              		.thumb_func
 899              		.fpu softvfp
 901              	graphic_initialize:
 902              	.LFB13:
 201:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 202:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void graphic_initialize() {
 903              		.loc 1 202 34
 904              		.cfi_startproc
 905              		@ args = 0, pretend = 0, frame = 0
 906              		@ frame_needed = 1, uses_anonymous_args = 0
 907 03f6 80B5     		push	{r7, lr}
 908              		.cfi_def_cfa_offset 8
 909              		.cfi_offset 7, -8
 910              		.cfi_offset 14, -4
 911 03f8 00AF     		add	r7, sp, #0
 912              		.cfi_def_cfa_register 7
 203:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_E);
 913              		.loc 1 203 5
 914 03fa 4020     		movs	r0, #64
 915 03fc FFF761FE 		bl	graphic_ctrl_bit_set
 204:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_mikro(10);
 916              		.loc 1 204 5
 917 0400 0A20     		movs	r0, #10
 918 0402 FFF7FEFF 		bl	delay_mikro
 205:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 919              		.loc 1 205 5
 920 0406 7820     		movs	r0, #120
 921 0408 FFF784FE 		bl	graphic_ctrl_bit_clear
 206:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     delay_milli(30);
 922              		.loc 1 206 5
 923 040c 1E20     		movs	r0, #30
 924 040e FFF7FEFF 		bl	delay_milli
 207:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_ctrl_bit_set(B_RST);
 925              		.loc 1 207 5
 926 0412 2020     		movs	r0, #32
 927 0414 FFF755FE 		bl	graphic_ctrl_bit_set
 208:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     
 209:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_write_command(LCD_OFF,          B_CS1 | B_CS2);
 928              		.loc 1 209 5
 929 0418 1821     		movs	r1, #24
 930 041a 3E20     		movs	r0, #62
 931 041c FFF790FF 		bl	graphic_write_command
 210:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_write_command(LCD_ON,           B_CS1 | B_CS2);
 932              		.loc 1 210 5
 933 0420 1821     		movs	r1, #24
 934 0422 3F20     		movs	r0, #63
 935 0424 FFF78CFF 		bl	graphic_write_command
 211:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_write_command(LCD_DISP_START,   B_CS1 | B_CS2);
 936              		.loc 1 211 5
 937 0428 1821     		movs	r1, #24
 938 042a C020     		movs	r0, #192
 939 042c FFF788FF 		bl	graphic_write_command
 212:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_write_command(LCD_SET_ADD,      B_CS1 | B_CS2);
 940              		.loc 1 212 5
 941 0430 1821     		movs	r1, #24
 942 0432 4020     		movs	r0, #64
 943 0434 FFF784FF 		bl	graphic_write_command
 213:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_write_command(LCD_SET_PAGE,     B_CS1 | B_CS2);
 944              		.loc 1 213 5
 945 0438 1821     		movs	r1, #24
 946 043a B820     		movs	r0, #184
 947 043c FFF780FF 		bl	graphic_write_command
 214:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     
 215:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     select_controller(0);
 948              		.loc 1 215 5
 949 0440 0020     		movs	r0, #0
 950 0442 FFF78FFE 		bl	select_controller
 216:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 951              		.loc 1 216 1
 952 0446 C046     		nop
 953 0448 BD46     		mov	sp, r7
 954              		@ sp needed
 955 044a 80BD     		pop	{r7, pc}
 956              		.cfi_endproc
 957              	.LFE13:
 959              		.align	1
 960              		.syntax unified
 961              		.code	16
 962              		.thumb_func
 963              		.fpu softvfp
 965              	graphic_clear_screen:
 966              	.LFB14:
 217:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 218:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static void graphic_clear_screen() {
 967              		.loc 1 218 36
 968              		.cfi_startproc
 969              		@ args = 0, pretend = 0, frame = 8
 970              		@ frame_needed = 1, uses_anonymous_args = 0
 971 044c 80B5     		push	{r7, lr}
 972              		.cfi_def_cfa_offset 8
 973              		.cfi_offset 7, -8
 974              		.cfi_offset 14, -4
 975 044e 82B0     		sub	sp, sp, #8
 976              		.cfi_def_cfa_offset 16
 977 0450 00AF     		add	r7, sp, #0
 978              		.cfi_def_cfa_register 7
 979              	.LBB3:
 219:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     for (uint8_t page = 0; page < 8; page++) {
 980              		.loc 1 219 18
 981 0452 FB1D     		adds	r3, r7, #7
 982 0454 0022     		movs	r2, #0
 983 0456 1A70     		strb	r2, [r3]
 984              		.loc 1 219 5
 985 0458 23E0     		b	.L42
 986              	.L45:
 220:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         graphic_write_command(LCD_SET_PAGE | page,  B_CS1 | B_CS2);
 987              		.loc 1 220 9
 988 045a FB1D     		adds	r3, r7, #7
 989 045c 1B78     		ldrb	r3, [r3]
 990 045e 4822     		movs	r2, #72
 991 0460 5242     		rsbs	r2, r2, #0
 992 0462 1343     		orrs	r3, r2
 993 0464 DBB2     		uxtb	r3, r3
 994 0466 1821     		movs	r1, #24
 995 0468 1800     		movs	r0, r3
 996 046a FFF769FF 		bl	graphic_write_command
 221:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         graphic_write_command(LCD_SET_ADD | 0,      B_CS1 | B_CS2);
 997              		.loc 1 221 9
 998 046e 1821     		movs	r1, #24
 999 0470 4020     		movs	r0, #64
 1000 0472 FFF765FF 		bl	graphic_write_command
 1001              	.LBB4:
 222:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         for (uint8_t add = 0; add < 64; add++) {
 1002              		.loc 1 222 22
 1003 0476 BB1D     		adds	r3, r7, #6
 1004 0478 0022     		movs	r2, #0
 1005 047a 1A70     		strb	r2, [r3]
 1006              		.loc 1 222 9
 1007 047c 08E0     		b	.L43
 1008              	.L44:
 223:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             graphic_write_data(0, B_CS1 | B_CS2);
 1009              		.loc 1 223 13 discriminator 3
 1010 047e 1821     		movs	r1, #24
 1011 0480 0020     		movs	r0, #0
 1012 0482 FFF780FF 		bl	graphic_write_data
 222:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         for (uint8_t add = 0; add < 64; add++) {
 1013              		.loc 1 222 44 discriminator 3
 1014 0486 BB1D     		adds	r3, r7, #6
 1015 0488 1A78     		ldrb	r2, [r3]
 1016 048a BB1D     		adds	r3, r7, #6
 1017 048c 0132     		adds	r2, r2, #1
 1018 048e 1A70     		strb	r2, [r3]
 1019              	.L43:
 222:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         for (uint8_t add = 0; add < 64; add++) {
 1020              		.loc 1 222 9 discriminator 1
 1021 0490 BB1D     		adds	r3, r7, #6
 1022 0492 1B78     		ldrb	r3, [r3]
 1023 0494 3F2B     		cmp	r3, #63
 1024 0496 F2D9     		bls	.L44
 1025              	.LBE4:
 219:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         graphic_write_command(LCD_SET_PAGE | page,  B_CS1 | B_CS2);
 1026              		.loc 1 219 42 discriminator 2
 1027 0498 FB1D     		adds	r3, r7, #7
 1028 049a 1A78     		ldrb	r2, [r3]
 1029 049c FB1D     		adds	r3, r7, #7
 1030 049e 0132     		adds	r2, r2, #1
 1031 04a0 1A70     		strb	r2, [r3]
 1032              	.L42:
 219:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         graphic_write_command(LCD_SET_PAGE | page,  B_CS1 | B_CS2);
 1033              		.loc 1 219 5 discriminator 1
 1034 04a2 FB1D     		adds	r3, r7, #7
 1035 04a4 1B78     		ldrb	r3, [r3]
 1036 04a6 072B     		cmp	r3, #7
 1037 04a8 D7D9     		bls	.L45
 1038              	.LBE3:
 224:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         }
 225:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
 226:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 1039              		.loc 1 226 1
 1040 04aa C046     		nop
 1041 04ac C046     		nop
 1042 04ae BD46     		mov	sp, r7
 1043 04b0 02B0     		add	sp, sp, #8
 1044              		@ sp needed
 1045 04b2 80BD     		pop	{r7, pc}
 1046              		.cfi_endproc
 1047              	.LFE14:
 1049              		.align	1
 1050              		.global	pixel
 1051              		.syntax unified
 1052              		.code	16
 1053              		.thumb_func
 1054              		.fpu softvfp
 1056              	pixel:
 1057              	.LFB15:
 227:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 228:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 229:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 230:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** static uint8_t buffer[8][128];
 231:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 232:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 233:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** void pixel(uint8_t x, uint8_t y, uint8_t set) {
 1058              		.loc 1 233 47
 1059              		.cfi_startproc
 1060              		@ args = 0, pretend = 0, frame = 16
 1061              		@ frame_needed = 1, uses_anonymous_args = 0
 1062 04b4 B0B5     		push	{r4, r5, r7, lr}
 1063              		.cfi_def_cfa_offset 16
 1064              		.cfi_offset 4, -16
 1065              		.cfi_offset 5, -12
 1066              		.cfi_offset 7, -8
 1067              		.cfi_offset 14, -4
 1068 04b6 84B0     		sub	sp, sp, #16
 1069              		.cfi_def_cfa_offset 32
 1070 04b8 00AF     		add	r7, sp, #0
 1071              		.cfi_def_cfa_register 7
 1072 04ba 0400     		movs	r4, r0
 1073 04bc 0800     		movs	r0, r1
 1074 04be 1100     		movs	r1, r2
 1075 04c0 FB1D     		adds	r3, r7, #7
 1076 04c2 221C     		adds	r2, r4, #0
 1077 04c4 1A70     		strb	r2, [r3]
 1078 04c6 BB1D     		adds	r3, r7, #6
 1079 04c8 021C     		adds	r2, r0, #0
 1080 04ca 1A70     		strb	r2, [r3]
 1081 04cc 7B1D     		adds	r3, r7, #5
 1082 04ce 0A1C     		adds	r2, r1, #0
 1083 04d0 1A70     		strb	r2, [r3]
 234:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	if (x>127 || y>63) return;
 1084              		.loc 1 234 7
 1085 04d2 FB1D     		adds	r3, r7, #7
 1086 04d4 1B78     		ldrb	r3, [r3]
 1087 04d6 5BB2     		sxtb	r3, r3
 1088              		.loc 1 234 5
 1089 04d8 002B     		cmp	r3, #0
 1090 04da 46DB     		blt	.L51
 1091              		.loc 1 234 12 discriminator 2
 1092 04dc BB1D     		adds	r3, r7, #6
 1093 04de 1B78     		ldrb	r3, [r3]
 1094 04e0 3F2B     		cmp	r3, #63
 1095 04e2 42D8     		bhi	.L51
 235:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	
 236:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     uint8_t mask = 1 << (y % 8);
 1096              		.loc 1 236 28
 1097 04e4 BB1D     		adds	r3, r7, #6
 1098 04e6 1B78     		ldrb	r3, [r3]
 1099 04e8 0722     		movs	r2, #7
 1100 04ea 1340     		ands	r3, r2
 1101              		.loc 1 236 22
 1102 04ec 0122     		movs	r2, #1
 1103 04ee 9A40     		lsls	r2, r2, r3
 1104              		.loc 1 236 13
 1105 04f0 0F25     		movs	r5, #15
 1106 04f2 7B19     		adds	r3, r7, r5
 1107 04f4 1A70     		strb	r2, [r3]
 237:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	
 238:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	if (set) {
 1108              		.loc 1 238 5
 1109 04f6 7B1D     		adds	r3, r7, #5
 1110 04f8 1B78     		ldrb	r3, [r3]
 1111 04fa 002B     		cmp	r3, #0
 1112 04fc 17D0     		beq	.L50
 239:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		buffer[y/8][x] |= mask;
 1113              		.loc 1 239 18
 1114 04fe BB1D     		adds	r3, r7, #6
 1115 0500 1B78     		ldrb	r3, [r3]
 1116 0502 DB08     		lsrs	r3, r3, #3
 1117 0504 D8B2     		uxtb	r0, r3
 1118 0506 0200     		movs	r2, r0
 1119 0508 FB1D     		adds	r3, r7, #7
 1120 050a 1B78     		ldrb	r3, [r3]
 1121 050c 1949     		ldr	r1, .L52
 1122 050e D201     		lsls	r2, r2, #7
 1123 0510 8A18     		adds	r2, r1, r2
 1124 0512 D15C     		ldrb	r1, [r2, r3]
 1125 0514 0400     		movs	r4, r0
 1126 0516 FB1D     		adds	r3, r7, #7
 1127 0518 1B78     		ldrb	r3, [r3]
 1128 051a 7A19     		adds	r2, r7, r5
 1129 051c 1278     		ldrb	r2, [r2]
 1130 051e 0A43     		orrs	r2, r1
 1131 0520 D0B2     		uxtb	r0, r2
 1132 0522 1449     		ldr	r1, .L52
 1133 0524 E201     		lsls	r2, r4, #7
 1134 0526 8A18     		adds	r2, r1, r2
 1135 0528 011C     		adds	r1, r0, #0
 1136 052a D154     		strb	r1, [r2, r3]
 1137 052c 1EE0     		b	.L46
 1138              	.L50:
 240:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	} else {
 241:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		buffer[y/8][x] &= ~mask;
 1139              		.loc 1 241 18
 1140 052e BB1D     		adds	r3, r7, #6
 1141 0530 1B78     		ldrb	r3, [r3]
 1142 0532 DB08     		lsrs	r3, r3, #3
 1143 0534 D8B2     		uxtb	r0, r3
 1144 0536 0200     		movs	r2, r0
 1145 0538 FB1D     		adds	r3, r7, #7
 1146 053a 1B78     		ldrb	r3, [r3]
 1147 053c 0D49     		ldr	r1, .L52
 1148 053e D201     		lsls	r2, r2, #7
 1149 0540 8A18     		adds	r2, r1, r2
 1150 0542 D35C     		ldrb	r3, [r2, r3]
 1151 0544 5BB2     		sxtb	r3, r3
 1152 0546 0F22     		movs	r2, #15
 1153 0548 BA18     		adds	r2, r7, r2
 1154 054a 1278     		ldrb	r2, [r2]
 1155 054c 52B2     		sxtb	r2, r2
 1156 054e D243     		mvns	r2, r2
 1157 0550 52B2     		sxtb	r2, r2
 1158 0552 1340     		ands	r3, r2
 1159 0554 59B2     		sxtb	r1, r3
 1160 0556 0200     		movs	r2, r0
 1161 0558 FB1D     		adds	r3, r7, #7
 1162 055a 1B78     		ldrb	r3, [r3]
 1163 055c C8B2     		uxtb	r0, r1
 1164 055e 0549     		ldr	r1, .L52
 1165 0560 D201     		lsls	r2, r2, #7
 1166 0562 8A18     		adds	r2, r1, r2
 1167 0564 011C     		adds	r1, r0, #0
 1168 0566 D154     		strb	r1, [r2, r3]
 1169 0568 00E0     		b	.L46
 1170              	.L51:
 234:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	
 1171              		.loc 1 234 21
 1172 056a C046     		nop
 1173              	.L46:
 242:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	}
 243:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 1174              		.loc 1 243 1
 1175 056c BD46     		mov	sp, r7
 1176 056e 04B0     		add	sp, sp, #16
 1177              		@ sp needed
 1178 0570 B0BD     		pop	{r4, r5, r7, pc}
 1179              	.L53:
 1180 0572 C046     		.align	2
 1181              	.L52:
 1182 0574 00000000 		.word	buffer
 1183              		.cfi_endproc
 1184              	.LFE15:
 1186              		.align	1
 1187              		.global	clear_buffer
 1188              		.syntax unified
 1189              		.code	16
 1190              		.thumb_func
 1191              		.fpu softvfp
 1193              	clear_buffer:
 1194              	.LFB16:
 244:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 245:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** void clear_buffer() {
 1195              		.loc 1 245 21
 1196              		.cfi_startproc
 1197              		@ args = 0, pretend = 0, frame = 8
 1198              		@ frame_needed = 1, uses_anonymous_args = 0
 1199 0578 80B5     		push	{r7, lr}
 1200              		.cfi_def_cfa_offset 8
 1201              		.cfi_offset 7, -8
 1202              		.cfi_offset 14, -4
 1203 057a 82B0     		sub	sp, sp, #8
 1204              		.cfi_def_cfa_offset 16
 1205 057c 00AF     		add	r7, sp, #0
 1206              		.cfi_def_cfa_register 7
 1207              	.LBB5:
 246:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	for (uint8_t y = 0; y<8; y++) {
 1208              		.loc 1 246 15
 1209 057e FB1D     		adds	r3, r7, #7
 1210 0580 0022     		movs	r2, #0
 1211 0582 1A70     		strb	r2, [r3]
 1212              		.loc 1 246 2
 1213 0584 1BE0     		b	.L55
 1214              	.L58:
 1215              	.LBB6:
 247:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 0; x<128; x++) {
 1216              		.loc 1 247 16
 1217 0586 BB1D     		adds	r3, r7, #6
 1218 0588 0022     		movs	r2, #0
 1219 058a 1A70     		strb	r2, [r3]
 1220              		.loc 1 247 3
 1221 058c 0DE0     		b	.L56
 1222              	.L57:
 248:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			buffer[y][x] = 0;
 1223              		.loc 1 248 13 discriminator 3
 1224 058e FB1D     		adds	r3, r7, #7
 1225 0590 1A78     		ldrb	r2, [r3]
 1226 0592 BB1D     		adds	r3, r7, #6
 1227 0594 1B78     		ldrb	r3, [r3]
 1228              		.loc 1 248 17 discriminator 3
 1229 0596 0E49     		ldr	r1, .L59
 1230 0598 D201     		lsls	r2, r2, #7
 1231 059a 8A18     		adds	r2, r1, r2
 1232 059c 0021     		movs	r1, #0
 1233 059e D154     		strb	r1, [r2, r3]
 247:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 0; x<128; x++) {
 1234              		.loc 1 247 31 discriminator 3
 1235 05a0 BB1D     		adds	r3, r7, #6
 1236 05a2 1A78     		ldrb	r2, [r3]
 1237 05a4 BB1D     		adds	r3, r7, #6
 1238 05a6 0132     		adds	r2, r2, #1
 1239 05a8 1A70     		strb	r2, [r3]
 1240              	.L56:
 247:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 0; x<128; x++) {
 1241              		.loc 1 247 24 discriminator 1
 1242 05aa BB1D     		adds	r3, r7, #6
 1243 05ac 1B78     		ldrb	r3, [r3]
 1244 05ae 5BB2     		sxtb	r3, r3
 247:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 0; x<128; x++) {
 1245              		.loc 1 247 3 discriminator 1
 1246 05b0 002B     		cmp	r3, #0
 1247 05b2 ECDA     		bge	.L57
 1248              	.LBE6:
 246:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	for (uint8_t y = 0; y<8; y++) {
 1249              		.loc 1 246 28 discriminator 2
 1250 05b4 FB1D     		adds	r3, r7, #7
 1251 05b6 1A78     		ldrb	r2, [r3]
 1252 05b8 FB1D     		adds	r3, r7, #7
 1253 05ba 0132     		adds	r2, r2, #1
 1254 05bc 1A70     		strb	r2, [r3]
 1255              	.L55:
 246:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	for (uint8_t y = 0; y<8; y++) {
 1256              		.loc 1 246 2 discriminator 1
 1257 05be FB1D     		adds	r3, r7, #7
 1258 05c0 1B78     		ldrb	r3, [r3]
 1259 05c2 072B     		cmp	r3, #7
 1260 05c4 DFD9     		bls	.L58
 1261              	.LBE5:
 249:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		}
 250:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	}
 251:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 1262              		.loc 1 251 1
 1263 05c6 C046     		nop
 1264 05c8 C046     		nop
 1265 05ca BD46     		mov	sp, r7
 1266 05cc 02B0     		add	sp, sp, #8
 1267              		@ sp needed
 1268 05ce 80BD     		pop	{r7, pc}
 1269              	.L60:
 1270              		.align	2
 1271              	.L59:
 1272 05d0 00000000 		.word	buffer
 1273              		.cfi_endproc
 1274              	.LFE16:
 1276              		.align	1
 1277              		.global	draw_buffer
 1278              		.syntax unified
 1279              		.code	16
 1280              		.thumb_func
 1281              		.fpu softvfp
 1283              	draw_buffer:
 1284              	.LFB17:
 252:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 253:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** void draw_buffer() {
 1285              		.loc 1 253 20
 1286              		.cfi_startproc
 1287              		@ args = 0, pretend = 0, frame = 8
 1288              		@ frame_needed = 1, uses_anonymous_args = 0
 1289 05d4 80B5     		push	{r7, lr}
 1290              		.cfi_def_cfa_offset 8
 1291              		.cfi_offset 7, -8
 1292              		.cfi_offset 14, -4
 1293 05d6 82B0     		sub	sp, sp, #8
 1294              		.cfi_def_cfa_offset 16
 1295 05d8 00AF     		add	r7, sp, #0
 1296              		.cfi_def_cfa_register 7
 1297              	.LBB7:
 254:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	for (uint8_t y = 0; y<8; y++) {
 1298              		.loc 1 254 15
 1299 05da FB1D     		adds	r3, r7, #7
 1300 05dc 0022     		movs	r2, #0
 1301 05de 1A70     		strb	r2, [r3]
 1302              		.loc 1 254 2
 1303 05e0 38E0     		b	.L62
 1304              	.L65:
 1305              	.LBB8:
 255:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 0; x<64; x++) {
 1306              		.loc 1 255 16
 1307 05e2 BB1D     		adds	r3, r7, #6
 1308 05e4 0022     		movs	r2, #0
 1309 05e6 1A70     		strb	r2, [r3]
 1310              		.loc 1 255 3
 1311 05e8 2BE0     		b	.L63
 1312              	.L64:
 256:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_ADD | x, B_CS1);
 1313              		.loc 1 256 4 discriminator 3
 1314 05ea BB1D     		adds	r3, r7, #6
 1315 05ec 1B78     		ldrb	r3, [r3]
 1316 05ee 4022     		movs	r2, #64
 1317 05f0 1343     		orrs	r3, r2
 1318 05f2 DBB2     		uxtb	r3, r3
 1319 05f4 0821     		movs	r1, #8
 1320 05f6 1800     		movs	r0, r3
 1321 05f8 FFF7A2FE 		bl	graphic_write_command
 257:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_PAGE | y, B_CS1);
 1322              		.loc 1 257 4 discriminator 3
 1323 05fc FB1D     		adds	r3, r7, #7
 1324 05fe 1B78     		ldrb	r3, [r3]
 1325 0600 4822     		movs	r2, #72
 1326 0602 5242     		rsbs	r2, r2, #0
 1327 0604 1343     		orrs	r3, r2
 1328 0606 DBB2     		uxtb	r3, r3
 1329 0608 0821     		movs	r1, #8
 1330 060a 1800     		movs	r0, r3
 1331 060c FFF798FE 		bl	graphic_write_command
 258:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_data(buffer[y][x], B_CS1);
 1332              		.loc 1 258 4 discriminator 3
 1333 0610 FB1D     		adds	r3, r7, #7
 1334 0612 1A78     		ldrb	r2, [r3]
 1335 0614 BB1D     		adds	r3, r7, #6
 1336 0616 1B78     		ldrb	r3, [r3]
 1337 0618 3649     		ldr	r1, .L70
 1338 061a D201     		lsls	r2, r2, #7
 1339 061c 8A18     		adds	r2, r1, r2
 1340 061e D35C     		ldrb	r3, [r2, r3]
 1341 0620 0821     		movs	r1, #8
 1342 0622 1800     		movs	r0, r3
 1343 0624 FFF7AFFE 		bl	graphic_write_data
 259:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			
 260:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_ON,           B_CS1 | B_CS2);
 1344              		.loc 1 260 4 discriminator 3
 1345 0628 1821     		movs	r1, #24
 1346 062a 3F20     		movs	r0, #63
 1347 062c FFF788FE 		bl	graphic_write_command
 261:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_DISP_START,   B_CS1 | B_CS2);
 1348              		.loc 1 261 4 discriminator 3
 1349 0630 1821     		movs	r1, #24
 1350 0632 C020     		movs	r0, #192
 1351 0634 FFF784FE 		bl	graphic_write_command
 255:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_ADD | x, B_CS1);
 1352              		.loc 1 255 30 discriminator 3
 1353 0638 BB1D     		adds	r3, r7, #6
 1354 063a 1A78     		ldrb	r2, [r3]
 1355 063c BB1D     		adds	r3, r7, #6
 1356 063e 0132     		adds	r2, r2, #1
 1357 0640 1A70     		strb	r2, [r3]
 1358              	.L63:
 255:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_ADD | x, B_CS1);
 1359              		.loc 1 255 3 discriminator 1
 1360 0642 BB1D     		adds	r3, r7, #6
 1361 0644 1B78     		ldrb	r3, [r3]
 1362 0646 3F2B     		cmp	r3, #63
 1363 0648 CFD9     		bls	.L64
 1364              	.LBE8:
 254:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 0; x<64; x++) {
 1365              		.loc 1 254 28 discriminator 2
 1366 064a FB1D     		adds	r3, r7, #7
 1367 064c 1A78     		ldrb	r2, [r3]
 1368 064e FB1D     		adds	r3, r7, #7
 1369 0650 0132     		adds	r2, r2, #1
 1370 0652 1A70     		strb	r2, [r3]
 1371              	.L62:
 254:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 0; x<64; x++) {
 1372              		.loc 1 254 2 discriminator 1
 1373 0654 FB1D     		adds	r3, r7, #7
 1374 0656 1B78     		ldrb	r3, [r3]
 1375 0658 072B     		cmp	r3, #7
 1376 065a C2D9     		bls	.L65
 1377              	.LBE7:
 1378              	.LBB9:
 262:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		}
 263:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	}
 264:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	for (uint8_t y = 0; y<8; y++) {
 1379              		.loc 1 264 15
 1380 065c 7B1D     		adds	r3, r7, #5
 1381 065e 0022     		movs	r2, #0
 1382 0660 1A70     		strb	r2, [r3]
 1383              		.loc 1 264 2
 1384 0662 3DE0     		b	.L66
 1385              	.L69:
 1386              	.LBB10:
 265:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 64; x<128; x++) {
 1387              		.loc 1 265 16
 1388 0664 3B1D     		adds	r3, r7, #4
 1389 0666 4022     		movs	r2, #64
 1390 0668 1A70     		strb	r2, [r3]
 1391              		.loc 1 265 3
 1392 066a 2FE0     		b	.L67
 1393              	.L68:
 266:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_ADD | x-64, B_CS2);
 1394              		.loc 1 266 41 discriminator 3
 1395 066c 3B1D     		adds	r3, r7, #4
 1396 066e 1B78     		ldrb	r3, [r3]
 1397 0670 403B     		subs	r3, r3, #64
 1398 0672 DBB2     		uxtb	r3, r3
 1399 0674 5BB2     		sxtb	r3, r3
 1400              		.loc 1 266 38 discriminator 3
 1401 0676 4022     		movs	r2, #64
 1402 0678 1343     		orrs	r3, r2
 1403 067a 5BB2     		sxtb	r3, r3
 1404              		.loc 1 266 4 discriminator 3
 1405 067c DBB2     		uxtb	r3, r3
 1406 067e 1021     		movs	r1, #16
 1407 0680 1800     		movs	r0, r3
 1408 0682 FFF75DFE 		bl	graphic_write_command
 267:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_PAGE | y, B_CS2);
 1409              		.loc 1 267 4 discriminator 3
 1410 0686 7B1D     		adds	r3, r7, #5
 1411 0688 1B78     		ldrb	r3, [r3]
 1412 068a 4822     		movs	r2, #72
 1413 068c 5242     		rsbs	r2, r2, #0
 1414 068e 1343     		orrs	r3, r2
 1415 0690 DBB2     		uxtb	r3, r3
 1416 0692 1021     		movs	r1, #16
 1417 0694 1800     		movs	r0, r3
 1418 0696 FFF753FE 		bl	graphic_write_command
 268:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_data(buffer[y][x], B_CS2);
 1419              		.loc 1 268 4 discriminator 3
 1420 069a 7B1D     		adds	r3, r7, #5
 1421 069c 1A78     		ldrb	r2, [r3]
 1422 069e 3B1D     		adds	r3, r7, #4
 1423 06a0 1B78     		ldrb	r3, [r3]
 1424 06a2 1449     		ldr	r1, .L70
 1425 06a4 D201     		lsls	r2, r2, #7
 1426 06a6 8A18     		adds	r2, r1, r2
 1427 06a8 D35C     		ldrb	r3, [r2, r3]
 1428 06aa 1021     		movs	r1, #16
 1429 06ac 1800     		movs	r0, r3
 1430 06ae FFF76AFE 		bl	graphic_write_data
 269:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			
 270:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_ON,           B_CS1 | B_CS2);
 1431              		.loc 1 270 4 discriminator 3
 1432 06b2 1821     		movs	r1, #24
 1433 06b4 3F20     		movs	r0, #63
 1434 06b6 FFF743FE 		bl	graphic_write_command
 271:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_DISP_START,   B_CS1 | B_CS2);
 1435              		.loc 1 271 4 discriminator 3
 1436 06ba 1821     		movs	r1, #24
 1437 06bc C020     		movs	r0, #192
 1438 06be FFF73FFE 		bl	graphic_write_command
 265:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_ADD | x-64, B_CS2);
 1439              		.loc 1 265 32 discriminator 3
 1440 06c2 3B1D     		adds	r3, r7, #4
 1441 06c4 1A78     		ldrb	r2, [r3]
 1442 06c6 3B1D     		adds	r3, r7, #4
 1443 06c8 0132     		adds	r2, r2, #1
 1444 06ca 1A70     		strb	r2, [r3]
 1445              	.L67:
 265:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_ADD | x-64, B_CS2);
 1446              		.loc 1 265 25 discriminator 1
 1447 06cc 3B1D     		adds	r3, r7, #4
 1448 06ce 1B78     		ldrb	r3, [r3]
 1449 06d0 5BB2     		sxtb	r3, r3
 265:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 			graphic_write_command(LCD_SET_ADD | x-64, B_CS2);
 1450              		.loc 1 265 3 discriminator 1
 1451 06d2 002B     		cmp	r3, #0
 1452 06d4 CADA     		bge	.L68
 1453              	.LBE10:
 264:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 64; x<128; x++) {
 1454              		.loc 1 264 28 discriminator 2
 1455 06d6 7B1D     		adds	r3, r7, #5
 1456 06d8 1A78     		ldrb	r2, [r3]
 1457 06da 7B1D     		adds	r3, r7, #5
 1458 06dc 0132     		adds	r2, r2, #1
 1459 06de 1A70     		strb	r2, [r3]
 1460              	.L66:
 264:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		for (uint8_t x = 64; x<128; x++) {
 1461              		.loc 1 264 2 discriminator 1
 1462 06e0 7B1D     		adds	r3, r7, #5
 1463 06e2 1B78     		ldrb	r3, [r3]
 1464 06e4 072B     		cmp	r3, #7
 1465 06e6 BDD9     		bls	.L69
 1466              	.LBE9:
 272:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 		}
 273:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	}
 274:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 1467              		.loc 1 274 1
 1468 06e8 C046     		nop
 1469 06ea C046     		nop
 1470 06ec BD46     		mov	sp, r7
 1471 06ee 02B0     		add	sp, sp, #8
 1472              		@ sp needed
 1473 06f0 80BD     		pop	{r7, pc}
 1474              	.L71:
 1475 06f2 C046     		.align	2
 1476              	.L70:
 1477 06f4 00000000 		.word	buffer
 1478              		.cfi_endproc
 1479              	.LFE17:
 1481              		.align	1
 1482              		.global	init
 1483              		.syntax unified
 1484              		.code	16
 1485              		.thumb_func
 1486              		.fpu softvfp
 1488              	init:
 1489              	.LFB18:
 275:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 276:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 277:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** void init() {
 1490              		.loc 1 277 13
 1491              		.cfi_startproc
 1492              		@ args = 0, pretend = 0, frame = 0
 1493              		@ frame_needed = 1, uses_anonymous_args = 0
 1494 06f8 80B5     		push	{r7, lr}
 1495              		.cfi_def_cfa_offset 8
 1496              		.cfi_offset 7, -8
 1497              		.cfi_offset 14, -4
 1498 06fa 00AF     		add	r7, sp, #0
 1499              		.cfi_def_cfa_register 7
 278:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	#ifdef USBDM
 279:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	*((unsigned long *) 0x40023830) = 0x18;
 280:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	__asm volatile( " LDR R0,=0x08000209\n BLX R0 \n");
 281:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	#endif
 282:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *portModer = 0x55555555; // Set E0-15 to output
 1500              		.loc 1 282 5
 1501 06fc 1E4B     		ldr	r3, .L73
 1502              		.loc 1 282 16
 1503 06fe 1F4A     		ldr	r2, .L73+4
 1504 0700 1A60     		str	r2, [r3]
 283:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	
 284:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	*((unsigned long *) 0x40023830) = 0x18;
 1505              		.loc 1 284 2
 1506 0702 1F4B     		ldr	r3, .L73+8
 1507              		.loc 1 284 34
 1508 0704 1822     		movs	r2, #24
 1509 0706 1A60     		str	r2, [r3]
 285:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     // GPIO_D 8-15 ska bli keypad
 286:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     // Set MODER
 287:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *GPIO_D_MODER &= 0x0000FFFF;
 1510              		.loc 1 287 19
 1511 0708 1E4B     		ldr	r3, .L73+12
 1512 070a 1A68     		ldr	r2, [r3]
 1513 070c 1D4B     		ldr	r3, .L73+12
 1514 070e 1204     		lsls	r2, r2, #16
 1515 0710 120C     		lsrs	r2, r2, #16
 1516 0712 1A60     		str	r2, [r3]
 288:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *GPIO_D_MODER |= 0x55000000;
 1517              		.loc 1 288 19
 1518 0714 1B4B     		ldr	r3, .L73+12
 1519 0716 1A68     		ldr	r2, [r3]
 1520 0718 1A4B     		ldr	r3, .L73+12
 1521 071a AA21     		movs	r1, #170
 1522 071c C905     		lsls	r1, r1, #23
 1523 071e 0A43     		orrs	r2, r1
 1524 0720 1A60     		str	r2, [r3]
 289:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     // Set OTYPER
 290:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *GPIO_D_OTYPER &= 0xFFFF00FF;
 1525              		.loc 1 290 20
 1526 0722 194B     		ldr	r3, .L73+16
 1527 0724 1A68     		ldr	r2, [r3]
 1528 0726 184B     		ldr	r3, .L73+16
 1529 0728 1849     		ldr	r1, .L73+20
 1530 072a 0A40     		ands	r2, r1
 1531 072c 1A60     		str	r2, [r3]
 291:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *GPIO_D_OTYPER |= 0x00000F00;
 1532              		.loc 1 291 20
 1533 072e 164B     		ldr	r3, .L73+16
 1534 0730 1A68     		ldr	r2, [r3]
 1535 0732 154B     		ldr	r3, .L73+16
 1536 0734 F021     		movs	r1, #240
 1537 0736 0901     		lsls	r1, r1, #4
 1538 0738 0A43     		orrs	r2, r1
 1539 073a 1A60     		str	r2, [r3]
 292:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     
 293:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     // Set PUPDR
 294:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *GPIO_D_PUPDR &= 0x0000FFFF;
 1540              		.loc 1 294 19
 1541 073c 144B     		ldr	r3, .L73+24
 1542 073e 1A68     		ldr	r2, [r3]
 1543 0740 134B     		ldr	r3, .L73+24
 1544 0742 1204     		lsls	r2, r2, #16
 1545 0744 120C     		lsrs	r2, r2, #16
 1546 0746 1A60     		str	r2, [r3]
 295:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *GPIO_D_PUPDR |= 0xFFAA0000;
 1547              		.loc 1 295 19
 1548 0748 114B     		ldr	r3, .L73+24
 1549 074a 1A68     		ldr	r2, [r3]
 1550 074c 104B     		ldr	r3, .L73+24
 1551 074e 1149     		ldr	r1, .L73+28
 1552 0750 0A43     		orrs	r2, r1
 1553 0752 1A60     		str	r2, [r3]
 296:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     
 297:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     // GPIO_D 0-7 ska bli 7seg
 298:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     // Set MODER
 299:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *GPIO_D_MODER &= 0xFFFF0000;
 1554              		.loc 1 299 19
 1555 0754 0B4B     		ldr	r3, .L73+12
 1556 0756 1A68     		ldr	r2, [r3]
 1557 0758 0A4B     		ldr	r3, .L73+12
 1558 075a 120C     		lsrs	r2, r2, #16
 1559 075c 1204     		lsls	r2, r2, #16
 1560 075e 1A60     		str	r2, [r3]
 300:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *GPIO_D_MODER |= 0x00005555;
 1561              		.loc 1 300 19
 1562 0760 084B     		ldr	r3, .L73+12
 1563 0762 1A68     		ldr	r2, [r3]
 1564 0764 074B     		ldr	r3, .L73+12
 1565 0766 0C49     		ldr	r1, .L73+32
 1566 0768 0A43     		orrs	r2, r1
 1567 076a 1A60     		str	r2, [r3]
 301:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	
 302:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 	
 303:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     graphic_initialize();
 1568              		.loc 1 303 5
 1569 076c FFF743FE 		bl	graphic_initialize
 304:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 1570              		.loc 1 304 1
 1571 0770 C046     		nop
 1572 0772 BD46     		mov	sp, r7
 1573              		@ sp needed
 1574 0774 80BD     		pop	{r7, pc}
 1575              	.L74:
 1576 0776 C046     		.align	2
 1577              	.L73:
 1578 0778 00100240 		.word	1073876992
 1579 077c 55555555 		.word	1431655765
 1580 0780 30380240 		.word	1073887280
 1581 0784 000C0240 		.word	1073875968
 1582 0788 040C0240 		.word	1073875972
 1583 078c FF00FFFF 		.word	-65281
 1584 0790 0C0C0240 		.word	1073875980
 1585 0794 0000AAFF 		.word	-5636096
 1586 0798 55550000 		.word	21845
 1587              		.cfi_endproc
 1588              	.LFE18:
 1590              		.section	.rodata
 1591              		.align	2
 1592              	.LC3:
 1593 0000 0102030A 		.ascii	"\001\002\003\012\004\005\006\013\007\010\011\014\016"
 1593      0405060B 
 1593      0708090C 
 1593      0E
 1594 000d 000F0D   		.ascii	"\000\017\015"
 1595              		.text
 1596              		.align	1
 1597              		.global	keyb
 1598              		.syntax unified
 1599              		.code	16
 1600              		.thumb_func
 1601              		.fpu softvfp
 1603              	keyb:
 1604              	.LFB19:
 305:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 306:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 307:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** unsigned char keyb(void) {
 1605              		.loc 1 307 26
 1606              		.cfi_startproc
 1607              		@ args = 0, pretend = 0, frame = 24
 1608              		@ frame_needed = 1, uses_anonymous_args = 0
 1609 079c 90B5     		push	{r4, r7, lr}
 1610              		.cfi_def_cfa_offset 12
 1611              		.cfi_offset 4, -12
 1612              		.cfi_offset 7, -8
 1613              		.cfi_offset 14, -4
 1614 079e 87B0     		sub	sp, sp, #28
 1615              		.cfi_def_cfa_offset 40
 1616 07a0 00AF     		add	r7, sp, #0
 1617              		.cfi_def_cfa_register 7
 308:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     unsigned char keys[] = {1, 2, 3,10,
 1618              		.loc 1 308 19
 1619 07a2 3B00     		movs	r3, r7
 1620 07a4 3F4A     		ldr	r2, .L86
 1621 07a6 13CA     		ldmia	r2!, {r0, r1, r4}
 1622 07a8 13C3     		stmia	r3!, {r0, r1, r4}
 1623 07aa 1268     		ldr	r2, [r2]
 1624 07ac 1A60     		str	r2, [r3]
 309:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****                             4, 5, 6,11,
 310:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****                             7, 8, 9,12,
 311:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****                             14,0,15,13};
 312:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     char index = 0xFF;
 1625              		.loc 1 312 10
 1626 07ae 1723     		movs	r3, #23
 1627 07b0 FB18     		adds	r3, r7, r3
 1628 07b2 FF22     		movs	r2, #255
 1629 07b4 1A70     		strb	r2, [r3]
 313:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     char base = 0x10;
 1630              		.loc 1 313 10
 1631 07b6 1423     		movs	r3, #20
 1632 07b8 FB18     		adds	r3, r7, r3
 1633 07ba 1022     		movs	r2, #16
 1634 07bc 1A70     		strb	r2, [r3]
 1635              	.LBB11:
 314:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     for (char row = 0; row<5; row++) {
 1636              		.loc 1 314 15
 1637 07be 1623     		movs	r3, #22
 1638 07c0 FB18     		adds	r3, r7, r3
 1639 07c2 0022     		movs	r2, #0
 1640 07c4 1A70     		strb	r2, [r3]
 1641              		.loc 1 314 5
 1642 07c6 54E0     		b	.L76
 1643              	.L82:
 1644              	.LBB12:
 315:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         char outVal = base << row;
 1645              		.loc 1 315 28
 1646 07c8 1423     		movs	r3, #20
 1647 07ca FB18     		adds	r3, r7, r3
 1648 07cc 1A78     		ldrb	r2, [r3]
 1649 07ce 1623     		movs	r3, #22
 1650 07d0 FB18     		adds	r3, r7, r3
 1651 07d2 1B78     		ldrb	r3, [r3]
 1652 07d4 9A40     		lsls	r2, r2, r3
 1653              		.loc 1 315 14
 1654 07d6 1321     		movs	r1, #19
 1655 07d8 7B18     		adds	r3, r7, r1
 1656 07da 1A70     		strb	r2, [r3]
 316:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         *KB_OUT = outVal;
 1657              		.loc 1 316 9
 1658 07dc 324A     		ldr	r2, .L86+4
 1659              		.loc 1 316 17
 1660 07de 7B18     		adds	r3, r7, r1
 1661 07e0 1B78     		ldrb	r3, [r3]
 1662 07e2 1370     		strb	r3, [r2]
 317:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         char inVal = *KB_IN & 0x0F;
 1663              		.loc 1 317 29
 1664 07e4 314B     		ldr	r3, .L86+8
 1665 07e6 1B78     		ldrb	r3, [r3]
 1666 07e8 DAB2     		uxtb	r2, r3
 1667              		.loc 1 317 14
 1668 07ea 1220     		movs	r0, #18
 1669 07ec 3B18     		adds	r3, r7, r0
 1670 07ee 0F21     		movs	r1, #15
 1671 07f0 0A40     		ands	r2, r1
 1672 07f2 1A70     		strb	r2, [r3]
 318:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         if (inVal != 0) {
 1673              		.loc 1 318 12
 1674 07f4 3B18     		adds	r3, r7, r0
 1675 07f6 1B78     		ldrb	r3, [r3]
 1676 07f8 002B     		cmp	r3, #0
 1677 07fa 34D0     		beq	.L77
 1678              	.LBB13:
 319:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             char col;
 320:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             if (inVal & 0x01) col = 0;
 1679              		.loc 1 320 23
 1680 07fc 3B18     		adds	r3, r7, r0
 1681 07fe 1B78     		ldrb	r3, [r3]
 1682 0800 0122     		movs	r2, #1
 1683 0802 1340     		ands	r3, r2
 1684              		.loc 1 320 16
 1685 0804 03D0     		beq	.L78
 1686              		.loc 1 320 35 discriminator 1
 1687 0806 1523     		movs	r3, #21
 1688 0808 FB18     		adds	r3, r7, r3
 1689 080a 0022     		movs	r2, #0
 1690 080c 1A70     		strb	r2, [r3]
 1691              	.L78:
 321:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             if (inVal & 0x02) col = 1;
 1692              		.loc 1 321 23
 1693 080e 1223     		movs	r3, #18
 1694 0810 FB18     		adds	r3, r7, r3
 1695 0812 1B78     		ldrb	r3, [r3]
 1696 0814 0222     		movs	r2, #2
 1697 0816 1340     		ands	r3, r2
 1698              		.loc 1 321 16
 1699 0818 03D0     		beq	.L79
 1700              		.loc 1 321 35 discriminator 1
 1701 081a 1523     		movs	r3, #21
 1702 081c FB18     		adds	r3, r7, r3
 1703 081e 0122     		movs	r2, #1
 1704 0820 1A70     		strb	r2, [r3]
 1705              	.L79:
 322:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             if (inVal & 0x04) col = 2;
 1706              		.loc 1 322 23
 1707 0822 1223     		movs	r3, #18
 1708 0824 FB18     		adds	r3, r7, r3
 1709 0826 1B78     		ldrb	r3, [r3]
 1710 0828 0422     		movs	r2, #4
 1711 082a 1340     		ands	r3, r2
 1712              		.loc 1 322 16
 1713 082c 03D0     		beq	.L80
 1714              		.loc 1 322 35 discriminator 1
 1715 082e 1523     		movs	r3, #21
 1716 0830 FB18     		adds	r3, r7, r3
 1717 0832 0222     		movs	r2, #2
 1718 0834 1A70     		strb	r2, [r3]
 1719              	.L80:
 323:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             if (inVal & 0x08) col = 3;
 1720              		.loc 1 323 23
 1721 0836 1223     		movs	r3, #18
 1722 0838 FB18     		adds	r3, r7, r3
 1723 083a 1B78     		ldrb	r3, [r3]
 1724 083c 0822     		movs	r2, #8
 1725 083e 1340     		ands	r3, r2
 1726              		.loc 1 323 16
 1727 0840 03D0     		beq	.L81
 1728              		.loc 1 323 35 discriminator 1
 1729 0842 1523     		movs	r3, #21
 1730 0844 FB18     		adds	r3, r7, r3
 1731 0846 0322     		movs	r2, #3
 1732 0848 1A70     		strb	r2, [r3]
 1733              	.L81:
 324:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             
 325:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****             index = row*4+col-4;
 1734              		.loc 1 325 26
 1735 084a 1623     		movs	r3, #22
 1736 084c FB18     		adds	r3, r7, r3
 1737 084e 1B78     		ldrb	r3, [r3]
 1738 0850 9B00     		lsls	r3, r3, #2
 1739 0852 DAB2     		uxtb	r2, r3
 1740 0854 1523     		movs	r3, #21
 1741 0856 FB18     		adds	r3, r7, r3
 1742 0858 1B78     		ldrb	r3, [r3]
 1743 085a D318     		adds	r3, r2, r3
 1744 085c DAB2     		uxtb	r2, r3
 1745              		.loc 1 325 19
 1746 085e 1723     		movs	r3, #23
 1747 0860 FB18     		adds	r3, r7, r3
 1748 0862 043A     		subs	r2, r2, #4
 1749 0864 1A70     		strb	r2, [r3]
 1750              	.L77:
 1751              	.LBE13:
 1752              	.LBE12:
 314:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         char outVal = base << row;
 1753              		.loc 1 314 34 discriminator 2
 1754 0866 1621     		movs	r1, #22
 1755 0868 7B18     		adds	r3, r7, r1
 1756 086a 1A78     		ldrb	r2, [r3]
 1757 086c 7B18     		adds	r3, r7, r1
 1758 086e 0132     		adds	r2, r2, #1
 1759 0870 1A70     		strb	r2, [r3]
 1760              	.L76:
 314:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         char outVal = base << row;
 1761              		.loc 1 314 5 discriminator 1
 1762 0872 1623     		movs	r3, #22
 1763 0874 FB18     		adds	r3, r7, r3
 1764 0876 1B78     		ldrb	r3, [r3]
 1765 0878 042B     		cmp	r3, #4
 1766 087a A5D9     		bls	.L82
 1767              	.LBE11:
 326:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         }
 327:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
 328:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *KB_OUT = 0;
 1768              		.loc 1 328 5
 1769 087c 0A4B     		ldr	r3, .L86+4
 1770              		.loc 1 328 13
 1771 087e 0022     		movs	r2, #0
 1772 0880 1A70     		strb	r2, [r3]
 329:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     if (index == 0xFF) {
 1773              		.loc 1 329 8
 1774 0882 1723     		movs	r3, #23
 1775 0884 FB18     		adds	r3, r7, r3
 1776 0886 1B78     		ldrb	r3, [r3]
 1777 0888 FF2B     		cmp	r3, #255
 1778 088a 01D1     		bne	.L83
 330:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         return 0xFF;
 1779              		.loc 1 330 16
 1780 088c FF23     		movs	r3, #255
 1781 088e 04E0     		b	.L85
 1782              	.L83:
 331:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     } else {
 332:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         return keys[index];
 1783              		.loc 1 332 20
 1784 0890 1723     		movs	r3, #23
 1785 0892 FB18     		adds	r3, r7, r3
 1786 0894 1B78     		ldrb	r3, [r3]
 1787 0896 3A00     		movs	r2, r7
 1788 0898 D35C     		ldrb	r3, [r2, r3]
 1789              	.L85:
 333:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
 334:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 1790              		.loc 1 334 1 discriminator 1
 1791 089a 1800     		movs	r0, r3
 1792 089c BD46     		mov	sp, r7
 1793 089e 07B0     		add	sp, sp, #28
 1794              		@ sp needed
 1795 08a0 90BD     		pop	{r4, r7, pc}
 1796              	.L87:
 1797 08a2 C046     		.align	2
 1798              	.L86:
 1799 08a4 00000000 		.word	.LC3
 1800 08a8 150C0240 		.word	1073875989
 1801 08ac 110C0240 		.word	1073875985
 1802              		.cfi_endproc
 1803              	.LFE19:
 1805              		.section	.rodata
 1806              		.align	2
 1807              	.LC5:
 1808 0010 3F065B4F 		.ascii	"?\006[Ofm}\007\177ow|9^yq"
 1808      666D7D07 
 1808      7F6F777C 
 1808      395E7971 
 1809              		.text
 1810              		.align	1
 1811              		.global	out7seg
 1812              		.syntax unified
 1813              		.code	16
 1814              		.thumb_func
 1815              		.fpu softvfp
 1817              	out7seg:
 1818              	.LFB20:
 335:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 336:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** 
 337:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** void out7seg(unsigned char c) {
 1819              		.loc 1 337 31
 1820              		.cfi_startproc
 1821              		@ args = 0, pretend = 0, frame = 32
 1822              		@ frame_needed = 1, uses_anonymous_args = 0
 1823 08b0 F0B5     		push	{r4, r5, r6, r7, lr}
 1824              		.cfi_def_cfa_offset 20
 1825              		.cfi_offset 4, -20
 1826              		.cfi_offset 5, -16
 1827              		.cfi_offset 6, -12
 1828              		.cfi_offset 7, -8
 1829              		.cfi_offset 14, -4
 1830 08b2 89B0     		sub	sp, sp, #36
 1831              		.cfi_def_cfa_offset 56
 1832 08b4 00AF     		add	r7, sp, #0
 1833              		.cfi_def_cfa_register 7
 1834 08b6 0200     		movs	r2, r0
 1835 08b8 FB1D     		adds	r3, r7, #7
 1836 08ba 1A70     		strb	r2, [r3]
 338:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     char out = 0;
 1837              		.loc 1 338 10
 1838 08bc 1F21     		movs	r1, #31
 1839 08be 7B18     		adds	r3, r7, r1
 1840 08c0 0022     		movs	r2, #0
 1841 08c2 1A70     		strb	r2, [r3]
 339:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     if (c<16) {
 1842              		.loc 1 339 8
 1843 08c4 FB1D     		adds	r3, r7, #7
 1844 08c6 1B78     		ldrb	r3, [r3]
 1845 08c8 0F2B     		cmp	r3, #15
 1846 08ca 0CD8     		bhi	.L89
 1847              	.LBB14:
 340:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         char segCodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 
 1848              		.loc 1 340 14
 1849 08cc 0C20     		movs	r0, #12
 1850 08ce 3B18     		adds	r3, r7, r0
 1851 08d0 094A     		ldr	r2, .L90
 1852 08d2 70CA     		ldmia	r2!, {r4, r5, r6}
 1853 08d4 70C3     		stmia	r3!, {r4, r5, r6}
 1854 08d6 1268     		ldr	r2, [r2]
 1855 08d8 1A60     		str	r2, [r3]
 341:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****         out = segCodes[c];
 1856              		.loc 1 341 23
 1857 08da FB1D     		adds	r3, r7, #7
 1858 08dc 1A78     		ldrb	r2, [r3]
 1859              		.loc 1 341 13
 1860 08de 7B18     		adds	r3, r7, r1
 1861 08e0 3918     		adds	r1, r7, r0
 1862 08e2 8A5C     		ldrb	r2, [r1, r2]
 1863 08e4 1A70     		strb	r2, [r3]
 1864              	.L89:
 1865              	.LBE14:
 342:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     }
 343:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c ****     *SEG_OUT = out;
 1866              		.loc 1 343 5
 1867 08e6 054A     		ldr	r2, .L90+4
 1868              		.loc 1 343 14
 1869 08e8 1F23     		movs	r3, #31
 1870 08ea FB18     		adds	r3, r7, r3
 1871 08ec 1B78     		ldrb	r3, [r3]
 1872 08ee 1370     		strb	r3, [r2]
 344:C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation\drivers.c **** }
 1873              		.loc 1 344 1
 1874 08f0 C046     		nop
 1875 08f2 BD46     		mov	sp, r7
 1876 08f4 09B0     		add	sp, sp, #36
 1877              		@ sp needed
 1878 08f6 F0BD     		pop	{r4, r5, r6, r7, pc}
 1879              	.L91:
 1880              		.align	2
 1881              	.L90:
 1882 08f8 10000000 		.word	.LC5
 1883 08fc 140C0240 		.word	1073875988
 1884              		.cfi_endproc
 1885              	.LFE20:
 1887              	.Letext0:
 1888              		.file 2 "C:/Users/Eriksson/Documents/Chalmers/MOP/Boids-Simulation/drivers.h"
