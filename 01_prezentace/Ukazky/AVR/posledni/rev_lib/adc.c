
#include <avr/io.h>
#include "adc.h"


void adc_init(void){
    // reference
    VREF.ADC0REF = 0x5;  
    // nasaveni adc_clk cpu clock / 32
    ADC0.CTRLC = ADC_PRESC_DIV32_gc;
    ADC0.SAMPCTRL = 32;
    // zapnuti 12bit
    ADC0.CTRLA = ADC_ENABLE_bm | ADC_RESSEL_12BIT_gc;
}

void adc_set_channel(uint8_t ch){
    ADC0.MUXPOS = ch;
}

uint16_t adc_read_raw(void){

    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm));
    return ADC0.RES;
}

