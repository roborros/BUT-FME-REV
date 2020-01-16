# REV - První cvičení
- Seznamme se s vývojovým prostředím MPLAB. Stahněte ukázkový projekt, zkompilujte jej a nahrajte do MCU.
- Prostředí pracuje pouze s hlavním projektem, ten je zvýrazněn a lze jej přepínat.
## Příklad 1.1
* Následující výpis ukazuje jednoduchý příklad v jazyce C. Program vypisuje hodnotu proměnné count a binárně bliká třemi LEDkami. 
```c
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <xc.h>
 
#include "rev-basic.h"
#include "simdelay.h"
 
#pragma config WDTEN = OFF
#pragma config FOSC = INTIO7
#pragma config MCLRE = EXTMCLR
#pragma config FCMEN = ON
 
void main(void) {
    char count = 0;
    int i;
    char a = 'x';
 
    REV_init();
 
    while(1){
        count++;
 
        REV_led(1,count & 1);
        REV_led(2,count & 2);
        REV_led(3,count & 4);
 
        printf("count: %d (0x%x) (%c)\n",count,count,a);
 
        DelayMs(100);
    }
}
```

## Úloha 1.2

* Další důležitou strukturou jsou cykly. Příklad využití cyklu while: 
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
