#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 4000000UL
#include <util/delay.h>


ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTB.OUTTGL = PIN3_bm;

}

int main(void) {    
    
    /* timto lze pripojit externi crystal
    _PROTECTED_WRITE(CLKCTRL_XOSCHFCTRLA, 0x05);
    _PROTECTED_WRITE(CLKCTRL_MCLKCTRLA, 0x03);
    
    while (!(CLKCTRL.MCLKSTATUS & (1 << 4)));
    */
    
    // timto lze zmenit frekvenci interniho osci na maximum 24 MHz
    //_PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    // PB3 jako out
    PORTB.DIRSET = PIN3_bm;
    
    // interrrupt na preteceni 
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    // nastaveni priod registru (kolik bude perioda??)
    TCA0.SINGLE.PER = 999;
    // zapneme timer
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
    
    sei();

    while(1){
       
        

    }
    
}
 