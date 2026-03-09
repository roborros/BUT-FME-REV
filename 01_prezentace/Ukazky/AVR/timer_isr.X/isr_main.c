#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>


ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTB.OUTTGL = PIN3_bm;

}

int main(void) {
    
    PORTB.DIRSET = PIN3_bm;
    
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    TCA0.SINGLE.PER = 49999;
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    
    sei();

    while(1){
        

    }
    
}
 