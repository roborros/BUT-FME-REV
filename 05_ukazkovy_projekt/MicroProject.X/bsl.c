#include "bsl.h"

void init_gpio(void){

    // vypnu analogove funkce pro input
    ANSELA = 0x00;
    ANSELC = 0x00;
    
    // ledky
    TRISDbits.TRISD2 = 0;
    TRISDbits.TRISD3 = 0;
    TRISCbits.TRISC4 = 0;
    TRISDbits.TRISD4 = 0;
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD6 = 0;
    
    // knofliky
    TRISAbits.TRISA4 = 1;
    TRISAbits.TRISA3 = 1;
    TRISAbits.TRISA2 = 1;
    TRISCbits.TRISC0 = 1;
    
    // zhasnu ledky
    LED1 = 1;
    LED2 = 1;
    LED3 = 1;
    LED4 = 1;
    LED5 = 1;
    LED6 = 1;
    
}

void init_tmr1(void){

    T1CONbits.TMR1CS = 0b00;        // zdroj casovace 1
    T1CONbits.T1CKPS = 0b11;        // nastaveni delicky                                             
    TMR1IE = 1;                     // povoleni preruseni pro TMR1
    TMR1IF = 0;                     // smazani priznaku (pro jistotu)
}

void drive_leds(char in){
    
    in = ~in;
    LATD2 = in & 1;             //LED0
    LATD3 = in & 2 ? 1 : 0;     //LED1
    LATC4 = in & 4 ? 1 : 0;     //LED2
    LATD4 = in & 8 ? 1 : 0;     //LED3
    LATD5 = in & 16 ? 1 : 0;    //LED4
    LATD6 = in & 32 ? 1 : 0;    //LED5
    
}