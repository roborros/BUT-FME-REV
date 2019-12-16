# REV - Páte cvičení
- čítače, přerušení

## Příklad 5.1:

PIC18F46K22 obsahuje několik čítačů. Zaměříme se na TIMER 1/3/5 které mají 16-bit. Timer je periferie, kterou ovládáme pomocí SFR. Programátorský model je jednoduchá TIMER je binární čítač, který načítá vstupní pulzy. Výsledek pak drží v příslušném registru. Periferie je při svém provozu nezavislá na CPU. Čítač se používá k časovaní. Můžemeho použít k relativně přesnému měření času na pozadí běhu programu, nebo také k vyvolání přerušení.

```c 
// REV TIMER
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = OFF     // 4X PLL Enable (Oscillator OFF)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>

#define _XTAL_FREQ 8E6              // definice fosc pro knihovnu
#define LED LATDbits.LATD2          // ledka
#define DELAY 0x8000                // hodnota timeru

void init(void){
    
    TRISDbits.TRISD2 = 0;           // RD2 jako vystup
    
    T1CONbits.TMR1CS = 0b00;        // zdroj casovace 1
    T1CONbits.T1CKPS = 0b11;        // nastaveni delicky                                             
    TMR1ON = 1;                     // spusteni TMR1
}

void main(void) {
    init();                         // provedeni inicializace
    
    while(1){
        if(TMR1 >= 0x8000){         // kontrola registru casovace
            LED ^= 1;               // prevraceni pinu RD2
            TMR1 = 0;               // vznulovani registru casovace
        }
    }
}
```

## Příklad 5.2:
Přerušení je opravdu důležitý koncept v embedded systémech. Přerušení dovoluje procesoru přerušit současný program, vykonat jiný (kratký) a vratit se zpět. Tato přerušení mohou vyvolávat různé události. Může ho vyvolat TIMER, příchod dat na sběrnici, stisk tlačítka a jiné. Přerušení se zapisuje v XC8 podobně jako funkce. Má však několik specifik. V první řadě je to vždy void...void funkce. Přerušení vyvolává jiný mechanismus a tuto funkci nemůže používat programátor jako běžnou funkci. Zapis v xc8 je např. void __interrupt() muj_ISR(void). Za muj_ISR si můžete dosadit název.
    
```c
// REV INTERRUPT
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>

#define _XTAL_FREQ 32E6             // definice fosc pro knihovnu
#define LED LATDbits.LATD2          // ledka
#define DELAY (0xFFFF - 50000)      // hodnota timeru


void __interrupt() T1_ISR_HANDLER(void){
     
    if (TMR1IF && TMR1IE ){         // kontrola priznaku IF (interrupt flag) a IE (interrupt enabled)             
        LED ^= 1;
        TMR1 = DELAY;               // nastaveni registru timeru (preruseni vzvolava preteceni registru)
        TMR1IF = 0;                 // smazani IF jinak nedojde k dalsimu zavolani (bezpecnostni prvek)
    }
}

void init(void){
    
    TRISDbits.TRISD2 = 0;           // RD2 jako vystup
    
    T1CONbits.TMR1CS = 0b00;        // zdroj casovace 1
    T1CONbits.T1CKPS = 0b11;        // nastaveni delicky                                             
    TMR1IE = 1;                     // povoleni preruseni pro TMR1
    TMR1IF = 0;                     // smazani priznaku (pro jistotu)
    PEIE = 1;                       // povoleni preruseni od periferii
    TMR1ON = 1;                     // spusteni TMR1
    GIE = 1;                        // globalni povoleni preruseni
}

void main(void) {
    init();                         // provedeni inicializace
    
    while(1){
        __delay_ms(100);            // cekani 100ms s knihovni funkci
    }
}
```

## Rozšiřující úlohy:

1) rozšiřte Ukázku 1 tak, aby po stisknutí tlačítka změnila rychlost blikání. Definujte dvojici symbolických konstant, ošetřete debouncing.

2) rozšiřte Ukázku 2 ve stejném duchu jako v úloze tj. pouze použijete přerušení. Tj. upravte program tak, aby do registru TMR1 vkládal jednu ze dvou konstant, které upraví periodu čekání.

3) rozšiřte Ukázku 2 tak, že použijete i druhý časovač (dle datasheetu použijte Timer5) s rozdílnou délkou čítaní a rozblikejte druhou LED, která bude blikat s různou periodou. Stisknutím tlačítka periody blikání prohoďte (tou formou, že vyměníte hodnotu vkládanou do TMR1 a TMR5).

4) použijte druhé tlačítko pro zastavení a znovuspuštěni blikání. Použijte bity TMRxON pro zastavení a znovuspuštěni čítače (T1CONbits.TMR1ON pro TMR1 a T5CONbits.TMR5ON pro TMR5).

5) Vytvořte obecnou obsluhu pomoci přerušení pro všechna 4 tlačítka: pomoci jednoho časovače (tj. použijete jedno přerušení) periodicky detekujte stav na jednotlivých tlačítkách, a prováděje debouncing. V hlavním programu ovládejte celou sadu LED, zobrazujte na ní binární číslo n a reagujte na stisknutí jednotlivých tlačítek následovně:

    - BUT1 – inkrementuje n,
    - BUT2 – dekrementuje n,
    - BUT3 – bitové invertuje n,
    - BUT4 – nastaví n na 0

## Příklad 5.3:
    
<p align="center">
  <img width="400" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/05_CV/main_isr_flag.png">
</p>
    
```c 
// REV INTERRUPT
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)
#include <xc.h>

#define _XTAL_FREQ 32E6             // definice fosc pro knihovnu
#define LED LATDbits.LATD2          // ledka
#define DELAY (0xFFFF - 1000)       // hodnota timeru

volatile unsigned char flag = 0;             // globalni promenna 

void __interrupt() T1_ISR_HANDLER(void){
    
    volatile unsigned static int i = 0;      // staticka promenna nelze pouzit mimo ISR
    if (TMR1IF && TMR1IE ){         // kontrala priznaku a povoleni
        if (i >= 500) {
            flag = 1;               // nastaveni vlajky
            i = 0;
        }  
    i++;
    TMR1 = DELAY;                   // nastaveni registru TMR1
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
        if (flag) {
            LED ^= 1;
            flag = 0;
        }
    }
}
```
## Doma:
1) Rozchoďte TMR1 a TMR2
2) Použíjte obě priority PIC18 funkce se odlišují  __interrupt(low_priority); __interrupt(high_priority
3) Je treba nastavit IPRx registry pro low_priority pro TMR2IF
4) Vyšší priorita je schopna přerušit nižší vyzkoušejte třeba umístěním while(BTN1), tedy něco co bychom normálně dělat něměli!!
