# REV - Páte cvičení
- čítače, přerušení
[Link na video-návod](https://youtu.be/_rkvzKf5naM)

## Příklad 5.1:

PIC18F46K22 obsahuje několik čítačů. Zaměříme se na TIMER 1/3/5 které mají 16-bit. Timer je periferie, kterou ovládáme pomocí SFR. Programátorský model je jednoduchý, TIMER je binární čítač, který načítá vstupní pulzy. Výsledek pak drží v příslušném registru. Periferie je při svém provozu nezavislá na CPU. Čítač se používá k časovaní. Můžeme ho použít k relativně přesnému měření času na pozadí běhu programu, nebo také k vyvolání přerušení.
## Výpočet:

<p align="center">
  <img width="188" height="42" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/05_CV_Timer_ISR/Period.png">
</p>

### SFR:
* TxCON - Konfigurační registr čítače (Výběr zdroje pulzů, děličky)
* TMR1ON - Spuštění
* TMR1 - Aktuální hodnota čítače (lze přepsat z programu)

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
#define DELAY 25000                // hodnota timeru pro 0.1 s

void init(void){
    
    TRISDbits.TRISD2 = 0;           // RD2 jako vystup
    
    T1CONbits.TMR1CS = 0b00;        // zdroj casovace 1
    T1CONbits.T1CKPS = 0b11;        // nastaveni delicky                                             
    TMR1ON = 1;                     // spusteni TMR1
}

void main(void) {
    init();                         // provedeni inicializace
    
    while(1){
        if(TMR1 >= DELAY){         // kontrola registru casovace
            LED ^= 1;               // prevraceni pinu RD2
            TMR1 = 0;               // vynulovani registru casovace
        }
    }
}
```

## Příklad 5.2:
Přerušení je opravdu důležitý koncept v embedded systémech. Přerušení dovoluje procesoru přerušit současný program, vykonat jiný (kratký) a vratit se zpět. Tato přerušení mohou vyvolávat různé události. Může ho vyvolat TIMER, příchod dat na sběrnici, stisk tlačítka a jiné. Přerušení se zapisuje v XC8 podobně jako funkce. Má však několik specifik. V první řadě je to vždy void...void funkce. Přerušení vyvolává jiný mechanismus a tuto funkci nemůže používat programátor jako běžnou funkci. Zapis v xc8 je např. void __interrupt() muj_ISR(void). Za muj_ISR si můžete dosadit název. PIC18F46K22 nemá tzv. interrupt vector. Zavádí pouze dvě priority přerušení low a high. Mohu tedy v programu napsat 2xISR(). V přerušení potom testuji příznaky IF.

```
Poznamka:
K vyvolání přerušení dojde v návaznosti na přetečení čítače, tedy pro 16bit je to mezi hodnotou 65535 65536.
```

### Důležité nastavení SFR:
* GIE - zapnutí přerušení globálně (Global Interrupt Enable)
* PEIE - zapnutí přerušení od periferii (Peripheral Interrupt Enable)
* TMR1IE - Zapnuti přerušení TMR1 (TiMeR1 Interrupt Enable) 
* TMR1IF - Změna 0->1 vyvolá přerušení. Je nutní příznak smazat během přerušení. (Interrupt Flag)

<p align="center">
  <img width="300" height="43" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/05_CV_Timer_ISR/CounterValue.png">
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
#define DELAY (0xFFFF - 49999)      // hodnota timeru pro 0.05 s


void __interrupt() T1_ISR_HANDLER(void){
     
    if (TMR1IF && TMR1IE ){         // kontrola priznaku IF (interrupt flag) a IE (interrupt enabled)             
        LED ^= 1;
        TMR1 = DELAY;               // nastaveni registru timeru (preruseni vyvolava preteceni registru)
        TMR1IF = 0;                 // smazani IF jinak dojde k opakovanému volání ISR a kód se zde zacyklí.
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

1) rozšiřte Ukázku 1 tak, aby po stisknutí tlačítka změnila rychlost blikání. Definujte dvojici symbolických konstant.

2) rozšiřte Ukázku 2 ve stejném duchu jako v úloze tj. pouze použijete přerušení. Tj. upravte program tak, aby do registru TMR1 vkládal jednu ze dvou konstant, které upraví periodu čekání.

3) rozšiřte Ukázku 2 tak, že použijete i druhý časovač (dle datasheetu použijte Timer5) s rozdílnou délkou čítaní a rozblikejte druhou LED, která bude blikat s různou periodou. Stisknutím tlačítka periody blikání prohoďte (tou formou, že vyměníte hodnotu vkládanou do TMR1 a TMR5).

4) použijte druhé tlačítko pro zastavení a znovuspuštěni blikání. Použijte bity TMRxON pro zastavení a znovuspuštěni čítače (T1CONbits.TMR1ON pro TMR1 a T5CONbits.TMR5ON pro TMR5).

5) Vytvořte obecnou obsluhu pomoci přerušení pro všechna 4 tlačítka: pomoci jednoho časovače (tj. použijete jedno přerušení) periodicky detekujte stav na jednotlivých tlačítkách, a prováděje debouncing. V hlavním programu ovládejte celou sadu LED, zobrazujte na ní binární číslo n a reagujte na stisknutí jednotlivých tlačítek následovně:

    - BUT1 – inkrementuje n,
    - BUT2 – dekrementuje n,
    - BUT3 – bitové invertuje n,
    - BUT4 – nastaví n na 0

## Příklad 5.3:
Jednotlive ISR a hlavní program si mohou předávat informace pomocí globálních proměnných. Tyto proměnné musí být ozančeny jako volatile. Jedná se o informaci pro překladač, aby neprováděl žádné optimalizace. Ten by jinak mohl proměnou považovat za optimalizovatelnou. Proměnná je však potřebná v programu přerušení. Volatile jsou proměnné, které mohou měnit hodnotu asynchronně, nehledě na hlavní program. Případně proměnné. Jsou to i některé SFR např. PORTx mění hodnotu na základě napětí na pinu. V příkladu je takovou proměnou volatile char flag. Slouží k jednoduchému řízení. Je zde zavedene i volatile static uint i. 
jako statické označujeme proměnné, které lze používat pouze vně bloku, v tomto případě jen programu přerušení. Chová se však jako globální proměnná. Zachovává si hodnotu. 

<p align="center">
  <img width="400" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/05_CV_Timer_ISR/main_isr_flag.png">
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
#define DELAY (0xFFFF - 999)       // hodnota timeru pro 1 ms

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
## Další:
1) Rozchoďte TMR1 a TMR2 (TMR2 je trochu jiný--ma jen 8 bitu a obsahuje postscaler, a period register)
2) Použíjte obě priority PIC18 funkce se odlišují  __interrupt(low_priority); __interrupt(high_priority)
3) Je treba nastavit IPRx registry pro low_priority pro TMR2IF
4) Vyšší priorita je schopna přerušit nižší! Vyzkoušejte třeba umístěním while(BTN1), tedy něco co bychom normálně dělat něměli!!
