# 🚀 REV - Osmé cvičení PWM, input capture

PWM (Pulse Width Modulation) je způsob, jak pomocí rychlého přepínání digitálního výstupu vytvořit signál s nastavitelnou střídou, tedy poměrem doby v logické jedničce k celé periodě. Díky tomu lze efektivně řídit například jas LED, otáčky motoru nebo střední napětí na výstupu. Na mikrokontroléru AVR128DB48 budeme PWM generovat pomocí časovače, typicky TCA. Změnou periody určujeme frekvenci PWM a změnou compare hodnoty nastavujeme střídu. Výhodou je, že generování probíhá hardwarově bez nutnosti neustálého zásahu procesoru.

Input Capture je funkce časovače, která umožňuje přesně zaznamenat okamžik příchodu hrany na vstupní pin a uložit aktuální hodnotu čítače do speciálního registru. Díky tomu můžeme velmi přesně měřit periodu, frekvenci i šířku pulzu vstupního signálu, například u externího PWM. U AVR128DB48 má TCB přímo režimy Input Capture Frequency Measurement, Input Capture Pulse-Width Measurement a také Input Capture Frequency and Pulse-Width Measurement.

<p align="center">
  <img width="360" height="210" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/08_CV_PWM/PWM.png">
</p>

## 🏗️ Ukázka 8.1:
Nastavení jasu LED pomocí PWM
 
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>

void pwm_init(void)
{
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
            
    PORTC.DIRSET = PIN0_bm;

    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_DSBOTTOM_gc | TCA_SINGLE_CMP0EN_bm;             

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
Genervání frekvence pro reproduktor
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>


void tca0_frq_init(void)
{
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
            
    PORTC.DIRSET = PIN0_bm;

    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_FRQ_gc | TCA_SINGLE_CMP0EN_bm;             

    TCA0.SINGLE.CMP0 = 0;

    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
}

int main(void) 
{       
    tca0_frq_init();
    
    uint16_t freq = 0;
    
    while (1)
    {
        
        freq += 10; 
        
        TCA0.SINGLE.CMP0 = freq;
        _delay_ms(1);
    }
}
```

## 🏗️ Ukázka 8.3:

<p align="center">
  <img width="360" height="550" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/08_CV_PWM/speaker.png">
</p>

Šablona na přehrátí hudby
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 4000000UL
#include <util/delay.h>

int16_t melody[] = {250, 500, 750, 1000, 2000, 3000, 5000, 3000, 2000, 1000, 750, 500, 250};

void tca0_frq_init(void)
{
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
            
    PORTC.DIRSET = PIN0_bm;

    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_FRQ_gc | TCA_SINGLE_CMP0EN_bm;             

    TCA0.SINGLE.CMP0 = 0;

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

            TCA0.SINGLE.CMP0 = tone;
            
            delay_ms(500);
        }
        TCA0.SINGLE.CMP0 = 0;
        delay_ms(1000);
    }
}
```
### 📝  Zadání:

  1) Otestujte a rozšiřte ukázku 8.1 tak, že přídáte další dva kanály PWM. Ovládejte tři LEDky na semaforu. (TCA timer má tři cmp registry).

  2) Podívejte se na PORTMUX.TCAROUTEA registr a změnte výstup PWM na piny PD0-PD2 (pozor na nastaveni pinu jako OUT).
  
  3) Otestujte ukázku 8.2 která generuje frekvenci na pinu PC0. Připojte reproduktor a rozšiřte úlohu tak, že měníte frekvenci na základě ADC vstupu(minulé cvičení) Můžete použít potenciometr, ale lépe fotorezistor.
     
  4) Ukázku 8.3 rozšiřte tak, že přehrajete písničky ve formatu: [arduino notes](https://github.com/robsoncouto/arduino-songs/blob/master/harrypotter/harrypotter.ino)
  
