#include <avr/io.h>

#define F_CPU 4000000UL
#include <util/delay.h>
#include <stdio.h>

#include "lcd.h"


int main(void) {
    // Nastavení pinu jako VÝSTUP (Output)
    // Pou?íváme registr DIRSET
    PORTB.DIRSET = PIN3_bm;
    
    char text[16] = "";
    
    LCD_Init();
    
    uint8_t i = 0;

    while (1) {
        
        PORTB.OUTTGL = PIN3_bm;
        
        snprintf(text, sizeof(text), "hodnota = %u  ", i++);
       
        LCD_Print(1, text);
        
        _delay_ms(500);
        
        
    }
}