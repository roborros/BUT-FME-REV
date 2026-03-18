# 🚀 REV - Sedmé cvičení - ADC/DAC

### ADC:

Většina moderních mikrokontrolérů využívá pro ADC architekturu s postupnou aproximací (SAR – Successive Approximation Register). Tento princip pracuje na bázi binárního vyhledávání, kdy vnitřní komparátor postupně porovnává vstupní napětí s referenčními úrovněmi generovanými interním DAC. Algoritmus začíná u nejvýznamnějšího bitu (MSB) a postupně prochází až k nejméně významnému bitu (LSB), čímž v každém kroku zpřesňuje odhad vstupního napětí. Tento proces vyžaduje pro každý převod několik hodinových cyklů, což představuje kompromis mezi rychlostí a přesností převodu.

### DAC:

Digitálně-analogový převod v MCU je nejčastěji realizován pomocí odporové sítě, typicky v konfiguraci R-2R (odporový žebřík) nebo String DAC. Tyto obvody fungují jako precizní napěťové děliče, kde digitální vstup ovládá soustavu tranzistorových spínačů. Tyto spínače připojují odpovídající uzly odporové sítě k referenčnímu napětí, čímž na společném výstupu vzniká součtové napětí lineárně závislé na vstupním binárním kódu. Výstup je často doplněn operačním zesilovačem (bufferem), který zajišťuje nízkou výstupní impedanci pro stabilní buzení zátěže.

### Rozlišení:

Hlavním parametrem obou převodníků je rozlišení definované počtem bitů (N). Například 12bitové ADC rozděluje rozsah referenčního napětí na 4096 kroků. Velikost nejmenšího možného kroku, označovaná jako LSB (Least Significant Bit), se vypočítá jako:

$$LSB = \frac{V_{REF}}{2^N}$$

## 💡 Blokové schema ADC:

<p align="center">
  <img width="850" height="350" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/07_CV_ADC/ADCscheme.png">
</p>


## 🏗️ Přiklad 7.1:
Pošleme hodnotu z adc přes uart do PC
```c
#include <avr/io.h>
#include <avr/interrupt.h>
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
    
    USART3.CTRLA = USART_RXCIE_bm;
}


void uart_write_str(char *s)
{
    while(*s) {
        while(!(USART3.STATUS & USART_DREIF_bm)){} 
        USART3.TXDATAL = *s++;
    }
}

void ADC_init(void)
{   
    // nastaveni reference pro adc
    VREF.ADC0REF = 0x5;
    // vypnuti analog input - neni uplne nutne
    PORTD.PIN3CTRL |= PORT_ISC_INPUT_DISABLE_gc;     
    // nasaveni adc_clk cpu clock / 32
    ADC0.CTRLC = ADC_PRESC_DIV32_gc;
    // zapnuti 12bit
    ADC0.CTRLA = ADC_ENABLE_bm | ADC_RESSEL_12BIT_gc;
    // vzber kanalu
    ADC0.MUXPOS = ADC_MUXPOS_AIN3_gc;
}

uint16_t ADC_read(void)
{
    // tohle odstartuje prevod
    ADC0.COMMAND = ADC_STCONV_bm;
    // flag se nastavi az je hotovo
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm))
    {
        // Wait
    }
    // prectu a vratim vysledek
    return ADC0.RES;
}


int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);      
    ADC_init();
    uart_init(F_CPU, BAUDRATE);
       
    char txbuf[64];
    
    while (1)
    {
        sprintf(txbuf, "adc: %u\n", ADC_read());
        uart_write_str(txbuf);
        _delay_ms(100);   
    }
}

```


```
## 🏗️  Přiklad 7.2 vyvolani preruseni na dokoncenou konverzi a využití timeru:

```c

void main(void) {
    

}

```

## 🏗️  Přiklad 7.3 využití DAC převodníku:
generuje sinus na DAC - otput - PD6 připojte LED semaforu
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#define F_CPU 24000000UL
#include <util/delay.h>

// generator: https://deepbluembedded.com/sine-lookup-table-generator-calculator/
const uint16_t sine_table[] = {
512, 611, 707, 796, 873, 937, 984, 1013,
1023, 1013, 984, 937, 873, 796, 707, 611,
512, 412, 316, 227, 150, 86, 39, 10,
0, 10, 39, 86, 150, 227, 316, 412};

void dac_init(void)
{
    PORTD.PIN6CTRL = PORT_ISC_INPUT_DISABLE_gc;
    VREF.DAC0REF = VREF_REFSEL_VDD_gc;
    DAC0.CTRLA = DAC_ENABLE_bm | DAC_OUTEN_bm;  
}

void DAC_setVal(uint16_t value)
{
    DAC0.DATA = value << 6;
}

int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    dac_init();
     
    uint16_t i = 0;
    
    while (1)
    {
        
        DAC_setVal(sine_table[i++]);
        
        if(i >= sizeof(sine_table)/sizeof(sine_table[0])){
            i = 0;
        }
        
        _delay_ms(50);      
    }
}

```

### 📝 Zadání:

 1) Vyzkoušejte příklad 7.1 a připojte k adc potenciometr a převeďte hodnotu na napětí ve voltech (float) pošlete zaokrouhleno na 3 číslice.
  
 2) Rozšiřte předchozí úlohu tak, že budete moci změnit kanal ADC a přidejte na něj fotorezistor (měří intenzitu světla).

 3) Vyzkoušejte úlohu 7.3 a výstup DAC-out PD6 připojte na LED semaforu.

 4) Výstup DAC z předchozí úlohy snímejte pomocí ADC a pošlete hodnotu do PC. Vygenerujte si preciznější sinus tabulku.
 
