#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>

void pwm_init(void)
{
    
    // vyberu portc jako alternativni vystup
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
    // je treba nastavit jako out      
    PORTC.DIRSET = PIN0_bm | PIN1_bm;
    // povolim komparator a mod periferie je generovani dual slope PWM
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_SINGLESLOPE_gc | TCA_SINGLE_CMP0EN_bm;             
    // PER udava periodu PWM signalu je nastavena na kolik?? (vzorec je v datasheetu)
    TCA0.SINGLE.PER = 24000;

    // Start with 0% duty
    TCA0.SINGLE.CMP0 = 0;

    // Prescaler + enable
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV1_gc | TCA_SINGLE_ENABLE_bm;
}


void mot_dir(uint8_t dir){

    if(dir){
        PORTC.OUTCLR = PIN1_bm;
    }else{
        PORTC.OUTSET = PIN1_bm;
    }
        
}

int main(void) 
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    pwm_init();
    
    mot_dir(0);
   
    while (1)
    {
  
        TCA0.SINGLE.CMP0 = 20000;
        _delay_ms(1000);  
    }
}