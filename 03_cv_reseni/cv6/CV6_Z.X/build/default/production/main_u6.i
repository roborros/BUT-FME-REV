# 1 "main_u6.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "main_u6.c" 2

#pragma config FOSC = HSMP
#pragma config PLLCFG = ON
#pragma config FCMEN = ON
#pragma config WDTEN = OFF


# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 1 3
# 18 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 3
extern const char __xc8_OPTIM_SPEED;

extern double __fpnormalize(double);



# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\xc8debug.h" 1 3



# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 1 3



# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 2 3






# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\features.h" 1 3
# 10 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 2 3
# 21 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 18 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long int wchar_t;
# 122 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned size_t;
# 168 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __int24 int24_t;
# 204 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __uint24 uint24_t;
# 21 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 2 3


int atoi (const char *);
long atol (const char *);
long long atoll (const char *);
double atof (const char *);

float strtof (const char *restrict, char **restrict);
double strtod (const char *restrict, char **restrict);
long double strtold (const char *restrict, char **restrict);



long strtol (const char *restrict, char **restrict, int);
unsigned long strtoul (const char *restrict, char **restrict, int);
long long strtoll (const char *restrict, char **restrict, int);
unsigned long long strtoull (const char *restrict, char **restrict, int);

int rand (void);
void srand (unsigned);

          void abort (void);
int atexit (void (*) (void));
          void exit (int);
          void _Exit (int);

void *bsearch (const void *, const void *, size_t, size_t, int (*)(const void *, const void *));

__attribute__((nonreentrant)) void qsort (void *, size_t, size_t, int (*)(const void *, const void *));

int abs (int);
long labs (long);
long long llabs (long long);

typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;
typedef struct { long long quot, rem; } lldiv_t;

div_t div (int, int);
ldiv_t ldiv (long, long);
lldiv_t lldiv (long long, long long);

typedef struct { unsigned int quot, rem; } udiv_t;
typedef struct { unsigned long quot, rem; } uldiv_t;
udiv_t udiv (unsigned int, unsigned int);
uldiv_t uldiv (unsigned long, unsigned long);





size_t __ctype_get_mb_cur_max(void);
# 4 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\xc8debug.h" 2 3








#pragma intrinsic(__builtin_software_breakpoint)
extern void __builtin_software_breakpoint(void);
# 23 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 2 3
# 32 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18.h" 1 3




# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\htc.h" 1 3



# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 1 3
# 4 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\htc.h" 2 3
# 5 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18.h" 2 3



# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18_chip_select.h" 1 3
# 779 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18_chip_select.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 1 3
# 44 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\__at.h" 1 3
# 44 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 2 3








extern volatile unsigned char ANSELA __attribute__((address(0xF38)));

__asm("ANSELA equ 0F38h");


typedef union {
    struct {
        unsigned ANSA0 :1;
        unsigned ANSA1 :1;
        unsigned ANSA2 :1;
        unsigned ANSA3 :1;
        unsigned :1;
        unsigned ANSA5 :1;
    };
} ANSELAbits_t;
extern volatile ANSELAbits_t ANSELAbits __attribute__((address(0xF38)));
# 97 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ANSELB __attribute__((address(0xF39)));

__asm("ANSELB equ 0F39h");


typedef union {
    struct {
        unsigned ANSB0 :1;
        unsigned ANSB1 :1;
        unsigned ANSB2 :1;
        unsigned ANSB3 :1;
        unsigned ANSB4 :1;
        unsigned ANSB5 :1;
    };
} ANSELBbits_t;
extern volatile ANSELBbits_t ANSELBbits __attribute__((address(0xF39)));
# 147 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ANSELC __attribute__((address(0xF3A)));

__asm("ANSELC equ 0F3Ah");


typedef union {
    struct {
        unsigned :2;
        unsigned ANSC2 :1;
        unsigned ANSC3 :1;
        unsigned ANSC4 :1;
        unsigned ANSC5 :1;
        unsigned ANSC6 :1;
        unsigned ANSC7 :1;
    };
} ANSELCbits_t;
extern volatile ANSELCbits_t ANSELCbits __attribute__((address(0xF3A)));
# 198 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ANSELD __attribute__((address(0xF3B)));

__asm("ANSELD equ 0F3Bh");


typedef union {
    struct {
        unsigned ANSD0 :1;
        unsigned ANSD1 :1;
        unsigned ANSD2 :1;
        unsigned ANSD3 :1;
        unsigned ANSD4 :1;
        unsigned ANSD5 :1;
        unsigned ANSD6 :1;
        unsigned ANSD7 :1;
    };
} ANSELDbits_t;
extern volatile ANSELDbits_t ANSELDbits __attribute__((address(0xF3B)));
# 260 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ANSELE __attribute__((address(0xF3C)));

__asm("ANSELE equ 0F3Ch");


typedef union {
    struct {
        unsigned ANSE0 :1;
        unsigned ANSE1 :1;
        unsigned ANSE2 :1;
    };
} ANSELEbits_t;
extern volatile ANSELEbits_t ANSELEbits __attribute__((address(0xF3C)));
# 292 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PMD2 __attribute__((address(0xF3D)));

__asm("PMD2 equ 0F3Dh");


typedef union {
    struct {
        unsigned ADCMD :1;
        unsigned CMP1MD :1;
        unsigned CMP2MD :1;
        unsigned CTMUMD :1;
    };
} PMD2bits_t;
extern volatile PMD2bits_t PMD2bits __attribute__((address(0xF3D)));
# 330 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PMD1 __attribute__((address(0xF3E)));

__asm("PMD1 equ 0F3Eh");


typedef union {
    struct {
        unsigned CCP1MD :1;
        unsigned CCP2MD :1;
        unsigned CCP3MD :1;
        unsigned CCP4MD :1;
        unsigned CCP5MD :1;
        unsigned :1;
        unsigned MSSP1MD :1;
        unsigned MSSP2MD :1;
    };
    struct {
        unsigned EMBMD :1;
    };
} PMD1bits_t;
extern volatile PMD1bits_t PMD1bits __attribute__((address(0xF3E)));
# 395 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PMD0 __attribute__((address(0xF3F)));

__asm("PMD0 equ 0F3Fh");


typedef union {
    struct {
        unsigned TMR1MD :1;
        unsigned TMR2MD :1;
        unsigned TMR3MD :1;
        unsigned TMR4MD :1;
        unsigned TMR5MD :1;
        unsigned TMR6MD :1;
        unsigned UART1MD :1;
        unsigned UART2MD :1;
    };
    struct {
        unsigned :1;
        unsigned SPI1MD :1;
        unsigned SPI2MD :1;
    };
} PMD0bits_t;
extern volatile PMD0bits_t PMD0bits __attribute__((address(0xF3F)));
# 472 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char VREFCON2 __attribute__((address(0xF40)));

__asm("VREFCON2 equ 0F40h");


extern volatile unsigned char DACCON1 __attribute__((address(0xF40)));

__asm("DACCON1 equ 0F40h");


typedef union {
    struct {
        unsigned DACR :5;
    };
    struct {
        unsigned DACR0 :1;
        unsigned DACR1 :1;
        unsigned DACR2 :1;
        unsigned DACR3 :1;
        unsigned DACR4 :1;
    };
} VREFCON2bits_t;
extern volatile VREFCON2bits_t VREFCON2bits __attribute__((address(0xF40)));
# 527 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned DACR :5;
    };
    struct {
        unsigned DACR0 :1;
        unsigned DACR1 :1;
        unsigned DACR2 :1;
        unsigned DACR3 :1;
        unsigned DACR4 :1;
    };
} DACCON1bits_t;
extern volatile DACCON1bits_t DACCON1bits __attribute__((address(0xF40)));
# 574 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char VREFCON1 __attribute__((address(0xF41)));

__asm("VREFCON1 equ 0F41h");


extern volatile unsigned char DACCON0 __attribute__((address(0xF41)));

__asm("DACCON0 equ 0F41h");


typedef union {
    struct {
        unsigned DACNSS :1;
        unsigned :1;
        unsigned DACPSS :2;
        unsigned :1;
        unsigned DACOE :1;
        unsigned DACLPS :1;
        unsigned DACEN :1;
    };
    struct {
        unsigned :2;
        unsigned DACPSS0 :1;
        unsigned DACPSS1 :1;
    };
} VREFCON1bits_t;
extern volatile VREFCON1bits_t VREFCON1bits __attribute__((address(0xF41)));
# 638 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned DACNSS :1;
        unsigned :1;
        unsigned DACPSS :2;
        unsigned :1;
        unsigned DACOE :1;
        unsigned DACLPS :1;
        unsigned DACEN :1;
    };
    struct {
        unsigned :2;
        unsigned DACPSS0 :1;
        unsigned DACPSS1 :1;
    };
} DACCON0bits_t;
extern volatile DACCON0bits_t DACCON0bits __attribute__((address(0xF41)));
# 694 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char VREFCON0 __attribute__((address(0xF42)));

__asm("VREFCON0 equ 0F42h");


extern volatile unsigned char FVRCON __attribute__((address(0xF42)));

__asm("FVRCON equ 0F42h");


typedef union {
    struct {
        unsigned :4;
        unsigned FVRS :2;
        unsigned FVRST :1;
        unsigned FVREN :1;
    };
    struct {
        unsigned :4;
        unsigned FVRS0 :1;
        unsigned FVRS1 :1;
    };
} VREFCON0bits_t;
extern volatile VREFCON0bits_t VREFCON0bits __attribute__((address(0xF42)));
# 745 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned :4;
        unsigned FVRS :2;
        unsigned FVRST :1;
        unsigned FVREN :1;
    };
    struct {
        unsigned :4;
        unsigned FVRS0 :1;
        unsigned FVRS1 :1;
    };
} FVRCONbits_t;
extern volatile FVRCONbits_t FVRCONbits __attribute__((address(0xF42)));
# 788 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CTMUICON __attribute__((address(0xF43)));

__asm("CTMUICON equ 0F43h");


extern volatile unsigned char CTMUICONH __attribute__((address(0xF43)));

__asm("CTMUICONH equ 0F43h");


typedef union {
    struct {
        unsigned IRNG :2;
        unsigned ITRIM :6;
    };
    struct {
        unsigned IRNG0 :1;
        unsigned IRNG1 :1;
        unsigned ITRIM0 :1;
        unsigned ITRIM1 :1;
        unsigned ITRIM2 :1;
        unsigned ITRIM3 :1;
        unsigned ITRIM4 :1;
        unsigned ITRIM5 :1;
    };
} CTMUICONbits_t;
extern volatile CTMUICONbits_t CTMUICONbits __attribute__((address(0xF43)));
# 867 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned IRNG :2;
        unsigned ITRIM :6;
    };
    struct {
        unsigned IRNG0 :1;
        unsigned IRNG1 :1;
        unsigned ITRIM0 :1;
        unsigned ITRIM1 :1;
        unsigned ITRIM2 :1;
        unsigned ITRIM3 :1;
        unsigned ITRIM4 :1;
        unsigned ITRIM5 :1;
    };
} CTMUICONHbits_t;
extern volatile CTMUICONHbits_t CTMUICONHbits __attribute__((address(0xF43)));
# 938 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CTMUCONL __attribute__((address(0xF44)));

__asm("CTMUCONL equ 0F44h");


extern volatile unsigned char CTMUCON1 __attribute__((address(0xF44)));

__asm("CTMUCON1 equ 0F44h");


typedef union {
    struct {
        unsigned EDG1STAT :1;
        unsigned EDG2STAT :1;
        unsigned EDG1SEL :2;
        unsigned EDG1POL :1;
        unsigned EDG2SEL :2;
        unsigned EDG2POL :1;
    };
    struct {
        unsigned :2;
        unsigned EDG1SEL0 :1;
        unsigned EDG1SEL1 :1;
        unsigned :1;
        unsigned EDG2SEL0 :1;
        unsigned EDG2SEL1 :1;
    };
} CTMUCONLbits_t;
extern volatile CTMUCONLbits_t CTMUCONLbits __attribute__((address(0xF44)));
# 1019 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned EDG1STAT :1;
        unsigned EDG2STAT :1;
        unsigned EDG1SEL :2;
        unsigned EDG1POL :1;
        unsigned EDG2SEL :2;
        unsigned EDG2POL :1;
    };
    struct {
        unsigned :2;
        unsigned EDG1SEL0 :1;
        unsigned EDG1SEL1 :1;
        unsigned :1;
        unsigned EDG2SEL0 :1;
        unsigned EDG2SEL1 :1;
    };
} CTMUCON1bits_t;
extern volatile CTMUCON1bits_t CTMUCON1bits __attribute__((address(0xF44)));
# 1092 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CTMUCONH __attribute__((address(0xF45)));

__asm("CTMUCONH equ 0F45h");


extern volatile unsigned char CTMUCON0 __attribute__((address(0xF45)));

__asm("CTMUCON0 equ 0F45h");


typedef union {
    struct {
        unsigned CTTRIG :1;
        unsigned IDISSEN :1;
        unsigned EDGSEQEN :1;
        unsigned EDGEN :1;
        unsigned TGEN :1;
        unsigned CTMUSIDL :1;
        unsigned :1;
        unsigned CTMUEN :1;
    };
} CTMUCONHbits_t;
extern volatile CTMUCONHbits_t CTMUCONHbits __attribute__((address(0xF45)));
# 1152 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned CTTRIG :1;
        unsigned IDISSEN :1;
        unsigned EDGSEQEN :1;
        unsigned EDGEN :1;
        unsigned TGEN :1;
        unsigned CTMUSIDL :1;
        unsigned :1;
        unsigned CTMUEN :1;
    };
} CTMUCON0bits_t;
extern volatile CTMUCON0bits_t CTMUCON0bits __attribute__((address(0xF45)));
# 1204 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SRCON1 __attribute__((address(0xF46)));

__asm("SRCON1 equ 0F46h");


typedef union {
    struct {
        unsigned SRRC1E :1;
        unsigned SRRC2E :1;
        unsigned SRRCKE :1;
        unsigned SRRPE :1;
        unsigned SRSC1E :1;
        unsigned SRSC2E :1;
        unsigned SRSCKE :1;
        unsigned SRSPE :1;
    };
} SRCON1bits_t;
extern volatile SRCON1bits_t SRCON1bits __attribute__((address(0xF46)));
# 1266 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SRCON0 __attribute__((address(0xF47)));

__asm("SRCON0 equ 0F47h");


typedef union {
    struct {
        unsigned SRPR :1;
        unsigned SRPS :1;
        unsigned SRNQEN :1;
        unsigned SRQEN :1;
        unsigned SRCLK :3;
        unsigned SRLEN :1;
    };
    struct {
        unsigned :4;
        unsigned SRCLK0 :1;
        unsigned SRCLK1 :1;
        unsigned SRCLK2 :1;
    };
} SRCON0bits_t;
extern volatile SRCON0bits_t SRCON0bits __attribute__((address(0xF47)));
# 1337 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCPTMRS1 __attribute__((address(0xF48)));

__asm("CCPTMRS1 equ 0F48h");


typedef union {
    struct {
        unsigned C4TSEL :2;
        unsigned C5TSEL :2;
    };
    struct {
        unsigned C4TSEL0 :1;
        unsigned C4TSEL1 :1;
        unsigned C5TSEL0 :1;
        unsigned C5TSEL1 :1;
    };
} CCPTMRS1bits_t;
extern volatile CCPTMRS1bits_t CCPTMRS1bits __attribute__((address(0xF48)));
# 1389 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCPTMRS0 __attribute__((address(0xF49)));

__asm("CCPTMRS0 equ 0F49h");


typedef union {
    struct {
        unsigned C1TSEL :2;
        unsigned :1;
        unsigned C2TSEL :2;
        unsigned :1;
        unsigned C3TSEL :2;
    };
    struct {
        unsigned C1TSEL0 :1;
        unsigned C1TSEL1 :1;
        unsigned :1;
        unsigned C2TSEL0 :1;
        unsigned C2TSEL1 :1;
        unsigned :1;
        unsigned C3TSEL0 :1;
        unsigned C3TSEL1 :1;
    };
} CCPTMRS0bits_t;
extern volatile CCPTMRS0bits_t CCPTMRS0bits __attribute__((address(0xF49)));
# 1463 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T6CON __attribute__((address(0xF4A)));

__asm("T6CON equ 0F4Ah");


typedef union {
    struct {
        unsigned T6CKPS :2;
        unsigned TMR6ON :1;
        unsigned T6OUTPS :4;
    };
    struct {
        unsigned T6CKPS0 :1;
        unsigned T6CKPS1 :1;
        unsigned :1;
        unsigned T6OUTPS0 :1;
        unsigned T6OUTPS1 :1;
        unsigned T6OUTPS2 :1;
        unsigned T6OUTPS3 :1;
    };
} T6CONbits_t;
extern volatile T6CONbits_t T6CONbits __attribute__((address(0xF4A)));
# 1534 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PR6 __attribute__((address(0xF4B)));

__asm("PR6 equ 0F4Bh");


typedef union {
    struct {
        unsigned PR6 :8;
    };
} PR6bits_t;
extern volatile PR6bits_t PR6bits __attribute__((address(0xF4B)));
# 1554 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TMR6 __attribute__((address(0xF4C)));

__asm("TMR6 equ 0F4Ch");


typedef union {
    struct {
        unsigned TMR6 :8;
    };
} TMR6bits_t;
extern volatile TMR6bits_t TMR6bits __attribute__((address(0xF4C)));
# 1574 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T5GCON __attribute__((address(0xF4D)));

__asm("T5GCON equ 0F4Dh");


typedef union {
    struct {
        unsigned :3;
        unsigned T5GGO_NOT_DONE :1;
    };
    struct {
        unsigned T5GSS :2;
        unsigned T5GVAL :1;
        unsigned T5GGO_nDONE :1;
        unsigned T5GSPM :1;
        unsigned T5GTM :1;
        unsigned T5GPOL :1;
        unsigned TMR5GE :1;
    };
    struct {
        unsigned T5GSS0 :1;
        unsigned T5GSS1 :1;
        unsigned :1;
        unsigned T5GGO :1;
    };
    struct {
        unsigned :3;
        unsigned T5G_DONE :1;
    };
} T5GCONbits_t;
extern volatile T5GCONbits_t T5GCONbits __attribute__((address(0xF4D)));
# 1669 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T5CON __attribute__((address(0xF4E)));

__asm("T5CON equ 0F4Eh");


typedef union {
    struct {
        unsigned :2;
        unsigned NOT_T5SYNC :1;
    };
    struct {
        unsigned TMR5ON :1;
        unsigned T5RD16 :1;
        unsigned nT5SYNC :1;
        unsigned T5SOSCEN :1;
        unsigned T5CKPS :2;
        unsigned TMR5CS :2;
    };
    struct {
        unsigned :2;
        unsigned T5SYNC :1;
        unsigned :1;
        unsigned T5CKPS0 :1;
        unsigned T5CKPS1 :1;
        unsigned TMR5CS0 :1;
        unsigned TMR5CS1 :1;
    };
    struct {
        unsigned :1;
        unsigned RD165 :1;
        unsigned :1;
        unsigned SOSCEN5 :1;
    };
} T5CONbits_t;
extern volatile T5CONbits_t T5CONbits __attribute__((address(0xF4E)));
# 1778 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short TMR5 __attribute__((address(0xF4F)));

__asm("TMR5 equ 0F4Fh");




extern volatile unsigned char TMR5L __attribute__((address(0xF4F)));

__asm("TMR5L equ 0F4Fh");


typedef union {
    struct {
        unsigned TMR5L :8;
    };
} TMR5Lbits_t;
extern volatile TMR5Lbits_t TMR5Lbits __attribute__((address(0xF4F)));
# 1805 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TMR5H __attribute__((address(0xF50)));

__asm("TMR5H equ 0F50h");


typedef union {
    struct {
        unsigned TMR5H :8;
    };
} TMR5Hbits_t;
extern volatile TMR5Hbits_t TMR5Hbits __attribute__((address(0xF50)));
# 1825 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T4CON __attribute__((address(0xF51)));

__asm("T4CON equ 0F51h");


typedef union {
    struct {
        unsigned T4CKPS :2;
        unsigned TMR4ON :1;
        unsigned T4OUTPS :4;
    };
    struct {
        unsigned T4CKPS0 :1;
        unsigned T4CKPS1 :1;
        unsigned :1;
        unsigned T4OUTPS0 :1;
        unsigned T4OUTPS1 :1;
        unsigned T4OUTPS2 :1;
        unsigned T4OUTPS3 :1;
    };
} T4CONbits_t;
extern volatile T4CONbits_t T4CONbits __attribute__((address(0xF51)));
# 1896 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PR4 __attribute__((address(0xF52)));

__asm("PR4 equ 0F52h");


typedef union {
    struct {
        unsigned PR4 :8;
    };
} PR4bits_t;
extern volatile PR4bits_t PR4bits __attribute__((address(0xF52)));
# 1916 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TMR4 __attribute__((address(0xF53)));

__asm("TMR4 equ 0F53h");


typedef union {
    struct {
        unsigned TMR4 :8;
    };
} TMR4bits_t;
extern volatile TMR4bits_t TMR4bits __attribute__((address(0xF53)));
# 1936 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCP5CON __attribute__((address(0xF54)));

__asm("CCP5CON equ 0F54h");


typedef union {
    struct {
        unsigned CCP5M :4;
        unsigned DC5B :2;
    };
    struct {
        unsigned CCP5M0 :1;
        unsigned CCP5M1 :1;
        unsigned CCP5M2 :1;
        unsigned CCP5M3 :1;
        unsigned DC5B0 :1;
        unsigned DC5B1 :1;
    };
} CCP5CONbits_t;
extern volatile CCP5CONbits_t CCP5CONbits __attribute__((address(0xF54)));
# 2000 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short CCPR5 __attribute__((address(0xF55)));

__asm("CCPR5 equ 0F55h");




extern volatile unsigned char CCPR5L __attribute__((address(0xF55)));

__asm("CCPR5L equ 0F55h");


typedef union {
    struct {
        unsigned CCPR5L :8;
    };
} CCPR5Lbits_t;
extern volatile CCPR5Lbits_t CCPR5Lbits __attribute__((address(0xF55)));
# 2027 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCPR5H __attribute__((address(0xF56)));

__asm("CCPR5H equ 0F56h");


typedef union {
    struct {
        unsigned CCPR5H :8;
    };
} CCPR5Hbits_t;
extern volatile CCPR5Hbits_t CCPR5Hbits __attribute__((address(0xF56)));
# 2047 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCP4CON __attribute__((address(0xF57)));

__asm("CCP4CON equ 0F57h");


typedef union {
    struct {
        unsigned CCP4M :4;
        unsigned DC4B :2;
    };
    struct {
        unsigned CCP4M0 :1;
        unsigned CCP4M1 :1;
        unsigned CCP4M2 :1;
        unsigned CCP4M3 :1;
        unsigned DC4B0 :1;
        unsigned DC4B1 :1;
    };
} CCP4CONbits_t;
extern volatile CCP4CONbits_t CCP4CONbits __attribute__((address(0xF57)));
# 2111 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short CCPR4 __attribute__((address(0xF58)));

__asm("CCPR4 equ 0F58h");




extern volatile unsigned char CCPR4L __attribute__((address(0xF58)));

__asm("CCPR4L equ 0F58h");


typedef union {
    struct {
        unsigned CCPR4L :8;
    };
} CCPR4Lbits_t;
extern volatile CCPR4Lbits_t CCPR4Lbits __attribute__((address(0xF58)));
# 2138 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCPR4H __attribute__((address(0xF59)));

__asm("CCPR4H equ 0F59h");


typedef union {
    struct {
        unsigned CCPR4H :8;
    };
} CCPR4Hbits_t;
extern volatile CCPR4Hbits_t CCPR4Hbits __attribute__((address(0xF59)));
# 2158 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PSTR3CON __attribute__((address(0xF5A)));

__asm("PSTR3CON equ 0F5Ah");


typedef union {
    struct {
        unsigned STR3A :1;
        unsigned STR3B :1;
        unsigned STR3C :1;
        unsigned STR3D :1;
        unsigned STR3SYNC :1;
    };
    struct {
        unsigned STRA3 :1;
        unsigned STRB3 :1;
        unsigned STRC3 :1;
        unsigned STRD3 :1;
        unsigned STRSYNC3 :1;
    };
} PSTR3CONbits_t;
extern volatile PSTR3CONbits_t PSTR3CONbits __attribute__((address(0xF5A)));
# 2234 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ECCP3AS __attribute__((address(0xF5B)));

__asm("ECCP3AS equ 0F5Bh");


extern volatile unsigned char CCP3AS __attribute__((address(0xF5B)));

__asm("CCP3AS equ 0F5Bh");


typedef union {
    struct {
        unsigned P3SSBD :2;
        unsigned P3SSAC :2;
        unsigned CCP3AS :3;
        unsigned CCP3ASE :1;
    };
    struct {
        unsigned P3SSBD0 :1;
        unsigned P3SSBD1 :1;
        unsigned P3SSAC0 :1;
        unsigned P3SSAC1 :1;
        unsigned CCP3AS0 :1;
        unsigned CCP3AS1 :1;
        unsigned CCP3AS2 :1;
    };
    struct {
        unsigned PSS3BD :2;
        unsigned PSS3AC :2;
    };
    struct {
        unsigned PSS3BD0 :1;
        unsigned PSS3BD1 :1;
        unsigned PSS3AC0 :1;
        unsigned PSS3AC1 :1;
    };
} ECCP3ASbits_t;
extern volatile ECCP3ASbits_t ECCP3ASbits __attribute__((address(0xF5B)));
# 2359 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned P3SSBD :2;
        unsigned P3SSAC :2;
        unsigned CCP3AS :3;
        unsigned CCP3ASE :1;
    };
    struct {
        unsigned P3SSBD0 :1;
        unsigned P3SSBD1 :1;
        unsigned P3SSAC0 :1;
        unsigned P3SSAC1 :1;
        unsigned CCP3AS0 :1;
        unsigned CCP3AS1 :1;
        unsigned CCP3AS2 :1;
    };
    struct {
        unsigned PSS3BD :2;
        unsigned PSS3AC :2;
    };
    struct {
        unsigned PSS3BD0 :1;
        unsigned PSS3BD1 :1;
        unsigned PSS3AC0 :1;
        unsigned PSS3AC1 :1;
    };
} CCP3ASbits_t;
extern volatile CCP3ASbits_t CCP3ASbits __attribute__((address(0xF5B)));
# 2476 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PWM3CON __attribute__((address(0xF5C)));

__asm("PWM3CON equ 0F5Ch");


typedef union {
    struct {
        unsigned P3DC :7;
        unsigned P3RSEN :1;
    };
    struct {
        unsigned P3DC0 :1;
        unsigned P3DC1 :1;
        unsigned P3DC2 :1;
        unsigned P3DC3 :1;
        unsigned P3DC4 :1;
        unsigned P3DC5 :1;
        unsigned P3DC6 :1;
    };
} PWM3CONbits_t;
extern volatile PWM3CONbits_t PWM3CONbits __attribute__((address(0xF5C)));
# 2546 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCP3CON __attribute__((address(0xF5D)));

__asm("CCP3CON equ 0F5Dh");


typedef union {
    struct {
        unsigned CCP3M :4;
        unsigned DC3B :2;
        unsigned P3M :2;
    };
    struct {
        unsigned CCP3M0 :1;
        unsigned CCP3M1 :1;
        unsigned CCP3M2 :1;
        unsigned CCP3M3 :1;
        unsigned DC3B0 :1;
        unsigned DC3B1 :1;
        unsigned P3M0 :1;
        unsigned P3M1 :1;
    };
} CCP3CONbits_t;
extern volatile CCP3CONbits_t CCP3CONbits __attribute__((address(0xF5D)));
# 2628 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short CCPR3 __attribute__((address(0xF5E)));

__asm("CCPR3 equ 0F5Eh");




extern volatile unsigned char CCPR3L __attribute__((address(0xF5E)));

__asm("CCPR3L equ 0F5Eh");


typedef union {
    struct {
        unsigned CCPR3L :8;
    };
} CCPR3Lbits_t;
extern volatile CCPR3Lbits_t CCPR3Lbits __attribute__((address(0xF5E)));
# 2655 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCPR3H __attribute__((address(0xF5F)));

__asm("CCPR3H equ 0F5Fh");


typedef union {
    struct {
        unsigned CCPR3H :8;
    };
} CCPR3Hbits_t;
extern volatile CCPR3Hbits_t CCPR3Hbits __attribute__((address(0xF5F)));
# 2675 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SLRCON __attribute__((address(0xF60)));

__asm("SLRCON equ 0F60h");


typedef union {
    struct {
        unsigned SLRA :1;
        unsigned SLRB :1;
        unsigned SLRC :1;
        unsigned SLRD :1;
        unsigned SLRE :1;
    };
} SLRCONbits_t;
extern volatile SLRCONbits_t SLRCONbits __attribute__((address(0xF60)));
# 2719 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char WPUB __attribute__((address(0xF61)));

__asm("WPUB equ 0F61h");


typedef union {
    struct {
        unsigned WPUB0 :1;
        unsigned WPUB1 :1;
        unsigned WPUB2 :1;
        unsigned WPUB3 :1;
        unsigned WPUB4 :1;
        unsigned WPUB5 :1;
        unsigned WPUB6 :1;
        unsigned WPUB7 :1;
    };
} WPUBbits_t;
extern volatile WPUBbits_t WPUBbits __attribute__((address(0xF61)));
# 2781 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char IOCB __attribute__((address(0xF62)));

__asm("IOCB equ 0F62h");


typedef union {
    struct {
        unsigned :4;
        unsigned IOCB4 :1;
        unsigned IOCB5 :1;
        unsigned IOCB6 :1;
        unsigned IOCB7 :1;
    };
} IOCBbits_t;
extern volatile IOCBbits_t IOCBbits __attribute__((address(0xF62)));
# 2820 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PSTR2CON __attribute__((address(0xF63)));

__asm("PSTR2CON equ 0F63h");


typedef union {
    struct {
        unsigned STR2A :1;
        unsigned STR2B :1;
        unsigned STR2C :1;
        unsigned STR2D :1;
        unsigned STR2SYNC :1;
    };
    struct {
        unsigned P2DC02 :1;
        unsigned P2DC12 :1;
        unsigned P2DC22 :1;
        unsigned P2DC32 :1;
        unsigned P2DC42 :1;
    };
    struct {
        unsigned P2DC0CON :1;
        unsigned P2DC1CON :1;
        unsigned P2DC2CON :1;
        unsigned P2DC3CON :1;
        unsigned P2DC4CON :1;
    };
    struct {
        unsigned STRA2 :1;
        unsigned STRB2 :1;
        unsigned STRC2 :1;
        unsigned STRD2 :1;
        unsigned STRSYNC2 :1;
    };
} PSTR2CONbits_t;
extern volatile PSTR2CONbits_t PSTR2CONbits __attribute__((address(0xF63)));
# 2960 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ECCP2AS __attribute__((address(0xF64)));

