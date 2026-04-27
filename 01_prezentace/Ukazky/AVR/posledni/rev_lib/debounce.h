#ifndef DEBOUNCE_H
#define	DEBOUNCE_H

#include <stdint.h>

#define DEBOUNCE_LIMIT 20

typedef struct{
    uint8_t counter;
    uint8_t btn_state;
}btn_debounc_t;

uint8_t debounce(btn_debounc_t *btn, uint8_t read);

#endif	/* DEBOUNCE_H */

