#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

void init(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_1M_gc);

    PORTB.DIRSET = PIN3_bm;
    
    RTC.PITCTRLA = RTC_PERIOD_CYC32768_gc | RTC_PITEN_bm;
    
    RTC.PITINTCTRL = RTC_PI_bm;
    
    SLPCTRL.CTRLA = SLPCTRL_SMODE_PDOWN_gc;

}

void pullup_init(void) {

    PORTA.PINCONFIG  = PORT_PULLUPEN_bm;
    PORTA.PINCTRLUPD = 0xFF;

    // Port B
    PORTB.PINCONFIG  = PORT_PULLUPEN_bm;
    PORTB.PINCTRLUPD = 0xFF;

    // Port C
    PORTC.PINCONFIG  = PORT_PULLUPEN_bm;
    PORTC.PINCTRLUPD = 0xFF;

    // Port D
    PORTD.PINCONFIG  = PORT_PULLUPEN_bm;
    PORTD.PINCTRLUPD = 0xFF;

    // Port E
    PORTE.PINCONFIG  = PORT_PULLUPEN_bm;
    PORTE.PINCTRLUPD = 0xFF;

    // Port F
    PORTF.PINCONFIG  = PORT_PULLUPEN_bm;
    PORTF.PINCTRLUPD = 0xFF;
}

ISR(RTC_PIT_vect){

   PORTB.OUTTGL = PIN3_bm;
    RTC.PITINTFLAGS = RTC_PI_bm;
}

int main(void){
    
    init();
    pullup_init();
    
    sei();
  
    while (1)
    {
        sleep_mode();
        //_delay_ms(1000);

    }
}