__asm("ECCP2AS equ 0F64h");


extern volatile unsigned char CCP2AS __attribute__((address(0xF64)));

__asm("CCP2AS equ 0F64h");


typedef union {
    struct {
        unsigned P2SSBD :2;
        unsigned P2SSAC :2;
        unsigned CCP2AS :3;
        unsigned CCP2ASE :1;
    };
    struct {
        unsigned P2SSBD0 :1;
        unsigned P2SSBD1 :1;
        unsigned P2SSAC0 :1;
        unsigned P2SSAC1 :1;
        unsigned CCP2AS0 :1;
        unsigned CCP2AS1 :1;
        unsigned CCP2AS2 :1;
    };
    struct {
        unsigned PSS2BD :2;
        unsigned PSS2AC :2;
    };
    struct {
        unsigned PSS2BD0 :1;
        unsigned PSS2BD1 :1;
        unsigned PSS2AC0 :1;
        unsigned PSS2AC1 :1;
    };
} ECCP2ASbits_t;
extern volatile ECCP2ASbits_t ECCP2ASbits __attribute__((address(0xF64)));
# 3085 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned P2SSBD :2;
        unsigned P2SSAC :2;
        unsigned CCP2AS :3;
        unsigned CCP2ASE :1;
    };
    struct {
        unsigned P2SSBD0 :1;
        unsigned P2SSBD1 :1;
        unsigned P2SSAC0 :1;
        unsigned P2SSAC1 :1;
        unsigned CCP2AS0 :1;
        unsigned CCP2AS1 :1;
        unsigned CCP2AS2 :1;
    };
    struct {
        unsigned PSS2BD :2;
        unsigned PSS2AC :2;
    };
    struct {
        unsigned PSS2BD0 :1;
        unsigned PSS2BD1 :1;
        unsigned PSS2AC0 :1;
        unsigned PSS2AC1 :1;
    };
} CCP2ASbits_t;
extern volatile CCP2ASbits_t CCP2ASbits __attribute__((address(0xF64)));
# 3202 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PWM2CON __attribute__((address(0xF65)));

__asm("PWM2CON equ 0F65h");


typedef union {
    struct {
        unsigned P2DC :7;
        unsigned P2RSEN :1;
    };
    struct {
        unsigned P2DC0 :1;
        unsigned P2DC1 :1;
        unsigned P2DC2 :1;
        unsigned P2DC3 :1;
        unsigned P2DC4 :1;
        unsigned P2DC5 :1;
        unsigned P2DC6 :1;
    };
} PWM2CONbits_t;
extern volatile PWM2CONbits_t PWM2CONbits __attribute__((address(0xF65)));
# 3272 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCP2CON __attribute__((address(0xF66)));

__asm("CCP2CON equ 0F66h");


typedef union {
    struct {
        unsigned CCP2M :4;
        unsigned DC2B :2;
        unsigned P2M :2;
    };
    struct {
        unsigned CCP2M0 :1;
        unsigned CCP2M1 :1;
        unsigned CCP2M2 :1;
        unsigned CCP2M3 :1;
        unsigned DC2B0 :1;
        unsigned DC2B1 :1;
        unsigned P2M0 :1;
        unsigned P2M1 :1;
    };
} CCP2CONbits_t;
extern volatile CCP2CONbits_t CCP2CONbits __attribute__((address(0xF66)));
# 3354 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short CCPR2 __attribute__((address(0xF67)));

__asm("CCPR2 equ 0F67h");




extern volatile unsigned char CCPR2L __attribute__((address(0xF67)));

__asm("CCPR2L equ 0F67h");


typedef union {
    struct {
        unsigned CCPR2L :8;
    };
} CCPR2Lbits_t;
extern volatile CCPR2Lbits_t CCPR2Lbits __attribute__((address(0xF67)));
# 3381 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCPR2H __attribute__((address(0xF68)));

__asm("CCPR2H equ 0F68h");


typedef union {
    struct {
        unsigned CCPR2H :8;
    };
} CCPR2Hbits_t;
extern volatile CCPR2Hbits_t CCPR2Hbits __attribute__((address(0xF68)));
# 3401 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP2CON3 __attribute__((address(0xF69)));

__asm("SSP2CON3 equ 0F69h");


typedef union {
    struct {
        unsigned DHEN :1;
        unsigned AHEN :1;
        unsigned SBCDE :1;
        unsigned SDAHT :1;
        unsigned BOEN :1;
        unsigned SCIE :1;
        unsigned PCIE :1;
        unsigned ACKTIM :1;
    };
} SSP2CON3bits_t;
extern volatile SSP2CON3bits_t SSP2CON3bits __attribute__((address(0xF69)));
# 3463 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP2MSK __attribute__((address(0xF6A)));

__asm("SSP2MSK equ 0F6Ah");


typedef union {
    struct {
        unsigned MSK0 :1;
        unsigned MSK1 :1;
        unsigned MSK2 :1;
        unsigned MSK3 :1;
        unsigned MSK4 :1;
        unsigned MSK5 :1;
        unsigned MSK6 :1;
        unsigned MSK7 :1;
    };
    struct {
        unsigned MSK :8;
    };
} SSP2MSKbits_t;
extern volatile SSP2MSKbits_t SSP2MSKbits __attribute__((address(0xF6A)));
# 3533 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP2CON2 __attribute__((address(0xF6B)));

__asm("SSP2CON2 equ 0F6Bh");


typedef union {
    struct {
        unsigned SEN :1;
        unsigned RSEN :1;
        unsigned PEN :1;
        unsigned RCEN :1;
        unsigned ACKEN :1;
        unsigned ACKDT :1;
        unsigned ACKSTAT :1;
        unsigned GCEN :1;
    };
    struct {
        unsigned SEN2 :1;
        unsigned ADMSK12 :1;
        unsigned ADMSK22 :1;
        unsigned ADMSK32 :1;
        unsigned ACKEN2 :1;
        unsigned ACKDT2 :1;
        unsigned ACKSTAT2 :1;
        unsigned GCEN2 :1;
    };
    struct {
        unsigned :1;
        unsigned RSEN2 :1;
        unsigned PEN2 :1;
        unsigned RCEN2 :1;
        unsigned ADMSK42 :1;
        unsigned ADMSK52 :1;
    };
} SSP2CON2bits_t;
extern volatile SSP2CON2bits_t SSP2CON2bits __attribute__((address(0xF6B)));
# 3678 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP2CON1 __attribute__((address(0xF6C)));

__asm("SSP2CON1 equ 0F6Ch");


typedef union {
    struct {
        unsigned SSPM :4;
        unsigned CKP :1;
        unsigned SSPEN :1;
        unsigned SSPOV :1;
        unsigned WCOL :1;
    };
    struct {
        unsigned SSPM0 :1;
        unsigned SSPM1 :1;
        unsigned SSPM2 :1;
        unsigned SSPM3 :1;
    };
    struct {
        unsigned SSPM02 :1;
        unsigned SSPM12 :1;
        unsigned SSPM22 :1;
        unsigned SSPM32 :1;
        unsigned CKP2 :1;
        unsigned SSPEN2 :1;
        unsigned SSPOV2 :1;
        unsigned WCOL2 :1;
    };
} SSP2CON1bits_t;
extern volatile SSP2CON1bits_t SSP2CON1bits __attribute__((address(0xF6C)));
# 3798 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP2STAT __attribute__((address(0xF6D)));

__asm("SSP2STAT equ 0F6Dh");


typedef union {
    struct {
        unsigned :2;
        unsigned R_NOT_W :1;
    };
    struct {
        unsigned :5;
        unsigned D_NOT_A :1;
    };
    struct {
        unsigned BF :1;
        unsigned UA :1;
        unsigned R_nW :1;
        unsigned S :1;
        unsigned P :1;
        unsigned D_nA :1;
        unsigned CKE :1;
        unsigned SMP :1;
    };
    struct {
        unsigned :2;
        unsigned R :1;
        unsigned :2;
        unsigned D :1;
    };
    struct {
        unsigned :2;
        unsigned W :1;
        unsigned :2;
        unsigned A :1;
    };
    struct {
        unsigned :2;
        unsigned nW :1;
        unsigned :2;
        unsigned nA :1;
    };
    struct {
        unsigned :2;
        unsigned R_W :1;
        unsigned :2;
        unsigned D_A :1;
    };
    struct {
        unsigned :2;
        unsigned NOT_WRITE :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_ADDRESS :1;
    };
    struct {
        unsigned :2;
        unsigned nWRITE :1;
        unsigned :2;
        unsigned nADDRESS :1;
    };
    struct {
        unsigned BF2 :1;
        unsigned UA2 :1;
        unsigned I2C_READ2 :1;
        unsigned I2C_START2 :1;
        unsigned I2C_STOP2 :1;
        unsigned DA2 :1;
        unsigned CKE2 :1;
        unsigned SMP2 :1;
    };
    struct {
        unsigned :2;
        unsigned READ_WRITE2 :1;
        unsigned S2 :1;
        unsigned P2 :1;
        unsigned DATA_ADDRESS2 :1;
    };
    struct {
        unsigned :2;
        unsigned RW2 :1;
        unsigned START2 :1;
        unsigned STOP2 :1;
        unsigned D_A2 :1;
    };
    struct {
        unsigned :5;
        unsigned D_NOT_A2 :1;
    };
    struct {
        unsigned :2;
        unsigned R_W2 :1;
        unsigned :2;
        unsigned D_nA2 :1;
    };
    struct {
        unsigned :2;
        unsigned R_NOT_W2 :1;
    };
    struct {
        unsigned :2;
        unsigned R_nW2 :1;
        unsigned :2;
        unsigned I2C_DAT2 :1;
    };
    struct {
        unsigned :2;
        unsigned NOT_W2 :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_A2 :1;
    };
    struct {
        unsigned :2;
        unsigned nW2 :1;
        unsigned :2;
        unsigned nA2 :1;
    };
    struct {
        unsigned :2;
        unsigned NOT_WRITE2 :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_ADDRESS2 :1;
    };
    struct {
        unsigned :2;
        unsigned nWRITE2 :1;
        unsigned :2;
        unsigned nADDRESS2 :1;
    };
} SSP2STATbits_t;
extern volatile SSP2STATbits_t SSP2STATbits __attribute__((address(0xF6D)));
# 4198 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP2ADD __attribute__((address(0xF6E)));

__asm("SSP2ADD equ 0F6Eh");


typedef union {
    struct {
        unsigned SSPADD :8;
    };
    struct {
        unsigned MSK02 :1;
        unsigned MSK12 :1;
        unsigned MSK22 :1;
        unsigned MSK32 :1;
        unsigned MSK42 :1;
        unsigned MSK52 :1;
        unsigned MSK62 :1;
        unsigned MSK72 :1;
    };
} SSP2ADDbits_t;
extern volatile SSP2ADDbits_t SSP2ADDbits __attribute__((address(0xF6E)));
# 4268 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP2BUF __attribute__((address(0xF6F)));

__asm("SSP2BUF equ 0F6Fh");


typedef union {
    struct {
        unsigned SSPBUF :8;
    };
} SSP2BUFbits_t;
extern volatile SSP2BUFbits_t SSP2BUFbits __attribute__((address(0xF6F)));
# 4288 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char BAUDCON2 __attribute__((address(0xF70)));

__asm("BAUDCON2 equ 0F70h");


extern volatile unsigned char BAUD2CON __attribute__((address(0xF70)));

__asm("BAUD2CON equ 0F70h");


typedef union {
    struct {
        unsigned ABDEN :1;
        unsigned WUE :1;
        unsigned :1;
        unsigned BRG16 :1;
        unsigned CKTXP :1;
        unsigned DTRXP :1;
        unsigned RCIDL :1;
        unsigned ABDOVF :1;
    };
    struct {
        unsigned :4;
        unsigned SCKP :1;
    };
    struct {
        unsigned ABDEN2 :1;
        unsigned WUE2 :1;
        unsigned :1;
        unsigned BRG162 :1;
        unsigned SCKP2 :1;
        unsigned DTRXP2 :1;
        unsigned RCIDL2 :1;
        unsigned ABDOVF2 :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP2 :1;
        unsigned RXDTP2 :1;
        unsigned RCMT2 :1;
    };
} BAUDCON2bits_t;
extern volatile BAUDCON2bits_t BAUDCON2bits __attribute__((address(0xF70)));
# 4423 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned ABDEN :1;
        unsigned WUE :1;
        unsigned :1;
        unsigned BRG16 :1;
        unsigned CKTXP :1;
        unsigned DTRXP :1;
        unsigned RCIDL :1;
        unsigned ABDOVF :1;
    };
    struct {
        unsigned :4;
        unsigned SCKP :1;
    };
    struct {
        unsigned ABDEN2 :1;
        unsigned WUE2 :1;
        unsigned :1;
        unsigned BRG162 :1;
        unsigned SCKP2 :1;
        unsigned DTRXP2 :1;
        unsigned RCIDL2 :1;
        unsigned ABDOVF2 :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP2 :1;
        unsigned RXDTP2 :1;
        unsigned RCMT2 :1;
    };
} BAUD2CONbits_t;
extern volatile BAUD2CONbits_t BAUD2CONbits __attribute__((address(0xF70)));
# 4550 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char RCSTA2 __attribute__((address(0xF71)));

__asm("RCSTA2 equ 0F71h");


extern volatile unsigned char RC2STA __attribute__((address(0xF71)));

__asm("RC2STA equ 0F71h");


typedef union {
    struct {
        unsigned RX9D :1;
        unsigned OERR :1;
        unsigned FERR :1;
        unsigned ADDEN :1;
        unsigned CREN :1;
        unsigned SREN :1;
        unsigned RX9 :1;
        unsigned SPEN :1;
    };
    struct {
        unsigned :3;
        unsigned ADEN :1;
    };
    struct {
        unsigned RX9D2 :1;
        unsigned OERR2 :1;
        unsigned FERR2 :1;
        unsigned ADDEN2 :1;
        unsigned CREN2 :1;
        unsigned SREN2 :1;
        unsigned RX92 :1;
        unsigned SPEN2 :1;
    };
    struct {
        unsigned RCD82 :1;
        unsigned :5;
        unsigned RC8_92 :1;
    };
    struct {
        unsigned :6;
        unsigned RC92 :1;
    };
} RCSTA2bits_t;
extern volatile RCSTA2bits_t RCSTA2bits __attribute__((address(0xF71)));
# 4698 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned RX9D :1;
        unsigned OERR :1;
        unsigned FERR :1;
        unsigned ADDEN :1;
        unsigned CREN :1;
        unsigned SREN :1;
        unsigned RX9 :1;
        unsigned SPEN :1;
    };
    struct {
        unsigned :3;
        unsigned ADEN :1;
    };
    struct {
        unsigned RX9D2 :1;
        unsigned OERR2 :1;
        unsigned FERR2 :1;
        unsigned ADDEN2 :1;
        unsigned CREN2 :1;
        unsigned SREN2 :1;
        unsigned RX92 :1;
        unsigned SPEN2 :1;
    };
    struct {
        unsigned RCD82 :1;
        unsigned :5;
        unsigned RC8_92 :1;
    };
    struct {
        unsigned :6;
        unsigned RC92 :1;
    };
} RC2STAbits_t;
extern volatile RC2STAbits_t RC2STAbits __attribute__((address(0xF71)));
# 4838 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TXSTA2 __attribute__((address(0xF72)));

__asm("TXSTA2 equ 0F72h");


extern volatile unsigned char TX2STA __attribute__((address(0xF72)));

__asm("TX2STA equ 0F72h");


typedef union {
    struct {
        unsigned TX9D :1;
        unsigned TRMT :1;
        unsigned BRGH :1;
        unsigned SENDB :1;
        unsigned SYNC :1;
        unsigned TXEN :1;
        unsigned TX9 :1;
        unsigned CSRC :1;
    };
    struct {
        unsigned TX9D2 :1;
        unsigned TRMT2 :1;
        unsigned BRGH2 :1;
        unsigned SENDB2 :1;
        unsigned SYNC2 :1;
        unsigned TXEN2 :1;
        unsigned TX92 :1;
        unsigned CSRC2 :1;
    };
    struct {
        unsigned TXD82 :1;
        unsigned :5;
        unsigned TX8_92 :1;
    };
} TXSTA2bits_t;
extern volatile TXSTA2bits_t TXSTA2bits __attribute__((address(0xF72)));
# 4968 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TX9D :1;
        unsigned TRMT :1;
        unsigned BRGH :1;
        unsigned SENDB :1;
        unsigned SYNC :1;
        unsigned TXEN :1;
        unsigned TX9 :1;
        unsigned CSRC :1;
    };
    struct {
        unsigned TX9D2 :1;
        unsigned TRMT2 :1;
        unsigned BRGH2 :1;
        unsigned SENDB2 :1;
        unsigned SYNC2 :1;
        unsigned TXEN2 :1;
        unsigned TX92 :1;
        unsigned CSRC2 :1;
    };
    struct {
        unsigned TXD82 :1;
        unsigned :5;
        unsigned TX8_92 :1;
    };
} TX2STAbits_t;
extern volatile TX2STAbits_t TX2STAbits __attribute__((address(0xF72)));
# 5090 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TXREG2 __attribute__((address(0xF73)));

__asm("TXREG2 equ 0F73h");


extern volatile unsigned char TX2REG __attribute__((address(0xF73)));

__asm("TX2REG equ 0F73h");


typedef union {
    struct {
        unsigned TX2REG :8;
    };
} TXREG2bits_t;
extern volatile TXREG2bits_t TXREG2bits __attribute__((address(0xF73)));







typedef union {
    struct {
        unsigned TX2REG :8;
    };
} TX2REGbits_t;
extern volatile TX2REGbits_t TX2REGbits __attribute__((address(0xF73)));
# 5128 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char RCREG2 __attribute__((address(0xF74)));

__asm("RCREG2 equ 0F74h");


extern volatile unsigned char RC2REG __attribute__((address(0xF74)));

__asm("RC2REG equ 0F74h");


typedef union {
    struct {
        unsigned RC2REG :8;
    };
} RCREG2bits_t;
extern volatile RCREG2bits_t RCREG2bits __attribute__((address(0xF74)));







typedef union {
    struct {
        unsigned RC2REG :8;
    };
} RC2REGbits_t;
extern volatile RC2REGbits_t RC2REGbits __attribute__((address(0xF74)));
# 5166 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SPBRG2 __attribute__((address(0xF75)));

__asm("SPBRG2 equ 0F75h");


extern volatile unsigned char SP2BRG __attribute__((address(0xF75)));

__asm("SP2BRG equ 0F75h");


typedef union {
    struct {
        unsigned SP2BRG :8;
    };
} SPBRG2bits_t;
extern volatile SPBRG2bits_t SPBRG2bits __attribute__((address(0xF75)));







typedef union {
    struct {
        unsigned SP2BRG :8;
    };
} SP2BRGbits_t;
extern volatile SP2BRGbits_t SP2BRGbits __attribute__((address(0xF75)));
# 5204 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SPBRGH2 __attribute__((address(0xF76)));

__asm("SPBRGH2 equ 0F76h");


extern volatile unsigned char SP2BRGH __attribute__((address(0xF76)));

__asm("SP2BRGH equ 0F76h");


typedef union {
    struct {
        unsigned SP2BRGH :8;
    };
} SPBRGH2bits_t;
extern volatile SPBRGH2bits_t SPBRGH2bits __attribute__((address(0xF76)));







typedef union {
    struct {
        unsigned SP2BRGH :8;
    };
} SP2BRGHbits_t;
extern volatile SP2BRGHbits_t SP2BRGHbits __attribute__((address(0xF76)));
# 5242 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CM2CON1 __attribute__((address(0xF77)));

__asm("CM2CON1 equ 0F77h");


extern volatile unsigned char CM12CON __attribute__((address(0xF77)));

__asm("CM12CON equ 0F77h");


typedef union {
    struct {
        unsigned C2SYNC :1;
        unsigned C1SYNC :1;
        unsigned C2HYS :1;
        unsigned C1HYS :1;
        unsigned C2RSEL :1;
        unsigned C1RSEL :1;
        unsigned MC2OUT :1;
        unsigned MC1OUT :1;
    };
} CM2CON1bits_t;
extern volatile CM2CON1bits_t CM2CON1bits __attribute__((address(0xF77)));
# 5307 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned C2SYNC :1;
        unsigned C1SYNC :1;
        unsigned C2HYS :1;
        unsigned C1HYS :1;
        unsigned C2RSEL :1;
        unsigned C1RSEL :1;
        unsigned MC2OUT :1;
        unsigned MC1OUT :1;
    };
} CM12CONbits_t;
extern volatile CM12CONbits_t CM12CONbits __attribute__((address(0xF77)));
# 5364 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CM2CON0 __attribute__((address(0xF78)));

__asm("CM2CON0 equ 0F78h");


extern volatile unsigned char CM2CON __attribute__((address(0xF78)));

__asm("CM2CON equ 0F78h");


typedef union {
    struct {
        unsigned C2CH :2;
        unsigned C2R :1;
        unsigned C2SP :1;
        unsigned C2POL :1;
        unsigned C2OE :1;
        unsigned C2OUT :1;
        unsigned C2ON :1;
    };
    struct {
        unsigned C2CH0 :1;
        unsigned C2CH1 :1;
    };
    struct {
        unsigned CCH02 :1;
    };
    struct {
        unsigned :1;
        unsigned CCH12 :1;
    };
    struct {
        unsigned :6;
        unsigned COE2 :1;
    };
    struct {
        unsigned :7;
        unsigned CON2 :1;
    };
    struct {
        unsigned :5;
        unsigned CPOL2 :1;
    };
    struct {
        unsigned :2;
        unsigned CREF2 :1;
    };
    struct {
        unsigned :3;
        unsigned EVPOL02 :1;
    };
    struct {
        unsigned :4;
        unsigned EVPOL12 :1;
    };
} CM2CON0bits_t;
extern volatile CM2CON0bits_t CM2CON0bits __attribute__((address(0xF78)));
# 5508 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned C2CH :2;
        unsigned C2R :1;
        unsigned C2SP :1;
        unsigned C2POL :1;
        unsigned C2OE :1;
        unsigned C2OUT :1;
        unsigned C2ON :1;
    };
    struct {
        unsigned C2CH0 :1;
        unsigned C2CH1 :1;
    };
    struct {
        unsigned CCH02 :1;
    };
    struct {
        unsigned :1;
        unsigned CCH12 :1;
    };
    struct {
        unsigned :6;
        unsigned COE2 :1;
    };
    struct {
        unsigned :7;
        unsigned CON2 :1;
    };
    struct {
        unsigned :5;
        unsigned CPOL2 :1;
    };
    struct {
        unsigned :2;
        unsigned CREF2 :1;
    };
    struct {
        unsigned :3;
        unsigned EVPOL02 :1;
    };
    struct {
        unsigned :4;
        unsigned EVPOL12 :1;
    };
} CM2CONbits_t;
extern volatile CM2CONbits_t CM2CONbits __attribute__((address(0xF78)));
# 5644 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CM1CON0 __attribute__((address(0xF79)));

__asm("CM1CON0 equ 0F79h");


extern volatile unsigned char CM1CON __attribute__((address(0xF79)));

__asm("CM1CON equ 0F79h");


typedef union {
    struct {
        unsigned C1CH :2;
        unsigned C1R :1;
        unsigned C1SP :1;
        unsigned C1POL :1;
        unsigned C1OE :1;
        unsigned C1OUT :1;
        unsigned C1ON :1;
    };
    struct {
        unsigned C1CH0 :1;
        unsigned C1CH1 :1;
    };
    struct {
        unsigned CCH0 :1;
    };
    struct {
        unsigned CCH01 :1;
    };
    struct {
        unsigned :1;
        unsigned CCH1 :1;
    };
    struct {
        unsigned :1;
        unsigned CCH11 :1;
    };
    struct {
        unsigned :6;
        unsigned COE :1;
    };
    struct {
        unsigned :6;
        unsigned COE1 :1;
    };
    struct {
        unsigned :7;
        unsigned CON :1;
    };
    struct {
        unsigned :7;
        unsigned CON1 :1;
    };
    struct {
        unsigned :5;
        unsigned CPOL :1;
    };
    struct {
        unsigned :5;
        unsigned CPOL1 :1;
    };
    struct {
        unsigned :2;
        unsigned CREF :1;
    };
    struct {
        unsigned :2;
        unsigned CREF1 :1;
    };
    struct {
        unsigned :3;
        unsigned EVPOL0 :1;
    };
    struct {
        unsigned :3;
        unsigned EVPOL01 :1;
    };
    struct {
        unsigned :4;
        unsigned EVPOL1 :1;
    };
    struct {
        unsigned :4;
        unsigned EVPOL11 :1;
    };
} CM1CON0bits_t;
extern volatile CM1CON0bits_t CM1CON0bits __attribute__((address(0xF79)));
# 5859 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned C1CH :2;
        unsigned C1R :1;
        unsigned C1SP :1;
        unsigned C1POL :1;
        unsigned C1OE :1;
        unsigned C1OUT :1;
        unsigned C1ON :1;
    };
    struct {
        unsigned C1CH0 :1;
        unsigned C1CH1 :1;
    };
    struct {
        unsigned CCH0 :1;
    };
    struct {
        unsigned CCH01 :1;
    };
    struct {
        unsigned :1;
        unsigned CCH1 :1;
    };
    struct {
        unsigned :1;
        unsigned CCH11 :1;
    };
    struct {
        unsigned :6;
        unsigned COE :1;
    };
    struct {
        unsigned :6;
        unsigned COE1 :1;
    };
    struct {
        unsigned :7;
        unsigned CON :1;
    };
    struct {
        unsigned :7;
        unsigned CON1 :1;
    };
    struct {
        unsigned :5;
        unsigned CPOL :1;
    };
    struct {
        unsigned :5;
        unsigned CPOL1 :1;
    };
    struct {
        unsigned :2;
        unsigned CREF :1;
    };
    struct {
        unsigned :2;
        unsigned CREF1 :1;
    };
    struct {
        unsigned :3;
        unsigned EVPOL0 :1;
    };
    struct {
        unsigned :3;
        unsigned EVPOL01 :1;
    };
    struct {
        unsigned :4;
        unsigned EVPOL1 :1;
    };
    struct {
        unsigned :4;
        unsigned EVPOL11 :1;
    };
} CM1CONbits_t;
extern volatile CM1CONbits_t CM1CONbits __attribute__((address(0xF79)));
# 6066 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIE4 __attribute__((address(0xF7A)));

__asm("PIE4 equ 0F7Ah");


typedef union {
    struct {
        unsigned CCP3IE :1;
        unsigned CCP4IE :1;
        unsigned CCP5IE :1;
    };
} PIE4bits_t;
extern volatile PIE4bits_t PIE4bits __attribute__((address(0xF7A)));
# 6098 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIR4 __attribute__((address(0xF7B)));

__asm("PIR4 equ 0F7Bh");


typedef union {
    struct {
        unsigned CCP3IF :1;
        unsigned CCP4IF :1;
        unsigned CCP5IF :1;
    };
} PIR4bits_t;
extern volatile PIR4bits_t PIR4bits __attribute__((address(0xF7B)));
# 6130 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char IPR4 __attribute__((address(0xF7C)));

__asm("IPR4 equ 0F7Ch");


typedef union {
    struct {
        unsigned CCP3IP :1;
        unsigned CCP4IP :1;
        unsigned CCP5IP :1;
    };
    struct {
        unsigned CCIP3IP :1;
    };
} IPR4bits_t;
extern volatile IPR4bits_t IPR4bits __attribute__((address(0xF7C)));
# 6170 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIE5 __attribute__((address(0xF7D)));

__asm("PIE5 equ 0F7Dh");


typedef union {
    struct {
        unsigned TMR4IE :1;
        unsigned TMR5IE :1;
        unsigned TMR6IE :1;
    };
} PIE5bits_t;
extern volatile PIE5bits_t PIE5bits __attribute__((address(0xF7D)));
# 6202 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIR5 __attribute__((address(0xF7E)));

__asm("PIR5 equ 0F7Eh");


typedef union {
    struct {
        unsigned TMR4IF :1;
        unsigned TMR5IF :1;
        unsigned TMR6IF :1;
    };
} PIR5bits_t;
extern volatile PIR5bits_t PIR5bits __attribute__((address(0xF7E)));
# 6234 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char IPR5 __attribute__((address(0xF7F)));

__asm("IPR5 equ 0F7Fh");


typedef union {
    struct {
        unsigned TMR4IP :1;
        unsigned TMR5IP :1;
        unsigned TMR6IP :1;
    };
    struct {
        unsigned CCH05 :1;
        unsigned CCH15 :1;
    };
} IPR5bits_t;
extern volatile IPR5bits_t IPR5bits __attribute__((address(0xF7F)));
# 6280 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PORTA __attribute__((address(0xF80)));

__asm("PORTA equ 0F80h");


typedef union {
    struct {
        unsigned RA0 :1;
        unsigned RA1 :1;
        unsigned RA2 :1;
        unsigned RA3 :1;
        unsigned RA4 :1;
        unsigned RA5 :1;
        unsigned RA6 :1;
        unsigned RA7 :1;
    };
    struct {
        unsigned AN0 :1;
        unsigned AN1 :1;
        unsigned AN2 :1;
        unsigned AN3 :1;
        unsigned :1;
        unsigned AN4 :1;
    };
    struct {
        unsigned C12IN0M :1;
        unsigned C12IN1M :1;
        unsigned C2INP :1;
        unsigned C1INP :1;
        unsigned C1OUT :1;
        unsigned C2OUT :1;
    };
    struct {
        unsigned C12IN0N :1;
        unsigned C12IN1N :1;
        unsigned VREFM :1;
        unsigned VREFP :1;
        unsigned T0CKI :1;
        unsigned SS :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_SS :1;
    };
    struct {
        unsigned :2;
        unsigned VREFN :1;
        unsigned :1;
        unsigned SRQ :1;
        unsigned nSS :1;
    };
    struct {
        unsigned :2;
        unsigned CVREF :1;
        unsigned :2;
        unsigned LVDIN :1;
    };
    struct {
        unsigned :2;
        unsigned DACOUT :1;
        unsigned :2;
        unsigned HLVDIN :1;
    };
    struct {
        unsigned :5;
        unsigned SS1 :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_SS1 :1;
    };
    struct {
        unsigned :5;
        unsigned nSS1 :1;
    };
    struct {
        unsigned :5;
        unsigned SRNQ :1;
    };
    struct {
        unsigned ULPWUIN :1;
        unsigned :6;
        unsigned RJPU :1;
    };
} PORTAbits_t;
extern volatile PORTAbits_t PORTAbits __attribute__((address(0xF80)));
# 6565 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PORTB __attribute__((address(0xF81)));

