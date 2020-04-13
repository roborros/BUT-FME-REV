
# REV - Deváté cvičení
- WDT a SLEEP [Link na video-návod](https://youtu.be/cwu20SQlFE4)

## Watchdog timer:
Jedná se o specifickou periferii MCU, která slouží pro bezpečnost aplikací. Jde o čítač, který je napojen na vnitřní oscilátor s frekvencí 31,25kHz. Je mu předřazena ještě dělička /128. Výsledná perioda je tedy 4ms (přesněji 4,096). Uživatel zapíná WDT a jeho výstupní děličku pomocí konfiguračních bitů. WDT se pak musí nulovat v softwaru speciální instrukcí procesoru. Pokud dojde k přetečení, dojde k resetu MCU.

<p align="center">
  <img width="850" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/09_CV/WDT.png">
</p>

LFINTOSC = 31,25 kHz

### Konfigurace:

    - #pragma config WDTEN = ON
    - #pragma config WDTPS = 256 (hodnota je dělička jako u timeru)

### smazani WDT:

    - PIC18 má instrukci 'CLRWDT', instrukce lze do C programu zadat příkazem __asm("CLRWDT");


## Přiklad 9.1:
Program demostruje využití WDT. Funkce trap() schválně obsahuje nekonečnou smyčku, kde přeteče WDT a resetuje MCU. BIT RCONbits.TO pak mohu používat k detekci, že nastal reset. V příkladu nám to oznámí zablikáním poslední LED.
```c
// WDT
#pragma config FOSC =   HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = OFF         // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)

// nastaveni WDT
#pragma config WDTEN = ON           // Watchdog Timer Enable bits (WDT is always enabled. SWDTEN bit has no effect)
#pragma config WDTPS = 256          // Watchdog Timer Postscale Select bits (1:256)

#include <xc.h>

#define _XTAL_FREQ 8E6
#define BTN1    PORTCbits.RC0
#define LED1    LATDbits.LATD2

void trap(void);

void main(void) {
    
    //GPIO
    TRISD = 0b10000011;     // LEDs: 2..6 out
    TRISC = 0b11101111;     // RC0 BTN1, RC4 LED
    ANSELC = 0;
    ANSELD = 0;
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    // reakce na WDT reset
    if(!RCONbits.TO){
        LATD6 = 0;
        __delay_ms(250);
        LATD6 = 1;
        __delay_ms(250);
        LATD6 = 0;
        __delay_ms(250);
        LATD6 = 1; 
    }
    
    while(1){
        if(BTN1){
            trap();
        }
        __delay_ms(100);
        LED1 ^= 1;
        __asm("CLRWDT");
    }
    return;
}

void trap(void){
    while(1);
}
```

## Řízení spotřeby:
PIC18 ma v podstatě dva power módy. Jedná se o IDLE a SLEEP. Rozdíl je ten, že SLEEP opravdu zastaví CPU i periferie, zatímco IDLE jen CPU. V IDLE modu mohu tedy probudit procesor například přerušením od periferie (ukážeme si TIMER). Ve SLEEP modu k tomu může sloužit třeba WDT, který tentokrát neresetuje, ale probudí zařízení. 

## Power mody:
<p align="center">
  <img width="700" height="260" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/09_CV/PowerModes.png">
</p>

## Přiklad 9.2:
IDLEN = 0 je to deep sleep. CPU i periferie neběží. K probuzení použijeme WDT. Který po provedení "SLEEP" instrukce procesor probudí.
```c
// WDT_SLEEP
#pragma config FOSC =   HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = OFF         // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)

// nastaveni WDT
#pragma config WDTEN = ON           // Watchdog Timer Enable bits (WDT is always enabled. SWDTEN bit has no effect)
#pragma config WDTPS = 256          // Watchdog Timer Postscale Select bits (1:256)

#include <xc.h>

#define BTN1    PORTCbits.RC0
#define LED1    LATDbits.LATD2

void main(void) {
    
    //GPIO
    TRISD = 0b10000011;     // LEDs: 2..6 out
    TRISC = 0b11101111;     // RC0 BTN1, RC4 LED
    ANSELC = 0;
    ANSELD = 0;
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    IDLEN = 0;
    
    while(1){
        LED1 ^= 1;
        __asm("SLEEP");
    }
    return;
}
```
## Přiklad 9.3:
IDLEN = 1 je to idle mod. CPU je vypnuto, ale periferie běží dál. Je možné probudit interrupt flagem. V tomto případě používáme TMR1.
```c
// REV TIMER
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = OFF     // 4X PLL Enable (Oscillator OFF)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>

#define _XTAL_FREQ 8E6                  // definice fosc pro knihovnu
#define LED LATDbits.LATD2              // ledka                  

void init(void){
    
    //GPIO
    TRISD = 0b10000011;     // LEDs: 2..6 out
    TRISC = 0b11101111;     // RC0 BTN1, RC4 LED
    ANSELC = 0;
    ANSELD = 0;
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    //TIMER 1   
    T1CONbits.TMR1CS = 0b00;        // zdroj casovace 1
    T1CONbits.T1CKPS = 0b11;        // nastaveni delicky
    IDLEN = 1;                      // musim nechat clock pro periferie
    PEIE = 1;                       // irq od periferii
    TMR1IE = 1;                     // irq od TIMER1
    TMR1ON = 1;                     // Zapnu TIMER1

}

void main(void) {
    init();                         // provedeni inicializace
    
    while(1){
        LED ^= 1;
        TMR1 = 0xFFFF - 50000;               // nastavim citac
        TMR1IF = 0;
        __asm("SLEEP");
        }
}
```

## Přiklad 9.4:
Ukázka SW resetu, což je instrukce procesoru. Mohu tak programově reagovat na kritické události.
```c
// REV PWM
#pragma config FOSC =       HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG =     OFF          // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN =   ON          // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN =      OFF         // watchdog off
 
#include <xc.h>

#define _XTAL_FREQ 8E6

void main(void) {
    
    //GPIO
    TRISD = 0b10000011;     // LEDs: 2..6 out
    TRISC = 0b11101111;     // RC0 BTN1, RC4 LED
    ANSELC = 0;
    ANSELD = 0;
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    // reakce na reset
    if(!RCONbits.RI){
        LATD6 = 0;
        __delay_ms(250);
        LATD6 = 1;
        __delay_ms(250);
        LATD6 = 0;
        __delay_ms(250);
        LATD6 = 1; 
    }

    // ADC pro potenciometr
    ANSELE = 0b1;                   //AN5
    ADCON2bits.ADFM = 0;            //left justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout
    ADCON0bits.CHS = 5;             // kanal AN5
    
    while (1){
        GODONE = 1;                 // spustim konverzi
        while(GODONE){};            // cekam na konverzi
        if(ADRESH > 250){
            __asm("RESET");         // pokud vnastavim pot na vysoko
        }
        __delay_ms(500);
        LATD2 ^= 1;
   }
}
```

## Vyp/Zap jednotlivých periferii:

V PIC18 mohu vypnout jednotlivé periferie a nechat tak běžet jen ty, které používám a šetřit tak energii. Provádí se to pomocí registrů PMD0-2. 

<p align="center">
  <img width="660" height="200" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/09_CV/PMD.png">
</p>

### Zadání:

  1) Nakonfigurujte deep sleep a probouzejte MCU cca jednou za 1s. Po probuzení odešlete hodnotu POT2 přes UART do PC. 

  2) Nakonfugurujte komunikaci s PC. Pokud nepříjde déle než 30s specifická zpráva (kterou si zvolte), tak dojde k SW resetu. Po resetu zobrazte na displeji, že zpráva nedošla.
  3) Provozujte kontroler v IDLE módu. Kontrolér hned po inicilizaci uspěte a komunikujte přes uart. Tedy příchod zprávy MCU probudí. Zpráva se odešle zpět (ECHO) a MCU zase usne.
