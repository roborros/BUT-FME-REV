#include <stdint.h>
#include "timer.h"
#include <xc.h>


volatile uint16_t counter = 0;

void timer_init() {
    // Timer 1
    T1CONbits.TMR1CS = 0b00;
    T1CONbits.T1CKPS = 0b11;
    TMR1ON = 1;
    TMR1IE = 1;
    TMR1IF = 0;
    
    // Timer 2
    T2CONbits.T2CKPS = 0b11;        // zdroj casovace 1
    T2CONbits.T2OUTPS = 0b1111;     // nastaveni delicky  
    PR2 = 250;                      // nastaveni period reg
    IPR1bits.TMR2IP = 0;            // low priority
    TMR2IE = 1;                     // povoleni preruseni pro TMR1
    TMR2IF = 0;                     // smazani priznaku (pro jistotu)    
    TMR2ON = 1;                     // spusteni TMR1
}

void timer_timeout_counter(void) {
    counter += 1;
    TMR1 = 0xFFFF - 1000; 
}

void timer_timeout_reset(void) {
    counter = 0;
}

uint8_t timer_timeout_compare(uint16_t time) {
    return counter > time;
}