__asm("PORTB equ 0F81h");


typedef union {
    struct {
        unsigned RB0 :1;
        unsigned RB1 :1;
        unsigned RB2 :1;
        unsigned RB3 :1;
        unsigned RB4 :1;
        unsigned RB5 :1;
        unsigned RB6 :1;
        unsigned RB7 :1;
    };
    struct {
        unsigned INT0 :1;
        unsigned INT1 :1;
        unsigned INT2 :1;
        unsigned CCP2 :1;
        unsigned KBI0 :1;
        unsigned KBI1 :1;
        unsigned KBI2 :1;
        unsigned KBI3 :1;
    };
    struct {
        unsigned AN12 :1;
        unsigned AN10 :1;
        unsigned AN8 :1;
        unsigned AN9 :1;
        unsigned AN11 :1;
        unsigned AN13 :1;
        unsigned PGC :1;
        unsigned PGD :1;
    };
    struct {
        unsigned FLT0 :1;
        unsigned C12IN3M :1;
        unsigned :1;
        unsigned C12IN2M :1;
        unsigned T5G :1;
        unsigned T1G :1;
    };
    struct {
        unsigned SRI :1;
        unsigned C12IN3N :1;
        unsigned :1;
        unsigned C12IN2N :1;
        unsigned :1;
        unsigned CCP3 :1;
    };
    struct {
        unsigned :2;
        unsigned CTED1 :1;
        unsigned CTED2 :1;
        unsigned :1;
        unsigned T3CKI :1;
    };
    struct {
        unsigned :3;
        unsigned P2A :1;
        unsigned :1;
        unsigned P3A :1;
    };
    struct {
        unsigned :3;
        unsigned CCP2_PA2 :1;
    };
} PORTBbits_t;
extern volatile PORTBbits_t PORTBbits __attribute__((address(0xF81)));
# 6835 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PORTC __attribute__((address(0xF82)));

__asm("PORTC equ 0F82h");


typedef union {
    struct {
        unsigned RC0 :1;
        unsigned RC1 :1;
        unsigned RC2 :1;
        unsigned RC3 :1;
        unsigned RC4 :1;
        unsigned RC5 :1;
        unsigned RC6 :1;
        unsigned RC7 :1;
    };
    struct {
        unsigned T1OSO :1;
        unsigned T1OSI :1;
        unsigned T5CKI :1;
        unsigned SCK :1;
        unsigned SDI :1;
        unsigned SDO :1;
        unsigned TX :1;
        unsigned RX :1;
    };
    struct {
        unsigned P2B :1;
        unsigned P2A :1;
        unsigned P1A :1;
        unsigned SCL :1;
        unsigned SDA :1;
        unsigned :1;
        unsigned CK :1;
        unsigned DT :1;
    };
    struct {
        unsigned T1CKI :1;
        unsigned CCP2 :1;
        unsigned CCP1 :1;
        unsigned SCK1 :1;
        unsigned SDI1 :1;
        unsigned SDO1 :1;
        unsigned TX1 :1;
        unsigned RX1 :1;
    };
    struct {
        unsigned T3CKI :1;
        unsigned :1;
        unsigned CTPLS :1;
        unsigned SCL1 :1;
        unsigned SDA1 :1;
        unsigned :1;
        unsigned CK1 :1;
        unsigned DT1 :1;
    };
    struct {
        unsigned T3G :1;
        unsigned :1;
        unsigned AN14 :1;
        unsigned AN15 :1;
        unsigned AN16 :1;
        unsigned AN17 :1;
        unsigned AN18 :1;
        unsigned AN19 :1;
    };
    struct {
        unsigned :1;
        unsigned PA2 :1;
        unsigned PA1 :1;
    };
} PORTCbits_t;
extern volatile PORTCbits_t PORTCbits __attribute__((address(0xF82)));
# 7142 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PORTD __attribute__((address(0xF83)));

__asm("PORTD equ 0F83h");


typedef union {
    struct {
        unsigned RD0 :1;
        unsigned RD1 :1;
        unsigned RD2 :1;
        unsigned RD3 :1;
        unsigned RD4 :1;
        unsigned RD5 :1;
        unsigned RD6 :1;
        unsigned RD7 :1;
    };
    struct {
        unsigned :2;
        unsigned P2B :1;
        unsigned P2C :1;
        unsigned P2D :1;
        unsigned P1B :1;
        unsigned P1C :1;
        unsigned P1D :1;
    };
    struct {
        unsigned :1;
        unsigned CCP4 :1;
        unsigned :4;
        unsigned TX2 :1;
        unsigned RX2 :1;
    };
    struct {
        unsigned :3;
        unsigned NOT_SS2 :1;
    };
    struct {
        unsigned SCK2 :1;
        unsigned SDI2 :1;
        unsigned :1;
        unsigned nSS2 :1;
        unsigned SDO2 :1;
        unsigned :1;
        unsigned CK2 :1;
        unsigned DT2 :1;
    };
    struct {
        unsigned SCL2 :1;
        unsigned SDA2 :1;
        unsigned :1;
        unsigned SS2 :1;
    };
    struct {
        unsigned AN20 :1;
        unsigned AN21 :1;
        unsigned AN22 :1;
        unsigned AN23 :1;
        unsigned AN24 :1;
        unsigned AN25 :1;
        unsigned AN26 :1;
        unsigned AN27 :1;
    };
} PORTDbits_t;
extern volatile PORTDbits_t PORTDbits __attribute__((address(0xF83)));
# 7385 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PORTE __attribute__((address(0xF84)));

__asm("PORTE equ 0F84h");


typedef union {
    struct {
        unsigned RE0 :1;
        unsigned RE1 :1;
        unsigned RE2 :1;
        unsigned RE3 :1;
    };
    struct {
        unsigned AN5 :1;
        unsigned AN6 :1;
        unsigned AN7 :1;
        unsigned MCLR :1;
    };
    struct {
        unsigned :3;
        unsigned NOT_MCLR :1;
    };
    struct {
        unsigned P3A :1;
        unsigned P3B :1;
        unsigned CCP5 :1;
        unsigned nMCLR :1;
    };
    struct {
        unsigned CCP3 :1;
        unsigned :2;
        unsigned VPP :1;
    };
    struct {
        unsigned PD2 :1;
        unsigned PC2 :1;
        unsigned CCP10 :1;
        unsigned CCP9E :1;
    };
    struct {
        unsigned RDE :1;
        unsigned WRE :1;
        unsigned CS :1;
        unsigned PC3E :1;
    };
    struct {
        unsigned :2;
        unsigned PB2 :1;
    };
} PORTEbits_t;
extern volatile PORTEbits_t PORTEbits __attribute__((address(0xF84)));
# 7560 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char LATA __attribute__((address(0xF89)));

__asm("LATA equ 0F89h");


typedef union {
    struct {
        unsigned LATA0 :1;
        unsigned LATA1 :1;
        unsigned LATA2 :1;
        unsigned LATA3 :1;
        unsigned LATA4 :1;
        unsigned LATA5 :1;
        unsigned LATA6 :1;
        unsigned LATA7 :1;
    };
    struct {
        unsigned LA0 :1;
        unsigned LA1 :1;
        unsigned LA2 :1;
        unsigned LA3 :1;
        unsigned LA4 :1;
        unsigned LA5 :1;
        unsigned LA6 :1;
        unsigned LA7 :1;
    };
} LATAbits_t;
extern volatile LATAbits_t LATAbits __attribute__((address(0xF89)));
# 7672 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char LATB __attribute__((address(0xF8A)));

__asm("LATB equ 0F8Ah");


typedef union {
    struct {
        unsigned LATB0 :1;
        unsigned LATB1 :1;
        unsigned LATB2 :1;
        unsigned LATB3 :1;
        unsigned LATB4 :1;
        unsigned LATB5 :1;
        unsigned LATB6 :1;
        unsigned LATB7 :1;
    };
    struct {
        unsigned LB0 :1;
        unsigned LB1 :1;
        unsigned LB2 :1;
        unsigned LB3 :1;
        unsigned LB4 :1;
        unsigned LB5 :1;
        unsigned LB6 :1;
        unsigned LB7 :1;
    };
} LATBbits_t;
extern volatile LATBbits_t LATBbits __attribute__((address(0xF8A)));
# 7784 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char LATC __attribute__((address(0xF8B)));

__asm("LATC equ 0F8Bh");


typedef union {
    struct {
        unsigned LATC0 :1;
        unsigned LATC1 :1;
        unsigned LATC2 :1;
        unsigned LATC3 :1;
        unsigned LATC4 :1;
        unsigned LATC5 :1;
        unsigned LATC6 :1;
        unsigned LATC7 :1;
    };
    struct {
        unsigned LC0 :1;
        unsigned LC1 :1;
        unsigned LC2 :1;
        unsigned LC3 :1;
        unsigned LC4 :1;
        unsigned LC5 :1;
        unsigned LC6 :1;
        unsigned LC7 :1;
    };
} LATCbits_t;
extern volatile LATCbits_t LATCbits __attribute__((address(0xF8B)));
# 7896 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char LATD __attribute__((address(0xF8C)));

__asm("LATD equ 0F8Ch");


typedef union {
    struct {
        unsigned LATD0 :1;
        unsigned LATD1 :1;
        unsigned LATD2 :1;
        unsigned LATD3 :1;
        unsigned LATD4 :1;
        unsigned LATD5 :1;
        unsigned LATD6 :1;
        unsigned LATD7 :1;
    };
    struct {
        unsigned LD0 :1;
        unsigned LD1 :1;
        unsigned LD2 :1;
        unsigned LD3 :1;
        unsigned LD4 :1;
        unsigned LD5 :1;
        unsigned LD6 :1;
        unsigned LD7 :1;
    };
} LATDbits_t;
extern volatile LATDbits_t LATDbits __attribute__((address(0xF8C)));
# 8008 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char LATE __attribute__((address(0xF8D)));

__asm("LATE equ 0F8Dh");


typedef union {
    struct {
        unsigned LATE0 :1;
        unsigned LATE1 :1;
        unsigned LATE2 :1;
    };
    struct {
        unsigned LE0 :1;
        unsigned LE1 :1;
        unsigned LE2 :1;
    };
} LATEbits_t;
extern volatile LATEbits_t LATEbits __attribute__((address(0xF8D)));
# 8060 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TRISA __attribute__((address(0xF92)));

__asm("TRISA equ 0F92h");


extern volatile unsigned char DDRA __attribute__((address(0xF92)));

__asm("DDRA equ 0F92h");


typedef union {
    struct {
        unsigned TRISA0 :1;
        unsigned TRISA1 :1;
        unsigned TRISA2 :1;
        unsigned TRISA3 :1;
        unsigned TRISA4 :1;
        unsigned TRISA5 :1;
        unsigned TRISA6 :1;
        unsigned TRISA7 :1;
    };
    struct {
        unsigned RA0 :1;
        unsigned RA1 :1;
        unsigned RA2 :1;
        unsigned RA3 :1;
        unsigned RA4 :1;
        unsigned RA5 :1;
        unsigned RA6 :1;
        unsigned RA7 :1;
    };
} TRISAbits_t;
extern volatile TRISAbits_t TRISAbits __attribute__((address(0xF92)));
# 8175 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TRISA0 :1;
        unsigned TRISA1 :1;
        unsigned TRISA2 :1;
        unsigned TRISA3 :1;
        unsigned TRISA4 :1;
        unsigned TRISA5 :1;
        unsigned TRISA6 :1;
        unsigned TRISA7 :1;
    };
    struct {
        unsigned RA0 :1;
        unsigned RA1 :1;
        unsigned RA2 :1;
        unsigned RA3 :1;
        unsigned RA4 :1;
        unsigned RA5 :1;
        unsigned RA6 :1;
        unsigned RA7 :1;
    };
} DDRAbits_t;
extern volatile DDRAbits_t DDRAbits __attribute__((address(0xF92)));
# 8282 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TRISB __attribute__((address(0xF93)));

__asm("TRISB equ 0F93h");


extern volatile unsigned char DDRB __attribute__((address(0xF93)));

__asm("DDRB equ 0F93h");


typedef union {
    struct {
        unsigned TRISB0 :1;
        unsigned TRISB1 :1;
        unsigned TRISB2 :1;
        unsigned TRISB3 :1;
        unsigned TRISB4 :1;
        unsigned TRISB5 :1;
        unsigned TRISB6 :1;
        unsigned TRISB7 :1;
    };
    struct {
        unsigned RB0 :1;
        unsigned RB1 :1;
        unsigned RB2 :1;
        unsigned RB3 :1;
        unsigned RB4 :1;
        unsigned RB5 :1;
        unsigned RB6 :1;
        unsigned RB7 :1;
    };
} TRISBbits_t;
extern volatile TRISBbits_t TRISBbits __attribute__((address(0xF93)));
# 8397 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TRISB0 :1;
        unsigned TRISB1 :1;
        unsigned TRISB2 :1;
        unsigned TRISB3 :1;
        unsigned TRISB4 :1;
        unsigned TRISB5 :1;
        unsigned TRISB6 :1;
        unsigned TRISB7 :1;
    };
    struct {
        unsigned RB0 :1;
        unsigned RB1 :1;
        unsigned RB2 :1;
        unsigned RB3 :1;
        unsigned RB4 :1;
        unsigned RB5 :1;
        unsigned RB6 :1;
        unsigned RB7 :1;
    };
} DDRBbits_t;
extern volatile DDRBbits_t DDRBbits __attribute__((address(0xF93)));
# 8504 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TRISC __attribute__((address(0xF94)));

__asm("TRISC equ 0F94h");


extern volatile unsigned char DDRC __attribute__((address(0xF94)));

__asm("DDRC equ 0F94h");


typedef union {
    struct {
        unsigned TRISC0 :1;
        unsigned TRISC1 :1;
        unsigned TRISC2 :1;
        unsigned TRISC3 :1;
        unsigned TRISC4 :1;
        unsigned TRISC5 :1;
        unsigned TRISC6 :1;
        unsigned TRISC7 :1;
    };
    struct {
        unsigned RC0 :1;
        unsigned RC1 :1;
        unsigned RC2 :1;
        unsigned RC3 :1;
        unsigned RC4 :1;
        unsigned RC5 :1;
        unsigned RC6 :1;
        unsigned RC7 :1;
    };
} TRISCbits_t;
extern volatile TRISCbits_t TRISCbits __attribute__((address(0xF94)));
# 8619 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TRISC0 :1;
        unsigned TRISC1 :1;
        unsigned TRISC2 :1;
        unsigned TRISC3 :1;
        unsigned TRISC4 :1;
        unsigned TRISC5 :1;
        unsigned TRISC6 :1;
        unsigned TRISC7 :1;
    };
    struct {
        unsigned RC0 :1;
        unsigned RC1 :1;
        unsigned RC2 :1;
        unsigned RC3 :1;
        unsigned RC4 :1;
        unsigned RC5 :1;
        unsigned RC6 :1;
        unsigned RC7 :1;
    };
} DDRCbits_t;
extern volatile DDRCbits_t DDRCbits __attribute__((address(0xF94)));
# 8726 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TRISD __attribute__((address(0xF95)));

__asm("TRISD equ 0F95h");


extern volatile unsigned char DDRD __attribute__((address(0xF95)));

__asm("DDRD equ 0F95h");


typedef union {
    struct {
        unsigned TRISD0 :1;
        unsigned TRISD1 :1;
        unsigned TRISD2 :1;
        unsigned TRISD3 :1;
        unsigned TRISD4 :1;
        unsigned TRISD5 :1;
        unsigned TRISD6 :1;
        unsigned TRISD7 :1;
    };
    struct {
        unsigned RD0 :1;
        unsigned RD1 :1;
        unsigned RD2 :1;
        unsigned RD3 :1;
        unsigned RD4 :1;
        unsigned RD5 :1;
        unsigned RD6 :1;
        unsigned RD7 :1;
    };
} TRISDbits_t;
extern volatile TRISDbits_t TRISDbits __attribute__((address(0xF95)));
# 8841 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TRISD0 :1;
        unsigned TRISD1 :1;
        unsigned TRISD2 :1;
        unsigned TRISD3 :1;
        unsigned TRISD4 :1;
        unsigned TRISD5 :1;
        unsigned TRISD6 :1;
        unsigned TRISD7 :1;
    };
    struct {
        unsigned RD0 :1;
        unsigned RD1 :1;
        unsigned RD2 :1;
        unsigned RD3 :1;
        unsigned RD4 :1;
        unsigned RD5 :1;
        unsigned RD6 :1;
        unsigned RD7 :1;
    };
} DDRDbits_t;
extern volatile DDRDbits_t DDRDbits __attribute__((address(0xF95)));
# 8948 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TRISE __attribute__((address(0xF96)));

__asm("TRISE equ 0F96h");


extern volatile unsigned char DDRE __attribute__((address(0xF96)));

__asm("DDRE equ 0F96h");


typedef union {
    struct {
        unsigned TRISE0 :1;
        unsigned TRISE1 :1;
        unsigned TRISE2 :1;
        unsigned :4;
        unsigned WPUE3 :1;
    };
    struct {
        unsigned RE0 :1;
        unsigned RE1 :1;
        unsigned RE2 :1;
    };
} TRISEbits_t;
extern volatile TRISEbits_t TRISEbits __attribute__((address(0xF96)));
# 9010 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TRISE0 :1;
        unsigned TRISE1 :1;
        unsigned TRISE2 :1;
        unsigned :4;
        unsigned WPUE3 :1;
    };
    struct {
        unsigned RE0 :1;
        unsigned RE1 :1;
        unsigned RE2 :1;
    };
} DDREbits_t;
extern volatile DDREbits_t DDREbits __attribute__((address(0xF96)));
# 9064 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char OSCTUNE __attribute__((address(0xF9B)));

__asm("OSCTUNE equ 0F9Bh");


typedef union {
    struct {
        unsigned TUN :6;
        unsigned PLLEN :1;
        unsigned INTSRC :1;
    };
    struct {
        unsigned TUN0 :1;
        unsigned TUN1 :1;
        unsigned TUN2 :1;
        unsigned TUN3 :1;
        unsigned TUN4 :1;
        unsigned TUN5 :1;
    };
} OSCTUNEbits_t;
extern volatile OSCTUNEbits_t OSCTUNEbits __attribute__((address(0xF9B)));
# 9134 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char HLVDCON __attribute__((address(0xF9C)));

__asm("HLVDCON equ 0F9Ch");


extern volatile unsigned char LVDCON __attribute__((address(0xF9C)));

__asm("LVDCON equ 0F9Ch");


typedef union {
    struct {
        unsigned HLVDL :4;
        unsigned HLVDEN :1;
        unsigned IRVST :1;
        unsigned BGVST :1;
        unsigned VDIRMAG :1;
    };
    struct {
        unsigned HLVDL0 :1;
        unsigned HLVDL1 :1;
        unsigned HLVDL2 :1;
        unsigned HLVDL3 :1;
    };
    struct {
        unsigned LVDL0 :1;
        unsigned LVDL1 :1;
        unsigned LVDL2 :1;
        unsigned LVDL3 :1;
        unsigned LVDEN :1;
        unsigned IVRST :1;
    };
    struct {
        unsigned LVV0 :1;
        unsigned LVV1 :1;
        unsigned LVV2 :1;
        unsigned LVV3 :1;
        unsigned :1;
        unsigned BGST :1;
    };
} HLVDCONbits_t;
extern volatile HLVDCONbits_t HLVDCONbits __attribute__((address(0xF9C)));
# 9278 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned HLVDL :4;
        unsigned HLVDEN :1;
        unsigned IRVST :1;
        unsigned BGVST :1;
        unsigned VDIRMAG :1;
    };
    struct {
        unsigned HLVDL0 :1;
        unsigned HLVDL1 :1;
        unsigned HLVDL2 :1;
        unsigned HLVDL3 :1;
    };
    struct {
        unsigned LVDL0 :1;
        unsigned LVDL1 :1;
        unsigned LVDL2 :1;
        unsigned LVDL3 :1;
        unsigned LVDEN :1;
        unsigned IVRST :1;
    };
    struct {
        unsigned LVV0 :1;
        unsigned LVV1 :1;
        unsigned LVV2 :1;
        unsigned LVV3 :1;
        unsigned :1;
        unsigned BGST :1;
    };
} LVDCONbits_t;
extern volatile LVDCONbits_t LVDCONbits __attribute__((address(0xF9C)));
# 9414 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIE1 __attribute__((address(0xF9D)));

__asm("PIE1 equ 0F9Dh");


typedef union {
    struct {
        unsigned TMR1IE :1;
        unsigned TMR2IE :1;
        unsigned CCP1IE :1;
        unsigned SSP1IE :1;
        unsigned TX1IE :1;
        unsigned RC1IE :1;
        unsigned ADIE :1;
    };
    struct {
        unsigned :3;
        unsigned SSPIE :1;
        unsigned TXIE :1;
        unsigned RCIE :1;
    };
} PIE1bits_t;
extern volatile PIE1bits_t PIE1bits __attribute__((address(0xF9D)));
# 9491 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIR1 __attribute__((address(0xF9E)));

__asm("PIR1 equ 0F9Eh");


typedef union {
    struct {
        unsigned TMR1IF :1;
        unsigned TMR2IF :1;
        unsigned CCP1IF :1;
        unsigned SSP1IF :1;
        unsigned TX1IF :1;
        unsigned RC1IF :1;
        unsigned ADIF :1;
    };
    struct {
        unsigned :3;
        unsigned SSPIF :1;
        unsigned TXIF :1;
        unsigned RCIF :1;
    };
} PIR1bits_t;
extern volatile PIR1bits_t PIR1bits __attribute__((address(0xF9E)));
# 9568 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char IPR1 __attribute__((address(0xF9F)));

__asm("IPR1 equ 0F9Fh");


typedef union {
    struct {
        unsigned TMR1IP :1;
        unsigned TMR2IP :1;
        unsigned CCP1IP :1;
        unsigned SSP1IP :1;
        unsigned TX1IP :1;
        unsigned RC1IP :1;
        unsigned ADIP :1;
    };
    struct {
        unsigned :3;
        unsigned SSPIP :1;
        unsigned TXIP :1;
        unsigned RCIP :1;
    };
} IPR1bits_t;
extern volatile IPR1bits_t IPR1bits __attribute__((address(0xF9F)));
# 9645 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIE2 __attribute__((address(0xFA0)));

__asm("PIE2 equ 0FA0h");


typedef union {
    struct {
        unsigned CCP2IE :1;
        unsigned TMR3IE :1;
        unsigned HLVDIE :1;
        unsigned BCL1IE :1;
        unsigned EEIE :1;
        unsigned C2IE :1;
        unsigned C1IE :1;
        unsigned OSCFIE :1;
    };
    struct {
        unsigned :2;
        unsigned LVDIE :1;
        unsigned BCLIE :1;
    };
    struct {
        unsigned :6;
        unsigned CMIE :1;
    };
} PIE2bits_t;
extern volatile PIE2bits_t PIE2bits __attribute__((address(0xFA0)));
# 9731 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIR2 __attribute__((address(0xFA1)));

__asm("PIR2 equ 0FA1h");


typedef union {
    struct {
        unsigned CCP2IF :1;
        unsigned TMR3IF :1;
        unsigned HLVDIF :1;
        unsigned BCL1IF :1;
        unsigned EEIF :1;
        unsigned C2IF :1;
        unsigned C1IF :1;
        unsigned OSCFIF :1;
    };
    struct {
        unsigned :2;
        unsigned LVDIF :1;
        unsigned BCLIF :1;
    };
    struct {
        unsigned :6;
        unsigned CMIF :1;
    };
} PIR2bits_t;
extern volatile PIR2bits_t PIR2bits __attribute__((address(0xFA1)));
# 9817 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char IPR2 __attribute__((address(0xFA2)));

__asm("IPR2 equ 0FA2h");


typedef union {
    struct {
        unsigned CCP2IP :1;
        unsigned TMR3IP :1;
        unsigned HLVDIP :1;
        unsigned BCL1IP :1;
        unsigned EEIP :1;
        unsigned C2IP :1;
        unsigned C1IP :1;
        unsigned OSCFIP :1;
    };
    struct {
        unsigned :2;
        unsigned LVDIP :1;
        unsigned BCLIP :1;
    };
    struct {
        unsigned :6;
        unsigned CMIP :1;
    };
} IPR2bits_t;
extern volatile IPR2bits_t IPR2bits __attribute__((address(0xFA2)));
# 9903 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIE3 __attribute__((address(0xFA3)));

__asm("PIE3 equ 0FA3h");


typedef union {
    struct {
        unsigned TMR1GIE :1;
        unsigned TMR3GIE :1;
        unsigned TMR5GIE :1;
        unsigned CTMUIE :1;
        unsigned TX2IE :1;
        unsigned RC2IE :1;
        unsigned BCL2IE :1;
        unsigned SSP2IE :1;
    };
    struct {
        unsigned RXB0IE :1;
        unsigned RXB1IE :1;
        unsigned TXB0IE :1;
        unsigned TXB1IE :1;
        unsigned TXB2IE :1;
    };
    struct {
        unsigned :1;
        unsigned RXBNIE :1;
        unsigned :2;
        unsigned TXBNIE :1;
    };
} PIE3bits_t;
extern volatile PIE3bits_t PIE3bits __attribute__((address(0xFA3)));
# 10013 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PIR3 __attribute__((address(0xFA4)));

__asm("PIR3 equ 0FA4h");


typedef union {
    struct {
        unsigned TMR1GIF :1;
        unsigned TMR3GIF :1;
        unsigned TMR5GIF :1;
        unsigned CTMUIF :1;
        unsigned TX2IF :1;
        unsigned RC2IF :1;
        unsigned BCL2IF :1;
        unsigned SSP2IF :1;
    };
    struct {
        unsigned :1;
        unsigned RXBNIF :1;
        unsigned :2;
        unsigned TXBNIF :1;
    };
} PIR3bits_t;
extern volatile PIR3bits_t PIR3bits __attribute__((address(0xFA4)));
# 10091 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char IPR3 __attribute__((address(0xFA5)));

__asm("IPR3 equ 0FA5h");


typedef union {
    struct {
        unsigned TMR1GIP :1;
        unsigned TMR3GIP :1;
        unsigned TMR5GIP :1;
        unsigned CTMUIP :1;
        unsigned TX2IP :1;
        unsigned RC2IP :1;
        unsigned BCL2IP :1;
        unsigned SSP2IP :1;
    };
    struct {
        unsigned :1;
        unsigned RXBNIP :1;
        unsigned :2;
        unsigned TXBNIP :1;
    };
} IPR3bits_t;
extern volatile IPR3bits_t IPR3bits __attribute__((address(0xFA5)));
# 10169 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char EECON1 __attribute__((address(0xFA6)));

__asm("EECON1 equ 0FA6h");


typedef union {
    struct {
        unsigned RD :1;
        unsigned WR :1;
        unsigned WREN :1;
        unsigned WRERR :1;
        unsigned FREE :1;
        unsigned :1;
        unsigned CFGS :1;
        unsigned EEPGD :1;
    };
    struct {
        unsigned :6;
        unsigned EEFS :1;
    };
} EECON1bits_t;
extern volatile EECON1bits_t EECON1bits __attribute__((address(0xFA6)));
# 10235 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char EECON2 __attribute__((address(0xFA7)));

__asm("EECON2 equ 0FA7h");


typedef union {
    struct {
        unsigned EECON2 :8;
    };
} EECON2bits_t;
extern volatile EECON2bits_t EECON2bits __attribute__((address(0xFA7)));
# 10255 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char EEDATA __attribute__((address(0xFA8)));

__asm("EEDATA equ 0FA8h");


typedef union {
    struct {
        unsigned EEDATA :8;
    };
} EEDATAbits_t;
extern volatile EEDATAbits_t EEDATAbits __attribute__((address(0xFA8)));
# 10275 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char EEADR __attribute__((address(0xFA9)));

__asm("EEADR equ 0FA9h");


typedef union {
    struct {
        unsigned EEADR :8;
    };
    struct {
        unsigned EEADR0 :1;
        unsigned EEADR1 :1;
        unsigned EEADR2 :1;
        unsigned EEADR3 :1;
        unsigned EEADR4 :1;
        unsigned EEADR5 :1;
        unsigned EEADR6 :1;
        unsigned EEADR7 :1;
    };
} EEADRbits_t;
extern volatile EEADRbits_t EEADRbits __attribute__((address(0xFA9)));
# 10345 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char EEADRH __attribute__((address(0xFAA)));

__asm("EEADRH equ 0FAAh");


typedef union {
    struct {
        unsigned EEADRH :2;
    };
    struct {
        unsigned EEADR8 :1;
        unsigned EEADR9 :1;
    };
} EEADRHbits_t;
extern volatile EEADRHbits_t EEADRHbits __attribute__((address(0xFAA)));
# 10379 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char RCSTA1 __attribute__((address(0xFAB)));

__asm("RCSTA1 equ 0FABh");


extern volatile unsigned char RCSTA __attribute__((address(0xFAB)));

__asm("RCSTA equ 0FABh");

extern volatile unsigned char RC1STA __attribute__((address(0xFAB)));

__asm("RC1STA equ 0FABh");


