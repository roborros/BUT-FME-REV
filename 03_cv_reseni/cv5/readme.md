## 1. Rozchoďte TMR1 a TMR2 (TMR2 je trochu jiný--m8 jen 8 bitů a obsahuje postscaler, a period register)

```c
// REV INTERRUPT
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = OFF      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)
#include <xc.h>

#define _XTAL_FREQ 8E6             // definice fosc pro knihovnu

#define LED1 LATDbits.LATD2
#define LED2 LATDbits.LATD3

void __interrupt() Timer_ISR_HANDLER(void){
    if (TMR1IF && TMR1IE) {  // every 0.26214 s
        LED1 ^= 1;
        TMR1IF = 0;
    }
    
    if (TMR2IF && TMR2IE) {  // every 0.0256 s
        LED2 ^= 1;
        TMR2IF = 0;
    }    
}

void init(void){
    
    /* vyber pinu jako vystupy */ 
    TRISDbits.TRISD2 = 0;
    TRISDbits.TRISD3 = 0;

    // Timer 1
    T1CONbits.TMR1CS = 0b00;  // Instruction clock => 2 MHz
    T1CONbits.T1CKPS = 0b11;  // 1:8 Prescaler => 250 kHz
    
    TMR1IE = 1;
    TMR1IF = 0;
    TMR1ON = 1;
        
    // Timer 2
    // Clock input is fixed to instruction clock => 2 MHz
    T2CONbits.T2CKPS = 0b10;        // 1:16 prescaler => 125 kHz    
    T2CONbits.T2OUTPS = 0b1111;     // 1:16 postscaler => 7.8125 kHz
    PR2 = 200;                      
        
    TMR2IE = 1;    
    TMR2IF = 0;
    TMR2ON = 1;
    
    PEIE = 1;
    GIE = 1;    
}

void main(void) {
    init(); // provedeni inicializace
    
    /* hlavni smycka */
    while(1){        
    }
}
```

## 2. Použíjte obě priority PIC18 funkce se odlišují __interrupt(low_priority); __interrupt(high_priority). Je třeba nastavit IPRx registry pro low_priority pro TMR2IF. Vyšší priorita je schopna přerušit nižší! Vyzkoušejte třeba umístěním while(BTN1), tedy něco, co bychom normálně dělat něměli!!

```c
// REV INTERRUPT
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = OFF      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)
#include <xc.h>


#define _XTAL_FREQ 8E6             // definice fosc pro knihovnu

#define LED1 LATDbits.LATD2
#define LED2 LATDbits.LATD3
#define BTN1 PORTCbits.RC0

void __interrupt(high_priority) Timer1_ISR_HANDLER(void){
    if (TMR1IF && TMR1IE) {  // every 0.26214 s
        LED1 ^= 1;
        TMR1IF = 0;
    }
}

void __interrupt(low_priority) Timer2_ISR_HANDLER(void){
    if (TMR2IF && TMR2IE) {  // every 0.0256 s
        while (!BTN1) {}
        LED2 ^= 1;
        TMR2IF = 0;
    }    
}

void init(void){
    
    /* vyber pinu jako vystupy */ 
    TRISDbits.TRISD2 = 0;
    TRISDbits.TRISD3 = 0;
    
    // BTN 1 Input
    TRISCbits.RC0 = 1;
    
    
    // Timer 1
    T1CONbits.TMR1CS = 0b00;  // Instruction clock => 2 MHz
    T1CONbits.T1CKPS = 0b11;  // 1:8 Prescaler => 250 kHz
    
    TMR1IE = 1;
    TMR1IF = 0;
    TMR1IP = 1;  // High priority
    TMR1ON = 1;
        
    // Timer 2
    // Clock input is fixed to instruction clock => 2 MHz
    T2CONbits.T2CKPS = 0b10;        // 1:16 prescaler => 125 kHz    
    T2CONbits.T2OUTPS = 0b1111;     // 1:16 postscaler => 7.8125 kHz
    PR2 = 200;                      
        
    TMR2IE = 1;    
    TMR2IF = 0;
    TMR2IP = 0;  // Low priority
    TMR2ON = 1;
    
    IPEN = 1;  // Enables priority levels on interrupts
    GIEH = 1;  // Enables all high priority interrupts 
    GIEL = 1;  // Enables all low priority interrupts    
}

void main(void) {
    init(); // provedeni inicializace
    
    /* hlavni smycka */
    while(1){        
    }
}
```

