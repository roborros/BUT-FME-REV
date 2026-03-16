#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 4000000UL
#include <util/delay.h>


ISR(TCB0_INT_vect) {
    // smazat flag
    TCB0.INTFLAGS = TCB_CAPT_bm;

    PORTB.OUTTGL = PIN3_bm;
}



int main(void) {    

    // PB3 jako out
    PORTB.DIRSET = PIN3_bm;
    
    // nastaven cmp na 1kHz
    TCB0.CCMP = 3999;

    // mod timeru je periodic interrupt
    TCB0.CTRLB = TCB_CNTMODE_INT_gc;

    // povleni interruptu na CMP
    TCB0.INTCTRL = TCB_CAPT_bm;

    // zapnuti a nastaveni div
    TCB0.CTRLA = TCB_CLKSEL_DIV1_gc | TCB_ENABLE_bm;
    
    // globalni zapnuti
    sei();

    while(1){
        

    }
    
}
 