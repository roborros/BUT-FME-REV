// uart
#pragma config FOSC = HSMP      // Externi oscilator
#pragma config PLLCFG = ON      // 4X PLL 
#pragma config FCMEN = ON       // Fail-Safe Clock 
#pragma config WDTEN = OFF      // Watchdog Timer OFF

#include <xc.h>             //-- pro prekladac XC8
#include <stdio.h>          //   pro printf

#include "UartIO.h"

#define _XTAL_FREQ 32E6

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
    
    char chachar;
    char muj_str[80];
    char i = 0;
           
    while(1){
        if (UART_CharAvailable()){
            chachar = UART_GetChar();
            if (chachar != 46){
                muj_str[i] = chachar;
                i++;
            }else{
                for(int k = i-1; k >= 0; k--){
                    UART_PutChar(muj_str[k]);
                }
                sprintf(muj_str, " Mechlab je bozi\n");
                UART_PutStr(muj_str);
                i = 0;
            }
        }            
    }
}

