# 🚀 REV - Osmé cvičení PWM, input capture

PWM (Pulse Width Modulation) je způsob, jak pomocí rychlého přepínání digitálního výstupu vytvořit signál s nastavitelnou střídou, tedy poměrem doby v logické jedničce k celé periodě. Díky tomu lze efektivně řídit například jas LED, otáčky motoru nebo střední napětí na výstupu. Na mikrokontroléru AVR128DB48 budeme PWM generovat pomocí časovače, typicky TCA. Změnou periody určujeme frekvenci PWM a změnou compare hodnoty nastavujeme střídu. Výhodou je, že generování probíhá hardwarově bez nutnosti neustálého zásahu procesoru.

Input Capture je funkce časovače, která umožňuje přesně zaznamenat okamžik příchodu hrany na vstupní pin a uložit aktuální hodnotu čítače do speciálního registru. Díky tomu můžeme velmi přesně měřit periodu, frekvenci i šířku pulzu vstupního signálu, například u externího PWM. U AVR128DB48 má TCB přímo režimy Input Capture Frequency Measurement, Input Capture Pulse-Width Measurement a také Input Capture Frequency and Pulse-Width Measurement.

<p align="center">
  <img width="360" height="210" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/08_CV_PWM/PWM.png">
</p>

## 🏗️ Ukázka 8.1:
**Nastavení jasu LED pomocí PWM**
 
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>

void pwm_init(void)
{
    // vyberu portc jako alternativni vystup
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
    // je treba nastavit jako out      
    PORTC.DIRSET = PIN0_bm;
    // povolim komparator a mod periferie je generovani dual slope PWM
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_DSBOTTOM_gc | TCA_SINGLE_CMP0EN_bm;             
    // PER udava periodu PWM signalu je nastavena na kolik?? (vzorec je v datasheetu)
    TCA0.SINGLE.PER = 12000;

    // Start with 0% duty
    TCA0.SINGLE.CMP0 = 0;

    // Prescaler + enable
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV1_gc | TCA_SINGLE_ENABLE_bm;
}


int main(void) 
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    pwm_init();
    
    uint16_t i = 0;
    while (1)
    {
 
        TCA0.SINGLE.CMP0 = i++;
        
        if(i == 12000){
            i = 0;
        }
        _delay_us(250);    
    }
}
```

## 🏗️ Ukázka 8.2:
**Genervání frekvence pro reproduktor**
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

void tca0_frq_init(void)
{
    // vyberu portc jako alternativni vystup
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
    // je treba nastavit jako out        
    PORTC.DIRSET = PIN0_bm;
    // povolim komparator a mod periferie je generovani frekvence
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_FRQ_gc | TCA_SINGLE_CMP0EN_bm;             
    // zapisu nula do komparatoru
    TCA0.SINGLE.CMP0 = 0;
    // nastaveni delicky a zapnuti
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
}

int main(void) 
{       
    tca0_frq_init();
    
    uint16_t freq = 0;
    
    while (1)
    {
        
        freq += 10; 
        // nastaveni cmp pro generovani vystupu
        TCA0.SINGLE.CMP0 = freq;
        _delay_ms(1);
    }
}
```

## 🏗️ Ukázka 8.3:

<p align="center">
  <img width="360" height="550" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/08_CV_PWM/speaker.png">
</p>

**Šablona na přehrátí hudby**
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

// pole frekvenci v Hz
int16_t melody[] = {250, 500, 750, 1000, 2000, 3000, 5000, 3000, 2000, 1000, 750, 500, 250};

void tca0_frq_init(void)
{
    // vyberu portc jako alternativni vystup
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
    // je treba nastavit jako out        
    PORTC.DIRSET = PIN0_bm;
    // povolim komparator a mod periferie je generovani frekvence
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_FRQ_gc | TCA_SINGLE_CMP0EN_bm;             
    // zapisu nula do komparatoru
    TCA0.SINGLE.CMP0 = 0;
    // nastaveni delicky a zapnuti
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
}

void delay_ms(int16_t d)
{

    for (uint16_t i = 0; i < d; i++) {
        _delay_ms(1);
    }
}


