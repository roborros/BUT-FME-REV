#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

void init(void){
   
    PORTB.DIRSET = PIN3_bm;
    
    RTC.PITCTRLA = RTC_PERIOD_CYC32768_gc | RTC_PITEN_bm;
    
    RTC.PITINTCTRL = RTC_PI_bm;
    
}


ISR(RTC_PIT_vect){

   PORTB.OUTTGL = PIN3_bm;
    RTC.PITINTFLAGS = RTC_PI_bm;
}

int main(void){
    
    init();

    sei();
  
    while (1)
    {
        sleep_mode();
        //_delay_ms(1000);

    }
}
