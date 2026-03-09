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

## 🏗️ Příklad 5.2 - nastavení interruptu a zápis ISR (Interrupt Service Routine):

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

    /* timto lze pripojit externi crystal
    _PROTECTED_WRITE(CLKCTRL_XOSCHFCTRLA, 0x05);
    _PROTECTED_WRITE(CLKCTRL_MCLKCTRLA, 0x03);
    
    while (!(CLKCTRL.MCLKSTATUS & (1 << 4)));
    */
    
    // timto lze zmenit frekvenci interniho osci na maximum 24 MHz
    //_PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
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

    //cli(); to slouzi ke globalnimu vypnuti reruseni

    while(1){ 

    }    
}
```

## 📝 úlohy 1:

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

## 🏗️  Příklad 5.4:

Externí přerušení (External Interrupt) je hardwarový mechanismus, který umožňuje procesoru okamžitě reagovat na změnu napěťové úrovně na konkrétním pinu (např. stisk tlačítka nebo signál ze senzoru) bez nutnosti neustálého dotazování v hlavní smyčce (polling). 

- konfigurace:      **PORTx.PINnCTRL**
- interrupt flag:   **PORTx.INTFLAGS**

  V ISR je nutné softwarem určit konkrétní pin.


```c 
#include <avr/io.h>
#include <avr/interrupt.h>


void io_init(void) {
    // PB3 out
    PORTB.DIRSET = PIN3_bm;

    // PB2 je vstup
    PORTB.DIRCLR = PIN2_bm;
    
    // PULL-UP a preruseni na sestupnou hranu
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_ISC_FALLING_gc;

}  

ISR(PORTB_PORT_vect) {
    // Kontrola, zda přerušení způsobil PIN2 (pomocí registru INTFLAGS)
    if (PORTB.INTFLAGS & PIN2_bm) {
        
        // Otočení (toggle) stavu pinu PB3
        PORTB.OUTTGL = PIN3_bm;

        // Vynulování příznaku přerušení pro PIN2
        PORTB.INTFLAGS = PIN2_bm;
    }
}

int main(void) {
    
    io_init();
    
    sei(); // globalni povoleni preruseni

    while (1) {
        // nic tu neni, ale musi byt loop
    }
}
```

## 📝 úlohy 2:

1) Nakonfigurujte externí interrupt i na další přídavné tlačítko. Připojte ho na vybraný pin. 
2) Rozchoďte i druhý typ timeru TCB (je trochu jiný než TCA). Nastavte main clk na 24MHz a nastavte TCB a jeho přerušení tak, že bliknete LED každých 100ms.
3) Zkuste použít priority přerušení, kde můžete jednomu ISR přidělit vyšší prioritu tak, že může přerušovat ostatní. (datasheet str. 135)


# 🚀 Prompty pro studium MCU

Tento seznam obsahuje prompty pro LLM (jako Gemini nebo ChatGPT).

---

## 📍 1. Timer/Counter – základní koncept
**Prompt:**
> - Vysvětli, co je Timer/Counter v mikrokontroléru a jak funguje.
> - Jaký je rozdíl mezi režimem timer (časování) a counter (počítání externích impulsů).
> - Co znamená prescaler, perioda, overflow, compare match.
> - Vymysli 3 typické use-cases: periodický tick, měření.

---

## 📍 2. Timer/Counter – režimy a praktické použití
**Prompt:**
> - Popiš běžné režimy timeru: normal (overflow), CTC/compare, PWM (fast/phase-correct), input capture.
> - Vysvětli, jak bys nastavil timer pro periodické přerušení každých 1 ms (obecně, bez konkrétního MCU).
> - Vysvětli, jak funguje input capture a proč je lepší než číst pin v přerušení.
> - Uveď typické chyby při práci s timery (špatný prescaler, špatný výpočet periody, jitter, špatné mazání flagů).

---

## 📍 3. Interrupts – co to je a proč existují
**Prompt:**
> - Vysvětli, co je přerušení (interrupt) a proč se používá místo pollingu.
> - Popiš životní cyklus přerušení: událost → flag → vector → ISR → návrat.
> - Vysvětli pojmy: interrupt vector table, ISR, interrupt flag, enable bit, priority (pokud existuje).
> - Porovnej polling vs interrupt na konkrétním příkladu (tlačítko, UART RX, timer).

---

## 📍 4. Interrupts – bezpečné psaní ISR
**Prompt:**
> - Jaká pravidla platí pro ISR (krátká, žádné blokování, žádné delay, opatrně s printf).
> - Vysvětli, proč se používá `volatile` a kdy.
> - Vysvětli problém race conditions mezi ISR a main smyčkou a jak ho řešit (atomické sekce, disable/enable interrupts).
> - Navrhni “pattern” pro předávání dat z ISR do main loop.

---

## 📍 5. Externí přerušení – EXTI / Pin change interrupt
**Prompt:**
> - Vysvětli rozdíl mezi externím přerušením na konkrétním pinu a pin-change interrupt (pokud to dané MCU rozlišuje).
> - Jaké jsou typické triggery (rising/falling edge, level) a kdy je který vhodný.
> - Navrhni odrušení tlačítka: čistě software vs hardware vs kombinace.
> - Uveď typické chyby: bounce, opakované triggery, špatná konfigurace pull-up/down, zapomenutý flag.

---

## 📍 6. AVR128DB48 – jak funguje TCA v základním režimu (periodický interrupt)
**Prompt:**
> - Vysvětli, co je TCA (Timer/Counter Type A) na AVR128DB48 a jaké má typické vlastnosti oproti jiným timerům.
> - Popiš “základní režim” pro periodický interrupt: jak se nastavuje clock zdroj, prescaler a perioda (TOP).
> - Vysvětli, jaký je rozdíl mezi přerušením z overflow (přetečení) a compare match (pokud je relevantní pro zvolený režim).
> - Uveď krok za krokem, jak bys nakonfiguroval TCA na tick každých 1 ms (včetně obecného výpočtu hodnoty periody).
> - Jak se správně maže interrupt flag u TCA a jaké chyby z toho typicky vznikají.

---

## 📍 7. AVR128DB48 – jak funguje TCB v základním režimu (periodický interrupt)
**Prompt:**
> - Vysvětli, co je TCB (Timer/Counter Type B) na AVR128DB48 a v čem se liší od TCA (šířka čítače, účel, režimy).
> - Popiš “základní režim” pro periodický interrupt: jak se volí zdroj clocku, prescaler (pokud existuje) a hodnota compare/CNT.
> - Uveď krok za krokem, jak bys nakonfiguroval TCB na periodický tick každých 1 ms (včetně obecného výpočtu hodnoty).
> - Vysvětli, jak se správně maže interrupt flag u TCB a proč se to liší/nesmí plést s jinými periferiemi.
> - Uveď typické chyby: špatný clock select, špatná hodnota compare, zapomenuté enable v NVIC/vektor tabulce (podle architektury AVR).

---
