# REV - Jedenácté cvičení - WDT, SLEEP

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

Řízení spotřeby MCU slouží ke snížení odběru energie podle aktuální potřeby aplikace. Mikrokontroler může při nečinnosti přecházet do úsporných režimů, zpomalit hodinový signál nebo vypínat nevyužívané periferie. Díky tomu se prodlužuje výdrž baterie.

U AVR128DB48 se spotřeba řídí hlavně přes Sleep Controller (SLPCTRL), který nabízí režimy Idle, Standby a Power-Down. V těchto režimech se zastaví běh CPU a aktivní zůstávají jen potřebné části čipu. Pro pravidelné probouzení lze využít RTC a v režimu Power-Down i jeho PIT. Spotřebu v aktivním stavu navíc ovlivňuje i takt procesoru, protože odběr je v aktivním režimu svázán s frekvencí systémových hodin.


## Přiklad 11.2:

```c
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

void init(void){
   
    PORTB.DIRSET = PIN3_bm;
    
    RTC.PITCTRLA = RTC_PERIOD_CYC32768_gc | RTC_PITEN_bm;
    
    RTC.PITINTCTRL = RTC_PI_bm;
    
}

ISR(RTC_PIT_vect){

  PORTB.OUTTGL = PIN3_bm;
  RTC.PITINTFLAGS = RTC_PI_bm;
}

int main(void){
    
    init();
    sei();
  
    while (1)
    {
        sleep_mode();
        //_delay_ms(1000);

    }
}
```
## Přiklad 11.3:

<p align="center">
  <img width="750" height="520" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_WDT_SLEEP/lib_project.png">
</p>

```c

void main(void) {

}
```


### Zadání:

  1) Vyzkoušejte příklad 11.1. Je zde implementován SW reset a WDT. Nakonfigurujte WD do tzv. windowed režimu, tedy wdt musí být vyresetovám v určitém okně. (né moc brzy, ani pozdě)
  2) Vyzkoušejte ukázku 11.2. Vyzkoušejte různé sleep režimy. Nakonfigurujte MCU tak, že využijete F_CPU 1MHz. Dále nastavte power down režim, s nejnižší spotřebou. A přidejte i probuzení na GPIO pin. (stisk tlačítka). Přepněte stav diody. Původní PIT vypněte. 
  3) Projděte si zpětně cičení na jednotlivé periferie a připravte si knihovnu pro práci s AVR128DB48. Je zde připravena rev_lib složka, kde jsou šablony pro jednotlivé .c .h soubory. Některé vytvoříme na cvičení (např. uart, ADC).
