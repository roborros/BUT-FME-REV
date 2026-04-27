#include "debounce.h"

uint8_t debounce(btn_debounc_t *btn, uint8_t input){
    
    if (input) {

        if (btn->counter < DEBOUNCE_LIMIT) {
            btn->counter++;
        }
    } else {

        btn->counter = 0;
        btn->btn_state = 0;
    }

    if (btn->counter == DEBOUNCE_LIMIT && btn->btn_state == 0) {
        btn->btn_state = 1;
        return 1;
    }

    return 0;

}