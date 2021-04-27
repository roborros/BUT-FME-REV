
# REV - Rekreační cvičení

## Nastavení pro větší projekty:
Uvedeme si zde možné nastavení pro větší projekt. Umístění složek v systému je následovné:

<p align="center">
  <img width="200" height="230" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/projektsetup.png">
</p>

Složky jsou rozděleny na inc/src (hlavičkové soubory a zdrojové soubory). 

## Vytvoření knihovny:

Nečitelný soubor v podobě knihovny lze vygenerovat v příkazovém řádku, XC8 musí být v systémových cestách:
```c
xc8 --chip=18f46k22 --output=lpp soubor.c nazev.
```
knihovna .lpp se pote přidává do abstraktní složky libraries v MPLABu. Pro tyto knihovny může sloužit složka lib.

## Zkuste si s cvičícím nastavit takový projekt.
1) Vygenerujte .lpp pro lcd.

2) Použijte tuto knihovnu v projektu (složka MPLAB libraries).

3) Vytvorte uart.c a adc.c (i hlavičkové soubory).

4) Přidejte je do projektu.

5) Zkuste zahrnout inc složky v include path compilátoru (potom se používají <adc.h>, <uart.h>).

## LookUp tabulka:
Jedná se o hojně využívanou metodu v embedded systémech. V našem případě ji budeme využívat k rychlému určení nelineární funkce. Hodí se však i k přepočtům zavislostí, pro kterou funkci neznáme, ale máme hodnoty z naměřených (experimentálních) dat. Závislosti odporu na teplotě čidla, odbuzovací charakteristika elektrického stroje a tak podobně... v jednoduché podobě se jedná o tabulku s hodnotami X a Y. Tabulka má nějákou konečnou hodnotu, nemůže být tedy libovolně přesná. Mezi body, které znám je třeba  provádět interpolaci. Nejpoužívanější je lineární. 

## První úkol:
Všichni znáte jednotkovou kružnici. Představme si, že požadovýný úhel budeme volit potenciometrem a to mezi 0..255. Získat pak budeme chtít hodnotu sinus, kterou ale také přepočítáme na -127..127. Níže je graf s takto vygenerovanou sinusovkou. Pro naši tabulku zvolíme krok 15 (je dobre si pamatovat, že číslo 255 lze beze zbytku dělit třeba: ..5,15,17..). Naše tabulka bude mít 18 hodnot.

<p align="center">
  <img width="250" height="230" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/RevKruznice.png">
</p>

<p align="center">
  <img width="600" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/REVsinus.png">
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
  <img width="600" height="230" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/interpolation.png">
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
## Cvičení.
1) Doplňte funkci searchIndex

2) Doplňte funkci interpolate


## Kruhový buffer:
Jedná se o abstraktní strukturu, která realizuje LIFO frontu. V podstate se jedná pole na datový typ jednoho typu a o další mechanismus, který umožňuje přechod mezi poslední a první položkou. Dle obrázku:
<p align="center">
  <img width="600" height="400" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/Circular_Buffer_Animation.gif">
</p>


### Realizace:
Vytvoření vlastního datového typu. Obsahuje pole hodnot a index pro čtení a zápis. Pokud použiji velikost 2**n mohu zrychlit některé potřebné operace. 

```c
// buffer object
typedef struct ring_buffer_t {
  /** Buffer memory. */
  char buffer[RING_BUFFER_SIZE];
  /** Index of tail. */
  ring_buffer_size_t tail_index;
  /** Index of head. */
  ring_buffer_size_t head_index;
}ring_buffer_t;
```
1) Projděte si následující kód na desktopu. Demonstruje přetečení indexu i vrácení položek v bufferu
```c
// REV ring buffer
#include <stdio.h>
#include <stdint.h>

#define buff_size 8
#define buff_mask buff_size-1


// bitfields

typedef struct {
	uint8_t head :3;
	uint8_t tail :3;
}buff_t;

int main(void){
	
	
	uint8_t head=0;
	uint8_t tail=0;
	uint8_t result;
	
	buff_t buff={.head=0, .tail=0};
	
	// circulation
	char i;
	for (i = 0; i < 17; i++){
		head = (head+1) & buff_mask;
		printf("Head idx: %d \n", head);
	}
	
	printf("############################################ \n");	
	// number of items
	
	tail = 1;
	head = 5;
	
	result = (head - tail) & buff_mask;
	printf("Num of items: %d \n", result);
	
	tail = 5;
	head = 1;
	
	result = (head - tail) & buff_mask;
	printf("Num of items: %d \n", result);
	
	printf("############################################ \n");	
	
	for (i = 0; i < 17; i++){
		printf("Head idx: %d \n", buff.head++);
	}

	return 0;
}


```

### Zadání:
1) Projděte si projekt s kruhovým bufferem na PIC18. A následně implementujte plovoucí průměr na výstup POT2. Plovoucí průměr počítejte z 32 hodnot a přes UART posílejte do PC zprůměrovanou hodnotu a surový výstup z ADC. Obě hodnoty zobrazte pomocí Serial Oscilloscope.

## OOP:
C není objektově orientovaný jazyk, ale nekteré prvky lze realizovat i tak. Projděte se s cvičícím příklad OOP.X.

## Stavové automaty:

* Stavový automat je abstraktní popis problému, který jej uzavírá do tzv. Stavů. Lze je samozřejmě popsat matematicky.
* Podstatné však je, že funkcionalitu zařízení uzavírám do stavů a k přechodům z jednoho stavu do druhého používám události. 
* Stavový automat má vždy počáteční stav, ve kterém se nachází po uvedení do provozu.
* Kolem automatů existuje rozsáhlá teorie, důležitá je však základní myšlenka.
* Není přesně určeno jak se potom daný automat naprogramuje

* Popis pomocí stavového automatu je tedy převod komplexních systému, do abstraktního popisu pomocí stavů.

* Výhodou je právě to, že tato abstrakce umožňuje snadné ověření funkce, zda takto vytvořený automat skutečně myslí na vše (proofability)

* řešení pomocí stavového automatu je tedy jednoduší ověřit tzv verifikovat

* Možností jak FSM programovat je několik, jednoduché automaty lze dělat pomocí switch-case, což je poněkud nepřehledné, ale často se používá. Dále pak lze použít různý koncept tabulek a  struktur a pointery. 

<p align="center">
  <img width="520" height="600" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/fsm.jpg">
</p>

## Příklad FSM.x:
Projekt realizuje automat, ktery je v tomto případě řízen událostmi. Pro zachycení události je zde fronta událostí (kruhový buffer). Události mohu do fronty přidat třeba z ISR, nebo v podstate tam kde zavolám write_evt(evt).

### Zápis stavu pak může vypadat např.:
```c
void init(fsm_t *fsm, uint8_t event){
    
    switch(event){
        case EV_ENTRY:
            LCD_ShowString(1, "Welcome         ");
            bsp_set_timeout(5000);
            break;
        case EV_EXIT:
            printf("Init state exit\n");
            break;
        case EV_TIMEOUT:
            fsm_transition(fsm, &state1);
            break;
    }
}
```
## Úkol:
Upravte projekt FSM dostupný v tomto cvičení tak, aby stavový automat odpovídal diagramu níže.
<p align="center">
  <img width="600" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/FSM_diagram_ukol.png">
</p>
