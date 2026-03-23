#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>


#define BAUDRATE 115200UL


static inline uint16_t usart_baud_value(uint32_t f_cpu, uint32_t baud){
    return (uint16_t)((f_cpu * 4UL) / baud);
}

static void usart_init(void)
{ 
    
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   

    USART3.BAUD  = usart_baud_value(F_CPU, BAUDRATE); 
    USART3.CTRLC = USART_CHSIZE_8BIT_gc;         
    USART3.CTRLB = USART_TXEN_bm; 
}

static void usart_write_byte(uint8_t c)
{
    while(!(USART3.STATUS & USART_DREIF_bm)){} 
    USART3.TXDATAL = c;
}

static void usart_write_str(const char *s)
{
    while(*s) usart_write_byte((uint8_t)*s++);
}


static void dac0_init(void)
{
    PORTD.PIN6CTRL = PORT_ISC_INPUT_DISABLE_gc;
    VREF.DAC0REF = VREF_REFSEL_2V048_gc;
    DAC0.CTRLA = DAC_ENABLE_bm | DAC_OUTEN_bm;  
}

static void DAC0_setVal(uint16_t value)
{
    DAC0.DATA = value << 6;
}

void ADC0_init(void)
{
    PORTD.PIN3CTRL |= PORT_ISC_INPUT_DISABLE_gc;     // Disable digital input buffer


    // ADC clock: CLK_PER / 4, reference = VDD (default)
    ADC0.CTRLC = ADC_PRESC_DIV32_gc;

    // Enable ADC, 12-bit resolution
    ADC0.CTRLA = ADC_ENABLE_bm | ADC_RESSEL_12BIT_gc;

    // Select positive input channel AIN3 (PD3)
    ADC0.MUXPOS = ADC_MUXPOS_AIN3_gc;
}

uint16_t ADC0_read(void)
{
    // Start a single conversion
    ADC0.COMMAND = ADC_STCONV_bm;

    // Wait until conversion is finished
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm))
    {
        // Wait
    }

    // Read 12-bit result
    return ADC0.RES;
}


int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    usart_init();
    dac0_init();
    ADC0_init();
    
    PORTB.DIRSET = PIN3_bm; 
    PORTB.DIRSET = PIN1_bm;
    PORTA.DIRSET = PIN0_bm;
    
    uint16_t i = 0;
    char txbuf[64];
      
    while (1)
    {
        PORTB.OUTTGL = PIN3_bm;
        
        uint16_t adc = ADC0_read();
        
        
        sprintf(txbuf, "adc: %d\n", adc);
        usart_write_str(txbuf);
        
        DAC0_setVal(i++);
        
        if(i >= 1024){
            i = 0;
        }
        
        _delay_ms(100);      
    }
}
