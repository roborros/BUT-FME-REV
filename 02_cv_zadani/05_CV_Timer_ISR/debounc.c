// REV DEBOUNCING
#pragma config FOSC = INTIO67   // Oscillator Selection bits (Internal oscillator block)
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdint.h>

#define _XTAL_FREQ 32E6             // definice fosc pro knihovnu
#define LED1 LATDbits.LATD2         // ledka
#define LED2 LATDbits.LATD3         // ledka
#define LED3 LATCbits.LATC4         // ledka
#define BTN1 PORTCbits.RC0 
#define BTN2 PORTAbits.RA4
#define BTN3 PORTAbits.RA3
#define BTN4 PORTAbits.RA2
#define RAISING_EDGE 0b01111111
#define FALLING_EDGE 0b10000000


typedef struct {
    char btn1_acc;
    char btn1_stat;
    
    char btn2_acc;
    char btn2_stat;
    
    char btn3_acc;
    char btn3_stat;
    
    char btn4_acc;
    char btn4_stat;
}btn_filter_t;


volatile btn_filter_t buttons = {0, 0};

void __interrupt(low_priority) ISR_HANDLER(void){
     
    if (TMR2IF && TMR2IE ){             // kontrola priznaku IF (interrupt flag) a IE (interrupt enabled)  
        
        LATB5 = 1;
        
        buttons.btn1_acc<<=1;
        buttons.btn1_acc |= BTN1;
        
        buttons.btn2_acc<<=1;
        buttons.btn2_acc |= BTN2;
        
        buttons.btn3_acc<<=1;
        buttons.btn3_acc |= BTN3;
        
        buttons.btn4_acc<<=1;
        buttons.btn4_acc |= BTN4;
        
        if(buttons.btn1_acc == RAISING_EDGE){
           buttons.btn1_stat = 1; 
        }
        if(buttons.btn2_acc == RAISING_EDGE){
           buttons.btn2_stat = 1; 
        }
        if(buttons.btn3_acc == FALLING_EDGE){
           buttons.btn3_stat = 1; 
        }
        if(buttons.btn4_acc == FALLING_EDGE){
           buttons.btn4_stat = 1; 
        }
        
        LATB5 = 0;
        TMR2IF = 0;                     // smazani IF
    }
}


void driveLED(char in);

void init(void){
    
    OSCCONbits.IRCF = 0b111;
    OSCTUNEbits.PLLEN = 1;
    while(!OSCCONbits.HFIOFS){};
    
    
    TRISD   = 0x00;
    TRISC   = 0x00;
    TRISB   = 0x00;
    ANSELA  = 0x00;
    
    TRISCbits.RC0 = 1;
    TRISAbits.RA4 = 1;
    TRISAbits.RA3 = 1;
    TRISAbits.RA2 = 1;
    
    T2CONbits.T2CKPS = 0b11;        // zdroj casovace 1
    T2CONbits.T2OUTPS = 0b1111;     // nastaveni delicky  
    PR2 = 250;                      // nastaveni period reg
    IPR1bits.TMR2IP = 0;            // low priority
    TMR2IE = 1;                     // povoleni preruseni pro TMR1
    TMR2IF = 0;                     // smazani priznaku (pro jistotu)
    PEIE = 1;                       // povoleni preruseni od periferii
    TMR2ON = 1;                     // spusteni TMR1
    GIE = 1;                        // globalni povoleni preruseni
}

void main(void) {
    init();     // provedeni inicializace
    char value = 0b11111111;
    while(1){
        if(buttons.btn1_stat){
            value ^= 0xFF;
            driveLED(value);
            buttons.btn1_stat = 0;
        };
        if(buttons.btn2_stat){
            LED1 ^= 1;
            buttons.btn2_stat = 0;
        };
        if(buttons.btn3_stat){
            LED2 ^= 1;
            
            buttons.btn3_stat = 0;
        };
        if(buttons.btn4_stat){
            LED3 ^= 1;
            buttons.btn4_stat = 0;
        };
    }
}

void driveLED(char in){
    LATD2 = in & 1;             //LED0
    LATD3 = in & 2 ? 1 : 0;     //LED1
    LATC4 = in & 4 ? 1 : 0;     //LED2
    LATD4 = in & 8 ? 1 : 0;     //LED3
    LATD5 = in & 16 ? 1 : 0;    //LED4
    LATD6 = in & 32 ? 1 : 0;    //LED5
}

