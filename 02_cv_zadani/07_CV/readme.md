# REV - Sedmé cvičení
- ADC

## Postup práce s ADC

### Konfigurace:

    - žádaným vstupům (piny) je třeba přiřadit analogovou funkci (registry ANSEL0 a ANSEL1)
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
```c
    ANSELA = 0b00100000;  //AN4
    ANSELE = 0b1;  //AN5
 
    ADCON0bits.CHS = 4; //select AN4
    //ADCON0bits.CHS = 5; //select AN5
 
    ADCON2bits.ADFM = 0;    //left justified
    ADCON2bits.ADCS = 0b110;    //Fosc/64
 
    ADCON0bits.ADON = 1;    //ADC turn on
    _delay(200);
```

Čtení z ADC:
```c
       GODONE = 1;
        while (GODONE);
 
        //data = (ADRESH << 8) + ADRESL;
        data = ADRESH;  //jen 8 bitu
```

## Ukázka:

```c
/* 
 * File:   main_ADC.c
 * Author: mat
 *
 */
 
#include <xc.h>
 
#pragma config WDTEN = OFF
#pragma config FOSC = INTIO7
#pragma config MCLRE = EXTMCLR
#pragma config FCMEN = ON
 
 
#define LED0 LATD2
#define LED1 LATD3
#define LED2 LATC4
#define LED3 LATD4
#define LED4 LATD5
#define LED5 LATD6
 
#define BTN0 PORTC0
#define BTN1 PORTA4
#define BTN2 PORTA3
#define BTN3 PORTA2
 
void driveLED(char in){
        LATD2 = in & 1; asm("nop"); //LED0
        LATD3 = in & 2 ? 1 : 0; asm("nop"); //LED1
        LATC4 = in & 4 ? 1 : 0; asm("nop"); //LED2
        LATD4 = in & 8 ? 1 : 0; asm("nop"); //LED3
        LATD5 = in & 16 ? 1 : 0; asm("nop"); //LED4
        LATD6 = in & 32 ? 1 : 0; asm("nop"); //LED5
}
 
void main(void) {
 
    OSCCON = (OSCCON & 0b10001111) | 0b01110000;    // internal oscillator at full speed (16 MHz)
 
    TRISA = 0b00111100;
 
    TRISC = 0b00000001; // RC0 BTN1, RC4 LED
    ANSELC = 0;
 
    TRISD = 0b10000011; // LEDs: 2..6 out
    ANSELD = 0;
 
    TRISE = 1;
    ANSELE = 0b1;
 
    //ADC config
    ANSELA = 0b00100000;
    ANSELE = 0b1;
 
    ADCON0bits.CHS = 4; //select AN4
    //ADCON0bits.CHS = 5; //select AN5
    ADCON0bits.ADON = 1;    //ADC turn on
    ADCON2bits.ADFM = 0;    //left justified
    ADCON2bits.ADCS = 0b110;    //Fosc/64
 
    while (1){
 
        GODONE = 1;
        while (GODONE);
 
        if (ADRESH > 128) driveLED(~1);
        else driveLED(~2);
 
        //_delay(200);
    }
}
```

### Zadaní:

 1) Načítejte hodnoty z potenciometru (vstup AN4) a postupně rozsvicujte jednotlivé LED0-LED5 (bargraph). Použij funkci driveLED.

 2) Vypisujte na UART načítanou 10bitovou hodnotu v celočíselném formátu (cca 1x za sekundu).

 3) Vypisujte POT1 a POT2 na displej. 

