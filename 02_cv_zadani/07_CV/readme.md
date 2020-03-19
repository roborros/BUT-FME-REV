# REV - Sedmé cvičení
- ADC

<p align="center">
  <img width="850" height="350" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/07_CV/ADCscheme.png">
</p>

## Blokové schema ADC

<p align="center">
  <img width="850" height="350" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/07_CV/ADCscheme.png">
</p>

### Konfigurace:

    - žádaným vstupům (piny) je třeba přiřadit analogovou funkci (registry ANSELx)
    - nastavení vstupního rozsahu, tj. volba napěťové reference (pole VCFG v registru ADCON1)
    - nastavení vstupů pro zvolený kanál (AN4 a AN5 v našem případě)
    - zapnutí ADC modulu (ADCON0bits.ADON)

### Čtení:

    - spuštění vzorkování
    - krátká prodleva
    - spuštění konverze (kvantizace)
    - čekání na dokončení konverze (kontrolou ADCON0bits.DONE)
    - čtení výsledku konverze (registr ADRESH nebo ADRESL)

Programová inicializace ADC:

Teď přichází chvíle nastavit registr ANSELx pro příslušný pin na 1!

```c
    ANSELA |= (1 << 5);             //AN4 (RA5)
    ANSELE = 0b1;                   //AN5 (RE0)
 
    ADCON2bits.ADFM = 1;            //left justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout
```

Čtení z ADC:
```c
    GODONE = 1;
    while (GODONE);
    data = (ADRESH << 8) + ADRESL;
```

## Přiklad 7.1:

```c
// REV ADC
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>

void init(void){
  
    ANSELA |= (1 << 5);             //AN4
    ANSELE = 0b1;                   //AN5
 
    ADCON2bits.ADFM = 1;            //left justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout
    
    TRISCbits.TRISC6 = 0;           // uart TX vystup
    TRISDbits.TRISD2 = 0;           // led1 vystup
    
    SPBRG1 = 51;                    // (32_000_000 / (64 * 9600)) - 1
    // final enable
    RCSTAbits.SPEN = 1;             // enable UART peripheral
    TXSTAbits.TXEN = 1;             // enable TX
}

void main(void)
{
    init();
    
    unsigned int  pot1;
    
    while(1){

        ADCON0bits.CHS = 5;                 // kanal AN5
        GODONE = 1;                         // spustit aproximaci
        while(GODONE);                      // cekam nez je hotovo
        pot1 = (ADRESH << 8) | ADRESL;      // cteni vysledku
        
        if (pot1 > 512){
            LATD2 = 1;
        }
        else {
            LATD2 = 0;
        }
    }
    
}
```

### Zadání:

 1) Načítejte hodnoty z potenciometru (vstup AN4) a postupně rozsvicujte jednotlivé LED0-LED5 (bargraph). Použij funkci driveLED.

 2) Vypisujte na UART hodnotu v celočíselném formátu (cca 1x za sekundu).

 3) Vypisujte POT1 a POT2 na displej (použijte knihovnu pro LCD).
 

