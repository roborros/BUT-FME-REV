# REV - Jedenácté cvičení - WDT, SLEEP, FINE

## Watchdog timer:
Jedná se o specifickou periferii MCU, která slouží pro bezpečnost aplikací. Jde o čítač, který je napojen na vnitřní oscilátor s frekvencí 31,25kHz. Je mu předřazena ještě dělička /128. Výsledná perioda je tedy 4ms (přesněji 4,096). Uživatel zapíná WDT a jeho výstupní děličku pomocí konfiguračních bitů. WDT se pak musí nulovat v softwaru speciální instrukcí procesoru. Pokud dojde k přetečení, dojde k resetu MCU.

<p align="center">
  <img width="850" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/09_CV_WDT/WDT.png">
</p>



## Přiklad 11.1:

```c

void main(void) {
    
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
