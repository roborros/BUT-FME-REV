
# REV - Rekreační cvičení

## Nastavení pro porjekt:
Uvedeme si zde možné nastavení pro větší projekt. Umístené složek v systému je následovné:

<p align="center">
  <img width="200" height="230" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FSM/projektsetup.png">
</p>

## LookUp tabulka:
Jedná se o hojně využívanou metodu v embedded systémech. V našem případě ji budeme využívat k rychlému určení nelineární funkce. Hodí se však i k přepočtům zavislostí, pro kterou funkci neznáme, ale máme hodnoty z naměřených (experimentálních) dat. Závislosti odporu na teplotě čidla, odbuzovací charakteristika elektrického stroje a tak podobně... v jednoduché podobě se jedná o tabulku s hodnotami X a Y. Tabulka má nějákou konečnou hodnotu, nemůže být tedy libovolně přesná. Mezi body, které znám je třeba  provádět interpolaci. Nejpoužívanější je lineární. 

## První úkol:
Všichni znáte jednotkovou kružnici. Představme si, že požadovýný úhel budeme volit potenciometrem a to mezi 0..255. Získat pak budeme chtít hodnotu sinus, kterou ale také přepočítáme na -127..127. Níže je graf s takto vygenerovanou sinusovkou. Pro naši tabulku zvolíme krok 15 (je dobre si pamatovat, že číslo 255 lze beze zbytku dělit třeba: ..5,15,17..). Naše tabulka bude mít 18 hodnot.

<p align="center">
  <img width="250" height="230" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FSM/RevKruznice.png">
</p>

<p align="center">
  <img width="600" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FSM/REVsinus.png">
</p>

### Kód pro matlab:
Vygeneruje vám obrázky a také tabulku. Lze ho spustit i na Octave Online. Na konci v proměnné "z" mohu zobrazit výsledek pro nějáký vstup a porovnat ho s řešením na MCU.

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

% vystup******************************************************
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
### Použití tabulky na MCU:
V prvé řadě je výhodné zavést datový typ point, což je struktura, která obsahuje bod(x,y). Tabulka je potom pole těchto bodů. Pro interpolaci potom musíme určit pro které body ji budeme provádět. Interpolace je potom už přímočará. 

### Návod na interpolaci:
Nejdříve je třeba určit body, kde budete interpolovat, proto implementujte funkci searchIndex(). Nalézt index je třeba proto, že ADC vám vrací libovolnou hodnotu 0..255, musíte tedy určit body v tabulce, kde budete interpolovat. Potom implementujte funkci interpolate(). Viz. obrázek.

### Nepoužívejte floating point, kontrolér na to nemá hardware (tzv. FPU):

<p align="center">
  <img width="600" height="230" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FSM/interpolation.png">
</p>

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

        adc = readADC(5);
        indx = searchIndex(adc, LOOKUP, 18);
        value = interpolate(LOOKUP[indx], LOOKUP[indx+1], adc);
        

        sprintf(text1,"sin:%d-->%d   ", adc, value);
        LCD_ShowString(1,text1);
        __delay_ms(40);
        
    }

}

int searchIndex(int target, const point *table, int tableSize)
{
  // implementujte funkci 
  return target; // return je zde jen pro preklad ma vracet index
}

int interpolate(point p1, point p2, int x)
{
    //implementujte funkci
    return x;  // return je zde jen pro preklad ma vracet hodnotu y
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
