
# REV - Desáté cvičení
- LOOKUP a FSM

## LookUp tabulka:
Jedná se o hojně využívanou metodu v embedded systémech. V našem případě ji budeme využívat k rychlému určení nelineární funkce. Hodí se však i k přepočtům zavislostí, pro kterou funkci neznáme, ale máme hodnoty z naměřených (experimentálních) dat. Závislosti odporu na teplotě čidla, odbuzovací charakteristika elektrického stroje a tak podobně... v jednoduché podobě se jedná o tabulku s hodnotami X a Y. Tabulka má nějákou konečnou hodnotu, nemůže být tedy libovolně přesná. Mezi body, které znám je třeba  provádět interpolaci. Nejpoužívanější je lineární. 

## První úkol:
Všichni znáte jednotkovou kružnici. Představme si, že požadovýný úhel budeme volit potenciometrem a to mezi 0..255. Získat pak budeme chtít hodnotu sinus, kterou ale také přepočítáme na -127..127. Níže je graf s takto vygenerovanou sinusovkou. Pro naši tabulku zvolíme krok 15 (je dobre si pamatovat, že číslo 255 lze beze zbytku dělit třeba: ..5,15,17..). Naše tabulka bude mít 18 hodnot.

<p align="center">
  <img width="250" height="230" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV/RevKruznice.png">
</p>

<p align="center">
  <img width="600" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV/REVsinus.png">
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
V prvé řadě je výhodné zavést datový typ point, což je struktura, která obsahuje bod(x,y). Tabulka je potom pole těchto bodů. Pro interpolaci potom musíme určit pro které body ji budeme provádět. Interpoloca je potom už přímočará. 

### Návod na interpolaci:
Nejdříve je třeba určit body, kde budete interpolovat, proto implementujte funkci searchIndex(). Nalézt index je třeba proto, žeADC vám vrací libovolnou hodnotu 0..255, musíte tedy určit body v tabulce, kde budete interpolovat. Potom implementujte funkci interpolate(). Viz. obrázek.
<p align="center">
  <img width="600" height="230" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV/interpolation.png">
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

## Stavové automaty:
Stavové automaty jsou fundamentální koncept v embedded systémech. Jedná se o jistou formu abstrakce, kdy logiku systému uzavíráme do stavu. Stavový automat je potom ovládán přes určité události. To může být stisknuté tlačítko, příchod zprávy, vypršení času apod. Koncept nic neříká o tom, jak přesně má být automat naprogramován. Uvedeme základní a použivanou realizaci pomoci switch-case. Ten je vhodný pro jednoduché FSM, kde není příliš mnoho stavů. Toto řešení u větších úloh totiž vede k celkem nepřehlednému kódu. tzv. "spaghetti code".


## Přiklad 10.2:
Implementujeme základní kostru programu se stavovým automatem na obrázku. Automat má 5 stavů, kdy jeden je IDLE. Je to stav, který se spustí na začátku programu. Dále jsou zde čtyři stavy STATEx. Mezi stavy se jdá v kruhu přecházet tlačítkem BTN1. Náš automat se volá pravidelně a je řízen přerušením přes TMR1. Stav automatu uchováváme ve statické proměnné state. 

## FSM k úloze 10.2:
<p align="center">
  <img width="240" height="300" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV/FSM.png">
</p>

