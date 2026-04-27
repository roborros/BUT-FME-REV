## 11 - 1. Vyzkoušejte příklad 11.1. Je zde implementován SW reset a WDT. Nakonfigurujte WD do tzv. windowed režimu, tedy wdt musí být vyresetovám v určitém okně. (né moc brzy, ani pozdě)
```c
void wdt_init(void){
    // str 228
    _PROTECTED_WRITE(WDT_CTRLA, 0x67);
    
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
        _delay_ms(300);
        wdt_reset(); // musí být v okně
        //avr_reset();
    }
}

```

## 8 - 2. Vyzkoušejte ukázku 11.2. Vyzkoušejte různé sleep režimy. Nakonfigurujte MCU tak, že využijete F_CPU 1MHz. Dále nastavte power down režim, s nejnižší spotřebou. A přidejte i probuzení na GPIO pin. (stisk tlačítka). Přepněte stav diody. Původní PIT vypněte.
```c
void init(void){
    PORTB.DIRSET = PIN3_bm;
    PORTB.DIRCLR = PIN2_bm;
    PORTB.INTFLAGS = PIN2_bm;
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm | 0x03;
}

ISR(PORTB_PORT_vect){
  PORTB.OUTTGL = PIN3_bm;
  _delay_ms(100);
  //RTC.PITINTFLAGS = RTC_PI_bm;
  PORTB.INTFLAGS = PIN2_bm;
}

int main(void){
    init();
    sei();
  
    while (1)
    {
        sleep_mode();
    }
}


```

## 8 - 3. Projděte si zpětně cičení na jednotlivé periferie a připravte si knihovnu pro práci s AVR128DB48. Je zde připravena rev_lib složka, kde jsou šablony pro jednotlivé .c .h soubory. Některé vytvoříme na cvičení (např. uart, ADC).
```c
kompletnější knihovnu lze stáhnout ve složce 12. cvičení

```
