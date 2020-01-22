# REV - Osmé cvičení
- PWM

## Příklad 1
Programová inicializace PWM LEDkami:

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

## Ukázka:
 
```c
#include <xc.h>
 
#pragma config WDTEN =  OFF
#pragma config FOSC =   HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor enabled)
#pragma config IESO = OFF       // Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)
 
 
#define BTN1    PORTCbits.RC0
#define BTN2    PORTAbits.RA4
#define BTN3    PORTAbits.RA3
#define BTN4    PORTAbits.RA2
 
#define LED1    LATDbits.LATD2
#define LED2    LATDbits.LATD3
#define LED3    LATCbits.LATC4
#define LED4    LATDbits.LATD4
#define LED5    LATDbits.LATD5
#define LED6    LATDbits.LATD6
 
void driveLED(char in){
        LATD2 = in & 1; asm("nop"); //LED1
        LATD3 = in & 2 ? 1 : 0; asm("nop"); //LED2
        LATC4 = in & 4 ? 1 : 0; asm("nop"); //LED3
        LATD4 = in & 8 ? 1 : 0; asm("nop"); //LED4
        LATD5 = in & 16 ? 1 : 0; asm("nop"); //LED5
        LATD6 = in & 32 ? 1 : 0; asm("nop"); //LED6
}
 
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
 
    driveLED(0b111111);
 
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
