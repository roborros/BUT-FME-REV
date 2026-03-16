#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 4000000UL
#include <util/delay.h>


volatile uint8_t flag = 0;

ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    flag = 1;
   
}

int main(void){
    
    // PB3 jako out
    PORTB.DIRSET = PIN3_bm;
    
    // interrrupt na preteceni 
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    // nastaveni priod registru (kolik bude perioda??)
    TCA0.SINGLE.PER = 49999;
    // zapneme timer
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV16_gc | TCA_SINGLE_ENABLE_bm;
    
    sei();

    while(1){
        
        
        if(flag){
            
            PORTB.OUTTGL = PIN3_bm;
            flag = 0;
            
        } 
    }  
}
 
