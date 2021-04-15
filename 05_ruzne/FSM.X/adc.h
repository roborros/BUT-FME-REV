#ifndef ADC_H
#define	ADC_H

#include <stdint.h>
#include <xc.h>

#define POT1 5
#define POT2 4

void adc_init(void);
uint16_t adc_read(uint8_t channel);


#endif	/* ADC_H */

