## 8 - 1. Otestujte a rozšiřte ukázku 8.1 tak, že přídáte další dva kanály PWM. Ovládejte tři LEDky na semaforu. (TCA timer má tři cmp registry).
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>

void pwm_init(void)
{
    // vyberu portc jako alternativni vystup
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
    // je treba nastavit jako out      
    PORTC.DIRSET = PIN0_bm;
    PORTC.DIRSET = PIN1_bm;
    PORTC.DIRSET = PIN2_bm;
    // povolim komparator a mod periferie je generovani dual slope PWM
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_DSBOTTOM_gc | TCA_SINGLE_CMP0EN_bm | TCA_SINGLE_CMP1EN_bm | TCA_SINGLE_CMP2EN_bm;             
    // PER udava periodu PWM signalu je nastavena na kolik?? (vzorec je v datasheetu)
    TCA0.SINGLE.PER = 12000;

    // Start with 0% duty
    TCA0.SINGLE.CMP0 = 0;
    TCA0.SINGLE.CMP1 = 0;
    TCA0.SINGLE.CMP2 = 0;

    // Prescaler + enable
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV1_gc | TCA_SINGLE_ENABLE_bm;
    

}


int main(void) 
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    pwm_init();
    // LED GND pin to 0V
    PORTF.DIRSET = PIN3_bm;
    PORTF.OUTCLR = PIN3_bm;
    uint16_t i = 0;
    uint16_t j = 0;
    uint16_t k = 0;

    while (1)
    {
 
        TCA0.SINGLE.CMP0 = i++;
        j=j+2;
        TCA0.SINGLE.CMP1 = j;
        k = k+3;
        TCA0.SINGLE.CMP2 = k;
        if(i == 12000){
            i = 0;
        }
        if(j == 12000){
            j = 0;
        }
        if(k == 12000){
            k = 0;
        }
        _delay_us(250);    
    }
}
```

## 8 - 2. Podívejte se na PORTMUX.TCAROUTEA registr a změnte výstup PWM na piny PD0-PD2 (pozor na nastaveni pinu jako OUT).
```c
// vyberu portc jako alternativni vystup
PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTD_gc;
// je treba nastavit jako out      
PORTD.DIRSET = PIN0_bm;
PORTD.DIRSET = PIN1_bm;
PORTD.DIRSET = PIN2_bm;
...
...
// LED GND pin to 0V
PORTD.DIRSET = PIN7_bm;
PORTD.OUTCLR = PIN7_bm;
```

## 8 - 3. Otestujte ukázku 8.2 která generuje frekvenci na pinu PC0. Připojte reproduktor a rozšiřte úlohu tak, že měníte frekvenci na základě ADC vstupu(minulé cvičení) Můžete použít potenciometr, ale lépe fotorezistor.
```c
int main(void) 
{       
    tca0_frq_init();
    ADC_init();
    
    uint16_t freq = 0;
    
    while (1)
    {
        
        freq = ADC_read(); 
        // nastaveni cmp pro generovani vystupu
        TCA0.SINGLE.CMP0 = freq;
        _delay_ms(50);
    }
}
```

## 8 - 4. Ukázku 8.3 rozšiřte tak, že přehrajete písničky ve formatu: arduino notes.
```c
TODO
```

## 8 - 5. Ukázka 8.4 měří frekvenci na pinu a odesílá výsledek do PC. K měření událostí na pinu slouží TCB. Využíjte ukázku tak, že změříte frekvenci PWM z ukázky 8.1. Dále přenastavte TCB tak, že změříte střídu i frekvenci. Je to jeden z režimů viz. datasheet.
```c
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
    TCB0.CTRLB = TCB_CNTMODE_FRQPW_gc;    
    
    // zapnuti interruptu
    TCB0.INTCTRL = TCB_CAPT_bm;
    // zapnu event a filtr
    TCB0.EVCTRL = TCB_CAPTEI_bm | TCB_FILTER_bm;
    
    // spustim musim delat OR at neprepisu delicku
    TCB0.CTRLA |= TCB_ENABLE_bm;

}

void pwm_init(void)
{
    // vyberu portc jako alternativni vystup
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
    // je treba nastavit jako out      
    PORTC.DIRSET = PIN0_bm;
    // povolim komparator a mod periferie je generovani dual slope PWM
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_DSBOTTOM_gc | TCA_SINGLE_CMP0EN_bm;             
    // PER udava periodu PWM signalu je nastavena na kolik?? (vzorec je v datasheetu)
    TCA0.SINGLE.PER = 12000;

    TCA0.SINGLE.CMP0 = 1200;

    // Prescaler + enable
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV1_gc | TCA_SINGLE_ENABLE_bm;
}


int main(void) 
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
          
    TCB_init();
    uart_init(F_CPU, BAUDRATE);
    pwm_init(); // set frequency ~ TCA0.SINGLE.PER/TCA0.SINGLE.CMP0 * 1000
    
    char txbuf[64];
    
    sei();
    uint16_t local_capture;
    uint8_t data_ready = 0;
    uint16_t i = 0;
    
    while (1)
    {
        
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

        _delay_ms(10);      
    }
}

```
