#include <xc.h>
#include "uart.h"

void uart_init() {
    TRISCbits.RC6 = 1;
    TRISCbits.RC7 = 1;
    
    ANSELCbits.ANSC6 = 0;
    ANSELCbits.ANSC7 = 0;
    
    SPBRGH1 = 0;
    SPBRG1 = 51;
    
    // Transmitter
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
    
    RC1IE = 1;   
}

void putch(unsigned char data){
    while(!TX1IF);
    TXREG1 = data;
}