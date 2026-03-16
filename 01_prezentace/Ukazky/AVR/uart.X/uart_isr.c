#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <string.h>

#define F_CPU 24000000UL
#include <util/delay.h>

#define BAUDRATE 115200UL

char text_buf[64];
volatile uint8_t msg_ready = 0;
 

ISR(USART3_RXC_vect)
{   
    static uint8_t index = 0;
    uint8_t received_char = USART3.RXDATAL;
    
    if(received_char != '\n' && index < (sizeof(text_buf)-1)){
        text_buf[index] = received_char;
        index++;
    }
    else{
        text_buf[index] = '\0';
        index = 0;
        msg_ready = 1;
    }
    
}


void usart_init(uint32_t f_cpu, uint32_t baud)
{
    
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   

    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);        
    USART3.CTRLB |= USART_TXEN_bm | USART_RXEN_bm;
    
    USART3.CTRLA = USART_RXCIE_bm;
}


void usart_write_byte(uint8_t c)
{
    while(!(USART3.STATUS & USART_DREIF_bm)){} 
    USART3.TXDATAL = c;
}


void usart_write_str(const char *s)
{
    while(*s) usart_write_byte((uint8_t)*s++);
}


int main(void) {
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    usart_init(F_CPU, BAUDRATE);

    sei();
    
    while (1)
    {
        if(msg_ready){
           
            if(strcmp(text_buf, "GO") == 0){

            usart_write_str("WHERE\n");
             
            }
            else{
                usart_write_str("ERR\n");
            }
            
            msg_ready = 0;
        }
    }
}