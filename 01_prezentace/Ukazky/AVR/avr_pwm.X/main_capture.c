#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>


#define BAUDRATE 115200UL


void uart_init(uint32_t f_cpu, uint32_t baud)
{
    
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   

    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);        
    USART3.CTRLB |= USART_TXEN_bm | USART_RXEN_bm;
    
}

void uart_write_byte(uint8_t c)
{
    while(!(USART3.STATUS & USART_DREIF_bm)){} 
    USART3.TXDATAL = c;
}

void uart_write_str(char *s)
{
    while(*s) {
        uart_write_byte((uint8_t)*s++);
    }
}

volatile uint16_t capture_value = 0;
volatile uint8_t fresh_data = 0;

ISR(TCB0_INT_vect) {
    // cteni maze flag
    capture_value = TCB0.CCMP;
    fresh_data = 1;
}

void TCB_init(void) {
    // pin jako input
    PORTA.DIRCLR = PIN2_bm;
    
    // event z portu na tcb
    EVSYS.CHANNEL0 = EVSYS_CHANNEL0_PORTA_PIN2_gc;
    EVSYS.USERTCB0CAPT = EVSYS_USER_CHANNEL0_gc;

    // delicka
    TCB0.CTRLA = TCB_CLKSEL_DIV2_gc;
    // mod funkce, merim frekvenci
    TCB0.CTRLB = TCB_CNTMODE_FRQ_gc;    
    
    // zapnuti interruptu
    TCB0.INTCTRL = TCB_CAPT_bm;
    
    TCB0.EVCTRL = TCB_CAPTEI_bm | TCB_FILTER_bm;
    
    // spustim musim delat OR at neprepisu delicku
    TCB0.CTRLA |= TCB_ENABLE_bm;

}

int main(void) 
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
          
    TCB_init();
    uart_init(F_CPU, BAUDRATE);
    
    char txbuf[64];
    
    sei();
    
    while (1)
    {
        
        uint16_t local_capture;
        uint8_t data_ready = 0;

        // bezpecne zkopiruji
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            if (fresh_data) {
                local_capture = capture_value;
                fresh_data = 0;
                data_ready = 1;
            }
        }

        if (data_ready) {
            if (local_capture > 0) {
                // vypocet frekvence
                float frequency = F_CPU /(2*local_capture) ;

                sprintf(txbuf, "freq: %.2f \n", frequency);
                uart_write_str(txbuf);
            }
            
            data_ready = 0;
        }

        _delay_ms(100);      
    }
}
