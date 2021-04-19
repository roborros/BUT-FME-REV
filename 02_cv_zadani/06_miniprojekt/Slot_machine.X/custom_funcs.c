#include <stdint.h>
#include <stdlib.h>
#include "gpio.h"
#include "custom_funcs.h"

char generate_symbol(void) {
    int random = rand() % 4;
    
    switch(random){
        case 0:
            return '&';
        case 1:
            return '%';
        case 2:
            return '#';
        case 3:
            return '@';
        default:
            return '%';
    }    
}

uint16_t check_win(char* symbols) {
    if(symbols[0] == '#' && symbols[1] == '#' && symbols[2] == '#') {
        return 5;
    } else if (symbols[0] == '@' && symbols[1] == '@' && symbols[2] == '@') {
        return 3;
    } else if (symbols[0] == '&' && symbols[1] == '&' && symbols[2] == '&') {
        return 2;
    }else if (symbols[0] == '%' && symbols[1] == '%' && symbols[2] == '%') {
        return 1;
    } else {
        return 0;
    }
}

void show_credit(uint8_t credit) {
    uint8_t leds = 0xFF;
    if (credit > 6) {
        leds = (uint8_t)~(leds << 6);
    } else {
        leds = (uint8_t)~(leds << credit);
    } 
    
    gpio_drive_led(leds);
}

void change_state(state_struct* state, uint8_t state_id) {
    state->id = state_id;
    state->changed = 1;
}
