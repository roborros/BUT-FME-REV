#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>


void ADC_init(void)
{   
    // nastaveni reference pro adc
    VREF.ADC0REF = 0x5;
    // vypnuti analog input - neni uplne nutne
    PORTD.PIN3CTRL |= PORT_ISC_INPUT_DISABLE_gc;     
    // nasaveni adc_clk cpu clock / 32
    ADC0.CTRLC = ADC_PRESC_DIV32_gc;
    // zapnuti 12bit
    ADC0.CTRLA = ADC_ENABLE_bm | ADC_RESSEL_12BIT_gc;
    // vzber kanalu
    ADC0.MUXPOS = ADC_MUXPOS_AIN3_gc;
}

uint16_t ADC_read(void)
{
    // tohle odstartuje prevod
    ADC0.COMMAND = ADC_STCONV_bm;
    // flag se nastavi, kdzy je hotovo
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm))
    {
        // Wait
    }
    // prectu a vratim vysledek
    return ADC0.RES;
}


int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    ADC_init();
    
    // ovladani led
    PORTB.DIRSET = PIN3_bm; 
      
    while (1)
    {
   
        if(ADC_read() >= 2048){
            PORTB.OUTCLR = PIN3_bm;
        }else{
            PORTB.OUTSET = PIN3_bm;
        }
     
    }
}
