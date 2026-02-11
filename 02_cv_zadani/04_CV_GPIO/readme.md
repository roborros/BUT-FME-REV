# 🚀 Nainstalujte toolchain MPLAB+XC8:
1) Napřed nainstalujte MPLAB (nejlépe defaultně do program files)
3) Poté nainstalujte kompilátor XC8 (zaškrtněte ať se vám přidá do system path)

## Odkazy:
[MPLAB IDE](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide#tabs)

[XC8 compiler](https://www.microchip.com/en-us/development-tools-tools-and-software/mplab-xc-compilers#tabs)

## REV - Čtvrté cvičení GPIO
- GPIO (Rozpis pinů na AVR desce)

<p align="center">
  <img width="800" height="800" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/04_CV_GPIO/AVR_pinout.png">
</p>

### Peripheral Address Map pro AVR128DB48 str.68:

<p align="center">
  <img width=750" height="700" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/04_CV_GPIO/registry_map.png">
</p>

## 💡 Struktura Periferie (Base & Offset)
Každý port (PORTA, PORTB, atd.) je v paměti reprezentován jako blok registrů začínající na **Base Address** (např. `PORTA` = `0x0400`). Konkrétní funkce se pak adresují pomocí **Offsetu** (vzdálenosti od báze).


| Registr | Offset | Popis funkce |
| :--- | :--- | :--- |
| **DIR** | `+0x00` | **Direction**: Určuje směr (0 = Vstup, 1 = Výstup). |
| **OUT** | `+0x04` | **Output**: Nastavuje logickou úroveň výstupu. |
| **IN** | `+0x08` | **Input**: Slouží pro čtení aktuálního stavu pinu. |



## Atomické Registry (SET, CLR, TGL)
Pro bezpečnou a rychlou manipulaci s jednotlivými bity bez ovlivnění ostatních slouží specializované registry:

* **`SET` (Např. `OUTSET`):** Zápis `1` nastaví daný bit na **logickou 1**. (Zápis `0` nemá žádný vliv).
* **`CLR` (Např. `OUTCLR`):** Zápis `1` vynuluje daný bit na **logickou 0**.
* **`TGL` (Např. `OUTTGL`):** Zápis `1` invertuje (přepne) aktuální stav bitu.


## Konfigurace Pinu (PINnCTRL)
Každý fyzický pin má svůj vlastní konfigurační registr `PINnCTRL` (kde `n` je číslo pinu 0–7). Tento registr umožňuje nastavit specifické vlastnosti hardwaru:

* **PULLUPEN:** Aktivuje interní pull-up rezistor.
* **INVEN:** Invertuje logiku pinu přímo na hardwarové úrovni (vhodné pro tlačítka se spínáním proti zemi).
* **ISC:** Konfigurace přerušení (vypnuto, náběžná hrana, sestupná hrana, obě hrany, nízká úroveň).

---

## 🏗️ Příklad 4.1

Postup:

    1) vytvorte projekt(Standalone project)
    2) cilove zarizeni je AVR128DB48
    3) jako prekladac zvolte Microchip XC8
    4) jako programator/debugger zvolte ten na kitu
    5) vytvorte novy soubor main.c, zkopirujte do nej prilozeny kod
    6) pomoci “Build main project” sestavte projekt
    7) pomoci “Make and Program device” naprogramujte zarizeni
    
```c
int main(void) {
    
    char *DIRSETB   = (char*)(0x0420 + 0x01);
    char *OUTTGLB   = (char*)(0x0420 + 0x07);
    char *INB       = (char*)(0x0420 + 0x08);
    char *PIN2CTRL  = (char*)(0x0420 + 0x12);
    
    *DIRSETB  |= (1 << 3);
    *PIN2CTRL |= (1 << 3);
    
    volatile long i;
    
    while(1){
        
        if(!(*INB & (1 << 2))){
            
            for(i = 0; i < 10000; i++){
        
            }
        
            *OUTTGLB |= (1 << 3);
        
        
        } 
    }
    
}
```
## 📝 Úloha:
   1) Přidejte tlačítko na kitu. Led bliká, pokud držím tlačítko.
   
## 🏗️ Příklad 4.2
Naštěstí má výrobce k dispozici hlavičkové soubory, kde jsou již makra pro práci s registry. Jejich používání šetří čas a minimalizuje chybu. Tyto makra můžeme používat po přidání hlavičkového souboru <avr/io.h>. Názvy korespondují s názvy registrů v datasheetu.

```c

#define F_CPU 4000000UL    // Definice frekvence (výchozí u AVR DB je 4 MHz)
#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN 3          // Definujeme pin PB3

int main(void) {
    // 1. Nastavení pinu jako VÝSTUP (Output)
    // Používáme registr DIRSET pro atomický zápis
    PORTB.DIRSET = (1 << LED_PIN);

    while (1) {
        // 2. Překlopení (Toggle) stavu pinu
        // Každým zápisem 1 do OUTTGL se stav LED změní (z 0 na 1 a naopak)
        PORTB.OUTTGL = (1 << LED_PIN);

        // 3. Čekání (500 ms)
        _delay_ms(500);
    }
}

```

```
 📌 Tipy:
Povšimněte si především přístupu k jednotlivým registrům přes tečkovou notaci. MPLAB obsahuje nápovědu ctrl + mezerník.
Je možné použít knihovní funkci _delay_ms(500); Je třeba definovat makro (např.): #define F_CPU 4000000UL
```

### 📝 Upravte program tak, aby zobrazoval různé sekvence:
    
   1) Zaveďte makra LED1 a BTN1. Zkuste si jejich použití místo plného názvu
   2) Had: Hada predstavuje dvojice sousednich sviticich LED. Had se posouva tak dlouho, než dorazi na konec radku, pak se otoci a plazi se zpet. Sekvence tedy bude vypadat takto: 00011 → 00110 → 01100 → 11000 → 01100 atd.
   3) Knight rider: jednotlive LED se postupne poporade rozsveci a pak v opacnem poradi zhasinaji. Na 3 led by sekvence vypadala takto: 000 → 001 → 011 → 111 → 011 → 001
   4) Counter strike alias binarni citani, sekvence vypada nasledovne: 0000 → 0001 → 0010 → 0011 → 0100 → …


### 📝 Upravte program tak, aby reagoval na stisknuta tlacitka (na jednorazove stlaceni, nikoliv na podrzeni!)

   1) Upravte program tak, aby jedno stisknuti tlacitka BUT1 zmenilo rychlost blikani cele rady LED. Definujte tri rychlosti, prepinejte mezi nimi cyklicky. Nezapomente na debouncing!
   2) Tlacitko BUT2 bude funkovat jako Pause/Resume
   3) Tlacitko BUT3 bude fungovat jako prepinac jednotlivych rezimu (viz ulohy 2) - 4))
   4) BONUS: tlacitko BUT4 bude fungovat jako prepinac intenzity svitu LED (pouzijte princip PWM)

## 💥 Doma:
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
