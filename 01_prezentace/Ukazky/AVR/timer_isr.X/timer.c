#define F_CPU 4000000UL
#include <avr/io.h>


int main(void) {
    
    PORTB.DIRSET = PIN3_bm;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;

    while(1){
        
        
        if(TCA0.SINGLE.CNT >= 10000){
            
            TCA0.SINGLE.CNT = 0x0000;
            PORTB.OUTTGL = PIN3_bm;
        
        }   
    }
    
}
 