typedef union {
    struct {
        unsigned RX9D :1;
        unsigned OERR :1;
        unsigned FERR :1;
        unsigned ADDEN :1;
        unsigned CREN :1;
        unsigned SREN :1;
        unsigned RX9 :1;
        unsigned SPEN :1;
    };
    struct {
        unsigned :3;
        unsigned ADEN :1;
    };
    struct {
        unsigned RX9D1 :1;
        unsigned OERR1 :1;
        unsigned FERR1 :1;
        unsigned ADDEN1 :1;
        unsigned CREN1 :1;
        unsigned SREN1 :1;
        unsigned RX91 :1;
        unsigned SPEN1 :1;
    };
    struct {
        unsigned RCD8 :1;
        unsigned :5;
        unsigned RC8_9 :1;
    };
    struct {
        unsigned :6;
        unsigned RC9 :1;
    };
    struct {
        unsigned :5;
        unsigned SRENA :1;
    };
} RCSTA1bits_t;
extern volatile RCSTA1bits_t RCSTA1bits __attribute__((address(0xFAB)));
# 10540 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned RX9D :1;
        unsigned OERR :1;
        unsigned FERR :1;
        unsigned ADDEN :1;
        unsigned CREN :1;
        unsigned SREN :1;
        unsigned RX9 :1;
        unsigned SPEN :1;
    };
    struct {
        unsigned :3;
        unsigned ADEN :1;
    };
    struct {
        unsigned RX9D1 :1;
        unsigned OERR1 :1;
        unsigned FERR1 :1;
        unsigned ADDEN1 :1;
        unsigned CREN1 :1;
        unsigned SREN1 :1;
        unsigned RX91 :1;
        unsigned SPEN1 :1;
    };
    struct {
        unsigned RCD8 :1;
        unsigned :5;
        unsigned RC8_9 :1;
    };
    struct {
        unsigned :6;
        unsigned RC9 :1;
    };
    struct {
        unsigned :5;
        unsigned SRENA :1;
    };
} RCSTAbits_t;
extern volatile RCSTAbits_t RCSTAbits __attribute__((address(0xFAB)));
# 10686 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned RX9D :1;
        unsigned OERR :1;
        unsigned FERR :1;
        unsigned ADDEN :1;
        unsigned CREN :1;
        unsigned SREN :1;
        unsigned RX9 :1;
        unsigned SPEN :1;
    };
    struct {
        unsigned :3;
        unsigned ADEN :1;
    };
    struct {
        unsigned RX9D1 :1;
        unsigned OERR1 :1;
        unsigned FERR1 :1;
        unsigned ADDEN1 :1;
        unsigned CREN1 :1;
        unsigned SREN1 :1;
        unsigned RX91 :1;
        unsigned SPEN1 :1;
    };
    struct {
        unsigned RCD8 :1;
        unsigned :5;
        unsigned RC8_9 :1;
    };
    struct {
        unsigned :6;
        unsigned RC9 :1;
    };
    struct {
        unsigned :5;
        unsigned SRENA :1;
    };
} RC1STAbits_t;
extern volatile RC1STAbits_t RC1STAbits __attribute__((address(0xFAB)));
# 10835 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TXSTA1 __attribute__((address(0xFAC)));

__asm("TXSTA1 equ 0FACh");


extern volatile unsigned char TXSTA __attribute__((address(0xFAC)));

__asm("TXSTA equ 0FACh");

extern volatile unsigned char TX1STA __attribute__((address(0xFAC)));

__asm("TX1STA equ 0FACh");


typedef union {
    struct {
        unsigned TX9D :1;
        unsigned TRMT :1;
        unsigned BRGH :1;
        unsigned SENDB :1;
        unsigned SYNC :1;
        unsigned TXEN :1;
        unsigned TX9 :1;
        unsigned CSRC :1;
    };
    struct {
        unsigned TX9D1 :1;
        unsigned TRMT1 :1;
        unsigned BRGH1 :1;
        unsigned SENDB1 :1;
        unsigned SYNC1 :1;
        unsigned TXEN1 :1;
        unsigned TX91 :1;
        unsigned CSRC1 :1;
    };
    struct {
        unsigned TXD8 :1;
        unsigned :5;
        unsigned TX8_9 :1;
    };
} TXSTA1bits_t;
extern volatile TXSTA1bits_t TXSTA1bits __attribute__((address(0xFAC)));
# 10969 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TX9D :1;
        unsigned TRMT :1;
        unsigned BRGH :1;
        unsigned SENDB :1;
        unsigned SYNC :1;
        unsigned TXEN :1;
        unsigned TX9 :1;
        unsigned CSRC :1;
    };
    struct {
        unsigned TX9D1 :1;
        unsigned TRMT1 :1;
        unsigned BRGH1 :1;
        unsigned SENDB1 :1;
        unsigned SYNC1 :1;
        unsigned TXEN1 :1;
        unsigned TX91 :1;
        unsigned CSRC1 :1;
    };
    struct {
        unsigned TXD8 :1;
        unsigned :5;
        unsigned TX8_9 :1;
    };
} TXSTAbits_t;
extern volatile TXSTAbits_t TXSTAbits __attribute__((address(0xFAC)));
# 11088 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TX9D :1;
        unsigned TRMT :1;
        unsigned BRGH :1;
        unsigned SENDB :1;
        unsigned SYNC :1;
        unsigned TXEN :1;
        unsigned TX9 :1;
        unsigned CSRC :1;
    };
    struct {
        unsigned TX9D1 :1;
        unsigned TRMT1 :1;
        unsigned BRGH1 :1;
        unsigned SENDB1 :1;
        unsigned SYNC1 :1;
        unsigned TXEN1 :1;
        unsigned TX91 :1;
        unsigned CSRC1 :1;
    };
    struct {
        unsigned TXD8 :1;
        unsigned :5;
        unsigned TX8_9 :1;
    };
} TX1STAbits_t;
extern volatile TX1STAbits_t TX1STAbits __attribute__((address(0xFAC)));
# 11210 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TXREG1 __attribute__((address(0xFAD)));

__asm("TXREG1 equ 0FADh");


extern volatile unsigned char TXREG __attribute__((address(0xFAD)));

__asm("TXREG equ 0FADh");

extern volatile unsigned char TX1REG __attribute__((address(0xFAD)));

__asm("TX1REG equ 0FADh");


typedef union {
    struct {
        unsigned TX1REG :8;
    };
    struct {
        unsigned TXREG :8;
    };
} TXREG1bits_t;
extern volatile TXREG1bits_t TXREG1bits __attribute__((address(0xFAD)));
# 11245 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TX1REG :8;
    };
    struct {
        unsigned TXREG :8;
    };
} TXREGbits_t;
extern volatile TXREGbits_t TXREGbits __attribute__((address(0xFAD)));
# 11265 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned TX1REG :8;
    };
    struct {
        unsigned TXREG :8;
    };
} TX1REGbits_t;
extern volatile TX1REGbits_t TX1REGbits __attribute__((address(0xFAD)));
# 11288 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char RCREG1 __attribute__((address(0xFAE)));

__asm("RCREG1 equ 0FAEh");


extern volatile unsigned char RCREG __attribute__((address(0xFAE)));

__asm("RCREG equ 0FAEh");

extern volatile unsigned char RC1REG __attribute__((address(0xFAE)));

__asm("RC1REG equ 0FAEh");


typedef union {
    struct {
        unsigned RC1REG :8;
    };
    struct {
        unsigned RCREG :8;
    };
} RCREG1bits_t;
extern volatile RCREG1bits_t RCREG1bits __attribute__((address(0xFAE)));
# 11323 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned RC1REG :8;
    };
    struct {
        unsigned RCREG :8;
    };
} RCREGbits_t;
extern volatile RCREGbits_t RCREGbits __attribute__((address(0xFAE)));
# 11343 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned RC1REG :8;
    };
    struct {
        unsigned RCREG :8;
    };
} RC1REGbits_t;
extern volatile RC1REGbits_t RC1REGbits __attribute__((address(0xFAE)));
# 11366 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SPBRG1 __attribute__((address(0xFAF)));

__asm("SPBRG1 equ 0FAFh");


extern volatile unsigned char SPBRG __attribute__((address(0xFAF)));

__asm("SPBRG equ 0FAFh");

extern volatile unsigned char SP1BRG __attribute__((address(0xFAF)));

__asm("SP1BRG equ 0FAFh");


typedef union {
    struct {
        unsigned SP1BRG :8;
    };
    struct {
        unsigned SPBRG :8;
    };
} SPBRG1bits_t;
extern volatile SPBRG1bits_t SPBRG1bits __attribute__((address(0xFAF)));
# 11401 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned SP1BRG :8;
    };
    struct {
        unsigned SPBRG :8;
    };
} SPBRGbits_t;
extern volatile SPBRGbits_t SPBRGbits __attribute__((address(0xFAF)));
# 11421 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned SP1BRG :8;
    };
    struct {
        unsigned SPBRG :8;
    };
} SP1BRGbits_t;
extern volatile SP1BRGbits_t SP1BRGbits __attribute__((address(0xFAF)));
# 11444 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SPBRGH1 __attribute__((address(0xFB0)));

__asm("SPBRGH1 equ 0FB0h");


extern volatile unsigned char SPBRGH __attribute__((address(0xFB0)));

__asm("SPBRGH equ 0FB0h");

extern volatile unsigned char SP1BRGH __attribute__((address(0xFB0)));

__asm("SP1BRGH equ 0FB0h");


typedef union {
    struct {
        unsigned SP1BRGH :8;
    };
    struct {
        unsigned SPBRGH :8;
    };
} SPBRGH1bits_t;
extern volatile SPBRGH1bits_t SPBRGH1bits __attribute__((address(0xFB0)));
# 11479 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned SP1BRGH :8;
    };
    struct {
        unsigned SPBRGH :8;
    };
} SPBRGHbits_t;
extern volatile SPBRGHbits_t SPBRGHbits __attribute__((address(0xFB0)));
# 11499 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned SP1BRGH :8;
    };
    struct {
        unsigned SPBRGH :8;
    };
} SP1BRGHbits_t;
extern volatile SP1BRGHbits_t SP1BRGHbits __attribute__((address(0xFB0)));
# 11522 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T3CON __attribute__((address(0xFB1)));

__asm("T3CON equ 0FB1h");


typedef union {
    struct {
        unsigned :2;
        unsigned NOT_T3SYNC :1;
    };
    struct {
        unsigned TMR3ON :1;
        unsigned T3RD16 :1;
        unsigned nT3SYNC :1;
        unsigned T3SOSCEN :1;
        unsigned T3CKPS :2;
        unsigned TMR3CS :2;
    };
    struct {
        unsigned :3;
        unsigned T3OSCEN :1;
        unsigned T3CKPS0 :1;
        unsigned T3CKPS1 :1;
        unsigned TMR3CS0 :1;
        unsigned TMR3CS1 :1;
    };
    struct {
        unsigned :3;
        unsigned SOSCEN3 :1;
        unsigned :3;
        unsigned RD163 :1;
    };
} T3CONbits_t;
extern volatile T3CONbits_t T3CONbits __attribute__((address(0xFB1)));
# 11630 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short TMR3 __attribute__((address(0xFB2)));

__asm("TMR3 equ 0FB2h");




extern volatile unsigned char TMR3L __attribute__((address(0xFB2)));

__asm("TMR3L equ 0FB2h");


typedef union {
    struct {
        unsigned TMR3L :8;
    };
} TMR3Lbits_t;
extern volatile TMR3Lbits_t TMR3Lbits __attribute__((address(0xFB2)));
# 11657 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TMR3H __attribute__((address(0xFB3)));

__asm("TMR3H equ 0FB3h");


typedef union {
    struct {
        unsigned TMR3H :8;
    };
} TMR3Hbits_t;
extern volatile TMR3Hbits_t TMR3Hbits __attribute__((address(0xFB3)));
# 11677 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T3GCON __attribute__((address(0xFB4)));

__asm("T3GCON equ 0FB4h");


typedef union {
    struct {
        unsigned :3;
        unsigned T3GGO_NOT_DONE :1;
    };
    struct {
        unsigned T3GSS :2;
        unsigned T3GVAL :1;
        unsigned T3GGO_nDONE :1;
        unsigned T3GSPM :1;
        unsigned T3GTM :1;
        unsigned T3GPOL :1;
        unsigned TMR3GE :1;
    };
    struct {
        unsigned T3GSS0 :1;
        unsigned T3GSS1 :1;
        unsigned :1;
        unsigned T3G_DONE :1;
    };
    struct {
        unsigned :3;
        unsigned T3GGO :1;
    };
} T3GCONbits_t;
extern volatile T3GCONbits_t T3GCONbits __attribute__((address(0xFB4)));
# 11772 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ECCP1AS __attribute__((address(0xFB6)));

__asm("ECCP1AS equ 0FB6h");


extern volatile unsigned char ECCPAS __attribute__((address(0xFB6)));

__asm("ECCPAS equ 0FB6h");


typedef union {
    struct {
        unsigned P1SSBD :2;
        unsigned P1SSAC :2;
        unsigned CCP1AS :3;
        unsigned CCP1ASE :1;
    };
    struct {
        unsigned P1SSBD0 :1;
        unsigned P1SSBD1 :1;
        unsigned P1SSAC0 :1;
        unsigned P1SSAC1 :1;
        unsigned CCP1AS0 :1;
        unsigned CCP1AS1 :1;
        unsigned CCP1AS2 :1;
    };
    struct {
        unsigned PSS1BD :2;
        unsigned PSS1AC :2;
    };
    struct {
        unsigned PSS1BD0 :1;
        unsigned PSS1BD1 :1;
        unsigned PSS1AC0 :1;
        unsigned PSS1AC1 :1;
    };
    struct {
        unsigned PSSBD :2;
        unsigned PSSAC :2;
        unsigned ECCPAS :3;
        unsigned ECCPASE :1;
    };
    struct {
        unsigned PSSBD0 :1;
        unsigned PSSBD1 :1;
        unsigned PSSAC0 :1;
        unsigned PSSAC1 :1;
        unsigned ECCPAS0 :1;
        unsigned ECCPAS1 :1;
        unsigned ECCPAS2 :1;
    };
} ECCP1ASbits_t;
extern volatile ECCP1ASbits_t ECCP1ASbits __attribute__((address(0xFB6)));
# 11967 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned P1SSBD :2;
        unsigned P1SSAC :2;
        unsigned CCP1AS :3;
        unsigned CCP1ASE :1;
    };
    struct {
        unsigned P1SSBD0 :1;
        unsigned P1SSBD1 :1;
        unsigned P1SSAC0 :1;
        unsigned P1SSAC1 :1;
        unsigned CCP1AS0 :1;
        unsigned CCP1AS1 :1;
        unsigned CCP1AS2 :1;
    };
    struct {
        unsigned PSS1BD :2;
        unsigned PSS1AC :2;
    };
    struct {
        unsigned PSS1BD0 :1;
        unsigned PSS1BD1 :1;
        unsigned PSS1AC0 :1;
        unsigned PSS1AC1 :1;
    };
    struct {
        unsigned PSSBD :2;
        unsigned PSSAC :2;
        unsigned ECCPAS :3;
        unsigned ECCPASE :1;
    };
    struct {
        unsigned PSSBD0 :1;
        unsigned PSSBD1 :1;
        unsigned PSSAC0 :1;
        unsigned PSSAC1 :1;
        unsigned ECCPAS0 :1;
        unsigned ECCPAS1 :1;
        unsigned ECCPAS2 :1;
    };
} ECCPASbits_t;
extern volatile ECCPASbits_t ECCPASbits __attribute__((address(0xFB6)));
# 12154 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PWM1CON __attribute__((address(0xFB7)));

__asm("PWM1CON equ 0FB7h");


extern volatile unsigned char PWMCON __attribute__((address(0xFB7)));

__asm("PWMCON equ 0FB7h");


typedef union {
    struct {
        unsigned P1DC :7;
        unsigned P1RSEN :1;
    };
    struct {
        unsigned P1DC0 :1;
        unsigned P1DC1 :1;
        unsigned P1DC2 :1;
        unsigned P1DC3 :1;
        unsigned P1DC4 :1;
        unsigned P1DC5 :1;
        unsigned P1DC6 :1;
    };
    struct {
        unsigned PDC :7;
        unsigned PRSEN :1;
    };
    struct {
        unsigned PDC0 :1;
        unsigned PDC1 :1;
        unsigned PDC2 :1;
        unsigned PDC3 :1;
        unsigned PDC4 :1;
        unsigned PDC5 :1;
        unsigned PDC6 :1;
    };
} PWM1CONbits_t;
extern volatile PWM1CONbits_t PWM1CONbits __attribute__((address(0xFB7)));
# 12285 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned P1DC :7;
        unsigned P1RSEN :1;
    };
    struct {
        unsigned P1DC0 :1;
        unsigned P1DC1 :1;
        unsigned P1DC2 :1;
        unsigned P1DC3 :1;
        unsigned P1DC4 :1;
        unsigned P1DC5 :1;
        unsigned P1DC6 :1;
    };
    struct {
        unsigned PDC :7;
        unsigned PRSEN :1;
    };
    struct {
        unsigned PDC0 :1;
        unsigned PDC1 :1;
        unsigned PDC2 :1;
        unsigned PDC3 :1;
        unsigned PDC4 :1;
        unsigned PDC5 :1;
        unsigned PDC6 :1;
    };
} PWMCONbits_t;
extern volatile PWMCONbits_t PWMCONbits __attribute__((address(0xFB7)));
# 12408 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char BAUDCON1 __attribute__((address(0xFB8)));

__asm("BAUDCON1 equ 0FB8h");


extern volatile unsigned char BAUDCON __attribute__((address(0xFB8)));

__asm("BAUDCON equ 0FB8h");

extern volatile unsigned char BAUDCTL __attribute__((address(0xFB8)));

__asm("BAUDCTL equ 0FB8h");

extern volatile unsigned char BAUD1CON __attribute__((address(0xFB8)));

__asm("BAUD1CON equ 0FB8h");


typedef union {
    struct {
        unsigned ABDEN :1;
        unsigned WUE :1;
        unsigned :1;
        unsigned BRG16 :1;
        unsigned CKTXP :1;
        unsigned DTRXP :1;
        unsigned RCIDL :1;
        unsigned ABDOVF :1;
    };
    struct {
        unsigned :4;
        unsigned SCKP :1;
    };
    struct {
        unsigned ABDEN1 :1;
        unsigned WUE1 :1;
        unsigned :1;
        unsigned BRG161 :1;
        unsigned SCKP1 :1;
        unsigned DTRXP1 :1;
        unsigned RCIDL1 :1;
        unsigned ABDOVF1 :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP :1;
        unsigned RXDTP :1;
        unsigned RCMT :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP1 :1;
        unsigned RXDTP1 :1;
        unsigned RCMT1 :1;
    };
    struct {
        unsigned :5;
        unsigned RXCKP :1;
    };
    struct {
        unsigned :1;
        unsigned W4E :1;
    };
} BAUDCON1bits_t;
extern volatile BAUDCON1bits_t BAUDCON1bits __attribute__((address(0xFB8)));
# 12590 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned ABDEN :1;
        unsigned WUE :1;
        unsigned :1;
        unsigned BRG16 :1;
        unsigned CKTXP :1;
        unsigned DTRXP :1;
        unsigned RCIDL :1;
        unsigned ABDOVF :1;
    };
    struct {
        unsigned :4;
        unsigned SCKP :1;
    };
    struct {
        unsigned ABDEN1 :1;
        unsigned WUE1 :1;
        unsigned :1;
        unsigned BRG161 :1;
        unsigned SCKP1 :1;
        unsigned DTRXP1 :1;
        unsigned RCIDL1 :1;
        unsigned ABDOVF1 :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP :1;
        unsigned RXDTP :1;
        unsigned RCMT :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP1 :1;
        unsigned RXDTP1 :1;
        unsigned RCMT1 :1;
    };
    struct {
        unsigned :5;
        unsigned RXCKP :1;
    };
    struct {
        unsigned :1;
        unsigned W4E :1;
    };
} BAUDCONbits_t;
extern volatile BAUDCONbits_t BAUDCONbits __attribute__((address(0xFB8)));
# 12753 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned ABDEN :1;
        unsigned WUE :1;
        unsigned :1;
        unsigned BRG16 :1;
        unsigned CKTXP :1;
        unsigned DTRXP :1;
        unsigned RCIDL :1;
        unsigned ABDOVF :1;
    };
    struct {
        unsigned :4;
        unsigned SCKP :1;
    };
    struct {
        unsigned ABDEN1 :1;
        unsigned WUE1 :1;
        unsigned :1;
        unsigned BRG161 :1;
        unsigned SCKP1 :1;
        unsigned DTRXP1 :1;
        unsigned RCIDL1 :1;
        unsigned ABDOVF1 :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP :1;
        unsigned RXDTP :1;
        unsigned RCMT :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP1 :1;
        unsigned RXDTP1 :1;
        unsigned RCMT1 :1;
    };
    struct {
        unsigned :5;
        unsigned RXCKP :1;
    };
    struct {
        unsigned :1;
        unsigned W4E :1;
    };
} BAUDCTLbits_t;
extern volatile BAUDCTLbits_t BAUDCTLbits __attribute__((address(0xFB8)));
# 12916 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned ABDEN :1;
        unsigned WUE :1;
        unsigned :1;
        unsigned BRG16 :1;
        unsigned CKTXP :1;
        unsigned DTRXP :1;
        unsigned RCIDL :1;
        unsigned ABDOVF :1;
    };
    struct {
        unsigned :4;
        unsigned SCKP :1;
    };
    struct {
        unsigned ABDEN1 :1;
        unsigned WUE1 :1;
        unsigned :1;
        unsigned BRG161 :1;
        unsigned SCKP1 :1;
        unsigned DTRXP1 :1;
        unsigned RCIDL1 :1;
        unsigned ABDOVF1 :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP :1;
        unsigned RXDTP :1;
        unsigned RCMT :1;
    };
    struct {
        unsigned :4;
        unsigned TXCKP1 :1;
        unsigned RXDTP1 :1;
        unsigned RCMT1 :1;
    };
    struct {
        unsigned :5;
        unsigned RXCKP :1;
    };
    struct {
        unsigned :1;
        unsigned W4E :1;
    };
} BAUD1CONbits_t;
extern volatile BAUD1CONbits_t BAUD1CONbits __attribute__((address(0xFB8)));
# 13082 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PSTR1CON __attribute__((address(0xFB9)));

__asm("PSTR1CON equ 0FB9h");


extern volatile unsigned char PSTRCON __attribute__((address(0xFB9)));

__asm("PSTRCON equ 0FB9h");


typedef union {
    struct {
        unsigned STR1A :1;
        unsigned STR1B :1;
        unsigned STR1C :1;
        unsigned STR1D :1;
        unsigned STR1SYNC :1;
    };
    struct {
        unsigned STRA :1;
        unsigned STRB :1;
        unsigned STRC :1;
        unsigned STRD :1;
        unsigned STRSYNC :1;
    };
} PSTR1CONbits_t;
extern volatile PSTR1CONbits_t PSTR1CONbits __attribute__((address(0xFB9)));
# 13161 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned STR1A :1;
        unsigned STR1B :1;
        unsigned STR1C :1;
        unsigned STR1D :1;
        unsigned STR1SYNC :1;
    };
    struct {
        unsigned STRA :1;
        unsigned STRB :1;
        unsigned STRC :1;
        unsigned STRD :1;
        unsigned STRSYNC :1;
    };
} PSTRCONbits_t;
extern volatile PSTRCONbits_t PSTRCONbits __attribute__((address(0xFB9)));
# 13232 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T2CON __attribute__((address(0xFBA)));

__asm("T2CON equ 0FBAh");


typedef union {
    struct {
        unsigned T2CKPS :2;
        unsigned TMR2ON :1;
        unsigned T2OUTPS :4;
    };
    struct {
        unsigned T2CKPS0 :1;
        unsigned T2CKPS1 :1;
        unsigned :1;
        unsigned T2OUTPS0 :1;
        unsigned T2OUTPS1 :1;
        unsigned T2OUTPS2 :1;
        unsigned T2OUTPS3 :1;
    };
} T2CONbits_t;
extern volatile T2CONbits_t T2CONbits __attribute__((address(0xFBA)));
# 13303 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PR2 __attribute__((address(0xFBB)));

__asm("PR2 equ 0FBBh");


typedef union {
    struct {
        unsigned PR2 :8;
    };
} PR2bits_t;
extern volatile PR2bits_t PR2bits __attribute__((address(0xFBB)));
# 13323 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TMR2 __attribute__((address(0xFBC)));

__asm("TMR2 equ 0FBCh");


typedef union {
    struct {
        unsigned TMR2 :8;
    };
} TMR2bits_t;
extern volatile TMR2bits_t TMR2bits __attribute__((address(0xFBC)));
# 13343 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCP1CON __attribute__((address(0xFBD)));

__asm("CCP1CON equ 0FBDh");


typedef union {
    struct {
        unsigned CCP1M :4;
        unsigned DC1B :2;
        unsigned P1M :2;
    };
    struct {
        unsigned CCP1M0 :1;
        unsigned CCP1M1 :1;
        unsigned CCP1M2 :1;
        unsigned CCP1M3 :1;
        unsigned DC1B0 :1;
        unsigned DC1B1 :1;
        unsigned P1M0 :1;
        unsigned P1M1 :1;
    };
} CCP1CONbits_t;
extern volatile CCP1CONbits_t CCP1CONbits __attribute__((address(0xFBD)));
# 13425 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short CCPR1 __attribute__((address(0xFBE)));

__asm("CCPR1 equ 0FBEh");




extern volatile unsigned char CCPR1L __attribute__((address(0xFBE)));

__asm("CCPR1L equ 0FBEh");


typedef union {
    struct {
        unsigned CCPR1L :8;
    };
} CCPR1Lbits_t;
extern volatile CCPR1Lbits_t CCPR1Lbits __attribute__((address(0xFBE)));
# 13452 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char CCPR1H __attribute__((address(0xFBF)));

__asm("CCPR1H equ 0FBFh");


typedef union {
    struct {
        unsigned CCPR1H :8;
    };
} CCPR1Hbits_t;
extern volatile CCPR1Hbits_t CCPR1Hbits __attribute__((address(0xFBF)));
# 13472 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ADCON2 __attribute__((address(0xFC0)));

__asm("ADCON2 equ 0FC0h");


typedef union {
    struct {
        unsigned ADCS :3;
        unsigned ACQT :3;
        unsigned :1;
        unsigned ADFM :1;
    };
    struct {
        unsigned ADCS0 :1;
        unsigned ADCS1 :1;
        unsigned ADCS2 :1;
        unsigned ACQT0 :1;
        unsigned ACQT1 :1;
        unsigned ACQT2 :1;
    };
} ADCON2bits_t;
extern volatile ADCON2bits_t ADCON2bits __attribute__((address(0xFC0)));
# 13543 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ADCON1 __attribute__((address(0xFC1)));

__asm("ADCON1 equ 0FC1h");


typedef union {
    struct {
        unsigned NVCFG :2;
        unsigned PVCFG :2;
        unsigned :3;
        unsigned TRIGSEL :1;
    };
    struct {
        unsigned NVCFG0 :1;
        unsigned NVCFG1 :1;
        unsigned PVCFG0 :1;
        unsigned PVCFG1 :1;
    };
    struct {
        unsigned :3;
        unsigned CHSN3 :1;
    };
} ADCON1bits_t;
extern volatile ADCON1bits_t ADCON1bits __attribute__((address(0xFC1)));
# 13611 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ADCON0 __attribute__((address(0xFC2)));

__asm("ADCON0 equ 0FC2h");


typedef union {
    struct {
        unsigned :1;
        unsigned GO_NOT_DONE :1;
    };
    struct {
        unsigned ADON :1;
        unsigned GO_nDONE :1;
        unsigned CHS :5;
    };
    struct {
        unsigned :1;
        unsigned GO :1;
        unsigned CHS0 :1;
        unsigned CHS1 :1;
        unsigned CHS2 :1;
        unsigned CHS3 :1;
        unsigned CHS4 :1;
    };
    struct {
        unsigned :1;
        unsigned DONE :1;
    };
    struct {
        unsigned :1;
        unsigned NOT_DONE :1;
    };
    struct {
        unsigned :1;
        unsigned nDONE :1;
    };
    struct {
        unsigned :1;
        unsigned GO_DONE :1;
    };
    struct {
        unsigned :1;
        unsigned GODONE :1;
    };
} ADCON0bits_t;
extern volatile ADCON0bits_t ADCON0bits __attribute__((address(0xFC2)));
# 13736 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short ADRES __attribute__((address(0xFC3)));

__asm("ADRES equ 0FC3h");




extern volatile unsigned char ADRESL __attribute__((address(0xFC3)));

__asm("ADRESL equ 0FC3h");


typedef union {
    struct {
        unsigned ADRESL :8;
    };
} ADRESLbits_t;
extern volatile ADRESLbits_t ADRESLbits __attribute__((address(0xFC3)));
# 13763 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char ADRESH __attribute__((address(0xFC4)));

__asm("ADRESH equ 0FC4h");


typedef union {
    struct {
        unsigned ADRESH :8;
    };
} ADRESHbits_t;
extern volatile ADRESHbits_t ADRESHbits __attribute__((address(0xFC4)));
# 13783 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP1CON2 __attribute__((address(0xFC5)));

__asm("SSP1CON2 equ 0FC5h");


extern volatile unsigned char SSPCON2 __attribute__((address(0xFC5)));

__asm("SSPCON2 equ 0FC5h");


typedef union {
    struct {
        unsigned SEN :1;
        unsigned RSEN :1;
        unsigned PEN :1;
        unsigned RCEN :1;
        unsigned ACKEN :1;
        unsigned ACKDT :1;
        unsigned ACKSTAT :1;
        unsigned GCEN :1;
    };
    struct {
        unsigned SEN1 :1;
        unsigned ADMSK1 :1;
        unsigned ADMSK2 :1;
        unsigned ADMSK3 :1;
        unsigned ACKEN1 :1;
        unsigned ACKDT1 :1;
        unsigned ACKSTAT1 :1;
        unsigned GCEN1 :1;
    };
    struct {
        unsigned :1;
        unsigned ADMSK11 :1;
        unsigned ADMSK21 :1;
        unsigned ADMSK31 :1;
        unsigned ADMSK4 :1;
        unsigned ADMSK5 :1;
    };
    struct {
        unsigned :1;
        unsigned RSEN1 :1;
        unsigned PEN1 :1;
        unsigned RCEN1 :1;
        unsigned ADMSK41 :1;
        unsigned ADMSK51 :1;
    };
} SSP1CON2bits_t;
extern volatile SSP1CON2bits_t SSP1CON2bits __attribute__((address(0xFC5)));
# 13964 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned SEN :1;
        unsigned RSEN :1;
        unsigned PEN :1;
        unsigned RCEN :1;
        unsigned ACKEN :1;
        unsigned ACKDT :1;
        unsigned ACKSTAT :1;
        unsigned GCEN :1;
    };
    struct {
        unsigned SEN1 :1;
        unsigned ADMSK1 :1;
        unsigned ADMSK2 :1;
        unsigned ADMSK3 :1;
        unsigned ACKEN1 :1;
        unsigned ACKDT1 :1;
        unsigned ACKSTAT1 :1;
        unsigned GCEN1 :1;
    };
    struct {
        unsigned :1;
        unsigned ADMSK11 :1;
        unsigned ADMSK21 :1;
        unsigned ADMSK31 :1;
        unsigned ADMSK4 :1;
        unsigned ADMSK5 :1;
    };
    struct {
        unsigned :1;
        unsigned RSEN1 :1;
        unsigned PEN1 :1;
        unsigned RCEN1 :1;
        unsigned ADMSK41 :1;
        unsigned ADMSK51 :1;
    };
} SSPCON2bits_t;
extern volatile SSPCON2bits_t SSPCON2bits __attribute__((address(0xFC5)));
# 14137 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP1CON1 __attribute__((address(0xFC6)));

