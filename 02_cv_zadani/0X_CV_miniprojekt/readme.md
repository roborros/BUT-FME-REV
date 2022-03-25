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
    * Příchozí data přes UART se budou přijímat v přerušení a vyhodnocovat v hlavním těle kódu.
    * Baudrate UARTu bude 115200
* Pro časování měřicí smyčky bude použit timer a přerušení.

## Pro rychlíky a rychlice
* Implementujte debouncing tlačítek s využitím časovače, posuvného registru, masky, stavových proměnných atd...
* Najděte si v datasheetu teplotního čidla jeho převodní charakteristiku a teplotu posílejte ve stupních.
* Pomocí příkazu **F##\n** měňte vzorkovací frekvenci v rozsahu 0 až 99 Hz.

