
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include "millis.h"


static uint32_t sg_millis;


ISR(TCB0_INT_vect){
    
    sg_millis++;
    TCB0.INTFLAGS = TCB_CAPT_bm;

}


void millis_init(void){

    // inicializujte TCB0 na ISR  kazdych 1ms

}


uint32_t get_millis(void){
    
    uint32_t millis_now;
    
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {     
        millis_now = sg_millis;
    }
    
    return millis_now;
}