__asm("SSP1CON1 equ 0FC6h");


extern volatile unsigned char SSPCON1 __attribute__((address(0xFC6)));

__asm("SSPCON1 equ 0FC6h");


typedef union {
    struct {
        unsigned SSPM :4;
        unsigned CKP :1;
        unsigned SSPEN :1;
        unsigned SSPOV :1;
        unsigned WCOL :1;
    };
    struct {
        unsigned SSPM0 :1;
        unsigned SSPM1 :1;
        unsigned SSPM2 :1;
        unsigned SSPM3 :1;
    };
    struct {
        unsigned SSPM01 :1;
        unsigned SSPM11 :1;
        unsigned SSPM21 :1;
        unsigned SSPM31 :1;
        unsigned CKP1 :1;
        unsigned SSPEN1 :1;
        unsigned SSPOV1 :1;
        unsigned WCOL1 :1;
    };
} SSP1CON1bits_t;
extern volatile SSP1CON1bits_t SSP1CON1bits __attribute__((address(0xFC6)));
# 14260 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned SSPM :4;
        unsigned CKP :1;
        unsigned SSPEN :1;
        unsigned SSPOV :1;
        unsigned WCOL :1;
    };
    struct {
        unsigned SSPM0 :1;
        unsigned SSPM1 :1;
        unsigned SSPM2 :1;
        unsigned SSPM3 :1;
    };
    struct {
        unsigned SSPM01 :1;
        unsigned SSPM11 :1;
        unsigned SSPM21 :1;
        unsigned SSPM31 :1;
        unsigned CKP1 :1;
        unsigned SSPEN1 :1;
        unsigned SSPOV1 :1;
        unsigned WCOL1 :1;
    };
} SSPCON1bits_t;
extern volatile SSPCON1bits_t SSPCON1bits __attribute__((address(0xFC6)));
# 14375 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP1STAT __attribute__((address(0xFC7)));

__asm("SSP1STAT equ 0FC7h");


extern volatile unsigned char SSPSTAT __attribute__((address(0xFC7)));

__asm("SSPSTAT equ 0FC7h");


typedef union {
    struct {
        unsigned :2;
        unsigned R_NOT_W :1;
    };
    struct {
        unsigned :5;
        unsigned D_NOT_A :1;
    };
    struct {
        unsigned BF :1;
        unsigned UA :1;
        unsigned R_nW :1;
        unsigned S :1;
        unsigned P :1;
        unsigned D_nA :1;
        unsigned CKE :1;
        unsigned SMP :1;
    };
    struct {
        unsigned :2;
        unsigned R :1;
        unsigned :2;
        unsigned D :1;
    };
    struct {
        unsigned :2;
        unsigned W :1;
        unsigned :2;
        unsigned A :1;
    };
    struct {
        unsigned :2;
        unsigned nW :1;
        unsigned :2;
        unsigned nA :1;
    };
    struct {
        unsigned :2;
        unsigned R_W :1;
        unsigned :2;
        unsigned D_A :1;
    };
    struct {
        unsigned :2;
        unsigned NOT_WRITE :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_ADDRESS :1;
    };
    struct {
        unsigned :2;
        unsigned nWRITE :1;
        unsigned :2;
        unsigned nADDRESS :1;
    };
    struct {
        unsigned BF1 :1;
        unsigned UA1 :1;
        unsigned I2C_READ :1;
        unsigned I2C_START :1;
        unsigned I2C_STOP :1;
        unsigned DA :1;
        unsigned CKE1 :1;
        unsigned SMP1 :1;
    };
    struct {
        unsigned :2;
        unsigned READ_WRITE :1;
        unsigned START :1;
        unsigned STOP :1;
        unsigned DA1 :1;
    };
    struct {
        unsigned :2;
        unsigned RW :1;
        unsigned START1 :1;
        unsigned STOP1 :1;
        unsigned DATA_ADDRESS :1;
    };
    struct {
        unsigned :2;
        unsigned RW1 :1;
        unsigned :2;
        unsigned I2C_DAT :1;
    };
    struct {
        unsigned :2;
        unsigned NOT_W :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_A :1;
    };
} SSP1STATbits_t;
extern volatile SSP1STATbits_t SSP1STATbits __attribute__((address(0xFC7)));
# 14694 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned :2;
        unsigned R_NOT_W :1;
    };
    struct {
        unsigned :5;
        unsigned D_NOT_A :1;
    };
    struct {
        unsigned BF :1;
        unsigned UA :1;
        unsigned R_nW :1;
        unsigned S :1;
        unsigned P :1;
        unsigned D_nA :1;
        unsigned CKE :1;
        unsigned SMP :1;
    };
    struct {
        unsigned :2;
        unsigned R :1;
        unsigned :2;
        unsigned D :1;
    };
    struct {
        unsigned :2;
        unsigned W :1;
        unsigned :2;
        unsigned A :1;
    };
    struct {
        unsigned :2;
        unsigned nW :1;
        unsigned :2;
        unsigned nA :1;
    };
    struct {
        unsigned :2;
        unsigned R_W :1;
        unsigned :2;
        unsigned D_A :1;
    };
    struct {
        unsigned :2;
        unsigned NOT_WRITE :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_ADDRESS :1;
    };
    struct {
        unsigned :2;
        unsigned nWRITE :1;
        unsigned :2;
        unsigned nADDRESS :1;
    };
    struct {
        unsigned BF1 :1;
        unsigned UA1 :1;
        unsigned I2C_READ :1;
        unsigned I2C_START :1;
        unsigned I2C_STOP :1;
        unsigned DA :1;
        unsigned CKE1 :1;
        unsigned SMP1 :1;
    };
    struct {
        unsigned :2;
        unsigned READ_WRITE :1;
        unsigned START :1;
        unsigned STOP :1;
        unsigned DA1 :1;
    };
    struct {
        unsigned :2;
        unsigned RW :1;
        unsigned START1 :1;
        unsigned STOP1 :1;
        unsigned DATA_ADDRESS :1;
    };
    struct {
        unsigned :2;
        unsigned RW1 :1;
        unsigned :2;
        unsigned I2C_DAT :1;
    };
    struct {
        unsigned :2;
        unsigned NOT_W :1;
    };
    struct {
        unsigned :5;
        unsigned NOT_A :1;
    };
} SSPSTATbits_t;
extern volatile SSPSTATbits_t SSPSTATbits __attribute__((address(0xFC7)));
# 15005 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP1ADD __attribute__((address(0xFC8)));

__asm("SSP1ADD equ 0FC8h");


extern volatile unsigned char SSPADD __attribute__((address(0xFC8)));

__asm("SSPADD equ 0FC8h");


typedef union {
    struct {
        unsigned SSPADD :8;
    };
    struct {
        unsigned SSP1ADD :8;
    };
    struct {
        unsigned MSK0 :1;
        unsigned MSK1 :1;
        unsigned MSK2 :1;
        unsigned MSK3 :1;
        unsigned MSK4 :1;
        unsigned MSK5 :1;
        unsigned MSK6 :1;
        unsigned MSK7 :1;
    };
    struct {
        unsigned MSK01 :1;
        unsigned MSK11 :1;
        unsigned MSK21 :1;
        unsigned MSK31 :1;
        unsigned MSK41 :1;
        unsigned MSK51 :1;
        unsigned MSK61 :1;
        unsigned MSK71 :1;
    };
} SSP1ADDbits_t;
extern volatile SSP1ADDbits_t SSP1ADDbits __attribute__((address(0xFC8)));
# 15136 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned SSPADD :8;
    };
    struct {
        unsigned SSP1ADD :8;
    };
    struct {
        unsigned MSK0 :1;
        unsigned MSK1 :1;
        unsigned MSK2 :1;
        unsigned MSK3 :1;
        unsigned MSK4 :1;
        unsigned MSK5 :1;
        unsigned MSK6 :1;
        unsigned MSK7 :1;
    };
    struct {
        unsigned MSK01 :1;
        unsigned MSK11 :1;
        unsigned MSK21 :1;
        unsigned MSK31 :1;
        unsigned MSK41 :1;
        unsigned MSK51 :1;
        unsigned MSK61 :1;
        unsigned MSK71 :1;
    };
} SSPADDbits_t;
extern volatile SSPADDbits_t SSPADDbits __attribute__((address(0xFC8)));
# 15259 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP1BUF __attribute__((address(0xFC9)));

__asm("SSP1BUF equ 0FC9h");


extern volatile unsigned char SSPBUF __attribute__((address(0xFC9)));

__asm("SSPBUF equ 0FC9h");


typedef union {
    struct {
        unsigned SSPBUF :8;
    };
    struct {
        unsigned SSP1BUF :8;
    };
} SSP1BUFbits_t;
extern volatile SSP1BUFbits_t SSP1BUFbits __attribute__((address(0xFC9)));
# 15290 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned SSPBUF :8;
    };
    struct {
        unsigned SSP1BUF :8;
    };
} SSPBUFbits_t;
extern volatile SSPBUFbits_t SSPBUFbits __attribute__((address(0xFC9)));
# 15313 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP1MSK __attribute__((address(0xFCA)));

__asm("SSP1MSK equ 0FCAh");


extern volatile unsigned char SSPMSK __attribute__((address(0xFCA)));

__asm("SSPMSK equ 0FCAh");


typedef union {
    struct {
        unsigned MSK0 :1;
        unsigned MSK1 :1;
        unsigned MSK2 :1;
        unsigned MSK3 :1;
        unsigned MSK4 :1;
        unsigned MSK5 :1;
        unsigned MSK6 :1;
        unsigned MSK7 :1;
    };
    struct {
        unsigned MSK :8;
    };
} SSP1MSKbits_t;
extern volatile SSP1MSKbits_t SSP1MSKbits __attribute__((address(0xFCA)));
# 15386 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned MSK0 :1;
        unsigned MSK1 :1;
        unsigned MSK2 :1;
        unsigned MSK3 :1;
        unsigned MSK4 :1;
        unsigned MSK5 :1;
        unsigned MSK6 :1;
        unsigned MSK7 :1;
    };
    struct {
        unsigned MSK :8;
    };
} SSPMSKbits_t;
extern volatile SSPMSKbits_t SSPMSKbits __attribute__((address(0xFCA)));
# 15451 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char SSP1CON3 __attribute__((address(0xFCB)));

__asm("SSP1CON3 equ 0FCBh");


extern volatile unsigned char SSPCON3 __attribute__((address(0xFCB)));

__asm("SSPCON3 equ 0FCBh");


typedef union {
    struct {
        unsigned DHEN :1;
        unsigned AHEN :1;
        unsigned SBCDE :1;
        unsigned SDAHT :1;
        unsigned BOEN :1;
        unsigned SCIE :1;
        unsigned PCIE :1;
        unsigned ACKTIM :1;
    };
} SSP1CON3bits_t;
extern volatile SSP1CON3bits_t SSP1CON3bits __attribute__((address(0xFCB)));
# 15516 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
typedef union {
    struct {
        unsigned DHEN :1;
        unsigned AHEN :1;
        unsigned SBCDE :1;
        unsigned SDAHT :1;
        unsigned BOEN :1;
        unsigned SCIE :1;
        unsigned PCIE :1;
        unsigned ACKTIM :1;
    };
} SSPCON3bits_t;
extern volatile SSPCON3bits_t SSPCON3bits __attribute__((address(0xFCB)));
# 15573 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T1GCON __attribute__((address(0xFCC)));

__asm("T1GCON equ 0FCCh");


typedef union {
    struct {
        unsigned :3;
        unsigned T1GGO_NOT_DONE :1;
    };
    struct {
        unsigned T1GSS :2;
        unsigned T1GVAL :1;
        unsigned T1GGO_nDONE :1;
        unsigned T1GSPM :1;
        unsigned T1GTM :1;
        unsigned T1GPOL :1;
        unsigned TMR1GE :1;
    };
    struct {
        unsigned T1GSS0 :1;
        unsigned T1GSS1 :1;
        unsigned :1;
        unsigned T1G_DONE :1;
    };
    struct {
        unsigned :3;
        unsigned T1GGO :1;
    };
} T1GCONbits_t;
extern volatile T1GCONbits_t T1GCONbits __attribute__((address(0xFCC)));
# 15668 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T1CON __attribute__((address(0xFCD)));

__asm("T1CON equ 0FCDh");


typedef union {
    struct {
        unsigned :2;
        unsigned NOT_T1SYNC :1;
    };
    struct {
        unsigned TMR1ON :1;
        unsigned T1RD16 :1;
        unsigned nT1SYNC :1;
        unsigned T1SOSCEN :1;
        unsigned T1CKPS :2;
        unsigned TMR1CS :2;
    };
    struct {
        unsigned :1;
        unsigned RD16 :1;
        unsigned T1SYNC :1;
        unsigned T1OSCEN :1;
        unsigned T1CKPS0 :1;
        unsigned T1CKPS1 :1;
        unsigned TMR1CS0 :1;
        unsigned TMR1CS1 :1;
    };
    struct {
        unsigned :3;
        unsigned SOSCEN :1;
    };
} T1CONbits_t;
extern volatile T1CONbits_t T1CONbits __attribute__((address(0xFCD)));
# 15781 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short TMR1 __attribute__((address(0xFCE)));

__asm("TMR1 equ 0FCEh");




extern volatile unsigned char TMR1L __attribute__((address(0xFCE)));

__asm("TMR1L equ 0FCEh");


typedef union {
    struct {
        unsigned TMR1L :8;
    };
} TMR1Lbits_t;
extern volatile TMR1Lbits_t TMR1Lbits __attribute__((address(0xFCE)));
# 15808 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TMR1H __attribute__((address(0xFCF)));

__asm("TMR1H equ 0FCFh");


typedef union {
    struct {
        unsigned TMR1H :8;
    };
} TMR1Hbits_t;
extern volatile TMR1Hbits_t TMR1Hbits __attribute__((address(0xFCF)));
# 15828 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char RCON __attribute__((address(0xFD0)));

__asm("RCON equ 0FD0h");


typedef union {
    struct {
        unsigned NOT_BOR :1;
    };
    struct {
        unsigned :1;
        unsigned NOT_POR :1;
    };
    struct {
        unsigned :2;
        unsigned NOT_PD :1;
    };
    struct {
        unsigned :3;
        unsigned NOT_TO :1;
    };
    struct {
        unsigned :4;
        unsigned NOT_RI :1;
    };
    struct {
        unsigned nBOR :1;
        unsigned nPOR :1;
        unsigned nPD :1;
        unsigned nTO :1;
        unsigned nRI :1;
        unsigned :1;
        unsigned SBOREN :1;
        unsigned IPEN :1;
    };
    struct {
        unsigned BOR :1;
        unsigned POR :1;
        unsigned PD :1;
        unsigned TO :1;
        unsigned RI :1;
    };
} RCONbits_t;
extern volatile RCONbits_t RCONbits __attribute__((address(0xFD0)));
# 15961 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char WDTCON __attribute__((address(0xFD1)));

__asm("WDTCON equ 0FD1h");


typedef union {
    struct {
        unsigned SWDTEN :1;
    };
    struct {
        unsigned SWDTE :1;
    };
} WDTCONbits_t;
extern volatile WDTCONbits_t WDTCONbits __attribute__((address(0xFD1)));
# 15989 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char OSCCON2 __attribute__((address(0xFD2)));

__asm("OSCCON2 equ 0FD2h");


typedef union {
    struct {
        unsigned LFIOFS :1;
        unsigned MFIOFS :1;
        unsigned PRISD :1;
        unsigned SOSCGO :1;
        unsigned MFIOSEL :1;
        unsigned :1;
        unsigned SOSCRUN :1;
        unsigned PLLRDY :1;
    };
} OSCCON2bits_t;
extern volatile OSCCON2bits_t OSCCON2bits __attribute__((address(0xFD2)));
# 16046 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char OSCCON __attribute__((address(0xFD3)));

__asm("OSCCON equ 0FD3h");


typedef union {
    struct {
        unsigned SCS :2;
        unsigned HFIOFS :1;
        unsigned OSTS :1;
        unsigned IRCF :3;
        unsigned IDLEN :1;
    };
    struct {
        unsigned SCS0 :1;
        unsigned SCS1 :1;
        unsigned IOFS :1;
        unsigned :1;
        unsigned IRCF0 :1;
        unsigned IRCF1 :1;
        unsigned IRCF2 :1;
    };
} OSCCONbits_t;
extern volatile OSCCONbits_t OSCCONbits __attribute__((address(0xFD3)));
# 16129 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char T0CON __attribute__((address(0xFD5)));

__asm("T0CON equ 0FD5h");


typedef union {
    struct {
        unsigned T0PS :3;
        unsigned PSA :1;
        unsigned T0SE :1;
        unsigned T0CS :1;
        unsigned T08BIT :1;
        unsigned TMR0ON :1;
    };
    struct {
        unsigned T0PS0 :1;
        unsigned T0PS1 :1;
        unsigned T0PS2 :1;
    };
} T0CONbits_t;
extern volatile T0CONbits_t T0CONbits __attribute__((address(0xFD5)));
# 16199 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short TMR0 __attribute__((address(0xFD6)));

__asm("TMR0 equ 0FD6h");




extern volatile unsigned char TMR0L __attribute__((address(0xFD6)));

__asm("TMR0L equ 0FD6h");


typedef union {
    struct {
        unsigned TMR0L :8;
    };
} TMR0Lbits_t;
extern volatile TMR0Lbits_t TMR0Lbits __attribute__((address(0xFD6)));
# 16226 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TMR0H __attribute__((address(0xFD7)));

__asm("TMR0H equ 0FD7h");


typedef union {
    struct {
        unsigned TMR0H :8;
    };
} TMR0Hbits_t;
extern volatile TMR0Hbits_t TMR0Hbits __attribute__((address(0xFD7)));
# 16246 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char STATUS __attribute__((address(0xFD8)));

__asm("STATUS equ 0FD8h");


typedef union {
    struct {
        unsigned C :1;
        unsigned DC :1;
        unsigned Z :1;
        unsigned OV :1;
        unsigned N :1;
    };
    struct {
        unsigned CARRY :1;
        unsigned :1;
        unsigned ZERO :1;
        unsigned OVERFLOW :1;
        unsigned NEGATIVE :1;
    };
} STATUSbits_t;
extern volatile STATUSbits_t STATUSbits __attribute__((address(0xFD8)));
# 16317 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short FSR2 __attribute__((address(0xFD9)));

__asm("FSR2 equ 0FD9h");




extern volatile unsigned char FSR2L __attribute__((address(0xFD9)));

__asm("FSR2L equ 0FD9h");


typedef union {
    struct {
        unsigned FSR2L :8;
    };
} FSR2Lbits_t;
extern volatile FSR2Lbits_t FSR2Lbits __attribute__((address(0xFD9)));
# 16344 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char FSR2H __attribute__((address(0xFDA)));

__asm("FSR2H equ 0FDAh");




extern volatile unsigned char PLUSW2 __attribute__((address(0xFDB)));

__asm("PLUSW2 equ 0FDBh");


typedef union {
    struct {
        unsigned PLUSW2 :8;
    };
} PLUSW2bits_t;
extern volatile PLUSW2bits_t PLUSW2bits __attribute__((address(0xFDB)));
# 16371 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PREINC2 __attribute__((address(0xFDC)));

__asm("PREINC2 equ 0FDCh");


typedef union {
    struct {
        unsigned PREINC2 :8;
    };
} PREINC2bits_t;
extern volatile PREINC2bits_t PREINC2bits __attribute__((address(0xFDC)));
# 16391 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char POSTDEC2 __attribute__((address(0xFDD)));

__asm("POSTDEC2 equ 0FDDh");


typedef union {
    struct {
        unsigned POSTDEC2 :8;
    };
} POSTDEC2bits_t;
extern volatile POSTDEC2bits_t POSTDEC2bits __attribute__((address(0xFDD)));
# 16411 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char POSTINC2 __attribute__((address(0xFDE)));

__asm("POSTINC2 equ 0FDEh");


typedef union {
    struct {
        unsigned POSTINC2 :8;
    };
} POSTINC2bits_t;
extern volatile POSTINC2bits_t POSTINC2bits __attribute__((address(0xFDE)));
# 16431 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char INDF2 __attribute__((address(0xFDF)));

__asm("INDF2 equ 0FDFh");


typedef union {
    struct {
        unsigned INDF2 :8;
    };
} INDF2bits_t;
extern volatile INDF2bits_t INDF2bits __attribute__((address(0xFDF)));
# 16451 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char BSR __attribute__((address(0xFE0)));

__asm("BSR equ 0FE0h");




extern volatile unsigned short FSR1 __attribute__((address(0xFE1)));

__asm("FSR1 equ 0FE1h");




extern volatile unsigned char FSR1L __attribute__((address(0xFE1)));

__asm("FSR1L equ 0FE1h");


typedef union {
    struct {
        unsigned FSR1L :8;
    };
} FSR1Lbits_t;
extern volatile FSR1Lbits_t FSR1Lbits __attribute__((address(0xFE1)));
# 16485 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char FSR1H __attribute__((address(0xFE2)));

__asm("FSR1H equ 0FE2h");




extern volatile unsigned char PLUSW1 __attribute__((address(0xFE3)));

__asm("PLUSW1 equ 0FE3h");


typedef union {
    struct {
        unsigned PLUSW1 :8;
    };
} PLUSW1bits_t;
extern volatile PLUSW1bits_t PLUSW1bits __attribute__((address(0xFE3)));
# 16512 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PREINC1 __attribute__((address(0xFE4)));

__asm("PREINC1 equ 0FE4h");


typedef union {
    struct {
        unsigned PREINC1 :8;
    };
} PREINC1bits_t;
extern volatile PREINC1bits_t PREINC1bits __attribute__((address(0xFE4)));
# 16532 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char POSTDEC1 __attribute__((address(0xFE5)));

__asm("POSTDEC1 equ 0FE5h");


typedef union {
    struct {
        unsigned POSTDEC1 :8;
    };
} POSTDEC1bits_t;
extern volatile POSTDEC1bits_t POSTDEC1bits __attribute__((address(0xFE5)));
# 16552 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char POSTINC1 __attribute__((address(0xFE6)));

__asm("POSTINC1 equ 0FE6h");


typedef union {
    struct {
        unsigned POSTINC1 :8;
    };
} POSTINC1bits_t;
extern volatile POSTINC1bits_t POSTINC1bits __attribute__((address(0xFE6)));
# 16572 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char INDF1 __attribute__((address(0xFE7)));

__asm("INDF1 equ 0FE7h");


typedef union {
    struct {
        unsigned INDF1 :8;
    };
} INDF1bits_t;
extern volatile INDF1bits_t INDF1bits __attribute__((address(0xFE7)));
# 16592 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char WREG __attribute__((address(0xFE8)));

__asm("WREG equ 0FE8h");







typedef union {
    struct {
        unsigned WREG :8;
    };
} WREGbits_t;
extern volatile WREGbits_t WREGbits __attribute__((address(0xFE8)));







typedef union {
    struct {
        unsigned WREG :8;
    };
} Wbits_t;
extern volatile Wbits_t Wbits __attribute__((address(0xFE8)));
# 16630 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short FSR0 __attribute__((address(0xFE9)));

__asm("FSR0 equ 0FE9h");




extern volatile unsigned char FSR0L __attribute__((address(0xFE9)));

__asm("FSR0L equ 0FE9h");


typedef union {
    struct {
        unsigned FSR0L :8;
    };
} FSR0Lbits_t;
extern volatile FSR0Lbits_t FSR0Lbits __attribute__((address(0xFE9)));
# 16657 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char FSR0H __attribute__((address(0xFEA)));

__asm("FSR0H equ 0FEAh");




extern volatile unsigned char PLUSW0 __attribute__((address(0xFEB)));

__asm("PLUSW0 equ 0FEBh");


typedef union {
    struct {
        unsigned PLUSW0 :8;
    };
} PLUSW0bits_t;
extern volatile PLUSW0bits_t PLUSW0bits __attribute__((address(0xFEB)));
# 16684 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PREINC0 __attribute__((address(0xFEC)));

__asm("PREINC0 equ 0FECh");


typedef union {
    struct {
        unsigned PREINC0 :8;
    };
} PREINC0bits_t;
extern volatile PREINC0bits_t PREINC0bits __attribute__((address(0xFEC)));
# 16704 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char POSTDEC0 __attribute__((address(0xFED)));

__asm("POSTDEC0 equ 0FEDh");


typedef union {
    struct {
        unsigned POSTDEC0 :8;
    };
} POSTDEC0bits_t;
extern volatile POSTDEC0bits_t POSTDEC0bits __attribute__((address(0xFED)));
# 16724 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char POSTINC0 __attribute__((address(0xFEE)));

__asm("POSTINC0 equ 0FEEh");


typedef union {
    struct {
        unsigned POSTINC0 :8;
    };
} POSTINC0bits_t;
extern volatile POSTINC0bits_t POSTINC0bits __attribute__((address(0xFEE)));
# 16744 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char INDF0 __attribute__((address(0xFEF)));

__asm("INDF0 equ 0FEFh");


typedef union {
    struct {
        unsigned INDF0 :8;
    };
} INDF0bits_t;
extern volatile INDF0bits_t INDF0bits __attribute__((address(0xFEF)));
# 16764 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char INTCON3 __attribute__((address(0xFF0)));

__asm("INTCON3 equ 0FF0h");


typedef union {
    struct {
        unsigned INT1IF :1;
        unsigned INT2IF :1;
        unsigned :1;
        unsigned INT1IE :1;
        unsigned INT2IE :1;
        unsigned :1;
        unsigned INT1IP :1;
        unsigned INT2IP :1;
    };
    struct {
        unsigned INT1F :1;
        unsigned INT2F :1;
        unsigned :1;
        unsigned INT1E :1;
        unsigned INT2E :1;
        unsigned :1;
        unsigned INT1P :1;
        unsigned INT2P :1;
    };
} INTCON3bits_t;
extern volatile INTCON3bits_t INTCON3bits __attribute__((address(0xFF0)));
# 16856 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char INTCON2 __attribute__((address(0xFF1)));

__asm("INTCON2 equ 0FF1h");


typedef union {
    struct {
        unsigned :7;
        unsigned NOT_RBPU :1;
    };
    struct {
        unsigned RBIP :1;
        unsigned :1;
        unsigned TMR0IP :1;
        unsigned :1;
        unsigned INTEDG2 :1;
        unsigned INTEDG1 :1;
        unsigned INTEDG0 :1;
        unsigned nRBPU :1;
    };
    struct {
        unsigned :7;
        unsigned RBPU :1;
    };
} INTCON2bits_t;
extern volatile INTCON2bits_t INTCON2bits __attribute__((address(0xFF1)));
# 16926 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char INTCON __attribute__((address(0xFF2)));

__asm("INTCON equ 0FF2h");


typedef union {
    struct {
        unsigned RBIF :1;
        unsigned INT0IF :1;
        unsigned TMR0IF :1;
        unsigned RBIE :1;
        unsigned INT0IE :1;
        unsigned TMR0IE :1;
        unsigned PEIE_GIEL :1;
        unsigned GIE_GIEH :1;
    };
    struct {
        unsigned :1;
        unsigned INT0F :1;
        unsigned T0IF :1;
        unsigned :1;
        unsigned INT0E :1;
        unsigned T0IE :1;
        unsigned PEIE :1;
        unsigned GIE :1;
    };
    struct {
        unsigned :6;
        unsigned GIEL :1;
        unsigned GIEH :1;
    };
} INTCONbits_t;
extern volatile INTCONbits_t INTCONbits __attribute__((address(0xFF2)));
# 17043 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned short PROD __attribute__((address(0xFF3)));

__asm("PROD equ 0FF3h");




extern volatile unsigned char PRODL __attribute__((address(0xFF3)));

__asm("PRODL equ 0FF3h");


typedef union {
    struct {
        unsigned PRODL :8;
    };
} PRODLbits_t;
extern volatile PRODLbits_t PRODLbits __attribute__((address(0xFF3)));
# 17070 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PRODH __attribute__((address(0xFF4)));

__asm("PRODH equ 0FF4h");


typedef union {
    struct {
        unsigned PRODH :8;
    };
} PRODHbits_t;
extern volatile PRODHbits_t PRODHbits __attribute__((address(0xFF4)));
# 17090 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TABLAT __attribute__((address(0xFF5)));

__asm("TABLAT equ 0FF5h");


typedef union {
    struct {
        unsigned TABLAT :8;
    };
} TABLATbits_t;
extern volatile TABLATbits_t TABLATbits __attribute__((address(0xFF5)));
# 17111 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile __uint24 TBLPTR __attribute__((address(0xFF6)));


__asm("TBLPTR equ 0FF6h");




extern volatile unsigned char TBLPTRL __attribute__((address(0xFF6)));

__asm("TBLPTRL equ 0FF6h");


typedef union {
    struct {
        unsigned TBLPTRL :8;
    };
} TBLPTRLbits_t;
extern volatile TBLPTRLbits_t TBLPTRLbits __attribute__((address(0xFF6)));
# 17139 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TBLPTRH __attribute__((address(0xFF7)));

__asm("TBLPTRH equ 0FF7h");


typedef union {
    struct {
        unsigned TBLPTRH :8;
    };
} TBLPTRHbits_t;
extern volatile TBLPTRHbits_t TBLPTRHbits __attribute__((address(0xFF7)));
# 17159 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TBLPTRU __attribute__((address(0xFF8)));

__asm("TBLPTRU equ 0FF8h");


typedef union {
    struct {
        unsigned TBLPTRU :6;
    };
    struct {
        unsigned :5;
        unsigned ACSS :1;
    };
} TBLPTRUbits_t;
extern volatile TBLPTRUbits_t TBLPTRUbits __attribute__((address(0xFF8)));
# 17189 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile __uint24 PCLAT __attribute__((address(0xFF9)));


__asm("PCLAT equ 0FF9h");



extern volatile __uint24 PC __attribute__((address(0xFF9)));


__asm("PC equ 0FF9h");




extern volatile unsigned char PCL __attribute__((address(0xFF9)));

__asm("PCL equ 0FF9h");


