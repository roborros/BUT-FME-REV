
#include <avr/io.h>
#include "lcd.h"


void uart_init(uint32_t f_cpu, uint32_t baud){

    // nastaveni pinu TX RX
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   

    // baudrate str. 380
    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);
   // zapnuti TX      
    USART3.CTRLB |= USART_TXEN_bm;
    
}

void uart_write_byte(uint8_t data){

    while (!(USART3.STATUS & USART_DREIF_bm));
    USART3.TXDATAL = data;
    
}

void uart_write_str(char *str){
    
    while(*str != '\0'){
        uart_write_byte((uint8_t)*str++);
    }

}
