
#pragma config WDTEN = OFF
#pragma config FOSC = INTIO7
#pragma config MCLRE = EXTMCLR
#pragma config FCMEN = ON


#include <xc.h>

#include <stdio.h>

#include "rev-basic.h"
#include "lcd.h"



void main(void) {
    REV_init();
    
    
    int count = 0;
    char a = 'x';
    
    
    /* main loop */ 
    while(1){
        
        
        
        printf("Count: %d (%c)\n",count,a);
        
        REV_led(2,REV_btn(1)); // ???
        
        REV_led(1,1);
        __delay_ms(50);
        REV_led(1,0);
        __delay_ms(950);
        
        count++;
        
        
        
    }
    
}

