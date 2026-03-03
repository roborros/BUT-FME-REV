#include <avr/io.h>

#define F_CPU 4000000UL
#include <util/delay.h>

volatile uint8_t ga = 0xaa;
volatile uint8_t gb = 0xff;


uint8_t fce(uint8_t a, uint8_t b){
    
    uint8_t tmp_ga = ga;
    uint8_t tmp_gb = gb;

    return a + b + ga + gb;
}

int main(void) {
    
  
    while(1){
       
        volatile uint8_t res;
        
        res = fce(1, 2);
        _delay_ms(100);
    
    }
    
}
 
