#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <stdint.h>
#include <xc.h>

#define _XTAL_FREQ 32000000


void driveLED(char in);

void main(void) {
    
    ANSELA = 0x00;
    ANSELC = 0x00;
    
    TRISDbits.TRISD2 = 0;
    TRISDbits.TRISD3 = 0;
    TRISDbits.TRISD4 = 0;
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD6 = 0;
    TRISCbits.TRISC4 = 0;
    
    TRISCbits.TRISC0 = 1;
     
    uint8_t leds = 0b11;
    uint8_t dir = 0;
    
    while(1){
    
        driveLED(leds);
        
        if(leds == 0b110000) dir = 1;
        if(leds == 0b11) dir = 0;
        
        if(dir == 1){
            leds = (leds >> 1);
        }else if(dir == 0){
            leds = (leds << 1);
        }
        
        __delay_ms(200);
    }
    
    return;
}


void driveLED(char in){
    in = ~in;
    LATD2 = in & 1;             //LED0
    LATD3 = in & 2 ? 1 : 0;     //LED1
    LATC4 = in & 4 ? 1 : 0;     //LED2
    LATD4 = in & 8 ? 1 : 0;     //LED3
    LATD5 = in & 16 ? 1 : 0;    //LED4
    LATD6 = in & 32 ? 1 : 0;    //LED5
}
