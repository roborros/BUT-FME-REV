# REV - Deváté cvičení
- WDT a SLEEP

## Zapojení potenciometrů na RevKitu:

<p align="center">
  <img width="520" height="350" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/07_CV/ADC_Piny.png">
</p>

### Konfigurace:

    - #pragma config WDTEN = ON
    - #pragma config WDTPS = 256 (hodnota je dělička jako u timeru)

### smazani WDT:

    - PIC18 má instrukci 'CLRWDT', instrukce lze do C programu zadat příkazem __asm("CLRWDT");


## Přiklad 9.1:
Rozsviťe LED1 v případě, že je potenciometr POT1 v horní polovině svého rozsahu a zhasněte ji, je-li potenciometr v dolní polovině svého rozsahu.
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
 
    ADCON2bits.ADFM = 1;            //right justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout
        
    TRISDbits.TRISD2 = 0;           // led1 vystup
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

## Přiklad 9.2:
Vypište hodnotu z AD převhodníku pro potenciometr POT1 na LCD displej.
```c
// REV ADC
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdio.h>
#include <stdint.h>

#include "lcd.h"

#define _XTAL_FREQ 32E6

void main(void) {
    
    LCD_Init();
    
    ANSELA |= (1 << 5);             //AN4
    ANSELE = 0b1;                   //AN5
 
    ADCON2bits.ADFM = 1;            //right justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout
    
    uint16_t pot1;                  // promenna pro vysledek prevodu
    char text[17] = "";             // retezec zatim prazdny
    
    while(1){
        
        ADCON0bits.CHS = 5;                         // kanal AN5
        GODONE = 1;                                 // spustit aproximaci
        while(GODONE);                              // cekam nez je hotovo
        pot1 = (uint16_t)((ADRESH << 8) | ADRESL);  // cteni vysledku
        
        sprintf(text, "ADC = %d             ", pot1);
        LCD_ShowString(1, text);
        
        __delay_ms(40);
    }
    
    return;
}

```
## Přiklad 9.3:
Vypište hodnotu z AD převhodníku pro potenciometr POT1 na LCD displej. Využijte přerušení vyvolané ADC.
```c
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdio.h>
#include <stdint.h>

#include "lcd.h"

#define _XTAL_FREQ 32E6

volatile uint16_t g_pot1;

void __interrupt() ADC_ISR(){
    if(ADIE && ADIF){
        g_pot1 = (uint16_t)((ADRESH << 8) | ADRESL);  // cteni vysledku
        ADIF = 0;
    }

}

void main(void) {
    
    LCD_Init();
    
    ANSELA |= (1 << 5);             //AN4
    ANSELE = 0b1;                   //AN5
 
    ADCON2bits.ADFM = 1;            //right justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout
    ADCON0bits.CHS = 5;             // kanal AN5
    
    // nastaveni pro preruseni na dokoncenou konverzi
    ADIF = 0;       // pro jistotu nuluji priznak IRQ Interrupt ReQuest pro preruseni
    PEIE = 1;       // periferie Interrupt
    ADIE = 1;       // ADC Interrupt
    GIE  = 1;       // globalni povoleni Interrupt
    
    char text[17] = "";             // retezec zatim prazdny
    
    while(1){
        
        GODONE = 1;         // spustit aproximaci
        __delay_ms(40);
        
        sprintf(text, "ADC = %d             ", g_pot1);
        LCD_ShowString(1, text);

    }
    
    return;
}

```
