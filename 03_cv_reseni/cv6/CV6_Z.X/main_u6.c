// uart
#pragma config FOSC = HSMP      // Externi oscilator
#pragma config PLLCFG = ON      // 4X PLL 
#pragma config FCMEN = ON       // Fail-Safe Clock 
#pragma config WDTEN = OFF      // Watchdog Timer OFF

#include <xc.h>             //-- pro prekladac XC8
#include <stdio.h>          //   pro printf
#include <stdint.h>

#include "UartIO.h"

#define _XTAL_FREQ 32E6

volatile uint32_t  sec = 0;

void __interrupt() ISR(){
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


/*--------main--------*/
int main(void) {
    
    ANSELC = 0x00;          // vypnuti analogovych funkci na PORTC
    TRISD = 0x00;           // PORTD jako vystup
    TRISCbits.TRISC6 = 0;   // TX pin jako vystup
    TRISCbits.TRISC7 = 1;   // rx pin jako vstup
   
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 1
    
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
    
    // Timer 1
    T1CONbits.TMR1CS = 0b00;  // Fosc/4
    T1CONbits.T1CKPS = 0b11;
    TMR1IE = 1;
    TMR1IF = 0;
    PEIE = 1;
    GIE = 1;
    TMR1ON = 1;
    
    while(1){ 
        printf("Cas: %u\n", sec);
        __delay_ms(1000);
    }  
                
}

