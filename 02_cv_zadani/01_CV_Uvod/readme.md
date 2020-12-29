# REV - První cvičení
- Seznamme se s vývojovým prostředím DEV C++. Stahněte ukázkový projekt REV_basic, zkompilujte jej a nahrajte do MCU.

## odkazy:
[IDE](https://sourceforge.net/projects/orwelldevcpp/)

<p align="center">
  <img width="700" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/01_CV_Uvod/Prostredi.png">
</p>
- pro spuštění programu je třeba jej zkompilovat (F9) a spustit (F10), nebo oboje (F11). Najdete tlačítka i na horní lište IDE

## Příklad 1.1
* Následující výpis ukazuje jednoduchý příklad v jazyce C. Program vypisuje hodnotu proměnné count 
```c
// REV-Basic

#include <stdio.h>

void main(void) {
    char count = 0;
    int i;
    char a = 'x';
  
    for(;;){
        count++;

        printf("count: %d (0x%x) (%c)\n",count,count,a);
        
        if (count == 0) break;
 
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
   5) program vyhodnotí jestli je číslo dělitelné 3, nebo 7, ale ne zároveň

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
  <img width="700" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/01_CV_Uvod/Debug.png">
</p>

- zaklady debuggingu
- krokování
- breakpointy
- disassembly
- sledování registrů a proměnných
