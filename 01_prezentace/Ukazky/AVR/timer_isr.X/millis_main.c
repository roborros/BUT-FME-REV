#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>

#define F_CPU 4000000UL
#include <util/delay.h>

volatile uint32_t millis = 0;


ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    millis++;
    
}

int main(void) {
    
    PORTB.DIRSET = PIN3_bm;
    
    // zapnout preruseni
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    
    // nastavit period registr 
    TCA0.SINGLE.PER = 999;
    
    // nastaveni delicky a zapnuti timeru
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
       
    uint32_t millis_prev = 0;
    uint32_t millis_now = 0;
    
    sei();

    while(1){
        
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {     
            millis_now = millis;
        }
        
        if ((millis_now - millis_prev) >= 1000){
        
            PORTB.OUTTGL = PIN3_bm;
            millis_prev = millis_now;
        }

    }
    
}
 
