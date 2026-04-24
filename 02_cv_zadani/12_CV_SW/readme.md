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


### 📝  Zadání:

  1) V této složce je aktuální rev_lib. Doplňte a otestujte filtry 12.1 a 12.3. Použíjte     [serial plotter web](https://web-serial-plotter.atomic14.com/), [serial plotter app](https://github.com/hyOzd/serialplot/releases).

  2) Vyzkoušejte i plovoucí průměr a vytvořte filters .c a filters .h v knihovně. Filtry tam přesuňte.
  
