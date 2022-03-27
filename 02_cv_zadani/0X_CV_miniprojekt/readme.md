# Miniprojekt

## Zadání
Vytvořte miniprojekt měřicí ústředny, která bude mít následující funkcionalitu:
* Měření se bude zapínat a vypínat posláním příkazu přes UART z PC. **ON\n** pro zapnutí a **OFF\n** pro vypnutí měření.
* Tlačítky BTN1 až BTN3  se bude přepínat měřený kanál.
    * BTN1 -> POT1
    * BTN2 -> POT2
    * BTN3 -> TEMP
* Měření bude se vzorkovací frekvencí 2 Hz.
* Měřená hodnota z potenciometrů bude poslána přes UART do PC v mV. Teplota bude v jednotkách ADC.
* Při poslání dat do PC dojde ke změně stavu LED1.
* Po stisku BTN4 se poslední změřená hodnota vypíše na LCD.

## Doplňující informace
* Zapněte PLL
* Vytvořte samostatné knihovny pro obsluhu jednotlivých periferií.
    * Knihovny budou obsahovat inicializační funkci pro nastavení periferie a funkce pro obsluhu dané periferie (čtení ADC, sepnutí LED, ...).
        * ADC (adc.c, adc.h):
            * void adc_init(void)
            * uint16_t adc_read(uint8_t channel)
        * UART (uart.c, uart.h):
            * void uart_init(void)
            * void puthch(char data)
        * LCD (lcd.c, lcd.h):
            * Použijte již hotovou knihovnu
        * BSP (Board Support Package) (bsp.c, bsp.h):
            * void bsp_init(void)
                * Inicializace GPIO
                * Inicializace Timer1 - přerušení každou 1 ms
            * uint32_t bsp_millis(void) - vrací počet milisekund
            * void bsp_millis_step(void) - inkrementuje millis counter
            * Konfigurační bity, makra pro tlačítka a LED, hodnota timeru, glo

    * Příchozí data přes UART se budou přijímat v přerušení a vyhodnocovat v hlavním těle kódu.
    * Baudrate UARTu bude 115200
* Pro časování měřicí smyčky využijte porovnávání uběhlého času od posledního volání funkce pomocí bsp_millis().

## Pro rychlíky a rychlice
* Implementujte debouncing tlačítek s využitím časovače, posuvného registru, masky, stavových proměnných atd...
* Najděte si v datasheetu teplotního čidla jeho převodní charakteristiku a teplotu posílejte ve stupních.
* Pomocí příkazu **F##\n** měňte vzorkovací frekvenci v rozsahu 0 až 99 Hz.

