# REV - Jedenácté cvičení - WDT, SLEEP, FINE

## Watchdog timer:
Watchdog na MCU slouží k hlídání správného běhu programu. Když se software zasekne nebo přestane pracovat správně, watchdog vyvolá reset mikrokontroleru. Windowed watchdog má navíc určené časové okno, ve kterém se musí obnovit, takže pomáhá odhalit i chybné časování programu.

<p align="center">
  <img width="750" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_WDT_SLEEP/WDT.png">
</p>

## Přiklad 11.1:

```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

#define BAUDRATE 115200UL

void uart_init(uint32_t f_cpu, uint32_t baud)
{
  
    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);        
    USART3.CTRLB |= USART_TXEN_bm | USART_RXEN_bm;
    
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm; 
}


void uart_write_str(char *s)
{
    while(*s) {
        while(!(USART3.STATUS & USART_DREIF_bm)){} 
        USART3.TXDATAL = *s++;
    }
}


void avr_reset(void){
    // str. 129
    _PROTECTED_WRITE(RSTCTRL_SWRR, 0x01);
    while(1){};
    
}

void wdt_init(void){
    // str 228
    _PROTECTED_WRITE(WDT_CTRLA, 0x07);
    
}

int main(void){
  
    wdt_init();
    uart_init(F_CPU, BAUDRATE);
    char txbuf[64];
          
    // kontrola reset flagu
    if(RSTCTRL.RSTFR & RSTCTRL_SWRF_bm){
        RSTCTRL.RSTFR |= RSTCTRL_SWRF_bm;
        sprintf(txbuf, "SW_reset\n");
        uart_write_str(txbuf);
    }
    
    // kontrolo WDT resetu
    if(RSTCTRL.RSTFR & RSTCTRL_WDRF_bm){
        RSTCTRL.RSTFR |= RSTCTRL_WDRF_bm;
        sprintf(txbuf, "WDT_reset\n");
        uart_write_str(txbuf);
    }
    
    while (1)
    {
        sprintf(txbuf, "Ahoj\n");
        uart_write_str(txbuf);
        _delay_ms(100);
        wdt_reset();
        //avr_reset();
    }
}
```

## Řízení spotřeby:

## Přiklad 11.2:

```c

void main(void) {

}
```
## Přiklad 11.3:

```c

void main(void) {

}
```


### Zadání:

  1) Nakonfigurujte deep sleep a probouzejte MCU cca jednou za 1s. Po probuzení odešlete hodnotu POT2 přes UART do PC. 
  2) Nakonfugurujte komunikaci s PC. Pokud nepříjde déle než 30s specifická zpráva (kterou si zvolte), tak dojde k SW resetu. Po resetu zobrazte na displeji, že zpráva nedošla.
  3) Provozujte kontroler v IDLE módu. Kontrolér hned po inicilizaci uspěte a komunikujte přes uart. Tedy příchod zprávy MCU probudí. Zpráva se odešle zpět (ECHO) a MCU zase usne.
