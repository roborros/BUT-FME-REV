
#include <avr/io.h>
#include "dac.h"


void dac_init(void){

    // disabluje analog input na pinu
    PORTD.PIN6CTRL = PORT_ISC_INPUT_DISABLE_gc;
    // vyber reference
    VREF.DAC0REF = VREF_REFSEL_VDD_gc;
    // zapnuti periferie a outputu
    DAC0.CTRLA = DAC_ENABLE_bm | DAC_OUTEN_bm;

}

void dac_write(uint16_t val){

    DAC0.DATA = val << 6;

}