# REV - První cvičení
- Seznamme se s vývojovým prostředím MPLAB. Stahněte ukázkový projekt, zkompilujte jej a nahrajte do MCU.
- Prostředí pracuje pouze s hlavním projektem, ten je zvýrazněn a lze jej přepínat.
- .c soubory naleznete v záložce source files. Připomeňme si, že funkce main() může existovat v projektu pouze jednou. Soubory lze do překladu zahrnout/vyřadit pomocí exclude/include file.

<p align="center">
  <img width="600" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/01_CV/SetProjectAsMain.png">
</p>

- po naprogramování procesoru nastavte program Termite a sledujte zprávy, které PIC zasílá do PC (comport může nabývat různých hodnot)

<p align="center">
  <img width="600" height="400" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/01_CV/Termite.png">
</p>

## Příklad 1.1
* Následující výpis ukazuje jednoduchý příklad v jazyce C. Program vypisuje hodnotu proměnné count a binárně bliká třemi LEDkami. 
```c
// REV-Basic 2018
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <xc.h>
 
#include "rev-basic.h"
 
void main(void) {
    char count = 0;
    int i;
    char a = 'x';
 
    REV_init();
 
    for(;;){
        count++;
 
        REV_led(1,count & 1);
        REV_led(2,count & 2);
        REV_led(3,count & 4);
 
        printf("count: %d (0x%x) (%c)\n",count,count,a);
 
        __delay_ms(100);
    }
}
```

## Úloha 1.2

* Příklad využití cyklu while: 
```c
// plny nazev promenne
int cislo = 10;
 
while(cislo > 0){
  printf("Akutalni hodnota: %d\n",cislo);
  cislo--;
}
```

* Příklad využití cyklu for: 
```c
#define LIMIT 10
 
// kratky nazev pro index
int i;
 
for(i = 1; i < LIMIT; i++ ){
  printf("Akutalni hodnota: %d\n", i);
}
```
### Upravte příklad 1.1 takto:

    1) program vypíše řetězec “Ahoj svete!” třináctkrát za sebou. Každý řetězec bude na novém řádku a uvozen pořadovým číslem – využijte cyklus!
    2) pro každé pořadové číslo program zjistí, zda je číslo dělitelné pěti a vypíše poznámku do závorky.
    3) program vypíše jen sudá čísla do 30
    4) program vypise fibonaciho posloupnost do 50 (0 1 1 2 3 5 8 13 21 34 55)

# Debugging 
- projděte si základní debugging s cvičícím
- použíjte jednoduchý kód:
```c
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>

#define LED1 LATDbits.LATD2
#define BTN1 PORTCbits.RC0

int main(void) {
    
    TRISDbits.TRISD2 = 0;
    TRISCbits.TRISC0 = 1;
    unsigned char i = 0;
    
    while(1){
        
        if (BTN1){                          //  kontrola stisknuti BTN1
            LED1 = 1;                       //  prevráceni LED1 pomoci XOR
            i++;                            //  inkrementace i
        }
        else{
            LED1 = 0;
            i--;                            // dekrementace i
        } 
    }
    return 0;                               //  nikdy se neprovede
}
```

<p align="center">
  <img width="800" height="600" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/01_CV/Debugging.png">
</p>

- zahajeni debuggingu
- krokování
- breakpointy
- disassembly
- sledování registrů a proměnných
- optimalizace
