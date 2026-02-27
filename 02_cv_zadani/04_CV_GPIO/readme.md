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
    // Umístíme pointer na adresu registru periferie
    char *DIRSETB   = (char*)(0x0420 + 0x01);
    char *OUTTGLB   = (char*)(0x0420 + 0x07);

    // nastavení outputu
    *DIRSETB  |= (1 << 3);
    
    while(1){
        
        // Smyčka čekání pomocí for (volatile zakáže compilatoru optimalizovat/vynechat prázdný for)
        for(volatile long i = 0; i < 100000; i++){
        
        }
        // zápisem 1 do OUTTGLB se stav překlopí automaticky
        *OUTTGLB |= (1 << 3);
        
    } 
}  
```
## 📝 Úloha:
   1) Přidejte tlačítko na kitu. Led bliká, pokud držím tlačítko. (Tlačítko je na PB2 a je třeba zapnout interní pull-up rezistor)
   
## 🏗️ Příklad 4.2
Naštěstí má výrobce k dispozici hlavičkové soubory, kde jsou již makra a struktury pro práci s registry. Jejich používání šetří čas a minimalizuje chybu. Můžeme je používat po přidání hlavičkového souboru <avr/io.h>. Názvy korespondují s názvy registrů v datasheetu.

```c
#define F_CPU 4000000UL    // Definice frekvence (výchozi je 4 MHz)
#include <avr/io.h>
#include <util/delay.h>


int main(void) {
    // Nastavení pinu jako VÝSTUP (Output)
    // Používáme registr DIRSET
    PORTB.DIRSET = PIN3_bm;

    while (1) {
        // Překlopení (Toggle) stavu pinu
        // Každým zápisem 1 do OUTTGL se stav LED změní (z 0 na 1 a naopak)
        PORTB.OUTTGL = PIN3_bm;

        // Čekání 
        _delay_ms(500);
    }
}
```

```
 📌 Tipy:
Povšimněte si především přístupu k jednotlivým registrům přes tečkovou notaci. MPLAB obsahuje nápovědu ctrl + mezerník.
Je možné použít knihovní funkci _delay_ms(500); Je třeba definovat makro (např.): #define F_CPU 4000000UL a #include <util/delay.h>
```

### 📝 Upravte program tak, aby zobrazoval různé sekvence:
    
   1) Přidejte tlačítko i pomocí tohoto přístupu a zapněte interní pull-up rezistor.
   2) Zapojte semafor dle obrázku níže. Nastavte příslušné piny jako output a vyzkoušejte funkčnost.
   3) Knight rider: jednotlivé led se postupně rozsvěcují. Na 3 led sekvence vypadá takto: 000 → 001 → 011 → 111 → 011 → 001
   4) Counter strike alias binární čítání, sekvence vypadá následovně: 000 → 001 → 010 → 011 → 100 → 


### 📝 Připojte ke kitu další tlačítko

<p align="center">
  <img width="600" height="750" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/04_CV_GPIO/rgb_circuit.png">
</p>

   1) Tlačítka jsou zapojena tak, že mají opačnou logiku, tedy stisknuto je 0. Upravte to v configuračním registru pinu, aby byla invertovaná.
   2) Upravte program tak, aby jedno stisknutí tlačítka BUT1 změnilo rychlost blikání celé řady LED. Definujte tři rychlosti, přepínejte mezi nimi cyklicky. (detekujte pouze stisknutí a řešte debouncing)
   3) Tlačítko BTN2 bude fungovat jako PAUSE/RESUME (detekujte pouze stisknutí a řešte debouncing)

## 💥 Doma:
 - Debugujte následující kód. Vyzkoušejte breakpointy, watches, nastavování registrů, prohlídku pamětí a zobrazení assembleru. 
 
 ```c
#define F_CPU 4000000UL
#include <avr/io.h>

// Globalni promenne
uint8_t sensor_data[5] = {12, 45, 8, 120, 33};
uint8_t current_reading = 0;
uint16_t accumulated_sum = 0;
volatile uint8_t button_press_count = 0;

uint16_t test_fcn(uint8_t val);

int main(void) {
    // PB3 vystup
    PORTB.DIRSET = PIN3_bm;

    // PB2 pull-up
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm;

    while (1) {
        // Kontrola tlacitka
        if (!(PORTB.IN & PIN2_bm)) {
            
            button_press_count++; // breikpoint treba sem
            accumulated_sum = 0;

            // Iterace pres pole
            for (uint8_t i = 0; i < 5; i++) {
                current_reading = sensor_data[i];
                accumulated_sum += test_fcn(current_reading);
            }

            // Obracení led
            PORTB.OUTTGL = PIN3_bm;

            // Delay
            for (volatile uint32_t d = 0; d < 100000; d++);
        }
    }
}

uint16_t test_fcn(uint8_t val) {
    
    uint16_t result;
    if (val > 50) {
        result = (uint16_t)val * 2;
    } else {
        result = (uint16_t)val + 10;
    }
    return result;
}
```


# 🚀 Prompty pro studium MCU: 

Tento seznam obsahuje prompty pro LLM (jako Gemini nebo ChatGPT)

---
## 📍 1. GPIO periferie
**Prompt:**
> - Vysvětli koncept GPIO pinů na mikrokontroléru:
> - K čemu jsou v praxi vhodné. Jaké jsou režimy a různá nastavení.
> - Jaké jsou možnosti práce s GPIO na AVR128DB48 (input, output, pull-up, inverze logiky).
> - Vysvětli práci s SET CLR a TOGGLE registry na AVR128DB48

---

## 📍 1. Periferie, registry a definition files
**Prompt:**
> - Vysvětli koncept registrů periferii a práce s nimi na mikrokontrolérech
> - Vysvětli jak fungují bitové masky pro práci s registry 
> - Jaké možnosti mám jako programátor v C nastavit registr na příslušné adrese
> - K čemu je dobré používat difinnition files od výrobce například na AVR128DB48 po includu avr/io.h
