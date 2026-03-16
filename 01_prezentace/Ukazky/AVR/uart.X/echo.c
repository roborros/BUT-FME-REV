#include <avr/io.h>
#include <avr/interrupt.h>
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

void uart_transmit(uint8_t data) {
    // cekam na misto v tx bufferu
    while (!(USART3.STATUS & USART_DREIF_bm));
    USART3.TXDATAL = data;
}

uint8_t uart_receive(void) {
    // cekam na priznak ze RX buffer ma data
    while (!(USART3.STATUS & USART_RXCIF_bm));
    return USART3.RXDATAL;
}

int main(void) {
    
    // osci na 24MHz
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    // nastaveni uartu ve fci
    uart_init(F_CPU, BAUDRATE);
           
    while (1)
    {
    
        // Echo:
        uint8_t received_byte = uart_receive();
        uart_transmit(received_byte);

    }
}
