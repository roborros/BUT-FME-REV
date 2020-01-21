
// REV-Basic 2018
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "rev-basic.h"
#include "lcd.h"


void main(void) {
    
    REV_init();
    bool flag = true;
    char count = 0;
    char text[17];
    int32_t pot1;
    int16_t pot2;
    
    
    sprintf(text,"Mechlab je bozi!");
    LCD_ShowString(1,text);
    sprintf(text,"                ");
    
    /* main loop */ 
    while(true){
        
        if (count == 100 && flag){
            count = 0;
            pot1 = (3300*pot1)>>10;
            printf("Pot1: %d [mV]\n", pot1);   
        }
        
        REV_led(2,REV_btn(1));
        REV_led(3,REV_btn(2)); 
        
        pot1 = REV_pot(1);
        pot2 = REV_pot(2);
        
        sprintf(text,"Pot2: %d",pot2);
        LCD_ShowString(2,text);
        
        if (PORTAbits.RA3){
            LCD_Clear();
        }
        
        count++;
    }
    
}