```c
// FSM
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = OFF    // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)
 
 
#include <xc.h>
#include <stdio.h>
 
#include "lcd.h"
 
#define ISR_PERIOD 0xFFFF - 50000
#define _XTAL_FREQ 8E6
 
#define BTN1    PORTCbits.RC0
#define BTN2    PORTAbits.RA4
#define BTN3    PORTAbits.RA3
#define BTN4    PORTAbits.RA2

enum{
    IDLE = 0,
    STATE1,
    STATE2,
    STATE3,
    STATE4,
} STATES;

void idle(void);
void state1(void);
void state2(void);
void state3(void);
void state4(void);

void driveLED(char in);
void putch(char msg);
  
volatile char gFlag = 0;
 
void __interrupt() ISR(void){
    if(TMR1IE & TMR1IF){
        TMR1 = ISR_PERIOD;
        gFlag = 1;
        TMR1IF = 0;
   }
}
 
// Functions prototypes
void FSM(void);
 
void init(void)
{
    // disable analog properties
    ANSELA = 0x00;
    ANSELC = 0x00;
 
    // set pins as outputs
    TRISDbits.TRISD2 = 0;
    TRISDbits.TRISD3 = 0;
    TRISCbits.TRISC4 = 0;
    TRISDbits.TRISD4 = 0;
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD6 = 0;
    
    // LEDs off
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    
    // set pins as inputs
    TRISAbits.TRISA4 = 1;
    TRISAbits.TRISA3 = 1;
    TRISAbits.TRISA2 = 1;
    TRISCbits.TRISC0 = 1;
    
    // uart
    SPBRG1 = 12;              // (8_000_000 / (64 * 9600)) - 1
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    
 
    // TIMER
    T1CONbits.TMR1CS = 0b00;
    T1CONbits.T1CKPS = 0b11;    // TMR1 prescaler
   
    //interrupts
    PEIE = 1;                   // global interrupt enable// peripheral interrupt enable
    GIE = 1;                    // global interrupt enable
    TMR1IE = 1;                 // enable TMR1 interrupt
    T1CONbits.TMR1ON = 1;       // timer ON
 
}
 
void main(void)
{
    init();
    LCD_Init();
 
    while(1)
    {
        if (gFlag)
        {
            FSM();
            gFlag = 0;
        }
    }
}
 
void FSM(void)
{
    static char STATE = IDLE;
    
    switch (STATE)
    {
    case IDLE:
        if (BTN1){
            __delay_ms(5);
            if(BTN1){
                STATE = STATE1;
                while(BTN1);
            }
        }
        idle();
        break;
    case STATE1:
        if (BTN1){
            __delay_ms(5);
            if(BTN1){
                STATE = STATE2;
                while(BTN1);
            }
        }
        state1();
        break;
    case STATE2:
        if (BTN1){
            __delay_ms(5);
            if(BTN1){
                STATE = STATE3;
                while(BTN1);
            }
        }
        state2();
        break;
    case STATE3:
        if (BTN1){
            __delay_ms(5);
            if(BTN1){
                STATE = STATE4;
                while(BTN1);
            }
        }
        state3();
        break;
    case STATE4:
        if (BTN1){
            __delay_ms(5);
            if(BTN1){
                STATE = STATE1;
                while(BTN1);
            }
        }
        state4();
        break;
        }
}


void idle(void){
    
    LCD_ShowString(1, "State:IDLE         ");
    printf("Current state: IDLE\n");
    driveLED(IDLE);
    
}
void state1(void){
    
    LCD_ShowString(1, "State: STATE1      ");
    printf("Current state: STATE1\n");
    driveLED(STATE1);
    
}
void state2(void){
    
    LCD_ShowString(1, "State: STATE2      ");
    printf("Current state: STATE2\n");
    driveLED(STATE2);
    
}
void state3(void){
    
    LCD_ShowString(1, "State: STATE3      ");
    printf("Current state: STATE3\n");
    driveLED(STATE3);
    
}
void state4(void){
    
    LCD_ShowString(1, "State: STATE4      ");
    printf("Current state: STATE4\n");
    driveLED(STATE4);
    
}

void driveLED(char in){
        in = ~in;
        LATD2 = in & 1;             //LED0
        LATD3 = in & 2 ? 1 : 0;     //LED1
        LATC4 = in & 4 ? 1 : 0;     //LED2
        LATD4 = in & 8 ? 1 : 0;     //LED3
        LATD5 = in & 16 ? 1 : 0;    //LED4
        LATD6 = in & 32 ? 1 : 0;    //LED5
}

void putch(char msg){
    while(!TX1IF){};
    TX1REG = msg;
}

```

### Zadání:

  1) Rozšiřte úlohu jedna LookUp, že dolní řádek zobrazuje hodnotu cos().
  2) Rozšiřte úlohu dva FSM tak, že první stav zobrazuje na LCD napětí na POT1, druhy na POT2, třetí realizuje časovač a ukazuje čas od začátku stavu v s, čtvrtý realizuje blikání všech led (frekvence blikáni laze viditelně nastavovat POT2).
  3) Upravte FSM takto: K přepínání stále slouží talačítko BTN1, ale zároveň dojde k přechodu po 10s ve stavu. Musíte reagovat na BTN1 a tedy nejde použít blokující delay(). (Použíjte TIMER)
  
