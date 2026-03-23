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


void uart_write_str(char *s)
{
    while(*s) {
        while(!(USART3.STATUS & USART_DREIF_bm)){} 
        USART3.TXDATAL = *s++;
    }
}

void ADC_init(void)
{   
    // nastaveni reference pro adc
    VREF.ADC0REF = 0x5;
    // vypnuti analog input - neni uplne nutne
    PORTD.PIN3CTRL |= PORT_ISC_INPUT_DISABLE_gc;     
    // nasaveni adc_clk cpu clock / 32
    ADC0.CTRLC = ADC_PRESC_DIV32_gc;
    // zapnuti 12bit
    ADC0.CTRLA = ADC_ENABLE_bm | ADC_RESSEL_12BIT_gc;
    // vzber kanalu
    ADC0.MUXPOS = ADC_MUXPOS_AIN3_gc;
}

uint16_t ADC_read(void)
{
    // tohle odstartuje prevod
    ADC0.COMMAND = ADC_STCONV_bm;
    // flag se nastavi, kdzy je hotovo
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm))
    {
        // Wait
    }
    // prectu a vratim vysledek
    return ADC0.RES;
}


int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);      
    ADC_init();
    uart_init(F_CPU, BAUDRATE);
       
    char txbuf[64];
    
    while (1)
    {
        float result = ADC_read() * 3.3F/4095.0F;
        sprintf(txbuf, "adc: %.2f\n", result);
        uart_write_str(txbuf);
        _delay_ms(100);   
    }
}
