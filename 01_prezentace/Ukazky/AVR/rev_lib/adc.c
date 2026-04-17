
#include <avr/io.h>
#include "adc.h"


void adc_init(void){
    // inicializace adc vybrat prescaler a samplovat dostatecne dlouho
}

void adc_set_channel(uint8_t ch){
    // implementace prepnuti kanalu
}

uint16_t adc_read_raw(void){
    // zahajit konverzi pockat a vratit vysledek
    return 0;
}

