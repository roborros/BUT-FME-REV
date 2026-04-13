#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#define F_CPU 24000000UL
#include <util/delay.h>

#include "w25qxx.h"

void uart_init(uint32_t f_cpu, uint32_t baud)
{
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   

    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);        
    USART3.CTRLB |= USART_TXEN_bm;
}

void uart_write_byte(uint8_t c)
{
    while(!(USART3.STATUS & USART_DREIF_bm)){} 
    USART3.TXDATAL = c;
}


void uart_write_str(const char *s)
{
    while(*s){
        
        uart_write_byte((uint8_t)*s++);
        
    }
}

void spi_init(void) 
{
    // nastaveni pinu out
    PORTA.DIRSET = PIN4_bm | PIN6_bm | PIN7_bm;
    // nastaveni pinu in
    PORTA.DIRCLR = PIN5_bm;
    
    // mod 0, SSPIn disabled
    SPI0.CTRLB = SPI_SSD_bm | SPI_MODE_0_gc;

    // rezim master, nastaveni clk, enabled
    SPI0.CTRLA = SPI_MASTER_bm | SPI_PRESC_DIV16_gc | SPI_ENABLE_bm;
}

void CS_Select(bool active)
{
    
    if(active){
        PORTA.OUTCLR = PIN7_bm;
    }else{
        PORTA.OUTSET = PIN7_bm;
    }
}

uint8_t spi_transfer(uint8_t data) 
{
    // zapis dat do transfer registru
    SPI0.DATA = data;

    // cekam na transfer
    while (!(SPI0.INTFLAGS & SPI_IF_bm));

    // vratim prijata data
    return SPI0.DATA;
}


uint8_t data[256];

int main(void) 
{
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    spi_init();
    uart_init(F_CPU, 115200);
    
    W25Q_EraseSector(0);
    
    while(W25Q_IsBusy());
    
    char msg[] = "";
    
    //memset(msg, 0xAA, sizeof(msg));
    
    //W25Q_WritePage(0, (uint8_t*)msg, sizeof(msg));
    
    while(W25Q_IsBusy());

    while (1) {
        
        //uint8_t idbuf[3];
        //W25Q32_ReadID(idbuf);
        
        W25Q_ReadData(0, data, 16);
        
        
        for(uint8_t i=0; i<16; i++){
            uart_write_byte(data[i]);
            _delay_ms(10);
        }
        
        
        _delay_ms(1000);
        
    }
}