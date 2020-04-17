## 1. Ovládejte rychlost a směr motoru pomocí potenciometru POT2. Pokud bude POT2 ve střední poloze, bude motor zastavený. Při otáčení potenciometrem do horní polohy bude motor postupně zrychlovat otáčení na jednu stranu. Při otočení potenciometru do spodní polohy bude motor postupně zrychlovat otáčení na opačnou stranu než v předchozím případě.

```c
#pragma config FOSC =       HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG =     OFF          // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN =   ON          // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN =      OFF         // watchdog off


#include <xc.h>
#include <stdint.h>

void init(void);

void main(void) {
    init();
    LCD_Init();
    
    uint16_t pot2_val = 0;
    uint16_t duty = 0;    
    
    while(1) {
        GODONE = 1;                 // spustim konverzi
        while(GODONE){};            // cekam na konverzi
        pot2_val = (ADRESH << 8) | ADRESL;
        
        if (pot2_val > 512) {
            LATC1 = 0;
            duty = (pot2_val - 512) * 2; 
            CCPR1L = duty >> 2;
            CCP1CONbits.DC1B = duty & 0b11;  
        } else {
            LATC1 = 1;
            duty = pot2_val * 2;
            CCPR1L = duty >> 2;
            CCP1CONbits.DC1B = duty & 0b11;
        }        
    }
    
}

void init(void) {
    // ADC pro potenciometr
    ANSELE = 0b1;                   //RE0/AN5
    ADCON2bits.ADFM = 1;            //left justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16 Tad
    ADCON0bits.ADON = 1;            //ADC zapnout
    ADCON0bits.CHS = 5;             // kanal AN5
    
    // DIR
    TRISCbits.RC1 = 0;

    // PWM    
    TRISCbits.RC2 = 1;
    
    PSTR1CONbits.STR1A = 1;
    PSTR1CONbits.STR1B = 0;
    
    CCPTMRS0bits.C1TSEL = 0b00;        
    PR2 = 199;
    
    CCP1CONbits.CCP1M = 0b1100;
    CCP1CONbits.P1M = 0b00;
    
    CCPR1L = 0;
    
    T2CONbits.T2CKPS = 0b00;
    TMR2IF = 0;
    TMR2ON = 1;
    
    while(!TMR2IF) {};    
    TRISCbits.RC2 = 0;
}

```

## 2. Nakonfigurujte PWM1 jako Half-bridge P1A motor a P1B LED5 (Tak že P1B je invertovaná k P1A).

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
    PR2 = 199;                      // f = 10kHz
    CCP1CONbits.P1M = 0b10;         // PWM single
    CCP1CONbits.CCP1M = 0b1101;     // PWM single
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