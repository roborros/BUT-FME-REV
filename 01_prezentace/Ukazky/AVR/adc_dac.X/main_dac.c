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
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    dac_init();
     
    uint16_t i = 0;
    
    while (1)
    {
        
        DAC_setVal(sine_table[i++]);
        
        if(i >= sizeof(sine_table)/sizeof(sine_table[0])){
            i = 0;
        }
        
        _delay_ms(50);      
    }
}
