#ifndef ADC_H
#define	ADC_H

#include <stdint.h>
#include <xc.h>

#define POT1 4
#define POT2 5

void adc_init(void);
uint16_t adc_read(uint8_t channel);


#endif	/* ADC_H */

