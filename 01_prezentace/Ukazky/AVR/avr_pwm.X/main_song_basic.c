#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

int16_t melody[] = {250, 500, 750, 1000, 2000, 3000, 5000, 3000, 2000, 1000, 750, 500, 250};

void tca0_frq_init(void)
{
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
            
    PORTC.DIRSET = PIN0_bm;

    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_FRQ_gc | TCA_SINGLE_CMP0EN_bm;             

    TCA0.SINGLE.CMP0 = 0;

    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
}

void delay_ms(int16_t d)
{

    for (uint16_t i = 0; i < d; i++) {
        _delay_ms(1);
    }
}


int main(void) 
{       
    tca0_frq_init();
    
    int16_t notes = sizeof(melody) / sizeof(melody[0]);
    uint16_t tone;
    
    while (1)
    {
        for (uint16_t thisNote = 0; thisNote < notes; thisNote += 1) {
            

            tone = (uint16_t)(2000000/(int32_t)melody[thisNote]);

            TCA0.SINGLE.CMP0 = tone;
            
            delay_ms(500);
        }
        TCA0.SINGLE.CMP0 = 0;
        delay_ms(1000);
    }
}