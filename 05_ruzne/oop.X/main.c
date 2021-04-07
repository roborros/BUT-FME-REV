// REV
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdio.h>

#include "point.h"
#include "pid.h"

#define _XTAL_FREQ 32e6

void putch(unsigned char data);

void main(void) {
    TRISCbits.TRISC6 = 1;   // TX pin jako vstup
    TRISCbits.TRISC7 = 1;   // RX pin jako vstup
    
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 1
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
    
    stPID pid1;
    
    pid_init(&pid1, 0.5, 0.1, 24, -24, 1);
    
    NEW_POINT(p1, 10, 10);
    NEW_POINT(p2, 25, 25);
    NEW_RGB_POINT(c1, 25, 25, 100, 50, 50);
    int dist = 1;
    
    while(1)
    {
        
        p1.set(&p1 ,5 ,5);
        p2.set(&p2 , 10, 10);
        
        dist = p1.distance(&p1, &p2);
        
        p1.move(&p1, 5, 5);
        
        printf("%d\n", dist);
        printf("%d\n", c1.super.x);
        printf("%f\n", pid_step(&pid1, 10, 0));
        if (pid_step(&pid1, 10, 0) >= 24)
            pid_reset(&pid1);
        __delay_ms(1000);
    }
    
    return;
}

void putch(unsigned char data){
    while(!TX1IF);
    TXREG1 = data;
}
