#include <avr/io.h>
#include <avr/interrupt.h>


void init(void) {
    // PB3 out
    PORTB.DIRSET = PIN3_bm;

    // PB2 je vstup
    PORTB.DIRCLR = PIN2_bm;
    
    // PULL-UP a preruseni na sestupnou hranu
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_ISC_FALLING_gc;

}  

ISR(PORTB_PORT_vect) {
    // Kontrola, zda p?eru?ení zp?sobil PIN2 (pomocí registru INTFLAGS)
    if (PORTB.INTFLAGS & PIN2_bm) {
        
        // Oto?ení (toggle) stavu pinu PB3
        PORTB.OUTTGL = PIN3_bm;

        // Vynulování p?íznaku p?eru?ení pro PIN2
        PORTB.INTFLAGS = PIN2_bm;
    }
}

int main(void) {
    
    init();
    
    sei(); // globalni povoleni preruseni
    
    //cli(); to slouzi ke globalnimu vypnuti reruseni

    while (1) {
        // nic tu neni, ale musi byt loop
    }
}
