# 🚀 REV - Páte cvičení
- čítače/časovače, přerušení

## 💡 časovač TCA:




### 🏗️ Příklad 5.1:


```c 
#define F_CPU 4000000UL
#include <avr/io.h>


int main(void) {
    
    PORTB.DIRSET = PIN3_bm;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;

    while(1){
        
        
        if(TCA0.SINGLE.CNT >= 10000){
            
            TCA0.SINGLE.CNT = 0x0000;
            PORTB.OUTTGL = PIN3_bm;
        
        }   
    }
    
}
```

## 🏗️ Příklad 5.2:

```

```

### 🚀 Nastavení interruptu:

```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>


ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTB.OUTTGL = PIN3_bm;

}

int main(void) {
    
    PORTB.DIRSET = PIN3_bm;
    
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    TCA0.SINGLE.PER = 49999;
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    
    sei();

    while(1){
        

    }
    
}
```

## 📝 Rozšiřující úlohy:

1) rozšiřte Ukázku 1 tak, aby po stisknutí tlačítka změnila rychlost blikání. Definujte dvojici symbolických konstant.

2) rozšiřte Ukázku 2 ve stejném duchu jako v úloze tj. pouze použijete přerušení. Tj. upravte program tak, aby do registru TMR1 vkládal jednu ze dvou konstant, které upraví periodu čekání.

3) rozšiřte Ukázku 2 tak, že použijete i druhý časovač (dle datasheetu použijte Timer5) s rozdílnou délkou čítaní a rozblikejte druhou LED, která bude blikat s různou periodou. Stisknutím tlačítka periody blikání prohoďte (tou formou, že vyměníte hodnotu vkládanou do TMR1 a TMR5).

4) použijte druhé tlačítko pro zastavení a znovuspuštěni blikání. Použijte bity TMRxON pro zastavení a znovuspuštěni čítače (T1CONbits.TMR1ON pro TMR1 a T5CONbits.TMR5ON pro TMR5).

5) Vytvořte obecnou obsluhu pomoci přerušení pro všechna 4 tlačítka: pomoci jednoho časovače (tj. použijete jedno přerušení) periodicky detekujte stav na jednotlivých tlačítkách, a prováděje debouncing. V hlavním programu ovládejte celou sadu LED, zobrazujte na ní binární číslo n a reagujte na stisknutí jednotlivých tlačítek následovně:

    - BUT1 – inkrementuje n,
    - BUT2 – dekrementuje n,

## 🏗️  Příklad 5.3:

Jednotlive ISR a hlavní program si mohou předávat informace pomocí globálních proměnných. Tyto proměnné musí být ozančeny jako **volatile**. Jedná se o informaci pro překladač, aby neprováděl žádné optimalizace. Ten by jinak mohl proměnou považovat za optimalizovatelnou. Proměnná je však potřebná v programu přerušení. Volatile jsou proměnné, které mohou měnit hodnotu asynchronně, nehledě na hlavní program. Případně proměnné. Jsou to i některé registry např. PORTx.IN mění hodnotu na základě napětí na pinu. V příkladu je takovou proměnou volatile uint8_t flag. 

<p align="center">
  <img width="400" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/05_CV_Timer_ISR/main_isr_flag.png">
</p>
    
```c 



void init(void){
    
}

void main(void) {

}
```
## 📝 Doma:
1) Rozchoďte i druhý typ timeru TCB (je trochu jiný než TCA)
2) Zkuste použít priority přerušení, kde můžete jednomu ISR přidělit vyšší prioritu tak, že může přerušovat ostatní. 
