# REV - Dvanácté cvičení - software

## Filtry:

Digitální zpracování signálu (DSP) je v aplikacích s mikrokontroléry časté. Mezi nejzákladnější a nejpoužívanější patří digitální filtry typu dolní propust (Low-Pass) a horní propust (High-Pass). Oba tyto algoritmy vycházejí ze svých analogových ekvivalentů v podobě jednoduchých RC článků.

**Dolní propust:** propouští signály pouze do určité mezní frekvence, zatímco vyšší kmitočty tlumí, což je ideální pro potlačení šumu.

**Horní propust:** naopak odstraňuje stejnosměrnou složku (střední hodnotu) a reaguje pouze na dynamické změny signálu

Diferenční rovnici a její odvození: [wiki-low-pass](https://en.wikipedia.org/wiki/Low-pass_filter) ; [wiki-high-pass](https://en.wikipedia.org/wiki/High-pass_filter)

Na téma DSP(digitálního zpracování signálu) existuje skvělá online kniha: [DSP Guide](https://www.dspguide.com/pdfbook.htm)

## 🏗️ 12.1:
**šablona na low-pass:**
 
```c
typedef struct{
    
    float aplha;
    float out;
    
}lp_filt_t;


float filter_lp_step(lp_filt_t *f, float input){

    // implementujte diferencni rovnici filtru
    
    return input;
}
```

## 🏗️ 12.2:
**šablona na high-pass:**
 
```c
typedef struct{
    
    float aplha;
    float out;
    float prev_input;
    
}hp_filt_t;

float filter_hp_step(hp_filt_t *f, float input){

    // implementujte diferencni rovnici filtru
    
    return input;
}
```

## 🏗️ 12.3:
**implementace moving average:**
```c
#define MOVING_AVG_WINDOW 10
typedef struct
{
    float buffer[MOVING_AVG_WINDOW];
    float sum;
    size_t index;
    size_t count;
} mov_avg_t;

float mov_avg_step(mov_avg_t *ma, float input)
{
    if (ma->count < MOVING_AVG_WINDOW)
    {
        ma->buffer[ma->index] = input;
        ma->sum += input;
        ma->count++;
    }
    else
    {
        ma->sum -= ma->buffer[ma->index];
        ma->buffer[ma->index] = input;
        ma->sum += input;
    }

    ma->index++;
    if (ma->index >= MOVING_AVG_WINDOW)
    {
        ma->index = 0;
    }

    return ma->sum / (float)ma->count;
}
```

## 🏗️ 12.4:
**testovací kod:**
 
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <stdio.h>
#include <stdlib.h>
#define F_CPU 24000000UL
#include <util/delay.h>
#include "adc.h"
#include "dac.h"
#include "uart.h"
#include "millis.h"
#include "debounce.h"

int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    uart_init(F_CPU, 115200);
    adc_init();
    millis_init();
    dac_init(); 
    sei();
    
    char msg_buf[64];
    uint8_t i = 0;
    
    //lp_filt_t filter_lp = {.aplha=0.7, .out=0.0};
    //hp_filt_t filter_hp = {.aplha=0.2, .out=0.0, .prev_input=0.0};
    //mov_avg_t avg_filter = {.sum=0, .count=0, .index=0};
    
    adc_set_channel(3);
    
    uint32_t prev_time = get_millis();
    
    while (1)
    {
        if((get_millis() - prev_time) >= 10){
            prev_time = get_millis();
            
            uint16_t dac_val = (++i > 128) ? 700 : 100;
            dac_write(dac_val + rand() % 20);
            if(i >= 255){
                i = 0;
            }
            /*
            dac_write(waveform_lut[i++]);
        
            if(i >= sizeof(waveform_lut)/sizeof(waveform_lut[0])){
                i = 0;
            }
            */

            uint16_t adc_raw = adc_read_raw();
            float adc_val = (float)adc_raw * 3300.0/4096.0;
            sprintf(msg_buf, "%.1f,\n", adc_val);
            uart_write_str(msg_buf);
        }  
    }
}
```

## FSM

konečný stavový automat je způsob, jak popsat chování programu pomocí jasně definovaných stavů a přechodů mezi nimi. Program se v daném okamžiku nachází pouze v jednom stavu, například **IDLE**, **RUNNING** nebo **ERROR**, a podle vstupů, událostí nebo časových podmínek přechází do jiného stavu. V MCU aplikacích je FSM užitečný hlavně proto, že zpřehledňuje logiku programu, usnadňuje přidávání nových stavů, snižuje množství nepřehledných podmínek v hlavní smyčce a umožňuje psát neblokující kód.

## 🏗️ 12.5:
**Ukázka stavového automatu s knihovnou FSM:**
 
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <stdio.h>
#include <stdlib.h>

#define F_CPU 24000000UL
#include <util/delay.h>

#include "adc.h"
#include "uart.h"
#include "millis.h"
#include "debounce.h"
#include "fsm.h"
#include "lcd.h"

char char_buf[64];
char init_msg[] = "Start programu!";

void init(void){

    PORTB.DIRSET = PIN3_bm;
    PORTB.DIRCLR = PIN2_bm;
    PORTB.PIN2CTRL = PORT_INVEN_bm | PORT_PULLUPEN_bm;
    
}

void init_fcn(fsm_t *fsm, uint8_t event);
void run_fcn(fsm_t *fsm, uint8_t event);
void adc_fcn(fsm_t *fsm, uint8_t event);


int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    init();
    uart_init(F_CPU, 115200);
    adc_init();
    millis_init(); 
    LCD_Init();
    sei();
   
    adc_set_channel(3);
    uint32_t prev_time = get_millis();
    uint32_t prev_time_led = get_millis();
    fsm_t fsm;
    fsm_init(&fsm, init_fcn);
    btn_debounc_t btn = {.counter=0, .btn_state=0};
    
    while (1)
    {
        
        if((get_millis() - prev_time_led) >= 1000){
            prev_time_led = get_millis();
            PORTB.OUTTGL = PIN3_bm;
        }
        
        if((get_millis() - prev_time) >= 40){
            prev_time = get_millis();
            fsm_add_event(EV_TICK);
        }
        
        if (debounce(&btn, PORTB.IN & PIN2_bm)){
            fsm_add_event(EV_BTN_PRESSED);
            
        }
        
        uint8_t new_event;
        if (fsm_get_event(&new_event)){
            fsm_dispatch(&fsm, new_event);
        }  
    }
}

void init_fcn(fsm_t *fsm, uint8_t event){
    
    static uint8_t index = 1;
    
    switch(event){
    
        case EV_ENTRY:
        {   
            index = 1;
            break;
        }
        
        case EV_TICK:
        {
            snprintf(char_buf, index, "%s", init_msg);
            if(index<16){
                 LCD_Print(1, char_buf);
                 index++;
            }
            break;
        }
        
        case EV_BTN_PRESSED:
        {
            fsm_transition(fsm, adc_fcn);
            break;
        }

        case EV_EXIT:
        {
            LCD_Clear();
            break;
        }
    }
}

void adc_fcn(fsm_t *fsm, uint8_t event){

    switch(event){
    
        case EV_ENTRY:
        {   
            LCD_Print(1, "ADC:");   
            break;
        }
        
        case EV_TICK:
        {
            uint16_t adc_now = adc_read_raw();
            sprintf(char_buf, "ADC: %d    ", adc_now);
            LCD_Print(2, char_buf);
            break;
        }
        
        case EV_BTN_PRESSED:
        {
            fsm_transition(fsm, init_fcn);
            break;
        }

        case EV_EXIT:
        {
            LCD_Clear();
            break;
        }
    }

}

```


### 📝  Zadání:

Věnujte, prosím, pár minut a poskytněte nám feedback ke kurzu:
[rev-dotaznik](https://forms.gle/k3pbjr2YhkZ2CaHc8)

  1) V této složce je aktuální rev_lib. Doplňte a otestujte filtry 12.1 a 12.2. Použíjte     [serial plotter web](https://web-serial-plotter.atomic14.com/), [serial plotter app](https://github.com/hyOzd/serialplot/releases). Použijte testovací kód 12.4.

  2) Vyzkoušejte i plovoucí průměr a vytvořte filters .c a filters .h v knihovně. Filtry tam přesuňte. Pomocí skriptu pro generování lookup tabulky waveformgen.m, vygenerujte průběh pro DAC. Vyzkoušejte i nějáký vlastní. 
   
  3) Otestujte realizaci stavového automatu 12.5. Přidejte tlačítko btn2 a další stavy a přechody podle diagramu:
  4) 
  5) Rozšiřte , nebo přepracujte FSM dle vlastního uvážení.

<p align="center">
  <img width="750" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_WDT_SLEEP/WDT.png">
</p>
  
