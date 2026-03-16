#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdbool.h>

#define F_CPU 4000000UL
#include <util/delay.h>

#define RB_SIZE 64

typedef struct {
    uint8_t buffer[RB_SIZE];
    volatile uint8_t head;
    volatile uint8_t tail;
} ring_buffer_t;

// vytvorim buffer
ring_buffer_t rx_rb = { .head = 0, .tail = 0 };


// je prazdny??
bool ring_buffer_is_empty(ring_buffer_t *rb) {
    return rb->head == rb->tail;
}

// kontrola plneho bufferu
bool ring_buffer_is_full(ring_buffer_t *rb) {
    uint8_t next = rb->head + 1;
    if (next >= RB_SIZE) next = 0;
    return (next == rb->tail);
}

// pridat do bufferu
void ring_buffer_add(ring_buffer_t *rb, uint8_t data) {
    uint8_t next = rb->head + 1;
    if (next >= RB_SIZE) next = 0;

    if (next != rb->tail) {
        rb->buffer[rb->head] = data;
        rb->head = next;
    }
}

//vyzvednout z bufferu
bool ring_buffer_get(ring_buffer_t *rb, uint8_t *data) {
    if (rb->head == rb->tail) return false;

    *data = rb->buffer[rb->tail];
    uint8_t next = rb->tail + 1;
    if (next >= RB_SIZE) next = 0;
    rb->tail = next;
    return true;
}


void uart_init(uint32_t baud) {

    USART3.BAUD = (uint16_t)((F_CPU * 4) / (baud)); 
    
    PORTB.DIRSET = PIN0_bm;                 
    PORTB.DIRCLR = PIN1_bm;   
    
    USART3.CTRLA = USART_RXCIE_bm;         
    USART3.CTRLB = USART_RXEN_bm | USART_TXEN_bm;
}

// odeslani znaku
void uart_transmit(uint8_t data) {
    while (!(USART3.STATUS & USART_DREIF_bm));
    USART3.TXDATAL = data;
}

// RX interrupt
ISR(USART3_RXC_vect) {
    uint8_t data = USART3.RXDATAL;
    ring_buffer_add(&rx_rb, data);
}

int main(void) {
    
    uart_init(115200);
    
    sei();

    uint8_t val;

    while (1) {
        // Vy?tení z RX bufferu, pokud jsou data
        if (ring_buffer_get(&rx_rb, &val)) {

            uart_transmit(val);
        }
        
        _delay_ms(100);
    }
}