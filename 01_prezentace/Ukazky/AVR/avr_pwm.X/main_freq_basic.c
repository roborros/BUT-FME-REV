#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>


void tca0_frq_init(void)
{
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
            
    PORTC.DIRSET = PIN0_bm;

    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_FRQ_gc | TCA_SINGLE_CMP0EN_bm;             

    TCA0.SINGLE.CMP0 = 0;

    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
}

int main(void) 
{       
    tca0_frq_init();
    
    uint16_t freq = 0;
    
    while (1)
    {
        
        freq += 10; 
        
        TCA0.SINGLE.CMP0 = freq;
        _delay_ms(1);
    }
}
