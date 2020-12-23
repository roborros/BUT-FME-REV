# REV - Čtvrté cvičení
- GPIO (Rozpis pinů na EduKitu)

<p align="center">
  <img width="600" height="400" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/04_CV_GPIO/IOEduKit.png">
</p>

- Mapa SFR pro PIC18f46k22 str.78:

<p align="center">
  <img width="700" height="810" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/04_CV_GPIO/SFRegisters.png">
</p>

## Prace s registry SFR:
K ovládání pinů slouží specialní registry SFR TRISx, LATx, PORTx (někdy je třeba vypnout analogové funkce pomocí ANSELx). Zápisem, nebo čtením těchto registrů můžeme ovladat/zjistit stav periferie. V C pro překladač XC8 můžeme použít adresu v paměti na které se příslušný registr nachazí. Používá se zápis volatile int "mujnazev" __at("adresa"). Slovicko volatile je pokyn pro překladač, který vyloženě zakazuje optimalizace teto proměnné (bude dále diskutováno v dalších cvičeních). S proměnou se pak pracuje jako obvykle lze ji nastavovat i číst. Záleží na konkrétních vlastnostech příslušného registru. U GPIO slouží např. registr LATx pro zápis na pin, naopak registr PORTx ke čtení stavu pinu.  

- Registry LATx (bity odpovídají jednotlivým pinům):

<p align="center">
  <img width="800" height="210" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/04_CV_GPIO/LATx.png">
</p>

## Pro práci s GPIO slouží tyto registry:

1) TRISx  // Slouží k nastavení vstup 1 /výstup 0
2) LATx   // výstupní registr
3) PORTx  // vstupní registr
4) ANSELx // ovládání analogových funkcí ( ADC, nebo komparátor)

## Příklad 4.1

Postup:

    1) vytvorte projekt(Standalone project)
    2) cilove zarizeni je PIC18F46K22
    3) jako prekladac zvolte Microchip XC8
    4) jako programator zvolte PICKIT3
    5) vytvorte novy soubor main.c, zkopirujte do nej prilozeny kod
    6) pomoci “Build main project” sestavte projekt
    7) pomoci “Make and Program device” naprogramujte zarizeni
    
```c
// REV GPIO
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

volatile unsigned int TRISD     __at(0xf95);  
volatile unsigned int TRISC     __at(0xf94);

volatile unsigned int LATD      __at(0xf8c);
volatile unsigned int PORTC     __at(0xf82);

int main(void) {
    
    TRISD &= ~(1 << 2);     // nastaveni RD2 jako výstup
    TRISC |= 0b1;           // nastavení RC0 jako vstup
    
    while(1){
        
        if (PORTC & 0b1){               //  kontrola stisknutí BTN1
            LATD ^= (1 << 2);           //  prevrácení LED1 pomocí XOR
        }
        for(long i=1; i<100000; i++);   //  cekání...  
    }
    return 0;                           // nikdy se neprovede
}
```
## Úloha:
   1) Přidejte stejnou funkcionalitu LED3 blika jen po stisku BTN3
   
## Příklad 4.2
Naštěstí má výrobce k dispozici soubory, kde jsou již makra pro práci s registry. Jejich používání šetří čas a minimalizuje chybu. Tyto makra můžeme používat po přidání hlavičkového souboru xc.h. Názvy korespondují s názvy SFRs v datasheetu.

```c
// REV GPIO
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>


int main(void) {
    
    TRISDbits.TRISD2 = 0;
    TRISCbits.TRISC0 = 1;
    
    while(1){
        
        if (PORTCbits.RC0){             //  kontrola stisknuti BTN1
            LATDbits.LATD2 ^= 1;        //  prevráceni LED1 pomoci XOR
        }
        for(long i=1; i<100000; i++);   //  cekani...  
    }
    return 0;                           // nikdy se neprovede
}
```

```
Tipy:
Povšimněte si především přístupu k jednotlivým bitům přes tečkovou notaci. MPLAB obsahuje nápovědu ctrl + mezerník.
```

### Upravte program tak, aby zobrazoval různé sekvence:
    
   1) Zaveďte makra LED1 a BTN1. Zkuste si jejich použití místo plného názvu
   2) Had: Hada predstavuje dvojice sousednich sviticich LED. Had se posouva tak dlouho, než dorazi na konec radku, pak se otoci a plazi se zpet. Sekvence tedy bude vypadat takto: 00011 → 00110 → 01100 → 11000 → 01100 atd.
   3) Knight rider: jednotlive LED se postupne poporade rozsveci a pak v opacnem poradi zhasinaji. Na 3 led by sekvence vypadala takto: 000 → 001 → 011 → 111 → 011 → 001
   4) Counter strike alias binarni citani, sekvence vypada nasledovne: 0000 → 0001 → 0010 → 0011 → 0100 → …

### Ovládání LED binárním kódem:

```c
void driveLED(char in){
        LATD2 = in & 1;             //LED0
        LATD3 = in & 2 ? 1 : 0;     //LED1
        LATC4 = in & 4 ? 1 : 0;     //LED2
        LATD4 = in & 8 ? 1 : 0;     //LED3
        LATD5 = in & 16 ? 1 : 0;    //LED4
        LATD6 = in & 32 ? 1 : 0;    //LED5
}
```


### Upravte program tak, aby reagoval na stisknuta tlacitka (na jednorazove stlaceni, nikoliv na podrzeni!)

   1) Upravte program tak, aby jedno stisknuti tlacitka BUT1 zmenilo rychlost blikani cele rady LED. Definujte tri rychlosti, prepinejte mezi nimi cyklicky. Nezapomente na debouncing!
   2) Tlacitko BUT2 bude funkovat jako Pause/Resume
   3) Tlacitko BUT3 bude fungovat jako prepinac jednotlivych rezimu (viz ulohy 2) - 4))
   4) BONUS: tlacitko BUT4 bude fungovat jako prepinac intenzity svitu LED (pouzijte princip PWM)

## Doma:
 - Debugujte následující kód. Jaky je rozdil v disassembly? 
 
 ```c
// REV GPIO
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>

#define LED1 LATDbits.LATD2
#define LED2 LATDbits.LATD3


int main(void) {
    
    TRISDbits.TRISD2 = 0;
    TRISDbits.TRISD3 = 0;
    
    while(1){

        LED1 ^= 1;                      //  prevráceni LED1 pomoci XOR
        LED2 = ~LED2;                   //  prevráceni LED1 pomoci bitove negace
        
        for(long i=1; i<100000; i++);       //  cekani...  
    }
    return 0;                               //  nikdy se neprovede
}
```