typedef union {
    struct {
        unsigned PCL :8;
    };
} PCLbits_t;
extern volatile PCLbits_t PCLbits __attribute__((address(0xFF9)));
# 17224 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PCLATH __attribute__((address(0xFFA)));

__asm("PCLATH equ 0FFAh");


typedef union {
    struct {
        unsigned PCH :8;
    };
} PCLATHbits_t;
extern volatile PCLATHbits_t PCLATHbits __attribute__((address(0xFFA)));
# 17244 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char PCLATU __attribute__((address(0xFFB)));

__asm("PCLATU equ 0FFBh");




extern volatile unsigned char STKPTR __attribute__((address(0xFFC)));

__asm("STKPTR equ 0FFCh");


typedef union {
    struct {
        unsigned STKPTR :5;
        unsigned :1;
        unsigned STKUNF :1;
        unsigned STKFUL :1;
    };
    struct {
        unsigned STKPTR0 :1;
        unsigned STKPTR1 :1;
        unsigned STKPTR2 :1;
        unsigned STKPTR3 :1;
        unsigned STKPTR4 :1;
        unsigned :2;
        unsigned STKOVF :1;
    };
    struct {
        unsigned SP0 :1;
        unsigned SP1 :1;
        unsigned SP2 :1;
        unsigned SP3 :1;
        unsigned SP4 :1;
    };
} STKPTRbits_t;
extern volatile STKPTRbits_t STKPTRbits __attribute__((address(0xFFC)));
# 17356 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile __uint24 TOS __attribute__((address(0xFFD)));


__asm("TOS equ 0FFDh");




extern volatile unsigned char TOSL __attribute__((address(0xFFD)));

__asm("TOSL equ 0FFDh");


typedef union {
    struct {
        unsigned TOSL :8;
    };
} TOSLbits_t;
extern volatile TOSLbits_t TOSLbits __attribute__((address(0xFFD)));
# 17384 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TOSH __attribute__((address(0xFFE)));

__asm("TOSH equ 0FFEh");


typedef union {
    struct {
        unsigned TOSH :8;
    };
} TOSHbits_t;
extern volatile TOSHbits_t TOSHbits __attribute__((address(0xFFE)));
# 17404 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile unsigned char TOSU __attribute__((address(0xFFF)));

__asm("TOSU equ 0FFFh");
# 17417 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18f46k22.h" 3
extern volatile __bit ABDEN1 __attribute__((address(0x7DC0)));


extern volatile __bit ABDEN2 __attribute__((address(0x7B80)));


extern volatile __bit ABDOVF1 __attribute__((address(0x7DC7)));


extern volatile __bit ABDOVF2 __attribute__((address(0x7B87)));


extern volatile __bit ACKDT1 __attribute__((address(0x7E2D)));


extern volatile __bit ACKDT2 __attribute__((address(0x7B5D)));


extern volatile __bit ACKEN1 __attribute__((address(0x7E2C)));


extern volatile __bit ACKEN2 __attribute__((address(0x7B5C)));


extern volatile __bit ACKSTAT1 __attribute__((address(0x7E2E)));


extern volatile __bit ACKSTAT2 __attribute__((address(0x7B5E)));


extern volatile __bit ACQT0 __attribute__((address(0x7E03)));


extern volatile __bit ACQT1 __attribute__((address(0x7E04)));


extern volatile __bit ACQT2 __attribute__((address(0x7E05)));


extern volatile __bit ACSS __attribute__((address(0x7FC5)));


extern volatile __bit ADCMD __attribute__((address(0x79E8)));


extern volatile __bit ADCS0 __attribute__((address(0x7E00)));


extern volatile __bit ADCS1 __attribute__((address(0x7E01)));


extern volatile __bit ADCS2 __attribute__((address(0x7E02)));


extern volatile __bit ADDEN1 __attribute__((address(0x7D5B)));


extern volatile __bit ADDEN2 __attribute__((address(0x7B8B)));


extern volatile __bit ADFM __attribute__((address(0x7E07)));


extern volatile __bit ADIE __attribute__((address(0x7CEE)));


extern volatile __bit ADIF __attribute__((address(0x7CF6)));


extern volatile __bit ADIP __attribute__((address(0x7CFE)));


extern volatile __bit ADMSK1 __attribute__((address(0x7E29)));


extern volatile __bit ADMSK11 __attribute__((address(0x7E29)));


extern volatile __bit ADMSK12 __attribute__((address(0x7B59)));


extern volatile __bit ADMSK2 __attribute__((address(0x7E2A)));


extern volatile __bit ADMSK21 __attribute__((address(0x7E2A)));


extern volatile __bit ADMSK22 __attribute__((address(0x7B5A)));


extern volatile __bit ADMSK3 __attribute__((address(0x7E2B)));


extern volatile __bit ADMSK31 __attribute__((address(0x7E2B)));


extern volatile __bit ADMSK32 __attribute__((address(0x7B5B)));


extern volatile __bit ADMSK4 __attribute__((address(0x7E2C)));


extern volatile __bit ADMSK41 __attribute__((address(0x7E2C)));


extern volatile __bit ADMSK42 __attribute__((address(0x7B5C)));


extern volatile __bit ADMSK5 __attribute__((address(0x7E2D)));


extern volatile __bit ADMSK51 __attribute__((address(0x7E2D)));


extern volatile __bit ADMSK52 __attribute__((address(0x7B5D)));


extern volatile __bit ADON __attribute__((address(0x7E10)));


extern volatile __bit AN0 __attribute__((address(0x7C00)));


extern volatile __bit AN1 __attribute__((address(0x7C01)));


extern volatile __bit AN10 __attribute__((address(0x7C09)));


extern volatile __bit AN11 __attribute__((address(0x7C0C)));


extern volatile __bit AN12 __attribute__((address(0x7C08)));


extern volatile __bit AN13 __attribute__((address(0x7C0D)));


extern volatile __bit AN14 __attribute__((address(0x7C12)));


extern volatile __bit AN15 __attribute__((address(0x7C13)));


extern volatile __bit AN16 __attribute__((address(0x7C14)));


extern volatile __bit AN17 __attribute__((address(0x7C15)));


extern volatile __bit AN18 __attribute__((address(0x7C16)));


extern volatile __bit AN19 __attribute__((address(0x7C17)));


extern volatile __bit AN2 __attribute__((address(0x7C02)));


extern volatile __bit AN20 __attribute__((address(0x7C18)));


extern volatile __bit AN21 __attribute__((address(0x7C19)));


extern volatile __bit AN22 __attribute__((address(0x7C1A)));


extern volatile __bit AN23 __attribute__((address(0x7C1B)));


extern volatile __bit AN24 __attribute__((address(0x7C1C)));


extern volatile __bit AN25 __attribute__((address(0x7C1D)));


extern volatile __bit AN26 __attribute__((address(0x7C1E)));


extern volatile __bit AN27 __attribute__((address(0x7C1F)));


extern volatile __bit AN3 __attribute__((address(0x7C03)));


extern volatile __bit AN4 __attribute__((address(0x7C05)));


extern volatile __bit AN5 __attribute__((address(0x7C20)));


extern volatile __bit AN6 __attribute__((address(0x7C21)));


extern volatile __bit AN7 __attribute__((address(0x7C22)));


extern volatile __bit AN8 __attribute__((address(0x7C0A)));


extern volatile __bit AN9 __attribute__((address(0x7C0B)));


extern volatile __bit ANSA0 __attribute__((address(0x79C0)));


extern volatile __bit ANSA1 __attribute__((address(0x79C1)));


extern volatile __bit ANSA2 __attribute__((address(0x79C2)));


extern volatile __bit ANSA3 __attribute__((address(0x79C3)));


extern volatile __bit ANSA5 __attribute__((address(0x79C5)));


extern volatile __bit ANSB0 __attribute__((address(0x79C8)));


extern volatile __bit ANSB1 __attribute__((address(0x79C9)));


extern volatile __bit ANSB2 __attribute__((address(0x79CA)));


extern volatile __bit ANSB3 __attribute__((address(0x79CB)));


extern volatile __bit ANSB4 __attribute__((address(0x79CC)));


extern volatile __bit ANSB5 __attribute__((address(0x79CD)));


extern volatile __bit ANSC2 __attribute__((address(0x79D2)));


extern volatile __bit ANSC3 __attribute__((address(0x79D3)));


extern volatile __bit ANSC4 __attribute__((address(0x79D4)));


extern volatile __bit ANSC5 __attribute__((address(0x79D5)));


extern volatile __bit ANSC6 __attribute__((address(0x79D6)));


extern volatile __bit ANSC7 __attribute__((address(0x79D7)));


extern volatile __bit ANSD0 __attribute__((address(0x79D8)));


extern volatile __bit ANSD1 __attribute__((address(0x79D9)));


extern volatile __bit ANSD2 __attribute__((address(0x79DA)));


extern volatile __bit ANSD3 __attribute__((address(0x79DB)));


extern volatile __bit ANSD4 __attribute__((address(0x79DC)));


extern volatile __bit ANSD5 __attribute__((address(0x79DD)));


extern volatile __bit ANSD6 __attribute__((address(0x79DE)));


extern volatile __bit ANSD7 __attribute__((address(0x79DF)));


extern volatile __bit ANSE0 __attribute__((address(0x79E0)));


extern volatile __bit ANSE1 __attribute__((address(0x79E1)));


extern volatile __bit ANSE2 __attribute__((address(0x79E2)));


extern volatile __bit BCL1IE __attribute__((address(0x7D03)));


extern volatile __bit BCL1IF __attribute__((address(0x7D0B)));


extern volatile __bit BCL1IP __attribute__((address(0x7D13)));


extern volatile __bit BCL2IE __attribute__((address(0x7D1E)));


extern volatile __bit BCL2IF __attribute__((address(0x7D26)));


extern volatile __bit BCL2IP __attribute__((address(0x7D2E)));


extern volatile __bit BCLIE __attribute__((address(0x7D03)));


extern volatile __bit BCLIF __attribute__((address(0x7D0B)));


extern volatile __bit BCLIP __attribute__((address(0x7D13)));


extern volatile __bit BF1 __attribute__((address(0x7E38)));


extern volatile __bit BF2 __attribute__((address(0x7B68)));


extern volatile __bit BGST __attribute__((address(0x7CE5)));


extern volatile __bit BGVST __attribute__((address(0x7CE6)));


extern volatile __bit BOR __attribute__((address(0x7E80)));


extern volatile __bit BRG161 __attribute__((address(0x7DC3)));


extern volatile __bit BRG162 __attribute__((address(0x7B83)));


extern volatile __bit BRGH1 __attribute__((address(0x7D62)));


extern volatile __bit BRGH2 __attribute__((address(0x7B92)));


extern volatile __bit C12IN0M __attribute__((address(0x7C00)));


extern volatile __bit C12IN0N __attribute__((address(0x7C00)));


extern volatile __bit C12IN1M __attribute__((address(0x7C01)));


extern volatile __bit C12IN1N __attribute__((address(0x7C01)));


extern volatile __bit C12IN2M __attribute__((address(0x7C0B)));


extern volatile __bit C12IN2N __attribute__((address(0x7C0B)));


extern volatile __bit C12IN3M __attribute__((address(0x7C09)));


extern volatile __bit C12IN3N __attribute__((address(0x7C09)));


extern volatile __bit C1CH0 __attribute__((address(0x7BC8)));


extern volatile __bit C1CH1 __attribute__((address(0x7BC9)));


extern volatile __bit C1HYS __attribute__((address(0x7BBB)));


extern volatile __bit C1IE __attribute__((address(0x7D06)));


extern volatile __bit C1IF __attribute__((address(0x7D0E)));


extern volatile __bit C1INP __attribute__((address(0x7C03)));


extern volatile __bit C1IP __attribute__((address(0x7D16)));


extern volatile __bit C1OE __attribute__((address(0x7BCD)));


extern volatile __bit C1ON __attribute__((address(0x7BCF)));


extern volatile __bit C1POL __attribute__((address(0x7BCC)));


extern volatile __bit C1R __attribute__((address(0x7BCA)));


extern volatile __bit C1RSEL __attribute__((address(0x7BBD)));


extern volatile __bit C1SP __attribute__((address(0x7BCB)));


extern volatile __bit C1SYNC __attribute__((address(0x7BB9)));


extern volatile __bit C1TSEL0 __attribute__((address(0x7A48)));


extern volatile __bit C1TSEL1 __attribute__((address(0x7A49)));


extern volatile __bit C2CH0 __attribute__((address(0x7BC0)));


extern volatile __bit C2CH1 __attribute__((address(0x7BC1)));


extern volatile __bit C2HYS __attribute__((address(0x7BBA)));


extern volatile __bit C2IE __attribute__((address(0x7D05)));


extern volatile __bit C2IF __attribute__((address(0x7D0D)));


extern volatile __bit C2INP __attribute__((address(0x7C02)));


extern volatile __bit C2IP __attribute__((address(0x7D15)));


extern volatile __bit C2OE __attribute__((address(0x7BC5)));


extern volatile __bit C2ON __attribute__((address(0x7BC7)));


extern volatile __bit C2POL __attribute__((address(0x7BC4)));


extern volatile __bit C2R __attribute__((address(0x7BC2)));


extern volatile __bit C2RSEL __attribute__((address(0x7BBC)));


extern volatile __bit C2SP __attribute__((address(0x7BC3)));


extern volatile __bit C2SYNC __attribute__((address(0x7BB8)));


extern volatile __bit C2TSEL0 __attribute__((address(0x7A4B)));


extern volatile __bit C2TSEL1 __attribute__((address(0x7A4C)));


extern volatile __bit C3TSEL0 __attribute__((address(0x7A4E)));


extern volatile __bit C3TSEL1 __attribute__((address(0x7A4F)));


extern volatile __bit C4TSEL0 __attribute__((address(0x7A40)));


extern volatile __bit C4TSEL1 __attribute__((address(0x7A41)));


extern volatile __bit C5TSEL0 __attribute__((address(0x7A42)));


extern volatile __bit C5TSEL1 __attribute__((address(0x7A43)));


extern volatile __bit CARRY __attribute__((address(0x7EC0)));


extern volatile __bit CCH0 __attribute__((address(0x7BC8)));


extern volatile __bit CCH01 __attribute__((address(0x7BC8)));


extern volatile __bit CCH02 __attribute__((address(0x7BC0)));


extern volatile __bit CCH05 __attribute__((address(0x7BF8)));


extern volatile __bit CCH1 __attribute__((address(0x7BC9)));


extern volatile __bit CCH11 __attribute__((address(0x7BC9)));


extern volatile __bit CCH12 __attribute__((address(0x7BC1)));


extern volatile __bit CCH15 __attribute__((address(0x7BF9)));


extern volatile __bit CCIP3IP __attribute__((address(0x7BE0)));


extern volatile __bit CCP1 __attribute__((address(0x7C12)));


extern volatile __bit CCP10 __attribute__((address(0x7C22)));


extern volatile __bit CCP1AS0 __attribute__((address(0x7DB4)));


extern volatile __bit CCP1AS1 __attribute__((address(0x7DB5)));


extern volatile __bit CCP1AS2 __attribute__((address(0x7DB6)));


extern volatile __bit CCP1ASE __attribute__((address(0x7DB7)));


extern volatile __bit CCP1IE __attribute__((address(0x7CEA)));


extern volatile __bit CCP1IF __attribute__((address(0x7CF2)));


extern volatile __bit CCP1IP __attribute__((address(0x7CFA)));


extern volatile __bit CCP1M0 __attribute__((address(0x7DE8)));


extern volatile __bit CCP1M1 __attribute__((address(0x7DE9)));


extern volatile __bit CCP1M2 __attribute__((address(0x7DEA)));


extern volatile __bit CCP1M3 __attribute__((address(0x7DEB)));


extern volatile __bit CCP1MD __attribute__((address(0x79F0)));


extern volatile __bit CCP2AS0 __attribute__((address(0x7B24)));


extern volatile __bit CCP2AS1 __attribute__((address(0x7B25)));


extern volatile __bit CCP2AS2 __attribute__((address(0x7B26)));


extern volatile __bit CCP2ASE __attribute__((address(0x7B27)));


extern volatile __bit CCP2IE __attribute__((address(0x7D00)));


extern volatile __bit CCP2IF __attribute__((address(0x7D08)));


extern volatile __bit CCP2IP __attribute__((address(0x7D10)));


extern volatile __bit CCP2M0 __attribute__((address(0x7B30)));


extern volatile __bit CCP2M1 __attribute__((address(0x7B31)));


extern volatile __bit CCP2M2 __attribute__((address(0x7B32)));


extern volatile __bit CCP2M3 __attribute__((address(0x7B33)));


extern volatile __bit CCP2MD __attribute__((address(0x79F1)));


extern volatile __bit CCP2_PA2 __attribute__((address(0x7C0B)));


extern volatile __bit CCP3AS0 __attribute__((address(0x7ADC)));


extern volatile __bit CCP3AS1 __attribute__((address(0x7ADD)));


extern volatile __bit CCP3AS2 __attribute__((address(0x7ADE)));


extern volatile __bit CCP3ASE __attribute__((address(0x7ADF)));


extern volatile __bit CCP3IE __attribute__((address(0x7BD0)));


extern volatile __bit CCP3IF __attribute__((address(0x7BD8)));


extern volatile __bit CCP3IP __attribute__((address(0x7BE0)));


extern volatile __bit CCP3M0 __attribute__((address(0x7AE8)));


extern volatile __bit CCP3M1 __attribute__((address(0x7AE9)));


extern volatile __bit CCP3M2 __attribute__((address(0x7AEA)));


extern volatile __bit CCP3M3 __attribute__((address(0x7AEB)));


extern volatile __bit CCP3MD __attribute__((address(0x79F2)));


extern volatile __bit CCP4 __attribute__((address(0x7C19)));


extern volatile __bit CCP4IE __attribute__((address(0x7BD1)));


extern volatile __bit CCP4IF __attribute__((address(0x7BD9)));


extern volatile __bit CCP4IP __attribute__((address(0x7BE1)));


extern volatile __bit CCP4M0 __attribute__((address(0x7AB8)));


extern volatile __bit CCP4M1 __attribute__((address(0x7AB9)));


extern volatile __bit CCP4M2 __attribute__((address(0x7ABA)));


extern volatile __bit CCP4M3 __attribute__((address(0x7ABB)));


extern volatile __bit CCP4MD __attribute__((address(0x79F3)));


extern volatile __bit CCP5 __attribute__((address(0x7C22)));


extern volatile __bit CCP5IE __attribute__((address(0x7BD2)));


extern volatile __bit CCP5IF __attribute__((address(0x7BDA)));


extern volatile __bit CCP5IP __attribute__((address(0x7BE2)));


extern volatile __bit CCP5M0 __attribute__((address(0x7AA0)));


extern volatile __bit CCP5M1 __attribute__((address(0x7AA1)));


extern volatile __bit CCP5M2 __attribute__((address(0x7AA2)));


extern volatile __bit CCP5M3 __attribute__((address(0x7AA3)));


extern volatile __bit CCP5MD __attribute__((address(0x79F4)));


extern volatile __bit CCP9E __attribute__((address(0x7C23)));


extern volatile __bit CFGS __attribute__((address(0x7D36)));


extern volatile __bit CHS0 __attribute__((address(0x7E12)));


extern volatile __bit CHS1 __attribute__((address(0x7E13)));


extern volatile __bit CHS2 __attribute__((address(0x7E14)));


extern volatile __bit CHS3 __attribute__((address(0x7E15)));


extern volatile __bit CHS4 __attribute__((address(0x7E16)));


extern volatile __bit CHSN3 __attribute__((address(0x7E0B)));


extern volatile __bit CK __attribute__((address(0x7C16)));


extern volatile __bit CK1 __attribute__((address(0x7C16)));


extern volatile __bit CK2 __attribute__((address(0x7C1E)));


extern volatile __bit CKE1 __attribute__((address(0x7E3E)));


extern volatile __bit CKE2 __attribute__((address(0x7B6E)));


extern volatile __bit CKP1 __attribute__((address(0x7E34)));


extern volatile __bit CKP2 __attribute__((address(0x7B64)));


extern volatile __bit CMIE __attribute__((address(0x7D06)));


extern volatile __bit CMIF __attribute__((address(0x7D0E)));


extern volatile __bit CMIP __attribute__((address(0x7D16)));


extern volatile __bit CMP1MD __attribute__((address(0x79E9)));


extern volatile __bit CMP2MD __attribute__((address(0x79EA)));


extern volatile __bit COE __attribute__((address(0x7BCE)));


extern volatile __bit COE1 __attribute__((address(0x7BCE)));


extern volatile __bit COE2 __attribute__((address(0x7BC6)));


extern volatile __bit CON __attribute__((address(0x7BCF)));


extern volatile __bit CON1 __attribute__((address(0x7BCF)));


extern volatile __bit CON2 __attribute__((address(0x7BC7)));


extern volatile __bit CPOL __attribute__((address(0x7BCD)));


extern volatile __bit CPOL1 __attribute__((address(0x7BCD)));


extern volatile __bit CPOL2 __attribute__((address(0x7BC5)));


extern volatile __bit CREF __attribute__((address(0x7BCA)));


extern volatile __bit CREF1 __attribute__((address(0x7BCA)));


extern volatile __bit CREF2 __attribute__((address(0x7BC2)));


extern volatile __bit CREN1 __attribute__((address(0x7D5C)));


extern volatile __bit CREN2 __attribute__((address(0x7B8C)));


extern volatile __bit CS __attribute__((address(0x7C22)));


extern volatile __bit CSRC1 __attribute__((address(0x7D67)));


extern volatile __bit CSRC2 __attribute__((address(0x7B97)));


extern volatile __bit CTED1 __attribute__((address(0x7C0A)));


extern volatile __bit CTED2 __attribute__((address(0x7C0B)));


extern volatile __bit CTMUEN __attribute__((address(0x7A2F)));


extern volatile __bit CTMUIE __attribute__((address(0x7D1B)));


extern volatile __bit CTMUIF __attribute__((address(0x7D23)));


extern volatile __bit CTMUIP __attribute__((address(0x7D2B)));


extern volatile __bit CTMUMD __attribute__((address(0x79EB)));


extern volatile __bit CTMUSIDL __attribute__((address(0x7A2D)));


extern volatile __bit CTPLS __attribute__((address(0x7C12)));


extern volatile __bit CTTRIG __attribute__((address(0x7A28)));


extern volatile __bit CVREF __attribute__((address(0x7C02)));


extern volatile __bit DA __attribute__((address(0x7E3D)));


extern volatile __bit DA1 __attribute__((address(0x7E3D)));


extern volatile __bit DA2 __attribute__((address(0x7B6D)));


extern volatile __bit DACEN __attribute__((address(0x7A0F)));


extern volatile __bit DACLPS __attribute__((address(0x7A0E)));


extern volatile __bit DACNSS __attribute__((address(0x7A08)));


extern volatile __bit DACOE __attribute__((address(0x7A0D)));


extern volatile __bit DACOUT __attribute__((address(0x7C02)));


extern volatile __bit DACPSS0 __attribute__((address(0x7A0A)));


extern volatile __bit DACPSS1 __attribute__((address(0x7A0B)));


extern volatile __bit DACR0 __attribute__((address(0x7A00)));


extern volatile __bit DACR1 __attribute__((address(0x7A01)));


extern volatile __bit DACR2 __attribute__((address(0x7A02)));


extern volatile __bit DACR3 __attribute__((address(0x7A03)));


extern volatile __bit DACR4 __attribute__((address(0x7A04)));


extern volatile __bit DATA_ADDRESS __attribute__((address(0x7E3D)));


extern volatile __bit DATA_ADDRESS2 __attribute__((address(0x7B6D)));


extern volatile __bit DC __attribute__((address(0x7EC1)));


extern volatile __bit DC1B0 __attribute__((address(0x7DEC)));


extern volatile __bit DC1B1 __attribute__((address(0x7DED)));


extern volatile __bit DC2B0 __attribute__((address(0x7B34)));


extern volatile __bit DC2B1 __attribute__((address(0x7B35)));


extern volatile __bit DC3B0 __attribute__((address(0x7AEC)));


extern volatile __bit DC3B1 __attribute__((address(0x7AED)));


extern volatile __bit DC4B0 __attribute__((address(0x7ABC)));


extern volatile __bit DC4B1 __attribute__((address(0x7ABD)));


extern volatile __bit DC5B0 __attribute__((address(0x7AA4)));


extern volatile __bit DC5B1 __attribute__((address(0x7AA5)));


extern volatile __bit DONE __attribute__((address(0x7E11)));


extern volatile __bit DT __attribute__((address(0x7C17)));


extern volatile __bit DT1 __attribute__((address(0x7C17)));


extern volatile __bit DT2 __attribute__((address(0x7C1F)));


extern volatile __bit DTRXP1 __attribute__((address(0x7DC5)));


extern volatile __bit DTRXP2 __attribute__((address(0x7B85)));


extern volatile __bit D_A2 __attribute__((address(0x7B6D)));


extern volatile __bit D_NOT_A2 __attribute__((address(0x7B6D)));


extern volatile __bit D_nA2 __attribute__((address(0x7B6D)));


extern volatile __bit ECCPAS0 __attribute__((address(0x7DB4)));


extern volatile __bit ECCPAS1 __attribute__((address(0x7DB5)));


extern volatile __bit ECCPAS2 __attribute__((address(0x7DB6)));


extern volatile __bit ECCPASE __attribute__((address(0x7DB7)));


extern volatile __bit EDG1POL __attribute__((address(0x7A24)));


extern volatile __bit EDG1SEL0 __attribute__((address(0x7A22)));


extern volatile __bit EDG1SEL1 __attribute__((address(0x7A23)));


extern volatile __bit EDG1STAT __attribute__((address(0x7A20)));


extern volatile __bit EDG2POL __attribute__((address(0x7A27)));


extern volatile __bit EDG2SEL0 __attribute__((address(0x7A25)));


extern volatile __bit EDG2SEL1 __attribute__((address(0x7A26)));


extern volatile __bit EDG2STAT __attribute__((address(0x7A21)));


extern volatile __bit EDGEN __attribute__((address(0x7A2B)));


extern volatile __bit EDGSEQEN __attribute__((address(0x7A2A)));


extern volatile __bit EEADR0 __attribute__((address(0x7D48)));


extern volatile __bit EEADR1 __attribute__((address(0x7D49)));


extern volatile __bit EEADR2 __attribute__((address(0x7D4A)));


extern volatile __bit EEADR3 __attribute__((address(0x7D4B)));


extern volatile __bit EEADR4 __attribute__((address(0x7D4C)));


extern volatile __bit EEADR5 __attribute__((address(0x7D4D)));


extern volatile __bit EEADR6 __attribute__((address(0x7D4E)));


extern volatile __bit EEADR7 __attribute__((address(0x7D4F)));


extern volatile __bit EEADR8 __attribute__((address(0x7D50)));


extern volatile __bit EEADR9 __attribute__((address(0x7D51)));


extern volatile __bit EEFS __attribute__((address(0x7D36)));


extern volatile __bit EEIE __attribute__((address(0x7D04)));


extern volatile __bit EEIF __attribute__((address(0x7D0C)));


extern volatile __bit EEIP __attribute__((address(0x7D14)));


extern volatile __bit EEPGD __attribute__((address(0x7D37)));


extern volatile __bit EMBMD __attribute__((address(0x79F0)));


extern volatile __bit EVPOL0 __attribute__((address(0x7BCB)));


extern volatile __bit EVPOL01 __attribute__((address(0x7BCB)));


extern volatile __bit EVPOL02 __attribute__((address(0x7BC3)));


extern volatile __bit EVPOL1 __attribute__((address(0x7BCC)));


extern volatile __bit EVPOL11 __attribute__((address(0x7BCC)));


extern volatile __bit EVPOL12 __attribute__((address(0x7BC4)));


extern volatile __bit FERR1 __attribute__((address(0x7D5A)));


extern volatile __bit FERR2 __attribute__((address(0x7B8A)));


extern volatile __bit FLT0 __attribute__((address(0x7C08)));


extern volatile __bit FREE __attribute__((address(0x7D34)));


extern volatile __bit FVREN __attribute__((address(0x7A17)));


extern volatile __bit FVRS0 __attribute__((address(0x7A14)));


extern volatile __bit FVRS1 __attribute__((address(0x7A15)));


extern volatile __bit FVRST __attribute__((address(0x7A16)));


extern volatile __bit GCEN1 __attribute__((address(0x7E2F)));


extern volatile __bit GCEN2 __attribute__((address(0x7B5F)));


extern volatile __bit GIE __attribute__((address(0x7F97)));


extern volatile __bit GIEH __attribute__((address(0x7F97)));


extern volatile __bit GIEL __attribute__((address(0x7F96)));


extern volatile __bit GIE_GIEH __attribute__((address(0x7F97)));


extern volatile __bit GO __attribute__((address(0x7E11)));


extern volatile __bit GODONE __attribute__((address(0x7E11)));


extern volatile __bit GO_DONE __attribute__((address(0x7E11)));


extern volatile __bit GO_NOT_DONE __attribute__((address(0x7E11)));


extern volatile __bit GO_nDONE __attribute__((address(0x7E11)));


extern volatile __bit HFIOFS __attribute__((address(0x7E9A)));


extern volatile __bit HLVDEN __attribute__((address(0x7CE4)));


extern volatile __bit HLVDIE __attribute__((address(0x7D02)));


extern volatile __bit HLVDIF __attribute__((address(0x7D0A)));


extern volatile __bit HLVDIN __attribute__((address(0x7C05)));


extern volatile __bit HLVDIP __attribute__((address(0x7D12)));


extern volatile __bit HLVDL0 __attribute__((address(0x7CE0)));


extern volatile __bit HLVDL1 __attribute__((address(0x7CE1)));


extern volatile __bit HLVDL2 __attribute__((address(0x7CE2)));


extern volatile __bit HLVDL3 __attribute__((address(0x7CE3)));


extern volatile __bit I2C_DAT __attribute__((address(0x7E3D)));


extern volatile __bit I2C_DAT2 __attribute__((address(0x7B6D)));


extern volatile __bit I2C_READ __attribute__((address(0x7E3A)));


extern volatile __bit I2C_READ2 __attribute__((address(0x7B6A)));


extern volatile __bit I2C_START __attribute__((address(0x7E3B)));


extern volatile __bit I2C_START2 __attribute__((address(0x7B6B)));


extern volatile __bit I2C_STOP __attribute__((address(0x7E3C)));


extern volatile __bit I2C_STOP2 __attribute__((address(0x7B6C)));


extern volatile __bit IDISSEN __attribute__((address(0x7A29)));


