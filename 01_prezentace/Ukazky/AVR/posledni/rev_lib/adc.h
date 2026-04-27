#ifndef ADC_H
#define	ADC_H

#include <stdint.h>

void adc_init(void);
void adc_set_channel(uint8_t ch);
uint16_t adc_read_raw(void);

#endif	/* ADC_H */

