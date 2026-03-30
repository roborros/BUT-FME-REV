#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>

void pwm_init(void)
{
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
            
    PORTC.DIRSET = PIN0_bm | PIN1_bm;

    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_SINGLESLOPE_gc | TCA_SINGLE_CMP0EN_bm | TCA_SINGLE_CMP1EN_bm;              

    TCA0.SINGLE.PER = 12000;

    // Start with 0% duty
    TCA0.SINGLE.CMP0 = 0;
    TCA0.SINGLE.CMP1 = 0;

    // Prescaler + enable
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV1_gc | TCA_SINGLE_ENABLE_bm;
}


int main(void) 
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    pwm_init();
    
    uint16_t i = 0;
    while (1)
    {
 
        TCA0.SINGLE.CMP0 = i++;
        TCA0.SINGLE.CMP1 = 12000 - i;
        
        if(i == 12000){
            i = 0;
        }
        _delay_us(250);    
    }
}
