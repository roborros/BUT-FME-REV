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

void ADC_init(void)
{   
    // nastaveni reference pro adc
    VREF.ADC0REF = 0x5;
    // vypnuti analog input - neni uplne nutne
    PORTD.PIN3CTRL |= PORT_ISC_INPUT_DISABLE_gc;     
    // nasaveni adc_clk cpu clock / 32
    ADC0.CTRLC = ADC_PRESC_DIV64_gc;
    // zapnuti 12bit
    ADC0.CTRLA = ADC_ENABLE_bm | ADC_RESSEL_12BIT_gc;
    // vzber kanalu
    ADC0.MUXPOS = ADC_MUXPOS_AIN3_gc;
}

uint16_t ADC_read(void)
{
    // tohle odstartuje prevod
    ADC0.COMMAND = ADC_STCONV_bm;
    // flag se nastavi az je hotovo
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm))
    {
        // Wait
    }
    // prectu a vratim vysledek
    return ADC0.RES;
}

int main(void) 
{       
    tca0_frq_init();
    ADC_init();
    
    uint16_t freq;
    
    while (1)
    {
        
        freq = (4095 - ADC_read())+200;
        
        TCA0.SINGLE.CMP0 = freq;
        _delay_ms(10);
    }
}
