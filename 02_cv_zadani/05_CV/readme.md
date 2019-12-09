# REV - Páte cvičení
- čítače, přerušení

## Příklad 4.1

   1) zkopírujte si ukázku 1
   2) seznamte se se zdrojovým kódem a zprovozněte kód
   3) upravte program dle zadání a)
   4) zkopírujte si ukázku 2
   5) seznamte se se zdrojovým kódem a zprovozněte kód, vyzkoušejte varianty dle ukázky 2a a ukázky 2b
   6) upravte program dle zadání b) - e)



Ukázka 1:
    
```c
/*
 * File:   02.01-timer_basic/main.c
 * Author: res, mat
 */
 
/* fuses */
#pragma config WDTEN = OFF      // Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
#pragma config FOSC = INTIO7    // Oscillator Selection bits 
#pragma config MCLRE = EXTMCLR  // reset function
#pragma config FCMEN = ON
 
// device include
#include <xc.h>              //-- pro prekladac XC8
 
/* local defines */
#define DELAY 0x8000
 
/*
 *  main()
 */
int main(int argc, char** argv) {
 
    /* init - oscillator */
    OSCCON = (OSCCON & 0b10001111) | 0b01110000;    // internal oscillator at full speed (16 MHz)
 
    /* init - tristate */
    ANSELA = 0;
    TRISC = 0b00000001; // RC0 BTN1, RC4 LED
    ANSELC = 0;
    TRISD = 0b10000011; // LEDs: 2..6 out
    ANSELD = 0;
 
    /* init - timer1 */
    T1CONbits.T1CKPS = 0b11;    // TMR1 prescaler
    T1CONbits.TMR1ON = 1;       // TMR1 on
 
    /* main program */
 
    // put ones to LATC+LATD ~all LEDs
    LATC = 0xff;
    LATD = 0xff;
 
    /* main loop */
    while(1){
        while (TMR1 < DELAY); // waiting loop
        LATD2 = ~LATD2;
        TMR1 = 0;
    } // end of main loop
}
```

Ukázka 2:
    
```c
/*
 * File:   02.02-timers_interrupt/main.c
 * Author: res, mat
 */
 
 
/* fuses */
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config MCLRE = EXTMCLR  // reset function
#pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor enabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)
 
#include <xc.h>

#define _XTAL_FREQ 32E6             // definice fosc pro knihovnu
#define LED LATDbits.LATD2          // ledka
#define DELAY (0xFFFF - 1000)       // hodnota timeru


void __interrupt(high_priority) T1_ISR_HANDLE(void){
    
    volatile static int i =0;
    if (TMR1IF && TMR1IE ){
        if (i >= 500) {
            LED ^= 1;
            i = 0;
        }  
    i++;
    TMR1 = DELAY;
    TMR1IF = 0;
    }
}


void init(void){
    
    /* vyber pinu jako vystupy */
    TRISCbits.TRISC3 = 0;
    TRISCbits.TRISC5 = 0;
    TRISBbits.TRISB3 = 0;
    TRISDbits.TRISD2 = 0;

    T1CONbits.TMR1CS = 0b00;
    T1CONbits.T1CKPS = 0b11;
    GIE = 1;
    PEIE = 1;
    TMR1IE = 1;
    TMR1IF = 0;
    TMR1ON = 1;
}

void main(void) {
    init(); // provedeni inicializace
    
    /* hlavni smycka */
    while(1){

    }
}
```

## Rozšiřující úlohy:

1) rozšiřte Ukázku 1 tak, aby po stisknutí tlačítka změnila rychlost blikání. Definujte dvojici symbolických konstant, ošetřete debouncing.

2) rozšiřte Ukázku 2 ve stejném duchu jako v úloze a), tj. pouze místo busy-waiting použijete přerušení. Tj. upravte program tak, aby do registru TMR1 vkládal jednu ze dvou konstant, které upraví periodu čekání.

3) rozšiřte Ukázku 2 tak, že použijete i druhý časovač (dle datasheetu použijte Timer5) s rozdílnou délkou čítaní a rozblikejte druhou LED, která bude blikat s různou periodou. Stisknutím tlačítka periody blikání prohoďte (tou formou, že vyměníte hodnotu vkládanou do TMR1 a TMR5).

4) použijte druhé tlačítko pro zastavení a znovuspuštěni blikání. Použijte bity TMRxON pro zastavení a znovuspuštěni čítače (T1CONbits.TMR1ON pro TMR1 a T5CONbits.TMR5ON pro TMR5).

5) Vytvořte obecnou obsluhu pomoci přerušení pro všechna 4 tlačítka: pomoci jednoho časovače (tj. použijete jedno přerušení) periodicky detekujte stav na jednotlivých tlačítkách, a prováděje debouncing. V hlavním programu ovládejte celou sadu LED, zobrazujte na ní binární číslo n a reagujte na stisknutí jednotlivých tlačítek následovně:

    BUT1 – inkrementuje n,
    BUT2 – dekrementuje n,
    BUT3 – bitové invertuje n,
    BUT4 – nastaví n na 0

