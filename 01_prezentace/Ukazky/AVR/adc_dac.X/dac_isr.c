#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>

// generator: https://deepbluembedded.com/sine-lookup-table-generator-calculator/
const uint16_t sine_table[] = {
        512, 611, 707, 796, 873, 937, 984, 1013,
        1023, 1013, 984, 937, 873, 796, 707, 611,
        512, 412, 316, 227, 150, 86, 39, 10,
        0, 10, 39, 86, 150, 227, 316, 412};


void DAC_setVal(uint16_t value);

ISR(TCA0_OVF_vect){
    
    static uint8_t idx = 0;
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    DAC_setVal(sine_table[idx++]);
    
    if(idx >= sizeof(sine_table)/sizeof(sine_table[0])){
        idx = 0;
    }

}

void dac_init(void)
{
    PORTD.PIN6CTRL = PORT_ISC_INPUT_DISABLE_gc;
    VREF.DAC0REF = VREF_REFSEL_VDD_gc;
    DAC0.CTRLA = DAC_ENABLE_bm | DAC_OUTEN_bm;  
}

void DAC_setVal(uint16_t value)
{
    DAC0.DATA = value << 6;
}

int main(void){
    
    dac_init();
    
    TCA0.SINGLE.PER = 1999;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV2_gc | TCA_SINGLE_ENABLE_bm;
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    
    sei();
    
    while (1)
    {
    
    }
}
