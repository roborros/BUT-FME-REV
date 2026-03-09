#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 4000000UL
#include <util/delay.h>


ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTB.OUTTGL = PIN3_bm;

}

int main(void) {    
    
    // PB3 jako out
    PORTB.DIRSET = PIN3_bm;
    
    PORTB.DIRCLR = PIN2_bm;
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm;
    
    // interrrupt na preteceni 
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    // nastaveni priod registru (kolik bude perioda??)
    TCA0.SINGLE.PER = 49999;
    // zapneme timer
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc;
    
    sei();

    while(1){
        
        
        if(!(PORTB.IN & PIN2_bm)){
            
            TCA0.SINGLE.CTRLA = TCA_SINGLE_ENABLE_bm;
            
        }
        

    }
    
}
 