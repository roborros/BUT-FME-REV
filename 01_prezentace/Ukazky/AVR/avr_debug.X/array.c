#define F_CPU 4000000UL
#include <avr/io.h>
#include <util/delay.h>


uint8_t buffer[4];           // Pole o velikosti 4 bajty (indexy 0-3)
volatile uint8_t status_flag;

int main(void) {
        
    PORTB.DIRSET = PIN3_bm;
    status_flag = 0; // nastavim 0

    // CHYBA: Podmínka i <= 4 je 5 iteraci
    for (uint8_t i = 0; i <= 4; i++) {
        buffer[i] = 0xFF; 
    }

    while (1) {
        if (status_flag) {
            // LED on
            PORTB.OUTCLR = PIN3_bm;
        } else {
            // Standardní stav
            PORTB.OUTSET = PIN3_bm;
        }
    }
}