# 🚀 REV - Páte cvičení - čítače/časovače, přerušení

## 💡 Časovače:

Časovač (Timer) v mikrokontroléru (MCU) je nezávislý hardwarový modul, který slouží k přesnému měření času a počítání událostí bez nutnosti neustálého vytěžování procesoru (CPU). Funguje na principu inkrementace registru (čítače) v rytmu hodinového signálu. Mezi jeho hlavní funkce patří generování přesných časových prodlev, spouštění přerušení v pravidelných intervalech pro úlohy v reálném čase a vytváření signálů s pulzně šířkovou modulací (PWM) pro řízení motorů či jasu LED. Dále umožňuje měření délky trvání externích impulzů (Input Capture) nebo počítání vnějších pulsů, čímž zajišťuje vysokou efektivitu a deterministické časování celého systému.

---

## 💡 Časovač **TCA** (Single Mode)

Časovač **TCA** v režimu **Normal** čítá od 0 směrem nahoru. Horní mez je určena registrem periody (`PER`). Jakmile čítač dosáhne této hodnoty, dojde k:

1. Nastavení příznaku přetečení (`OVF` v registru `INTFLAGS`).
2. Vyvolání přerušení (pokud je povoleno v `INTCTRL`).
3. Resetování čítače na 0 a pokračování v čítání.

<p align="center">
  <img width=750" height="400" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/05_CV_Timer_ISR/timer_period.png">
</p>

### Výpočet hodnoty PER
Pro dosažení konkrétní frekvence přerušení použijte vzorec:

$$PER = \frac{f_{clk}}{f_{des} \cdot Prescaler} - 1$$

---

### 🏗️ Příklad 5.1 - polling (pravidelné čtení čítače):


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

## 🏗️ Příklad 5.2 - nastavení interruptu:

```c
#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 4000000UL
#include <util/delay.h>

ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTB.OUTTGL = PIN3_bm;

}

int main(void) {
    
    // PB3 jako out
    PORTB.DIRSET = PIN3_bm;
    
    // interrrupt na preteceni 
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    // nastaveni priod registru (kolik bude perioda??)
    TCA0.SINGLE.PER = 49999;
    // zapneme timer
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    // globalni enable preruseni
    sei();

    while(1){ 

    }    
}
```

## 📝 Rozšiřující úlohy:

1) rozšiřte Ukázku 1. tak, aby po stisknutí tlačítka změnila rychlost blikání. Definujte dvojici symbolických konstant (preprocesor makro #define).

2) rozšiřte Ukázku 2. ve stejném duchu jako v úloze tj. pouze použijete přerušení. Tj. upravte program tak, aby do registru PER vkládal jednu ze dvou konstant, které upraví periodu.

3) rozšiřte Ukázku 2. tak, že použijete i druhý časovač (TCA1) s rozdílnou délkou čítaní a rozblikejte druhou LED, která bude blikat s různou periodou. Stisknutím tlačítka periody blikání prohoďte (tou formou, že vyměníte hodnotu PER pro timery TCA0 TCA1).

4) použijte druhé tlačítko pro zastavení a znovuspuštěni blikání. Použijte bity enable pro zastavení a znovuspuštěni čítače.

5) Vytvořte obecnou obsluhu pomoci přerušení pro všechna 2 tlačítka: pomoci jednoho časovače (tj. použijete jedno přerušení) periodicky detekujte stav na jednotlivých tlačítkách, a prováděje debouncing. V hlavním programu ovládejte celou sadu semafaru RGB led, zobrazujte na ních binární číslo n a reagujte na stisknutí jednotlivých tlačítek následovně:

    - BUT1 – inkrementuje n,
    - BUT2 – dekrementuje n,

## 🏗️  Příklad 5.3:

Jednotlive ISR a hlavní program si mohou předávat informace pomocí globálních proměnných. Tyto proměnné musí být ozančeny jako **volatile**. Jedná se o informaci pro překladač, aby neprováděl žádné optimalizace. Ten by jinak mohl proměnou považovat za optimalizovatelnou. Proměnná je však potřebná v programu přerušení. Volatile jsou proměnné, které mohou měnit hodnotu asynchronně, nehledě na hlavní program. Jsou to i některé registry např. PORTx.IN mění hodnotu na základě napětí na pinu. V příkladu je takovou proměnou volatile uint8_t millis. Tu pak mohu používat k neblokujícímu časování nekritických událostí v hlavní smyčce.

    
```c 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>

#define F_CPU 4000000UL
#include <util/delay.h>

volatile uint32_t millis = 0;

ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    millis++;   
}

int main(void) {
    
    PORTB.DIRSET = PIN3_bm;
    
    // zapnout preruseni
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    
    // nastavit period registr 
    TCA0.SINGLE.PER = 999;
    
    // nastaveni delicky a zapnuti timeru
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
       
    uint32_t millis_prev = 0;
    uint32_t millis_now = 0;
    
    sei();

    while(1){
        // nebude preruseno
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {     
            millis_now = millis;
        }
        
        if ((millis_now - millis_prev) >= 1000){
        
            PORTB.OUTTGL = PIN3_bm;
            millis_prev = millis_now;
        }
    }  
}
```
## 💥 Doma:
1) Rozchoďte i druhý typ timeru TCB (je trochu jiný než TCA)
2) Zkuste použít priority přerušení, kde můžete jednomu ISR přidělit vyšší prioritu tak, že může přerušovat ostatní. 
