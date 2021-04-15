#include "adc.h"

void adc_init(void){
    
    ANSELA |= (1 << 5);             //AN4
    ANSELE = 0b1;                   //AN5
 
    ADCON2bits.ADFM = 1;            //right justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout

}

uint16_t adc_read(uint8_t channel){
    
    ADCON0bits.CHS = channel;
    GODONE = 1;
    while(GODONE){};
    uint16_t result = (uint16_t)(ADRESH<<8) | ADRESL;
    return result;
            
}