int main(void) 
{       
    tca0_frq_init();
    
    int16_t notes = sizeof(melody) / sizeof(melody[0]);
    uint16_t tone;
    
    while (1)
    {
        for (uint16_t thisNote = 0; thisNote < notes; thisNote += 1) {
            
            tone = (uint16_t)(2000000/(int32_t)melody[thisNote]);
            // nastavim comparator na nejakou frekvenci
            TCA0.SINGLE.CMP0 = tone;
            
            delay_ms(500);
        }
        TCA0.SINGLE.CMP0 = 0;
        delay_ms(1000);
    }
}
```

## 🏗️ Ukázka 8.4:
**Měření frekvence signálu na pinu PA2**
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>


#define BAUDRATE 115200UL


void uart_init(uint32_t f_cpu, uint32_t baud)
{
    
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   

    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);        
    USART3.CTRLB |= USART_TXEN_bm | USART_RXEN_bm;
    
}

void uart_write_byte(uint8_t c)
{
    while(!(USART3.STATUS & USART_DREIF_bm)){} 
    USART3.TXDATAL = c;
}

void uart_write_str(char *s)
{
    while(*s) {
        uart_write_byte((uint8_t)*s++);
    }
}

volatile uint16_t capture_value = 0;
volatile uint8_t fresh_data = 0;

ISR(TCB0_INT_vect) {
    // cteni maze flag
    capture_value = TCB0.CCMP;
    fresh_data = 1;
}

void TCB_init(void) {
    // pin jako input
    PORTA.DIRCLR = PIN2_bm;
    
    // event z portu na tcb
    EVSYS.CHANNEL0 = EVSYS_CHANNEL0_PORTA_PIN2_gc;
    EVSYS.USERTCB0CAPT = EVSYS_USER_CHANNEL0_gc;

    // delicka
    TCB0.CTRLA = TCB_CLKSEL_DIV2_gc;
    // mod funkce, merim frekvenci
    TCB0.CTRLB = TCB_CNTMODE_FRQ_gc;    
    
    // zapnuti interruptu
    TCB0.INTCTRL = TCB_CAPT_bm;
    // zapnu event a filtr
    TCB0.EVCTRL = TCB_CAPTEI_bm | TCB_FILTER_bm;
    
    // spustim musim delat OR at neprepisu delicku
    TCB0.CTRLA |= TCB_ENABLE_bm;

}

int main(void) 
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
          
    TCB_init();
    uart_init(F_CPU, BAUDRATE);
    
    char txbuf[64];
    
    sei();
    
    while (1)
    {
        
        uint16_t local_capture;
        uint8_t data_ready = 0;

        // bezpecne zkopiruji
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            if (fresh_data) {
                local_capture = capture_value;
                fresh_data = 0;
                data_ready = 1;
            }
        }

        if (data_ready) {
            if (local_capture > 0) {
                // vypocet frekvence
                float frequency = F_CPU /(2*local_capture) ;

                sprintf(txbuf, "freq: %.2f \n", frequency);
                uart_write_str(txbuf);
            }
            
            data_ready = 0;
        }

        _delay_ms(100);      
    }
}

```

### 📝  Zadání:

  1) Otestujte a rozšiřte ukázku 8.1 tak, že přídáte další dva kanály PWM. Ovládejte tři LEDky na semaforu. (TCA timer má tři cmp registry).

  2) Podívejte se na PORTMUX.TCAROUTEA registr a změnte výstup PWM na piny PD0-PD2 (pozor na nastaveni pinu jako OUT).
  
  3) Otestujte ukázku 8.2 která generuje frekvenci na pinu PC0. Připojte reproduktor a rozšiřte úlohu tak, že měníte frekvenci na základě ADC vstupu(minulé cvičení) Můžete použít potenciometr, ale lépe fotorezistor.
     
  4) Ukázku 8.3 rozšiřte tak, že přehrajete písničky ve formatu: [arduino notes](https://github.com/robsoncouto/arduino-songs/blob/master/harrypotter/harrypotter.ino).
  
  5) Ukázka 8.4 měří frekvenci na pinu a odesílá výsledek do PC. K měření událostí na pinu slouží TCB. Využíjte ukázku tak, že změříte frekvenci PWM z ukázky 8.1. Dále přenastavte TCB tak, že změříte střídu i frekvenci. Je to jeden z režimů viz. datasheet.
  
  # 🚀 Prompty pro studium generování frekvence, PWM a měření vstupního signálu

## 📍 1. Generování frekvence a PWM obecně
**Prompt:**
> Vysvětli mi generování frekvence a PWM obecně pro studium mikrokontrolérů
> - jak lze pomocí timeru generovat periodický signál
> - co je frekvence signálu
> - co je perioda signálu
> - co je PWM
> - co znamená střída PWM
> - běžné použití PWM v praxi

---

## 📍 2. Generování frekvence a PWM pomocí TCA na AVR128DB48
**Prompt:**
> - jak pomocí TCA generovat periodický signál
> - jak pomocí TCA generovat PWM
> - jak se nastavuje perioda signálu
> - jak se nastavuje střída PWM
> - jak se zapne výstup PWM na příslušném pinu
> - běžné praktické použití TCA na AVR128DB48

---

## 📍 3. Měření vstupního signálu obecně
**Prompt:**
> Vysvětli mi obecně, jak mikrokontrolér měří vstupní digitální signál
> - jak lze měřit frekvenci vstupního signálu
> - jak lze měřit periodu signálu
> - jak lze měřit šířku pulzu
> - co ovlivňuje přesnost měření
> - jak souvisí takt timeru s rozlišením měření

---

## 📍 4. Měření frekvence a šířky pulzu pomocí TCB na AVR128DB48
**Prompt:**
> Vysvětli mi měření frekvence a šířky pulzu pomocí periférie TCB na mikrokontroléru AVR128DB48
> - jak lze pomocí TCB měřit periodu vstupního signálu
> - jak lze pomocí TCB měřit frekvenci vstupního signálu
> - jak lze pomocí TCB měřit šířku pulzu
> - praktické použití TCB na AVR128DB48 pro měření vstupních signálů

---

## 📍 5. Porovnání TCA a TCB na AVR128DB48
**Prompt:**
> Porovnej mi periférie TCA a TCB na mikrokontroléru AVR128DB48 z pohledu generování a měření signálů
> - co je hlavní účel TCA
> - co je hlavní účel TCB
> - jaké jsou praktické příklady použití obou periférií
