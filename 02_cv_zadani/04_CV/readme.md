# REV - Čtvrté cvičení
- GPIO (Obecný vstup/výstup)
![Test Image 1](3DTest.png)
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
/*
 * File:   01.01-pic_basics-LEDs/main.c
 * Author: mat, res
 */
 
/* fuses */
#pragma config WDTEN = OFF      // Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
#pragma config FOSC = INTIO7    // Oscillator Selection bits 
#pragma config MCLRE = EXTMCLR  // reset function
#pragma config FCMEN = ON
 
// device include
#include <xc.h>              //-- pro prekladac XC8
 
 
#define _XTAL_FREQ 16000000 // clock procesoru pro funkce delay
// mozno pouzivat: 
// _delay( n );        - pocka n cyklu procesoru
// __delay_ms( n );    - pocka n milisekund
 
 
 
#define LED0 LATD2
#define LED1 LATD3
#define LED2 LATC4
#define LED3 LATD4
#define LED4 LATD5
#define LED5 LATD6
 
#define BTN0 PORTCbits.RC0
#define BTN1 PORTAbits.RA4
#define BTN2 PORTAbits.RA3
#define BTN3 PORTAbits.RA2
 
/*********************************/
// function main()
/*********************************/
int main(void) {
    char count = 0;
    int i;
 
    //configure oscillator
    OSCCON = (OSCCON & 0b10001111) | 0b01110000;    //internal oscillator at full speed (16 MHz)
 
    //configure TRIS + ANSEL
    TRISA = 0b00011100; // RA4 BTN2, RA3 BTN3, RA2 BTN4
    ANSELA = 0;
    TRISC = 0b00000001; // RC0 BTN1, RC4 LED
    ANSELC = 0;
    TRISD = 0b10000011; // LEDs: 2..6 out
    ANSELD = 0;
 
    //infinite main loop
    while(1){
        count++;
 
        LATD2 = count & 1;
        asm("nop");
        LATD3 = count & 2 ? 1 : 0;
        asm("nop");
 
        LATC4 = ~PORTCbits.RC0;
        asm("nop");
        LATD4 = ~PORTAbits.RA4;
        asm("nop");
        LATD5 = ~PORTAbits.RA3;
        asm("nop");
        LATD6 = ~PORTAbits.RA2;
 
        //wait
        __delay_ms(200); 
    }
}
```
## Další ulohy:

### Upravte program tak, aby zobrazoval různé sekvence:

   1) Had: Hada predstavuje dvojice sousednich sviticich LED. Had se posouva tak dlouho, nez dorazi na konec radku, pak se otoci a plazi se zpet. Sekvence tedy bude vypadat takto: 00011 → 00110 → 01100 → 11000 → 01100 atd.
   2) Knight rider: jednotlive LED se postupne poporade rozsveci a pak v opacnem poradi zhasinaji. Na 3 led by sekvence vypadala takto: 000 → 001 → 011 → 111 → 011 → 001
   3) Counter strike alias binarni citani, sekvence vypada nasledovne: 0000 → 0001 → 0010 → 0011 → 0100 → …

### Upravte program tak, aby reagoval na stisknuta tlacitka (na jednorazove stlaceni, nikoliv na podrzeni!)

   1) Upravte program tak, aby jedno stisknuti tlacitka BUT1 zmenilo rychlost blikani cele rady LED. Definujte tri rychlosti, prepinejte mezi nimi cyklicky. Nezapomente na debouncing!
   2) Tlacitko BUT2 bude funkovat jako Pause/Resume
   3) Tlacitko BUT3 bude fungovat jako prepinac jednotlivych rezimu (viz ulohy a) - c))
   4) BONUS: tlacitko BUT4 bude fungovat jako prepinac intenzity svitu LED (pouzijte princip PWM)

### Ovládání LED binárním kódem:

```c
void driveLED(char in){
        LATD2 = in & 1; asm("nop"); //LED0
        LATD3 = in & 2 ? 1 : 0; asm("nop"); //LED1
        LATC4 = in & 4 ? 1 : 0; asm("nop"); //LED2
        LATD4 = in & 8 ? 1 : 0; asm("nop"); //LED3
        LATD5 = in & 16 ? 1 : 0; asm("nop"); //LED4
        LATD6 = in & 32 ? 1 : 0; asm("nop"); //LED5
}
```
