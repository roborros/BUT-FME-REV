
# REV - Desáté cvičení
- LOOKUP a FSM

## LookUp tabulka:
Jedná se o hojně využívanou metodu v embedded systémech. V našem případě ji budeme využívat k rychlému určení nelineární funkce. Hodí se však i přepočtům zavislostí, pro která funkci neznáme, ale máme hodnoty z naměřených (experimentálních) dat. Závislosti odporu na teplotě čidla, odbuzovací charakteristika elektrického stroje a tak podobně... v jednoduché podobě se jedná o tabulku s hodnotami X a Y. Tabulka má nějákou konečnou hodnotu, nemůže být tedy libovolně přesná. Mezi body, které znám je třeba  provádět interpolaci. Nejpoužívanější je lineární. 

## Vykreslení a generování tabulky:

<p align="center">
  <img width="850" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/09_CV/WDT.png">
</p>

### Kód pro matlab:
Vygeneruje vám obrázky a také tabulku. Lze ho spustit i na Octave Online.
```matlab
clc; clear all; close all;
 
x = (0:15:255);
y = round(sin(((x*2*pi)/255))*127);
 
x1 = linspace(0,255,1001);
y1 = sin(((x1*2*pi)/255))*127;

figure(1);
plot(x,y,'+-r')
hold on
plot(x1,y1,'-b')
grid on

for index = 1:length(x)
    fprintf("{%d, %d},\n", x(1,index), y(1,index));
end

z =  sin(((100*2*pi)/255))*127

>>
{0, 0},
{15, 46},
{30, 86},
{45, 114},
{60, 126},
{75, 122},
{90, 101},
{105, 67},
{120, 23},
{135, -23},
{150, -67},
{165, -101},
{180, -122},
{195, -126},
{210, -114},
{225, -86},
{240, -46},
{255, 0},
z =  79.619
```
### smazani WDT:

    - PIC18 má instrukci 'CLRWDT', instrukce lze do C programu zadat příkazem __asm("CLRWDT");


## Přiklad 10.1:
Příklad demonstruje využití lookup tabulky na sin()

```c
// LOOKUP
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON    // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)


#include <xc.h>
#include <stdio.h>

#include "lcd.h"

#define _XTAL_FREQ 32E6

// vytvorim strukturu typu point pro x a y souradnici
typedef struct
{
    int x;
    int y;
} point;

// vytvorim lookup tabulku nezapomenu na slovo const, ktera umozni setrit pamet RAM
const point LOOKUP[18] = 
{   
                        {0, 0},
                        {15, 46},
                        {30, 86},
                        {45, 114},
                        {60, 126},
                        {75, 122},
                        {90, 101},
                        {105, 67},
                        {120, 23},
                        {135, -23},
                        {150, -67},
                        {165, -101},
                        {180, -122},
                        {195, -126},
                        {210, -114},
                        {225, -86},
                        {240, -46},
                        {255, 0}
};

int interpolate(point p1, point p2, int adc);
int searchIndex(int target, const point *table, int tableSize);
int readADC(char channel);

void init(void){
    
    ANSELA = 0b00100000;        //AN4
    ANSELE = 0b1;               //AN5
    
    //ADC init
    ADCON2bits.ADFM = 0;        //left justified
    ADCON2bits.ADCS = 0b110;    //Fosc/64
    ADCON2bits.ACQT = 0b110;    //16
    ADCON0bits.ADON = 1;        //ADC turn on
}

void main(void)
{

    init();
    LCD_Init();
    
    char text1[17];
    int adc, indx, value;
    while(1)
    {

        adc = (int)readADC(5);
        indx = searchIndex(adc, LOOKUP, 18);
        value = interpolate(LOOKUP[indx], LOOKUP[indx+1], adc);
        
        //LCD_Clear();
        sprintf(text1,"sin:%d-->%d   ", adc, value);
        LCD_ShowString(1,text1);
        __delay_ms(40);
        
    }

}

int searchIndex(int target, const point *table, int tableSize)
{
    int i;
    int bestIndex = 0;
    for (i=0; i<tableSize; i++) {
        if (target > table[i].x) {
            bestIndex = i;
        } else {
            return bestIndex;
        }
    }
    return bestIndex;
}

int interpolate(point p1, point p2, int x)
{
    int y;
    long tmp;
    tmp = (x - p1.x);
    tmp *= (p2.y - p1.y);
    tmp /= (p2.x - p1.x);
    y = p1.y + tmp;
    return y;
}

int readADC(char channel)
{
	char tmp = 10;
    ADCON0bits.CHS = channel;
    while(--tmp){};
    GODONE = 1;
    while(GODONE){};
    return ADRESH;
}
```

## Stavové automaty:
PIC18 ma v podstatě dva power módy. Jedná se o IDLE a SLEEP. Rozdíl je ten, že SLEEP opravdu zastaví CPU i periferie, zatímco IDLE jen CPU. V IDLE modu mohu tedy probudit procesor například přerušením od periferie (ukážeme si TIMER). Ve SLEEP modu k tomu může sloužit třeba WDT, který tentokrát neresetuje, ale probudí zařízení. 

## FSM:
<p align="center">
  <img width="700" height="260" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/09_CV/PowerModes.png">
</p>

## Přiklad 10.2:
IDLEN = 0 je to deep sleep. CPU i periferie neběží. K probuzení použijeme WDT. Který po provedení "SLEEP" instrukce procesor probudí.
```c
// FSMP

```
## Přiklad 10.3:
IDLEN = 1 je to idle mod. CPU je vypnuto, ale periferie běží dál. Je možné probudit interrupt flagem. V tomto případě používáme TMR1.
```c
// FSM

```

### Zadání:

  1) Rozšiřte úlohu jedna, že dolní řádek zobrazuje hodnotu cos().

  2) Nakonfugurujte komunikaci s PC. Pokud nepříjde déle než 30s specifická zpráva (kterou si zvolte), tak dojde k SW resetu. Po resetu zobrazte na displeji, že zpráva nedošla.
  3) Provozujte kontroler v IDLE módu. Kontrolér hned po inicilizaci uspěte a komunikujte přes uart. Tedy příchod zprávy MCU probudí. Zpráva se odešle zpět (ECHO) a MCU zase usne.
