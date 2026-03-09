#define F_CPU 4000000UL
#include <avr/io.h>

// Globalni promenne
uint8_t sensor_data[5] = {12, 45, 8, 120, 33};
uint8_t current_reading = 0;
uint16_t accumulated_sum = 0;
volatile uint8_t button_press_count = 0;

uint16_t test_fcn(uint8_t val);

int main(void) {
    // PB3 vystup
    PORTB.DIRSET = PIN3_bm;

    // PB2 pull-up
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm;

    while (1) {
        // Kontrola tlacitka
        if (!(PORTB.IN & PIN2_bm)) {
            
            button_press_count++; // breikpoint treba sem
            accumulated_sum = 0;

            // Iterace pres pole
            for (volatile uint8_t i = 0; i < 5; i++) {
                current_reading = sensor_data[i];
                accumulated_sum += test_fcn(current_reading);
            }

            // Obracení led
            PORTB.OUTTGL = PIN3_bm;

            // Delay
            for (volatile uint32_t d = 0; d < 100000; d++);
        }
    }
}

uint16_t test_fcn(uint8_t val) {
    
    uint16_t result;
    if (val > 50) {
        result = (uint16_t)val * 2;
    } else {
        result = (uint16_t)val + 10;
    }
    return result;
}
 
