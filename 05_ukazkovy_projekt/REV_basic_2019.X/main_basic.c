
// REV-Basic 2018
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <xc.h>
 
#include "rev-basic.h"
 
void main(void) {
    char count = 0;
    int i;
    char a = 'x';
 
    REV_init();
 
    for(;;){
        count++;
 
        REV_led(1,count & 1);
        REV_led(2,count & 2);
        REV_led(3,count & 4);
 
        printf("count: %d (0x%x) (%c)\n",count,count,a);
 
        __delay_ms(500);
    }
}