extern volatile __bit IDLEN __attribute__((address(0x7E9F)));


extern volatile __bit INT0 __attribute__((address(0x7C08)));


extern volatile __bit INT0E __attribute__((address(0x7F94)));


extern volatile __bit INT0F __attribute__((address(0x7F91)));


extern volatile __bit INT0IE __attribute__((address(0x7F94)));


extern volatile __bit INT0IF __attribute__((address(0x7F91)));


extern volatile __bit INT1 __attribute__((address(0x7C09)));


extern volatile __bit INT1E __attribute__((address(0x7F83)));


extern volatile __bit INT1F __attribute__((address(0x7F80)));


extern volatile __bit INT1IE __attribute__((address(0x7F83)));


extern volatile __bit INT1IF __attribute__((address(0x7F80)));


extern volatile __bit INT1IP __attribute__((address(0x7F86)));


extern volatile __bit INT1P __attribute__((address(0x7F86)));


extern volatile __bit INT2 __attribute__((address(0x7C0A)));


extern volatile __bit INT2E __attribute__((address(0x7F84)));


extern volatile __bit INT2F __attribute__((address(0x7F81)));


extern volatile __bit INT2IE __attribute__((address(0x7F84)));


extern volatile __bit INT2IF __attribute__((address(0x7F81)));


extern volatile __bit INT2IP __attribute__((address(0x7F87)));


extern volatile __bit INT2P __attribute__((address(0x7F87)));


extern volatile __bit INTEDG0 __attribute__((address(0x7F8E)));


extern volatile __bit INTEDG1 __attribute__((address(0x7F8D)));


extern volatile __bit INTEDG2 __attribute__((address(0x7F8C)));


extern volatile __bit INTSRC __attribute__((address(0x7CDF)));


extern volatile __bit IOCB4 __attribute__((address(0x7B14)));


extern volatile __bit IOCB5 __attribute__((address(0x7B15)));


extern volatile __bit IOCB6 __attribute__((address(0x7B16)));


extern volatile __bit IOCB7 __attribute__((address(0x7B17)));


extern volatile __bit IOFS __attribute__((address(0x7E9A)));


extern volatile __bit IPEN __attribute__((address(0x7E87)));


extern volatile __bit IRCF0 __attribute__((address(0x7E9C)));


extern volatile __bit IRCF1 __attribute__((address(0x7E9D)));


extern volatile __bit IRCF2 __attribute__((address(0x7E9E)));


extern volatile __bit IRNG0 __attribute__((address(0x7A18)));


extern volatile __bit IRNG1 __attribute__((address(0x7A19)));


extern volatile __bit IRVST __attribute__((address(0x7CE5)));


extern volatile __bit ITRIM0 __attribute__((address(0x7A1A)));


extern volatile __bit ITRIM1 __attribute__((address(0x7A1B)));


extern volatile __bit ITRIM2 __attribute__((address(0x7A1C)));


extern volatile __bit ITRIM3 __attribute__((address(0x7A1D)));


extern volatile __bit ITRIM4 __attribute__((address(0x7A1E)));


extern volatile __bit ITRIM5 __attribute__((address(0x7A1F)));


extern volatile __bit IVRST __attribute__((address(0x7CE5)));


extern volatile __bit KBI0 __attribute__((address(0x7C0C)));


extern volatile __bit KBI1 __attribute__((address(0x7C0D)));


extern volatile __bit KBI2 __attribute__((address(0x7C0E)));


extern volatile __bit KBI3 __attribute__((address(0x7C0F)));


extern volatile __bit LA0 __attribute__((address(0x7C48)));


extern volatile __bit LA1 __attribute__((address(0x7C49)));


extern volatile __bit LA2 __attribute__((address(0x7C4A)));


extern volatile __bit LA3 __attribute__((address(0x7C4B)));


extern volatile __bit LA4 __attribute__((address(0x7C4C)));


extern volatile __bit LA5 __attribute__((address(0x7C4D)));


extern volatile __bit LA6 __attribute__((address(0x7C4E)));


extern volatile __bit LA7 __attribute__((address(0x7C4F)));


extern volatile __bit LATA0 __attribute__((address(0x7C48)));


extern volatile __bit LATA1 __attribute__((address(0x7C49)));


extern volatile __bit LATA2 __attribute__((address(0x7C4A)));


extern volatile __bit LATA3 __attribute__((address(0x7C4B)));


extern volatile __bit LATA4 __attribute__((address(0x7C4C)));


extern volatile __bit LATA5 __attribute__((address(0x7C4D)));


extern volatile __bit LATA6 __attribute__((address(0x7C4E)));


extern volatile __bit LATA7 __attribute__((address(0x7C4F)));


extern volatile __bit LATB0 __attribute__((address(0x7C50)));


extern volatile __bit LATB1 __attribute__((address(0x7C51)));


extern volatile __bit LATB2 __attribute__((address(0x7C52)));


extern volatile __bit LATB3 __attribute__((address(0x7C53)));


extern volatile __bit LATB4 __attribute__((address(0x7C54)));


extern volatile __bit LATB5 __attribute__((address(0x7C55)));


extern volatile __bit LATB6 __attribute__((address(0x7C56)));


extern volatile __bit LATB7 __attribute__((address(0x7C57)));


extern volatile __bit LATC0 __attribute__((address(0x7C58)));


extern volatile __bit LATC1 __attribute__((address(0x7C59)));


extern volatile __bit LATC2 __attribute__((address(0x7C5A)));


extern volatile __bit LATC3 __attribute__((address(0x7C5B)));


extern volatile __bit LATC4 __attribute__((address(0x7C5C)));


extern volatile __bit LATC5 __attribute__((address(0x7C5D)));


extern volatile __bit LATC6 __attribute__((address(0x7C5E)));


extern volatile __bit LATC7 __attribute__((address(0x7C5F)));


extern volatile __bit LATD0 __attribute__((address(0x7C60)));


extern volatile __bit LATD1 __attribute__((address(0x7C61)));


extern volatile __bit LATD2 __attribute__((address(0x7C62)));


extern volatile __bit LATD3 __attribute__((address(0x7C63)));


extern volatile __bit LATD4 __attribute__((address(0x7C64)));


extern volatile __bit LATD5 __attribute__((address(0x7C65)));


extern volatile __bit LATD6 __attribute__((address(0x7C66)));


extern volatile __bit LATD7 __attribute__((address(0x7C67)));


extern volatile __bit LATE0 __attribute__((address(0x7C68)));


extern volatile __bit LATE1 __attribute__((address(0x7C69)));


extern volatile __bit LATE2 __attribute__((address(0x7C6A)));


extern volatile __bit LB0 __attribute__((address(0x7C50)));


extern volatile __bit LB1 __attribute__((address(0x7C51)));


extern volatile __bit LB2 __attribute__((address(0x7C52)));


extern volatile __bit LB3 __attribute__((address(0x7C53)));


extern volatile __bit LB4 __attribute__((address(0x7C54)));


extern volatile __bit LB5 __attribute__((address(0x7C55)));


extern volatile __bit LB6 __attribute__((address(0x7C56)));


extern volatile __bit LB7 __attribute__((address(0x7C57)));


extern volatile __bit LC0 __attribute__((address(0x7C58)));


extern volatile __bit LC1 __attribute__((address(0x7C59)));


extern volatile __bit LC2 __attribute__((address(0x7C5A)));


extern volatile __bit LC3 __attribute__((address(0x7C5B)));


extern volatile __bit LC4 __attribute__((address(0x7C5C)));


extern volatile __bit LC5 __attribute__((address(0x7C5D)));


extern volatile __bit LC6 __attribute__((address(0x7C5E)));


extern volatile __bit LC7 __attribute__((address(0x7C5F)));


extern volatile __bit LD0 __attribute__((address(0x7C60)));


extern volatile __bit LD1 __attribute__((address(0x7C61)));


extern volatile __bit LD2 __attribute__((address(0x7C62)));


extern volatile __bit LD3 __attribute__((address(0x7C63)));


extern volatile __bit LD4 __attribute__((address(0x7C64)));


extern volatile __bit LD5 __attribute__((address(0x7C65)));


extern volatile __bit LD6 __attribute__((address(0x7C66)));


extern volatile __bit LD7 __attribute__((address(0x7C67)));


extern volatile __bit LE0 __attribute__((address(0x7C68)));


extern volatile __bit LE1 __attribute__((address(0x7C69)));


extern volatile __bit LE2 __attribute__((address(0x7C6A)));


extern volatile __bit LFIOFS __attribute__((address(0x7E90)));


extern volatile __bit LVDEN __attribute__((address(0x7CE4)));


extern volatile __bit LVDIE __attribute__((address(0x7D02)));


extern volatile __bit LVDIF __attribute__((address(0x7D0A)));


extern volatile __bit LVDIN __attribute__((address(0x7C05)));


extern volatile __bit LVDIP __attribute__((address(0x7D12)));


extern volatile __bit LVDL0 __attribute__((address(0x7CE0)));


extern volatile __bit LVDL1 __attribute__((address(0x7CE1)));


extern volatile __bit LVDL2 __attribute__((address(0x7CE2)));


extern volatile __bit LVDL3 __attribute__((address(0x7CE3)));


extern volatile __bit LVV0 __attribute__((address(0x7CE0)));


extern volatile __bit LVV1 __attribute__((address(0x7CE1)));


extern volatile __bit LVV2 __attribute__((address(0x7CE2)));


extern volatile __bit LVV3 __attribute__((address(0x7CE3)));


extern volatile __bit MC1OUT __attribute__((address(0x7BBF)));


extern volatile __bit MC2OUT __attribute__((address(0x7BBE)));


extern volatile __bit MCLR __attribute__((address(0x7C23)));


extern volatile __bit MFIOFS __attribute__((address(0x7E91)));


extern volatile __bit MFIOSEL __attribute__((address(0x7E94)));


extern volatile __bit MSK01 __attribute__((address(0x7E40)));


extern volatile __bit MSK02 __attribute__((address(0x7B70)));


extern volatile __bit MSK11 __attribute__((address(0x7E41)));


extern volatile __bit MSK12 __attribute__((address(0x7B71)));


extern volatile __bit MSK21 __attribute__((address(0x7E42)));


extern volatile __bit MSK22 __attribute__((address(0x7B72)));


extern volatile __bit MSK31 __attribute__((address(0x7E43)));


extern volatile __bit MSK32 __attribute__((address(0x7B73)));


extern volatile __bit MSK41 __attribute__((address(0x7E44)));


extern volatile __bit MSK42 __attribute__((address(0x7B74)));


extern volatile __bit MSK51 __attribute__((address(0x7E45)));


extern volatile __bit MSK52 __attribute__((address(0x7B75)));


extern volatile __bit MSK61 __attribute__((address(0x7E46)));


extern volatile __bit MSK62 __attribute__((address(0x7B76)));


extern volatile __bit MSK71 __attribute__((address(0x7E47)));


extern volatile __bit MSK72 __attribute__((address(0x7B77)));


extern volatile __bit MSSP1MD __attribute__((address(0x79F6)));


extern volatile __bit MSSP2MD __attribute__((address(0x79F7)));


extern volatile __bit NEGATIVE __attribute__((address(0x7EC4)));


extern volatile __bit NOT_A __attribute__((address(0x7E3D)));


extern volatile __bit NOT_A2 __attribute__((address(0x7B6D)));


extern volatile __bit NOT_ADDRESS2 __attribute__((address(0x7B6D)));


extern volatile __bit NOT_BOR __attribute__((address(0x7E80)));


extern volatile __bit NOT_DONE __attribute__((address(0x7E11)));


extern volatile __bit NOT_MCLR __attribute__((address(0x7C23)));


extern volatile __bit NOT_PD __attribute__((address(0x7E82)));


extern volatile __bit NOT_POR __attribute__((address(0x7E81)));


extern volatile __bit NOT_RBPU __attribute__((address(0x7F8F)));


extern volatile __bit NOT_RI __attribute__((address(0x7E84)));


extern volatile __bit NOT_SS __attribute__((address(0x7C05)));


extern volatile __bit NOT_SS1 __attribute__((address(0x7C05)));


extern volatile __bit NOT_SS2 __attribute__((address(0x7C1B)));


extern volatile __bit NOT_T1SYNC __attribute__((address(0x7E6A)));


extern volatile __bit NOT_T3SYNC __attribute__((address(0x7D8A)));


extern volatile __bit NOT_T5SYNC __attribute__((address(0x7A72)));


extern volatile __bit NOT_TO __attribute__((address(0x7E83)));


extern volatile __bit NOT_W __attribute__((address(0x7E3A)));


extern volatile __bit NOT_W2 __attribute__((address(0x7B6A)));


extern volatile __bit NOT_WRITE2 __attribute__((address(0x7B6A)));


extern volatile __bit NVCFG0 __attribute__((address(0x7E08)));


extern volatile __bit NVCFG1 __attribute__((address(0x7E09)));


extern volatile __bit OERR1 __attribute__((address(0x7D59)));


extern volatile __bit OERR2 __attribute__((address(0x7B89)));


extern volatile __bit OSCFIE __attribute__((address(0x7D07)));


extern volatile __bit OSCFIF __attribute__((address(0x7D0F)));


extern volatile __bit OSCFIP __attribute__((address(0x7D17)));


extern volatile __bit OSTS __attribute__((address(0x7E9B)));


extern volatile __bit OV __attribute__((address(0x7EC3)));


extern volatile __bit OVERFLOW __attribute__((address(0x7EC3)));


extern volatile __bit P1A __attribute__((address(0x7C12)));


extern volatile __bit P1B __attribute__((address(0x7C1D)));


extern volatile __bit P1C __attribute__((address(0x7C1E)));


extern volatile __bit P1D __attribute__((address(0x7C1F)));


extern volatile __bit P1DC0 __attribute__((address(0x7DB8)));


extern volatile __bit P1DC1 __attribute__((address(0x7DB9)));


extern volatile __bit P1DC2 __attribute__((address(0x7DBA)));


extern volatile __bit P1DC3 __attribute__((address(0x7DBB)));


extern volatile __bit P1DC4 __attribute__((address(0x7DBC)));


extern volatile __bit P1DC5 __attribute__((address(0x7DBD)));


extern volatile __bit P1DC6 __attribute__((address(0x7DBE)));


extern volatile __bit P1M0 __attribute__((address(0x7DEE)));


extern volatile __bit P1M1 __attribute__((address(0x7DEF)));


extern volatile __bit P1RSEN __attribute__((address(0x7DBF)));


extern volatile __bit P1SSAC0 __attribute__((address(0x7DB2)));


extern volatile __bit P1SSAC1 __attribute__((address(0x7DB3)));


extern volatile __bit P1SSBD0 __attribute__((address(0x7DB0)));


extern volatile __bit P1SSBD1 __attribute__((address(0x7DB1)));


extern volatile __bit P2 __attribute__((address(0x7B6C)));


extern volatile __bit P2C __attribute__((address(0x7C1B)));


extern volatile __bit P2D __attribute__((address(0x7C1C)));


extern volatile __bit P2DC0 __attribute__((address(0x7B28)));


extern volatile __bit P2DC02 __attribute__((address(0x7B18)));


extern volatile __bit P2DC0CON __attribute__((address(0x7B18)));


extern volatile __bit P2DC1 __attribute__((address(0x7B29)));


extern volatile __bit P2DC12 __attribute__((address(0x7B19)));


extern volatile __bit P2DC1CON __attribute__((address(0x7B19)));


extern volatile __bit P2DC2 __attribute__((address(0x7B2A)));


extern volatile __bit P2DC22 __attribute__((address(0x7B1A)));


extern volatile __bit P2DC2CON __attribute__((address(0x7B1A)));


extern volatile __bit P2DC3 __attribute__((address(0x7B2B)));


extern volatile __bit P2DC32 __attribute__((address(0x7B1B)));


extern volatile __bit P2DC3CON __attribute__((address(0x7B1B)));


extern volatile __bit P2DC4 __attribute__((address(0x7B2C)));


extern volatile __bit P2DC42 __attribute__((address(0x7B1C)));


extern volatile __bit P2DC4CON __attribute__((address(0x7B1C)));


extern volatile __bit P2DC5 __attribute__((address(0x7B2D)));


extern volatile __bit P2DC6 __attribute__((address(0x7B2E)));


extern volatile __bit P2M0 __attribute__((address(0x7B36)));


extern volatile __bit P2M1 __attribute__((address(0x7B37)));


extern volatile __bit P2RSEN __attribute__((address(0x7B2F)));


extern volatile __bit P2SSAC0 __attribute__((address(0x7B22)));


extern volatile __bit P2SSAC1 __attribute__((address(0x7B23)));


extern volatile __bit P2SSBD0 __attribute__((address(0x7B20)));


extern volatile __bit P2SSBD1 __attribute__((address(0x7B21)));


extern volatile __bit P3B __attribute__((address(0x7C21)));


extern volatile __bit P3DC0 __attribute__((address(0x7AE0)));


extern volatile __bit P3DC1 __attribute__((address(0x7AE1)));


extern volatile __bit P3DC2 __attribute__((address(0x7AE2)));


extern volatile __bit P3DC3 __attribute__((address(0x7AE3)));


extern volatile __bit P3DC4 __attribute__((address(0x7AE4)));


extern volatile __bit P3DC5 __attribute__((address(0x7AE5)));


extern volatile __bit P3DC6 __attribute__((address(0x7AE6)));


extern volatile __bit P3M0 __attribute__((address(0x7AEE)));


extern volatile __bit P3M1 __attribute__((address(0x7AEF)));


extern volatile __bit P3RSEN __attribute__((address(0x7AE7)));


extern volatile __bit P3SSAC0 __attribute__((address(0x7ADA)));


extern volatile __bit P3SSAC1 __attribute__((address(0x7ADB)));


extern volatile __bit P3SSBD0 __attribute__((address(0x7AD8)));


extern volatile __bit P3SSBD1 __attribute__((address(0x7AD9)));


extern volatile __bit PA1 __attribute__((address(0x7C12)));


extern volatile __bit PA2 __attribute__((address(0x7C11)));


extern volatile __bit PB2 __attribute__((address(0x7C22)));


extern volatile __bit PC2 __attribute__((address(0x7C21)));


extern volatile __bit PC3E __attribute__((address(0x7C23)));


extern volatile __bit PD __attribute__((address(0x7E82)));


extern volatile __bit PD2 __attribute__((address(0x7C20)));


extern volatile __bit PDC0 __attribute__((address(0x7DB8)));


extern volatile __bit PDC1 __attribute__((address(0x7DB9)));


extern volatile __bit PDC2 __attribute__((address(0x7DBA)));


extern volatile __bit PDC3 __attribute__((address(0x7DBB)));


extern volatile __bit PDC4 __attribute__((address(0x7DBC)));


extern volatile __bit PDC5 __attribute__((address(0x7DBD)));


extern volatile __bit PDC6 __attribute__((address(0x7DBE)));


extern volatile __bit PEIE __attribute__((address(0x7F96)));


extern volatile __bit PEIE_GIEL __attribute__((address(0x7F96)));


extern volatile __bit PEN1 __attribute__((address(0x7E2A)));


extern volatile __bit PEN2 __attribute__((address(0x7B5A)));


extern volatile __bit PGC __attribute__((address(0x7C0E)));


extern volatile __bit PGD __attribute__((address(0x7C0F)));


extern volatile __bit PLLEN __attribute__((address(0x7CDE)));


extern volatile __bit PLLRDY __attribute__((address(0x7E97)));


extern volatile __bit POR __attribute__((address(0x7E81)));


extern volatile __bit PRISD __attribute__((address(0x7E92)));


extern volatile __bit PRSEN __attribute__((address(0x7DBF)));


extern volatile __bit PSA __attribute__((address(0x7EAB)));


extern volatile __bit PSS1AC0 __attribute__((address(0x7DB2)));


extern volatile __bit PSS1AC1 __attribute__((address(0x7DB3)));


extern volatile __bit PSS1BD0 __attribute__((address(0x7DB0)));


extern volatile __bit PSS1BD1 __attribute__((address(0x7DB1)));


extern volatile __bit PSS2AC0 __attribute__((address(0x7B22)));


extern volatile __bit PSS2AC1 __attribute__((address(0x7B23)));


extern volatile __bit PSS2BD0 __attribute__((address(0x7B20)));


extern volatile __bit PSS2BD1 __attribute__((address(0x7B21)));


extern volatile __bit PSS3AC0 __attribute__((address(0x7ADA)));


extern volatile __bit PSS3AC1 __attribute__((address(0x7ADB)));


extern volatile __bit PSS3BD0 __attribute__((address(0x7AD8)));


extern volatile __bit PSS3BD1 __attribute__((address(0x7AD9)));


extern volatile __bit PSSAC0 __attribute__((address(0x7DB2)));


extern volatile __bit PSSAC1 __attribute__((address(0x7DB3)));


extern volatile __bit PSSBD0 __attribute__((address(0x7DB0)));


extern volatile __bit PSSBD1 __attribute__((address(0x7DB1)));


extern volatile __bit PVCFG0 __attribute__((address(0x7E0A)));


extern volatile __bit PVCFG1 __attribute__((address(0x7E0B)));


extern volatile __bit RBIE __attribute__((address(0x7F93)));


extern volatile __bit RBIF __attribute__((address(0x7F90)));


extern volatile __bit RBIP __attribute__((address(0x7F88)));


extern volatile __bit RBPU __attribute__((address(0x7F8F)));


extern volatile __bit RC1IE __attribute__((address(0x7CED)));


extern volatile __bit RC1IF __attribute__((address(0x7CF5)));


extern volatile __bit RC1IP __attribute__((address(0x7CFD)));


extern volatile __bit RC2IE __attribute__((address(0x7D1D)));


extern volatile __bit RC2IF __attribute__((address(0x7D25)));


extern volatile __bit RC2IP __attribute__((address(0x7D2D)));


extern volatile __bit RC8_9 __attribute__((address(0x7D5E)));


extern volatile __bit RC8_92 __attribute__((address(0x7B8E)));


extern volatile __bit RC9 __attribute__((address(0x7D5E)));


extern volatile __bit RC92 __attribute__((address(0x7B8E)));


extern volatile __bit RCD8 __attribute__((address(0x7D58)));


extern volatile __bit RCD82 __attribute__((address(0x7B88)));


extern volatile __bit RCEN1 __attribute__((address(0x7E2B)));


extern volatile __bit RCEN2 __attribute__((address(0x7B5B)));


extern volatile __bit RCIDL1 __attribute__((address(0x7DC6)));


extern volatile __bit RCIDL2 __attribute__((address(0x7B86)));


extern volatile __bit RCIE __attribute__((address(0x7CED)));


extern volatile __bit RCIF __attribute__((address(0x7CF5)));


extern volatile __bit RCIP __attribute__((address(0x7CFD)));


extern volatile __bit RCMT __attribute__((address(0x7DC6)));


extern volatile __bit RCMT1 __attribute__((address(0x7DC6)));


extern volatile __bit RCMT2 __attribute__((address(0x7B86)));


extern volatile __bit RD __attribute__((address(0x7D30)));


extern volatile __bit RD16 __attribute__((address(0x7E69)));


extern volatile __bit RD163 __attribute__((address(0x7D8F)));


extern volatile __bit RD165 __attribute__((address(0x7A71)));


extern volatile __bit RDE __attribute__((address(0x7C20)));


extern volatile __bit RE3 __attribute__((address(0x7C23)));


extern volatile __bit READ_WRITE __attribute__((address(0x7E3A)));


extern volatile __bit READ_WRITE2 __attribute__((address(0x7B6A)));


extern volatile __bit RI __attribute__((address(0x7E84)));


extern volatile __bit RJPU __attribute__((address(0x7C07)));


extern volatile __bit RSEN1 __attribute__((address(0x7E29)));


extern volatile __bit RSEN2 __attribute__((address(0x7B59)));


extern volatile __bit RW __attribute__((address(0x7E3A)));


extern volatile __bit RW1 __attribute__((address(0x7E3A)));


extern volatile __bit RW2 __attribute__((address(0x7B6A)));


extern volatile __bit RX __attribute__((address(0x7C17)));


extern volatile __bit RX1 __attribute__((address(0x7C17)));


extern volatile __bit RX2 __attribute__((address(0x7C1F)));


extern volatile __bit RX91 __attribute__((address(0x7D5E)));


extern volatile __bit RX92 __attribute__((address(0x7B8E)));


extern volatile __bit RX9D1 __attribute__((address(0x7D58)));


extern volatile __bit RX9D2 __attribute__((address(0x7B88)));


extern volatile __bit RXB0IE __attribute__((address(0x7D18)));


extern volatile __bit RXB1IE __attribute__((address(0x7D19)));


extern volatile __bit RXBNIE __attribute__((address(0x7D19)));


extern volatile __bit RXBNIF __attribute__((address(0x7D21)));


extern volatile __bit RXBNIP __attribute__((address(0x7D29)));


extern volatile __bit RXCKP __attribute__((address(0x7DC5)));


extern volatile __bit RXDTP __attribute__((address(0x7DC5)));


extern volatile __bit RXDTP1 __attribute__((address(0x7DC5)));


extern volatile __bit RXDTP2 __attribute__((address(0x7B85)));


extern volatile __bit R_NOT_W2 __attribute__((address(0x7B6A)));


extern volatile __bit R_W2 __attribute__((address(0x7B6A)));


extern volatile __bit R_nW2 __attribute__((address(0x7B6A)));


extern volatile __bit S2 __attribute__((address(0x7B6B)));


extern volatile __bit SBOREN __attribute__((address(0x7E86)));


extern volatile __bit SCK __attribute__((address(0x7C13)));


extern volatile __bit SCK1 __attribute__((address(0x7C13)));


extern volatile __bit SCK2 __attribute__((address(0x7C18)));


extern volatile __bit SCKP1 __attribute__((address(0x7DC4)));


extern volatile __bit SCKP2 __attribute__((address(0x7B84)));


extern volatile __bit SCL __attribute__((address(0x7C13)));


extern volatile __bit SCL1 __attribute__((address(0x7C13)));


extern volatile __bit SCL2 __attribute__((address(0x7C18)));


extern volatile __bit SCS0 __attribute__((address(0x7E98)));


extern volatile __bit SCS1 __attribute__((address(0x7E99)));


extern volatile __bit SDA __attribute__((address(0x7C14)));


extern volatile __bit SDA1 __attribute__((address(0x7C14)));


extern volatile __bit SDA2 __attribute__((address(0x7C19)));


extern volatile __bit SDI __attribute__((address(0x7C14)));


extern volatile __bit SDI1 __attribute__((address(0x7C14)));


extern volatile __bit SDI2 __attribute__((address(0x7C19)));


extern volatile __bit SDO __attribute__((address(0x7C15)));


extern volatile __bit SDO1 __attribute__((address(0x7C15)));


extern volatile __bit SDO2 __attribute__((address(0x7C1C)));


extern volatile __bit SEN1 __attribute__((address(0x7E28)));


extern volatile __bit SEN2 __attribute__((address(0x7B58)));


extern volatile __bit SENDB1 __attribute__((address(0x7D63)));


extern volatile __bit SENDB2 __attribute__((address(0x7B93)));


extern volatile __bit SLRA __attribute__((address(0x7B00)));


extern volatile __bit SLRB __attribute__((address(0x7B01)));


extern volatile __bit SLRC __attribute__((address(0x7B02)));


extern volatile __bit SLRD __attribute__((address(0x7B03)));


extern volatile __bit SLRE __attribute__((address(0x7B04)));


extern volatile __bit SMP1 __attribute__((address(0x7E3F)));


extern volatile __bit SMP2 __attribute__((address(0x7B6F)));


extern volatile __bit SOSCEN __attribute__((address(0x7E6B)));


extern volatile __bit SOSCEN3 __attribute__((address(0x7D8B)));


extern volatile __bit SOSCEN5 __attribute__((address(0x7A73)));


extern volatile __bit SOSCGO __attribute__((address(0x7E93)));


extern volatile __bit SOSCRUN __attribute__((address(0x7E96)));


extern volatile __bit SP0 __attribute__((address(0x7FE0)));


extern volatile __bit SP1 __attribute__((address(0x7FE1)));


extern volatile __bit SP2 __attribute__((address(0x7FE2)));


extern volatile __bit SP3 __attribute__((address(0x7FE3)));


extern volatile __bit SP4 __attribute__((address(0x7FE4)));


extern volatile __bit SPEN1 __attribute__((address(0x7D5F)));


extern volatile __bit SPEN2 __attribute__((address(0x7B8F)));


extern volatile __bit SPI1MD __attribute__((address(0x79F9)));


extern volatile __bit SPI2MD __attribute__((address(0x79FA)));


extern volatile __bit SRCLK0 __attribute__((address(0x7A3C)));


extern volatile __bit SRCLK1 __attribute__((address(0x7A3D)));


extern volatile __bit SRCLK2 __attribute__((address(0x7A3E)));


extern volatile __bit SREN1 __attribute__((address(0x7D5D)));


extern volatile __bit SREN2 __attribute__((address(0x7B8D)));


extern volatile __bit SRENA __attribute__((address(0x7D5D)));


extern volatile __bit SRI __attribute__((address(0x7C08)));


extern volatile __bit SRLEN __attribute__((address(0x7A3F)));


extern volatile __bit SRNQ __attribute__((address(0x7C05)));


extern volatile __bit SRNQEN __attribute__((address(0x7A3A)));


extern volatile __bit SRPR __attribute__((address(0x7A38)));


extern volatile __bit SRPS __attribute__((address(0x7A39)));


extern volatile __bit SRQ __attribute__((address(0x7C04)));


extern volatile __bit SRQEN __attribute__((address(0x7A3B)));


extern volatile __bit SRRC1E __attribute__((address(0x7A30)));


extern volatile __bit SRRC2E __attribute__((address(0x7A31)));


extern volatile __bit SRRCKE __attribute__((address(0x7A32)));


extern volatile __bit SRRPE __attribute__((address(0x7A33)));


extern volatile __bit SRSC1E __attribute__((address(0x7A34)));


extern volatile __bit SRSC2E __attribute__((address(0x7A35)));


extern volatile __bit SRSCKE __attribute__((address(0x7A36)));


extern volatile __bit SRSPE __attribute__((address(0x7A37)));


extern volatile __bit SS __attribute__((address(0x7C05)));


extern volatile __bit SS1 __attribute__((address(0x7C05)));


extern volatile __bit SS2 __attribute__((address(0x7C1B)));


extern volatile __bit SSP1IE __attribute__((address(0x7CEB)));


extern volatile __bit SSP1IF __attribute__((address(0x7CF3)));


