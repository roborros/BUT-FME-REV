# REV - Dvanácté cvičení - software

## Fitry:

Digitální zpracování signálu (DSP) je v aplikacích s mikrokontroléry časté. Mezi nejzákladnější a nejpoužívanější patří digitální filtry typu dolní propust (Low-Pass) a horní propust (High-Pass). Oba tyto algoritmy vycházejí ze svých analogových ekvivalentů v podobě jednoduchých RC článků.

**Dolní propust:** propouští signály pouze do určité mezní frekvence, zatímco vyšší kmitočty tlumí, což je ideální pro potlačení šumu.

**Horní propust:** naopak odstraňuje stejnosměrnou složku (střední hodnotu) a reaguje pouze na dynamické změny signálu

Diferenční rovnici a její odvození: [wiki-low-pass](https://en.wikipedia.org/wiki/Low-pass_filter)

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

### 📝  Zadání:

  1) V této složce je aktuální rev_lib. Doplňte a otestujte filtry 12.1 a 12.3. Použíjte     [serial plotter web](https://web-serial-plotter.atomic14.com/), [serial plotter app](https://github.com/hyOzd/serialplot/releases). Použijte testovací kód 12.4.

  2) Vyzkoušejte i plovoucí průměr a vytvořte filters .c a filters .h v knihovně. Filtry tam přesuňte.
  
