#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

#define BAUDRATE 115200UL

void uart_init(uint32_t f_cpu, uint32_t baud)
{
    // nastaveni pinu TX RX
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   
    // baudrate str. 380
    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);
   // zapnuti TX a RX       
    USART3.CTRLB |= USART_TXEN_bm | USART_RXEN_bm;
}

void uart_transmit(char *data)
{ 
    while(*data){
        while (!(USART3.STATUS & USART_DREIF_bm));
        USART3.TXDATAL = *data++;
    }
}

void adc_init(void) 
{
    TCA0.SINGLE.PER = 39999;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV2_gc | TCA_SINGLE_ENABLE_bm;
    
    VREF.ADC0REF = VREF_REFSEL_VDD_gc;
    
    ADC0.MUXPOS = ADC_MUXPOS_AIN3_gc;
    ADC0.EVCTRL = ADC_STARTEI_bm;
    ADC0.INTCTRL = ADC_RESRDY_bm;
    ADC0.CTRLA = ADC_ENABLE_bm | ADC_RESSEL_12BIT_gc;
    
    EVSYS.CHANNEL0 = EVSYS_CHANNEL0_TCA0_OVF_LUNF_gc;
    EVSYS.USERADC0START = EVSYS_USER_CHANNEL0_gc;
}

volatile uint16_t g_adc_val = 33;
volatile uint8_t flag = 0;

ISR(ADC0_RESRDY_vect) 
{
    // precteni  maze flag
    g_adc_val = ADC0.RES;
    if(flag == 0){
        flag = 1;
    }
}

int main(void) 
{
    uart_init(F_CPU, BAUDRATE);
    adc_init();
    sei(); 
    
    char text[64];

    while (1) {
        if(flag){
            sprintf(text,"%u\r", g_adc_val);
            uart_transmit(text);
            flag = 0;
        }           
    }
}