extern volatile __bit SSP1IP __attribute__((address(0x7CFB)));


extern volatile __bit SSP2IE __attribute__((address(0x7D1F)));


extern volatile __bit SSP2IF __attribute__((address(0x7D27)));


extern volatile __bit SSP2IP __attribute__((address(0x7D2F)));


extern volatile __bit SSPEN1 __attribute__((address(0x7E35)));


extern volatile __bit SSPEN2 __attribute__((address(0x7B65)));


extern volatile __bit SSPIE __attribute__((address(0x7CEB)));


extern volatile __bit SSPIF __attribute__((address(0x7CF3)));


extern volatile __bit SSPIP __attribute__((address(0x7CFB)));


extern volatile __bit SSPM01 __attribute__((address(0x7E30)));


extern volatile __bit SSPM02 __attribute__((address(0x7B60)));


extern volatile __bit SSPM11 __attribute__((address(0x7E31)));


extern volatile __bit SSPM12 __attribute__((address(0x7B61)));


extern volatile __bit SSPM21 __attribute__((address(0x7E32)));


extern volatile __bit SSPM22 __attribute__((address(0x7B62)));


extern volatile __bit SSPM31 __attribute__((address(0x7E33)));


extern volatile __bit SSPM32 __attribute__((address(0x7B63)));


extern volatile __bit SSPOV1 __attribute__((address(0x7E36)));


extern volatile __bit SSPOV2 __attribute__((address(0x7B66)));


extern volatile __bit START __attribute__((address(0x7E3B)));


extern volatile __bit START1 __attribute__((address(0x7E3B)));


extern volatile __bit START2 __attribute__((address(0x7B6B)));


extern volatile __bit STKFUL __attribute__((address(0x7FE7)));


extern volatile __bit STKOVF __attribute__((address(0x7FE7)));


extern volatile __bit STKPTR0 __attribute__((address(0x7FE0)));


extern volatile __bit STKPTR1 __attribute__((address(0x7FE1)));


extern volatile __bit STKPTR2 __attribute__((address(0x7FE2)));


extern volatile __bit STKPTR3 __attribute__((address(0x7FE3)));


extern volatile __bit STKPTR4 __attribute__((address(0x7FE4)));


extern volatile __bit STKUNF __attribute__((address(0x7FE6)));


extern volatile __bit STOP __attribute__((address(0x7E3C)));


extern volatile __bit STOP1 __attribute__((address(0x7E3C)));


extern volatile __bit STOP2 __attribute__((address(0x7B6C)));


extern volatile __bit STR1A __attribute__((address(0x7DC8)));


extern volatile __bit STR1B __attribute__((address(0x7DC9)));


extern volatile __bit STR1C __attribute__((address(0x7DCA)));


extern volatile __bit STR1D __attribute__((address(0x7DCB)));


extern volatile __bit STR1SYNC __attribute__((address(0x7DCC)));


extern volatile __bit STR2A __attribute__((address(0x7B18)));


extern volatile __bit STR2B __attribute__((address(0x7B19)));


extern volatile __bit STR2C __attribute__((address(0x7B1A)));


extern volatile __bit STR2D __attribute__((address(0x7B1B)));


extern volatile __bit STR2SYNC __attribute__((address(0x7B1C)));


extern volatile __bit STR3A __attribute__((address(0x7AD0)));


extern volatile __bit STR3B __attribute__((address(0x7AD1)));


extern volatile __bit STR3C __attribute__((address(0x7AD2)));


extern volatile __bit STR3D __attribute__((address(0x7AD3)));


extern volatile __bit STR3SYNC __attribute__((address(0x7AD4)));


extern volatile __bit STRA __attribute__((address(0x7DC8)));


extern volatile __bit STRA2 __attribute__((address(0x7B18)));


extern volatile __bit STRA3 __attribute__((address(0x7AD0)));


extern volatile __bit STRB __attribute__((address(0x7DC9)));


extern volatile __bit STRB2 __attribute__((address(0x7B19)));


extern volatile __bit STRB3 __attribute__((address(0x7AD1)));


extern volatile __bit STRC __attribute__((address(0x7DCA)));


extern volatile __bit STRC2 __attribute__((address(0x7B1A)));


extern volatile __bit STRC3 __attribute__((address(0x7AD2)));


extern volatile __bit STRD __attribute__((address(0x7DCB)));


extern volatile __bit STRD2 __attribute__((address(0x7B1B)));


extern volatile __bit STRD3 __attribute__((address(0x7AD3)));


extern volatile __bit STRSYNC __attribute__((address(0x7DCC)));


extern volatile __bit STRSYNC2 __attribute__((address(0x7B1C)));


extern volatile __bit STRSYNC3 __attribute__((address(0x7AD4)));


extern volatile __bit SWDTE __attribute__((address(0x7E88)));


extern volatile __bit SWDTEN __attribute__((address(0x7E88)));


extern volatile __bit SYNC1 __attribute__((address(0x7D64)));


extern volatile __bit SYNC2 __attribute__((address(0x7B94)));


extern volatile __bit T08BIT __attribute__((address(0x7EAE)));


extern volatile __bit T0CKI __attribute__((address(0x7C04)));


extern volatile __bit T0CS __attribute__((address(0x7EAD)));


extern volatile __bit T0IE __attribute__((address(0x7F95)));


extern volatile __bit T0IF __attribute__((address(0x7F92)));


extern volatile __bit T0PS0 __attribute__((address(0x7EA8)));


extern volatile __bit T0PS1 __attribute__((address(0x7EA9)));


extern volatile __bit T0PS2 __attribute__((address(0x7EAA)));


extern volatile __bit T0SE __attribute__((address(0x7EAC)));


extern volatile __bit T1CKI __attribute__((address(0x7C10)));


extern volatile __bit T1CKPS0 __attribute__((address(0x7E6C)));


extern volatile __bit T1CKPS1 __attribute__((address(0x7E6D)));


extern volatile __bit T1G __attribute__((address(0x7C0D)));


extern volatile __bit T1GGO __attribute__((address(0x7E63)));


extern volatile __bit T1GGO_NOT_DONE __attribute__((address(0x7E63)));


extern volatile __bit T1GGO_nDONE __attribute__((address(0x7E63)));


extern volatile __bit T1GPOL __attribute__((address(0x7E66)));


extern volatile __bit T1GSPM __attribute__((address(0x7E64)));


extern volatile __bit T1GSS0 __attribute__((address(0x7E60)));


extern volatile __bit T1GSS1 __attribute__((address(0x7E61)));


extern volatile __bit T1GTM __attribute__((address(0x7E65)));


extern volatile __bit T1GVAL __attribute__((address(0x7E62)));


extern volatile __bit T1G_DONE __attribute__((address(0x7E63)));


extern volatile __bit T1OSCEN __attribute__((address(0x7E6B)));


extern volatile __bit T1OSI __attribute__((address(0x7C11)));


extern volatile __bit T1OSO __attribute__((address(0x7C10)));


extern volatile __bit T1RD16 __attribute__((address(0x7E69)));


extern volatile __bit T1SOSCEN __attribute__((address(0x7E6B)));


extern volatile __bit T1SYNC __attribute__((address(0x7E6A)));


extern volatile __bit T2CKPS0 __attribute__((address(0x7DD0)));


extern volatile __bit T2CKPS1 __attribute__((address(0x7DD1)));


extern volatile __bit T2OUTPS0 __attribute__((address(0x7DD3)));


extern volatile __bit T2OUTPS1 __attribute__((address(0x7DD4)));


extern volatile __bit T2OUTPS2 __attribute__((address(0x7DD5)));


extern volatile __bit T2OUTPS3 __attribute__((address(0x7DD6)));


extern volatile __bit T3CKPS0 __attribute__((address(0x7D8C)));


extern volatile __bit T3CKPS1 __attribute__((address(0x7D8D)));


extern volatile __bit T3G __attribute__((address(0x7C10)));


extern volatile __bit T3GGO __attribute__((address(0x7DA3)));


extern volatile __bit T3GGO_NOT_DONE __attribute__((address(0x7DA3)));


extern volatile __bit T3GGO_nDONE __attribute__((address(0x7DA3)));


extern volatile __bit T3GPOL __attribute__((address(0x7DA6)));


extern volatile __bit T3GSPM __attribute__((address(0x7DA4)));


extern volatile __bit T3GSS0 __attribute__((address(0x7DA0)));


extern volatile __bit T3GSS1 __attribute__((address(0x7DA1)));


extern volatile __bit T3GTM __attribute__((address(0x7DA5)));


extern volatile __bit T3GVAL __attribute__((address(0x7DA2)));


extern volatile __bit T3G_DONE __attribute__((address(0x7DA3)));


extern volatile __bit T3OSCEN __attribute__((address(0x7D8B)));


extern volatile __bit T3RD16 __attribute__((address(0x7D89)));


extern volatile __bit T3SOSCEN __attribute__((address(0x7D8B)));


extern volatile __bit T4CKPS0 __attribute__((address(0x7A88)));


extern volatile __bit T4CKPS1 __attribute__((address(0x7A89)));


extern volatile __bit T4OUTPS0 __attribute__((address(0x7A8B)));


extern volatile __bit T4OUTPS1 __attribute__((address(0x7A8C)));


extern volatile __bit T4OUTPS2 __attribute__((address(0x7A8D)));


extern volatile __bit T4OUTPS3 __attribute__((address(0x7A8E)));


extern volatile __bit T5CKI __attribute__((address(0x7C12)));


extern volatile __bit T5CKPS0 __attribute__((address(0x7A74)));


extern volatile __bit T5CKPS1 __attribute__((address(0x7A75)));


extern volatile __bit T5G __attribute__((address(0x7C0C)));


extern volatile __bit T5GGO __attribute__((address(0x7A6B)));


extern volatile __bit T5GGO_NOT_DONE __attribute__((address(0x7A6B)));


extern volatile __bit T5GGO_nDONE __attribute__((address(0x7A6B)));


extern volatile __bit T5GPOL __attribute__((address(0x7A6E)));


extern volatile __bit T5GSPM __attribute__((address(0x7A6C)));


extern volatile __bit T5GSS0 __attribute__((address(0x7A68)));


extern volatile __bit T5GSS1 __attribute__((address(0x7A69)));


extern volatile __bit T5GTM __attribute__((address(0x7A6D)));


extern volatile __bit T5GVAL __attribute__((address(0x7A6A)));


extern volatile __bit T5G_DONE __attribute__((address(0x7A6B)));


extern volatile __bit T5RD16 __attribute__((address(0x7A71)));


extern volatile __bit T5SOSCEN __attribute__((address(0x7A73)));


extern volatile __bit T5SYNC __attribute__((address(0x7A72)));


extern volatile __bit T6CKPS0 __attribute__((address(0x7A50)));


extern volatile __bit T6CKPS1 __attribute__((address(0x7A51)));


extern volatile __bit T6OUTPS0 __attribute__((address(0x7A53)));


extern volatile __bit T6OUTPS1 __attribute__((address(0x7A54)));


extern volatile __bit T6OUTPS2 __attribute__((address(0x7A55)));


extern volatile __bit T6OUTPS3 __attribute__((address(0x7A56)));


extern volatile __bit TGEN __attribute__((address(0x7A2C)));


extern volatile __bit TMR0IE __attribute__((address(0x7F95)));


extern volatile __bit TMR0IF __attribute__((address(0x7F92)));


extern volatile __bit TMR0IP __attribute__((address(0x7F8A)));


extern volatile __bit TMR0ON __attribute__((address(0x7EAF)));


extern volatile __bit TMR1CS0 __attribute__((address(0x7E6E)));


extern volatile __bit TMR1CS1 __attribute__((address(0x7E6F)));


extern volatile __bit TMR1GE __attribute__((address(0x7E67)));


extern volatile __bit TMR1GIE __attribute__((address(0x7D18)));


extern volatile __bit TMR1GIF __attribute__((address(0x7D20)));


extern volatile __bit TMR1GIP __attribute__((address(0x7D28)));


extern volatile __bit TMR1IE __attribute__((address(0x7CE8)));


extern volatile __bit TMR1IF __attribute__((address(0x7CF0)));


extern volatile __bit TMR1IP __attribute__((address(0x7CF8)));


extern volatile __bit TMR1MD __attribute__((address(0x79F8)));


extern volatile __bit TMR1ON __attribute__((address(0x7E68)));


extern volatile __bit TMR2IE __attribute__((address(0x7CE9)));


extern volatile __bit TMR2IF __attribute__((address(0x7CF1)));


extern volatile __bit TMR2IP __attribute__((address(0x7CF9)));


extern volatile __bit TMR2MD __attribute__((address(0x79F9)));


extern volatile __bit TMR2ON __attribute__((address(0x7DD2)));


extern volatile __bit TMR3CS0 __attribute__((address(0x7D8E)));


extern volatile __bit TMR3CS1 __attribute__((address(0x7D8F)));


extern volatile __bit TMR3GE __attribute__((address(0x7DA7)));


extern volatile __bit TMR3GIE __attribute__((address(0x7D19)));


extern volatile __bit TMR3GIF __attribute__((address(0x7D21)));


extern volatile __bit TMR3GIP __attribute__((address(0x7D29)));


extern volatile __bit TMR3IE __attribute__((address(0x7D01)));


extern volatile __bit TMR3IF __attribute__((address(0x7D09)));


extern volatile __bit TMR3IP __attribute__((address(0x7D11)));


extern volatile __bit TMR3MD __attribute__((address(0x79FA)));


extern volatile __bit TMR3ON __attribute__((address(0x7D88)));


extern volatile __bit TMR4IE __attribute__((address(0x7BE8)));


extern volatile __bit TMR4IF __attribute__((address(0x7BF0)));


extern volatile __bit TMR4IP __attribute__((address(0x7BF8)));


extern volatile __bit TMR4MD __attribute__((address(0x79FB)));


extern volatile __bit TMR4ON __attribute__((address(0x7A8A)));


extern volatile __bit TMR5CS0 __attribute__((address(0x7A76)));


extern volatile __bit TMR5CS1 __attribute__((address(0x7A77)));


extern volatile __bit TMR5GE __attribute__((address(0x7A6F)));


extern volatile __bit TMR5GIE __attribute__((address(0x7D1A)));


extern volatile __bit TMR5GIF __attribute__((address(0x7D22)));


extern volatile __bit TMR5GIP __attribute__((address(0x7D2A)));


extern volatile __bit TMR5IE __attribute__((address(0x7BE9)));


extern volatile __bit TMR5IF __attribute__((address(0x7BF1)));


extern volatile __bit TMR5IP __attribute__((address(0x7BF9)));


extern volatile __bit TMR5MD __attribute__((address(0x79FC)));


extern volatile __bit TMR5ON __attribute__((address(0x7A70)));


extern volatile __bit TMR6IE __attribute__((address(0x7BEA)));


extern volatile __bit TMR6IF __attribute__((address(0x7BF2)));


extern volatile __bit TMR6IP __attribute__((address(0x7BFA)));


extern volatile __bit TMR6MD __attribute__((address(0x79FD)));


extern volatile __bit TMR6ON __attribute__((address(0x7A52)));


extern volatile __bit TO __attribute__((address(0x7E83)));


extern volatile __bit TRIGSEL __attribute__((address(0x7E0F)));


extern volatile __bit TRISA0 __attribute__((address(0x7C90)));


extern volatile __bit TRISA1 __attribute__((address(0x7C91)));


extern volatile __bit TRISA2 __attribute__((address(0x7C92)));


extern volatile __bit TRISA3 __attribute__((address(0x7C93)));


extern volatile __bit TRISA4 __attribute__((address(0x7C94)));


extern volatile __bit TRISA5 __attribute__((address(0x7C95)));


extern volatile __bit TRISA6 __attribute__((address(0x7C96)));


extern volatile __bit TRISA7 __attribute__((address(0x7C97)));


extern volatile __bit TRISB0 __attribute__((address(0x7C98)));


extern volatile __bit TRISB1 __attribute__((address(0x7C99)));


extern volatile __bit TRISB2 __attribute__((address(0x7C9A)));


extern volatile __bit TRISB3 __attribute__((address(0x7C9B)));


extern volatile __bit TRISB4 __attribute__((address(0x7C9C)));


extern volatile __bit TRISB5 __attribute__((address(0x7C9D)));


extern volatile __bit TRISB6 __attribute__((address(0x7C9E)));


extern volatile __bit TRISB7 __attribute__((address(0x7C9F)));


extern volatile __bit TRISC0 __attribute__((address(0x7CA0)));


extern volatile __bit TRISC1 __attribute__((address(0x7CA1)));


extern volatile __bit TRISC2 __attribute__((address(0x7CA2)));


extern volatile __bit TRISC3 __attribute__((address(0x7CA3)));


extern volatile __bit TRISC4 __attribute__((address(0x7CA4)));


extern volatile __bit TRISC5 __attribute__((address(0x7CA5)));


extern volatile __bit TRISC6 __attribute__((address(0x7CA6)));


extern volatile __bit TRISC7 __attribute__((address(0x7CA7)));


extern volatile __bit TRISD0 __attribute__((address(0x7CA8)));


extern volatile __bit TRISD1 __attribute__((address(0x7CA9)));


extern volatile __bit TRISD2 __attribute__((address(0x7CAA)));


extern volatile __bit TRISD3 __attribute__((address(0x7CAB)));


extern volatile __bit TRISD4 __attribute__((address(0x7CAC)));


extern volatile __bit TRISD5 __attribute__((address(0x7CAD)));


extern volatile __bit TRISD6 __attribute__((address(0x7CAE)));


extern volatile __bit TRISD7 __attribute__((address(0x7CAF)));


extern volatile __bit TRISE0 __attribute__((address(0x7CB0)));


extern volatile __bit TRISE1 __attribute__((address(0x7CB1)));


extern volatile __bit TRISE2 __attribute__((address(0x7CB2)));


extern volatile __bit TRMT1 __attribute__((address(0x7D61)));


extern volatile __bit TRMT2 __attribute__((address(0x7B91)));


extern volatile __bit TUN0 __attribute__((address(0x7CD8)));


extern volatile __bit TUN1 __attribute__((address(0x7CD9)));


extern volatile __bit TUN2 __attribute__((address(0x7CDA)));


extern volatile __bit TUN3 __attribute__((address(0x7CDB)));


extern volatile __bit TUN4 __attribute__((address(0x7CDC)));


extern volatile __bit TUN5 __attribute__((address(0x7CDD)));


extern volatile __bit TX __attribute__((address(0x7C16)));


extern volatile __bit TX1 __attribute__((address(0x7C16)));


extern volatile __bit TX1IE __attribute__((address(0x7CEC)));


extern volatile __bit TX1IF __attribute__((address(0x7CF4)));


extern volatile __bit TX1IP __attribute__((address(0x7CFC)));


extern volatile __bit TX2 __attribute__((address(0x7C1E)));


extern volatile __bit TX2IE __attribute__((address(0x7D1C)));


extern volatile __bit TX2IF __attribute__((address(0x7D24)));


extern volatile __bit TX2IP __attribute__((address(0x7D2C)));


extern volatile __bit TX8_9 __attribute__((address(0x7D66)));


extern volatile __bit TX8_92 __attribute__((address(0x7B96)));


extern volatile __bit TX91 __attribute__((address(0x7D66)));


extern volatile __bit TX92 __attribute__((address(0x7B96)));


extern volatile __bit TX9D1 __attribute__((address(0x7D60)));


extern volatile __bit TX9D2 __attribute__((address(0x7B90)));


extern volatile __bit TXB0IE __attribute__((address(0x7D1A)));


extern volatile __bit TXB1IE __attribute__((address(0x7D1B)));


extern volatile __bit TXB2IE __attribute__((address(0x7D1C)));


extern volatile __bit TXBNIE __attribute__((address(0x7D1C)));


extern volatile __bit TXBNIF __attribute__((address(0x7D24)));


extern volatile __bit TXBNIP __attribute__((address(0x7D2C)));


extern volatile __bit TXCKP __attribute__((address(0x7DC4)));


extern volatile __bit TXCKP1 __attribute__((address(0x7DC4)));


extern volatile __bit TXCKP2 __attribute__((address(0x7B84)));


extern volatile __bit TXD8 __attribute__((address(0x7D60)));


extern volatile __bit TXD82 __attribute__((address(0x7B90)));


extern volatile __bit TXEN1 __attribute__((address(0x7D65)));


extern volatile __bit TXEN2 __attribute__((address(0x7B95)));


extern volatile __bit TXIE __attribute__((address(0x7CEC)));


extern volatile __bit TXIF __attribute__((address(0x7CF4)));


extern volatile __bit TXIP __attribute__((address(0x7CFC)));


extern volatile __bit UA1 __attribute__((address(0x7E39)));


extern volatile __bit UA2 __attribute__((address(0x7B69)));


extern volatile __bit UART1MD __attribute__((address(0x79FE)));


extern volatile __bit UART2MD __attribute__((address(0x79FF)));


extern volatile __bit ULPWUIN __attribute__((address(0x7C00)));


extern volatile __bit VDIRMAG __attribute__((address(0x7CE7)));


extern volatile __bit VPP __attribute__((address(0x7C23)));


extern volatile __bit VREFM __attribute__((address(0x7C02)));


extern volatile __bit VREFN __attribute__((address(0x7C02)));


extern volatile __bit VREFP __attribute__((address(0x7C03)));


extern volatile __bit W4E __attribute__((address(0x7DC1)));


extern volatile __bit WCOL1 __attribute__((address(0x7E37)));


extern volatile __bit WCOL2 __attribute__((address(0x7B67)));


extern volatile __bit WPUB0 __attribute__((address(0x7B08)));


extern volatile __bit WPUB1 __attribute__((address(0x7B09)));


extern volatile __bit WPUB2 __attribute__((address(0x7B0A)));


extern volatile __bit WPUB3 __attribute__((address(0x7B0B)));


extern volatile __bit WPUB4 __attribute__((address(0x7B0C)));


extern volatile __bit WPUB5 __attribute__((address(0x7B0D)));


extern volatile __bit WPUB6 __attribute__((address(0x7B0E)));


extern volatile __bit WPUB7 __attribute__((address(0x7B0F)));


extern volatile __bit WPUE3 __attribute__((address(0x7CB7)));


extern volatile __bit WR __attribute__((address(0x7D31)));


extern volatile __bit WRE __attribute__((address(0x7C21)));


extern volatile __bit WREN __attribute__((address(0x7D32)));


extern volatile __bit WRERR __attribute__((address(0x7D33)));


extern volatile __bit WUE1 __attribute__((address(0x7DC1)));


extern volatile __bit WUE2 __attribute__((address(0x7B81)));


extern volatile __bit ZERO __attribute__((address(0x7EC2)));


extern volatile __bit nA2 __attribute__((address(0x7B6D)));


extern volatile __bit nADDRESS2 __attribute__((address(0x7B6D)));


extern volatile __bit nBOR __attribute__((address(0x7E80)));


extern volatile __bit nDONE __attribute__((address(0x7E11)));


extern volatile __bit nMCLR __attribute__((address(0x7C23)));


extern volatile __bit nPD __attribute__((address(0x7E82)));


extern volatile __bit nPOR __attribute__((address(0x7E81)));


extern volatile __bit nRBPU __attribute__((address(0x7F8F)));


extern volatile __bit nRI __attribute__((address(0x7E84)));


extern volatile __bit nSS __attribute__((address(0x7C05)));


extern volatile __bit nSS1 __attribute__((address(0x7C05)));


extern volatile __bit nSS2 __attribute__((address(0x7C1B)));


extern volatile __bit nT1SYNC __attribute__((address(0x7E6A)));


extern volatile __bit nT3SYNC __attribute__((address(0x7D8A)));


extern volatile __bit nT5SYNC __attribute__((address(0x7A72)));


extern volatile __bit nTO __attribute__((address(0x7E83)));


extern volatile __bit nW2 __attribute__((address(0x7B6A)));


extern volatile __bit nWRITE2 __attribute__((address(0x7B6A)));
# 779 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18_chip_select.h" 2 3
# 8 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18.h" 2 3
# 18 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18.h" 3
__attribute__((__unsupported__("The " "flash_write" " routine is no longer supported. Please use the MPLAB X MCC."))) void flash_write(const unsigned char *, unsigned int, __far unsigned char *);
__attribute__((__unsupported__("The " "EraseFlash" " routine is no longer supported. Please use the MPLAB X MCC."))) void EraseFlash(unsigned long startaddr, unsigned long endaddr);







# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\errata.h" 1 3
# 26 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18.h" 2 3
# 49 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18.h" 3
#pragma intrinsic(__nop)
extern void __nop(void);
# 158 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18.h" 3
__attribute__((__unsupported__("The " "Read_b_eep" " routine is no longer supported. Please use the MPLAB X MCC."))) unsigned char Read_b_eep(unsigned int badd);
__attribute__((__unsupported__("The " "Busy_eep" " routine is no longer supported. Please use the MPLAB X MCC."))) void Busy_eep(void);
__attribute__((__unsupported__("The " "Write_b_eep" " routine is no longer supported. Please use the MPLAB X MCC."))) void Write_b_eep(unsigned int badd, unsigned char bdat);
# 178 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\pic18.h" 3
unsigned char __t1rd16on(void);
unsigned char __t3rd16on(void);






#pragma intrinsic(_delay)
extern __attribute__((nonreentrant)) void _delay(unsigned long);
#pragma intrinsic(_delaywdt)
extern __attribute__((nonreentrant)) void _delaywdt(unsigned long);
#pragma intrinsic(_delay3)
extern __attribute__((nonreentrant)) void _delay3(unsigned char);
# 32 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 2 3
# 7 "main_u6.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdio.h" 1 3
# 24 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdio.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 1 3





typedef void * va_list[1];




typedef void * __isoc_va_list[1];
# 137 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long ssize_t;
# 246 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long off_t;
# 399 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef struct _IO_FILE FILE;
# 24 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdio.h" 2 3
# 52 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdio.h" 3
typedef union _G_fpos64_t {
 char __opaque[16];
 double __align;
} fpos_t;

extern FILE *const stdin;
extern FILE *const stdout;
extern FILE *const stderr;





FILE *fopen(const char *restrict, const char *restrict);
FILE *freopen(const char *restrict, const char *restrict, FILE *restrict);
int fclose(FILE *);

int remove(const char *);
int rename(const char *, const char *);

int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
void clearerr(FILE *);

int fseek(FILE *, long, int);
long ftell(FILE *);
void rewind(FILE *);

int fgetpos(FILE *restrict, fpos_t *restrict);
int fsetpos(FILE *, const fpos_t *);

size_t fread(void *restrict, size_t, size_t, FILE *restrict);
size_t fwrite(const void *restrict, size_t, size_t, FILE *restrict);

int fgetc(FILE *);
int getc(FILE *);
int getchar(void);
int ungetc(int, FILE *);

int fputc(int, FILE *);
int putc(int, FILE *);
int putchar(int);

char *fgets(char *restrict, int, FILE *restrict);

char *gets(char *);


int fputs(const char *restrict, FILE *restrict);
int puts(const char *);

#pragma printf_check(printf) const
#pragma printf_check(vprintf) const
#pragma printf_check(sprintf) const
#pragma printf_check(snprintf) const
#pragma printf_check(vsprintf) const
#pragma printf_check(vsnprintf) const

int printf(const char *restrict, ...);
int fprintf(FILE *restrict, const char *restrict, ...);
int sprintf(char *restrict, const char *restrict, ...);
int snprintf(char *restrict, size_t, const char *restrict, ...);

int vprintf(const char *restrict, __isoc_va_list);
int vfprintf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsprintf(char *restrict, const char *restrict, __isoc_va_list);
int vsnprintf(char *restrict, size_t, const char *restrict, __isoc_va_list);

int scanf(const char *restrict, ...);
int fscanf(FILE *restrict, const char *restrict, ...);
int sscanf(const char *restrict, const char *restrict, ...);
int vscanf(const char *restrict, __isoc_va_list);
int vfscanf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsscanf(const char *restrict, const char *restrict, __isoc_va_list);

void perror(const char *);

int setvbuf(FILE *restrict, char *restrict, int, size_t);
void setbuf(FILE *restrict, char *restrict);

char *tmpnam(char *);
FILE *tmpfile(void);




FILE *fmemopen(void *restrict, size_t, const char *restrict);
FILE *open_memstream(char **, size_t *);
FILE *fdopen(int, const char *);
FILE *popen(const char *, const char *);
int pclose(FILE *);
int fileno(FILE *);
int fseeko(FILE *, off_t, int);
off_t ftello(FILE *);
int dprintf(int, const char *restrict, ...);
int vdprintf(int, const char *restrict, __isoc_va_list);
void flockfile(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);
ssize_t getdelim(char **restrict, size_t *restrict, int, FILE *restrict);
ssize_t getline(char **restrict, size_t *restrict, FILE *restrict);
int renameat(int, const char *, int, const char *);
char *ctermid(char *);







char *tempnam(const char *, const char *);
# 8 "main_u6.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdint.h" 1 3
# 22 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 127 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uintptr_t;
# 142 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long intptr_t;
# 158 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;
# 173 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long int32_t;





typedef long long int64_t;
# 188 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;
# 209 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 229 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 22 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdint.h" 2 3


typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 139 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/stdint.h" 1 3
typedef int32_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint32_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 139 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdint.h" 2 3
# 9 "main_u6.c" 2


# 1 "./UartIO.h" 1
# 12 "./UartIO.h"
int UART_GetChar(void);
void UART_PutChar(char);
int UART_CharAvailable(void);
void UART_PutStr(char * str);
void putch(unsigned char data);
char getch(void);
# 11 "main_u6.c" 2




volatile uint32_t sec = 0;

void __attribute__((picinterrupt(("")))) ISR(){
    static uint8_t i = 0;
    if(TMR1IE && TMR1IF) {
        i++;
        TMR1 = 0xFFFF - 50000;
        if (i == 20) {
            i = 0;
            sec++;
        }
        TMR1IF = 0;
    }
}



int main(void) {

    ANSELC = 0x00;
    TRISD = 0x00;
    TRISCbits.TRISC6 = 0;
    TRISCbits.TRISC7 = 1;


    SPBRG1 = 51;

    RCSTA1bits.SPEN = 1;
    TXSTA1bits.TXEN = 1;
    RCSTA1bits.CREN = 1;


    T1CONbits.TMR1CS = 0b00;
    T1CONbits.T1CKPS = 0b11;
    TMR1IE = 1;
    TMR1IF = 0;
    PEIE = 1;
    GIE = 1;
    TMR1ON = 1;

    while(1){
        printf("Cas: %u\n", sec);
        _delay((unsigned long)((1000)*(32E6/4000.0)));
    }

}
