
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
    char text[17];
    int pot1,pot2;
    
    
    sprintf(text,"Mechlab je bozi!");
    LCD_ShowString(1,text);
    sprintf(text,"                ");
    
    /* main loop */ 
    while(1){
        
        
        if (count == 1){
            REV_led(1,1);
            LATBbits.LATB0 = 1;
            printf("Pot1: %d %d (%c)\n",HIGH_BYTE(pot1),LOW_BYTE(pot1),a);   
            
        }else if(count == 2){
            REV_led(1,0);
        }else if(count == 5){
            LATBbits.LATB0 = 0;
        }else if(count == 100){
            count = 0;
        }
        
        REV_led(2,REV_btn(1)); // 2ms wait
        REV_led(3,REV_btn(2)); // 2ms wait
        
        pot1 = REV_pot(1);
        pot2 = REV_pot(2);
        
        sprintf(text,"Pot: %d  %d", pot1,pot2);
        LCD_ShowString(2,text);
        
        if (REV_btn(3)){
            LCD_Clear();
        }
        
        if (REV_btn(4)){
            sprintf(text,"Mechlab je bozi!");
            LCD_ShowString(1,text);
            sprintf(text,"                ");
        }
        
        
        
        __delay_us(10000 - 8000 - 1800);
        count++; // apx. 10ms counter
        
    }
    
}

