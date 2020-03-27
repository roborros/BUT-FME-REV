# REV - Osmé cvičení
- PWM
PWM periferie je určená pro aplikace k regulaci výkonu. Většina moderních aplikací z výkonové elektroniky používá k regulaci výkonu tranzistory ve spínacím režimu. Duležitým pojmem je perioda PWM a střída. V regulaci elektrických pohonů se setkáváme nejčastěji s periodou PWM 10-20 kHz. 

<p align="center">
  <img width="520" height="350" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/07_CV/ADC_Piny.png">
</p>

## Programová inicializace PWM:

```c
    //init - PWM
    PSTR1CON = 0b10;    //P1B PWM
    CCPTMRS0bits.C1TSEL = 0b00;       //timer2 will be used
    PR2 = 200;           //period
    CCP1CON = 0b10001100;   //enable PWM
    CCPR1L = 50;         //duty cycle
 
    //init - timer2
    T2CON = 0b00111101;
```

## Ukázka 2:
 
```c
// REV PWM
#pragma config FOSC =   HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN =  OFF
 
#include <xc.h> 

#define BTN1    PORTCbits.RC0

 
void main(void) {
 
    //init - PWM
    PSTR1CON = 0b00001;                 //P1A PWM
    CCPTMRS0bits.C1TSEL = 0b00;         //timer2 will be used
    PR2 = 200;                          //period
    CCP1CON = 0b00001101;               //enable PWM
    CCPR1L =150;                        //duty cycle
 
    //init - timer2
    T2CON = 0b00111101;
 
    TRISA = 0b00111100;
 
    TRISC = 0b00000001;                 // RC0 BTN1, RC4 LED
    ANSELC = 0;
 
    TRISD = 0b10000011; // LEDs: 2..6 out
    ANSELD = 0;
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
 
    while (1){
        if (BTN1){
            LATC1 = 0;
        }
        else{
            LATC1 = 1;
        }
   }
}
```
### Zadání:

  1) Otestujte funkčnost kódu pro PWM

  2) Nastavujte rychlost motoru

  3) Ovládejte rychlost motoru potenciometrem

  4) Nakonfigurujte PWM1 jako Half-bridge P1A motor a P1B LED5 (Tak že P1B je invertovaná k P1A) 
