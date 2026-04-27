#define F_CPU 4000000UL
#include <avr/io.h>
#include <util/delay.h>

// Definice pin? na PORTC (PC0, PC1, PC2, PC3)
#define STEP_MASK 0x0F

void motor_setup() {
    // Nastavení PC0-PC3 jako výstupní
    PORTC.DIRSET = STEP_MASK;
}

void step_motor(uint8_t step) {
    static const uint8_t lookup[] = {
    0x01, // 0001 (IN1 zapnuto)
    0x04, // 0100 (IN3 zapnuto)
    0x02, // 0010 (IN2 zapnuto)
    0x08  // 1000 (IN4 zapnuto)
};
    PORTC.OUTCLR = STEP_MASK;            // Vynulování pin?
    PORTC.OUTSET = lookup[step % 4];     // Nastavení fází
}

int main(void) {
    motor_setup();
    
    while (1) {
        for (uint8_t i = 0; i < 4; i++) {
            step_motor(i);
            _delay_ms(1000); // Rychlost otá?ení
        }
    }
}
