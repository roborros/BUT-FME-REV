#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

int main(void) {
    
    PORTB.DIRSET = PIN3_bm;
    PORTB.DIRCLR = PIN2_bm;
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm;
  
    while(1){
        
        if(!(PORTB.IN & PIN2_bm)){
            
            PORTB.OUTTGL = PIN3_bm;
        
        }
        
        _delay_ms(100);
    
    }
    
}
 