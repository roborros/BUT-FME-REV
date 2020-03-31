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

typedef struct
{
    char data [80];
    uint8_t length;
    char full;
} message;

volatile message message_in;

void __interrupt() ISR(void)
{    
    char chachar;
    static uint8_t rx_i = 0;
    static uint8_t tx_i = 0;
    
    if(RC1IE && RC1IF) {  
        chachar = RCREG1;
        if (chachar == '.') {
            message_in.length = rx_i;
            rx_i = 0;             
            message_in.full = 1;
        } else {
            message_in.data[rx_i] = chachar;
            rx_i++;
        }        
    }
    
    if(TX1IE & TX1IF){
        TXREG1 = message_in.data[message_in.length - 1];
        if (message_in.length == 1){
            TX1IE = 0;
        } else {
            message_in.length--;
        } 
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
    
    RC1IE = 1;              // zap  preruseni od RCREG
    PEIE = 1;               // preruseni od periferii    
    GIE = 1;                // globalni preruseni
    
    char muj_str[80];
             
    while(1){
        if (message_in.full){
            message_in.full = 0;  
            
            TX1IE = 1;
            
            sprintf(muj_str, " Mechlab je bozi\n");
            UART_PutStr(muj_str); 
        }            
    }
}


