# REV - Osmé cvičení
- PWM
<p align="center">
  <img width="610" height="210" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/08_CV/PIC18PWMdiagram.png">
</p>

PWM periferie je určená pro aplikace k regulaci výkonu. Většina moderních aplikací z výkonové elektroniky používá k regulaci výkonu tranzistory ve spínacím režimu. Duležitým pojmem je perioda PWM a střída (duty cycle). V regulaci elektrických pohonů se setkáváme nejčastěji s periodou PWM 10-20 kHz. 

<p align="center">
  <img width="360" height="210" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/08_CV/PWM.png">
</p>

<p align="center">
  <img width="140" height="35" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/08_CV/CodeCogsEqn.png">
</p>

## Programová inicializace PWM:

```c
    //init - PWM
    TRISDbits.RD5 = 0;              // vypnu pin P1B
    TRISCbits.RC2 = 0;              // vypnu pin P1A
    CCPTMRS0bits.C1TSEL = 0b00;     // Timer 2 
    PR2 = 200;                      // cca 10kHz
    CCP1CONbits.P1M = 0b00;         // PWM single
    CCP1CONbits.CCP1M = 0b1100;     // PWM single
    CCPR1L = 0;                     // strida 0%
    TMR2IF = 0;                     // nastavi se az pretece timer
    TMR2ON = 1;                     // staci zapnout defaultne je nastaven jak chceme
    while(!TMR2IF){};               // cekam az jednou pretece
    PSTR1CON |= 0b11;               // stream na P1B a P1A
```

## Ukázka 1:
 Nastavení jasu LED pomocí PWM a potenciometru (motor odpojen=neni tam jumper; po přidáni jumperu lze regulovat rychlost motoru)
 
```c
// REV PWM
#pragma config FOSC =       HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG =     OFF          // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN =   ON          // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN =      OFF         // watchdog off
 
#include <xc.h>

#define SETDUTY(x) CCPR1L = x

void main(void) {
    
    //GPIO
    TRISD = 0b10000011;     // LEDs: 2..6 out
    TRISCbits.RC4 = 0;      // LED 3    
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    //init - PWM
    TRISDbits.RD5 = 1;              // nastavim jako vstup pin P1B
    TRISCbits.RC2 = 1;              // nastavim jako vstup pin P1A
    PSTR1CON |= 0b11;               // steering na P1B a P1A
    
    CCPTMRS0bits.C1TSEL = 0b00;     // Timer 2 
    PR2 = 200;                      // cca 10kHz
    CCP1CONbits.P1M = 0b00;         // PWM single
    CCP1CONbits.CCP1M = 0b1100;     // PWM single
    CCPR1L = 0;                     // strida 0%    
    T2CONbits.T2CKPS = 0b00;        // 1:1 Prescaler
    TMR2IF = 0;                     // nastavi se az pretece timer
    TMR2ON = 1;                     // staci zapnout defaultne je nastaven jak chceme
    while(!TMR2IF){};               // cekam az jednou pretece
        
    TRISDbits.RD5 = 0;              // nastavim jako vystup pin P1B
    TRISCbits.RC2 = 0;              // nastavim jako vystup pin P1A
            
    // ADC pro potenciometr
    ANSELE = 0b1;                   //RE0/AN5
    ADCON2bits.ADFM = 0;            //left justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16 Tad
    ADCON0bits.ADON = 1;            //ADC zapnout
    ADCON0bits.CHS = 5;             // kanal AN5
    
    while (1){
        GODONE = 1;                 // spustim konverzi
        while(GODONE){};            // cekam na konverzi
        SETDUTY(ADRESH);            // nastavim stridu pouzivam jen 8hornich bitu
   }
}
```

## Ukázka 2:
 změna směru otáčení motoru na stisk tlačítka
```c
// REV PWM
#pragma config FOSC =   HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN =  OFF
 
#include <xc.h> 

#define BTN1    PORTCbits.RC0

 
void main(void) {
    
//GPIO
    TRISD = 0b10000011;     // LEDs: 2..6 out
    TRISC = 0b00000001;     // RC0 BTN1, RC4 LED
    ANSELC = 0;
    ANSELD = 0;
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    //init - PWM
    TRISDbits.RD5 = 0;              // vypnu pin P1B
    TRISCbits.RC2 = 0;              // vypnu pin P1A
    CCPTMRS0bits.C1TSEL = 0b00;     // T2mer 2 
    PR2 = 200;                      // cca 10kHz
    CCP1CONbits.P1M = 0b00;         // PWM single
    CCP1CONbits.CCP1M = 0b1100;     // PWM single
    CCPR1L = 150;                   // strida 59%
    TMR2IF = 0;                     // nastavi se az pretece timer
    TMR2ON = 1;                     // staci zapnout defaultne je nastaven jak chceme
    while(!TMR2IF){};               // cekam az jednou pretece
    PSTR1CON |= 0b01;               // stream na P1B a P1A
 
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

  2) Nastavujte rychlost motoru pomocí změny střídy.

  3) Ovládejte rychlost motoru potenciometrem.

  4) Nakonfigurujte PWM1 jako Half-bridge P1A motor a P1B LED5 (Tak že P1B je invertovaná k P1A).
