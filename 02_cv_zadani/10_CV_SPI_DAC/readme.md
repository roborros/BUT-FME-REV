# REV - Desáté cvičení
- SPI a DAC [Link na videonávod](https://youtu.be/Pbv0a3SPubc)

## SPI:
SPI je základní rozhraní MCU pro komunikaci s obvody např. ADC, DAC, externí paměti apod. Jedná se o poměrně jednoduché rozhraní, které je synchronni master/slave. Obsahuje 3 komunikační vodiče clock, dataout a datain. K určení s kterým zařízením probíhá komunikace je zde další vodič pro každé zařízení. Nevýhodou pak může být velký počet vodičů a to, že veškerou komunikaci musí řídit master a také nemohou komunikovat obvody mezi sebou. Výhodou je jednoduchost a rychlost, která je běžně v  řádu MHz.  

## 
<p align="center">
  <img width="500" height="350" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/SPIsync.png">
</p>

V našem datasheetu k MCU máme SPI periferii dobře popsanou. Poměrně důležité je pochopit různé mody SPI, které jsou 4. 

## MODY:
<p align="center">
  <img width="250" height="150" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/Mody.png">
</p>

## DAC MCP 4802:
V katalogu DAC převodníku najdeme informace ke komunikaci. Zjistíme, že komunikace může být, v módu 0,0 nebo 1,1. Také zjistíme, že náš DAC obsahuje interní referenci 2048mV a také má přepínatelné zesílení 1x, nebo 2x. Zpráva se také skládá ze dvou bajtů. Budeme tedy posílat dvě zprávy za sebou na jeden výběr CS signálu.

<p align="center">
  <img width="675" height="525" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/DAC.png">
</p>

### Konfigurace: 

    - nastávíme příslušné GPIO
    - SSP1CON1bits.SSPM = 0b0010;   // SPI clock
    - SP1CON1bits.SSPEN = 1;        // SPI zapnuto
    DAC převodník umí pracovat s módem 0,0 



## Přiklad 10.1:
Program demonstruje použití SPI k zápisu hodnoty na výstup DA převodníku. K měření běžně potřebujete osciloskop, ale my můžeme použít ADC a poslat si hodnotu přes UART do PC. Vše z toho již umíme. Použijeme seriový osciloskop pro zobrazení průběhu. Program generuje trojúhelník, protože inkrementuje i++ do maximální hodnoty a přeteče. Zesílení převodníku je nastaveno na 1x, tedy 0..2048mV.

```c
// DAC
#pragma config FOSC =   HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON         // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF           // Watchdog Timer Enable bits (WDT is always enabled. SWDTEN bit has no effect)

#include <stdio.h>
#include <stdint.h>
#include <xc.h>

#define _XTAL_FREQ 32E6         // definice fosc pro knihovnu
#define DAC_SS LATB3            // DAC slave select pin
#define DAC_CH1 0b00110000      // kanal 1/B
#define DAC_CH2 0b10110000      // kanal 2/A
#define LED LATDbits.LATD2      // ledka

void init(void){
    
    /* vyber pinu jako vystupy */
    ANSELC = 0x00;              // vypnuti analogovych funkci na PORTC
    TRISCbits.TRISC3 = 0;
    TRISCbits.TRISC5 = 0;
    TRISBbits.TRISB3 = 0;
    TRISDbits.TRISD2 = 0;
    TRISD = 0x00;               // PORTD jako vystup
    TRISCbits.TRISC6 = 1;       // TX pin jako vstup
    TRISCbits.TRISC7 = 1;       // RX pin jako vstup
    LATBbits.LATB3 = 1;         // DAC SS off

    SSP1CON1bits.SSPM = 0b0010; // SPI clock
    SSP1STATbits.CKE = 1;
    SSP1CON1bits.SSPEN = 1;     // SPI zapnuto
    
    /* nastaveni ADC*/
    ANSELBbits.ANSB5 = 1;
    ADCON2bits.ADFM = 0;            //justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout

    /*baudrate*/
    SPBRG1 = 51;                // (32_000_000 / (64 * 9600)) - 1
    RCSTA1bits.SPEN = 1;        // zapnuti UART
    TXSTA1bits.SYNC = 0;        // nastaveni asynchroniho modu
    TXSTA1bits.TXEN = 1;        // zapnuti TX
    RCSTA1bits.CREN = 1;        // zapnuti RX 
}

void putch(char data);
void SPIWrite(uint8_t channel ,uint8_t data);

void main(void) {
    init(); // provedeni inicializace
    ADCON0bits.CHS = 13;                 // kanal AN13
    unsigned char i=0;
    
    /* hlavni smycka */
    while(1){
        SPIWrite(DAC_CH1, i++);                 // nastaveni DAC 
        GODONE = 1;                             // spustit aproximaci
        while(GODONE);                          // cekam nez je hotovo
        printf("%d,\r",ADRESH);
 
        __delay_ms(10);
    }
}
/* funkce zapisu SPI funkce zapisuje dva bajty za sebou */
void SPIWrite(uint8_t channel ,uint8_t data){
    
    uint8_t msb, lsb, flush;
    msb = (channel | (data>>4));        // prvni bajt
    lsb = (data<<4) & 0xF0;             // druhy bajt
    DAC_SS = 0;                         // slave select
    PIR1bits.SSPIF = 0;                 // vynulovani priznaku SPI
    SSPBUF = msb;                       // zapis do bufferu
    while(PIR1bits.SSPIF == 0)NOP();    // pockat nez SPI posle prvni bajt
    
    PIR1bits.SSPIF = 0;                 // vynulovani priznaku SPI
    SSPBUF = lsb;                       // zapis do bufferu
    while(PIR1bits.SSPIF == 0)NOP();    // pockat nez SPI posle druhy bajt
    
    DAC_SS = 1;                         // vypnout slave select
    flush = SSPBUF;                     // vycteni bufferu
    
}

void putch(char data){
    while(!TX1IF);
    TXREG1 = data;
}

```
## Hodnotu na DAC přečteme pomocí ADC na volných pinech REVkitu můžeme použít AN13 a AN12.
<p align="center">
  <img width="600" height="250" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/foto.jpg">
</p>

## Přečtenou hodnotu pošleme přes UART a zobrazíme v seriovém osciloskopu.
[Serial scope](https://x-io.co.uk/serial-oscilloscope/)

<p align="center">
  <img width="800" height="520" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/osciloscope.png">
</p>

## Generování funkcí:
V tomto příkladu uvidíte generování pily a sinusovky na osciloskopu. Bude Vám to tedy prezentovat cvičící. Všimněte si, že hodnoty sin() máme uložené v tabulce s klíčovým slovem const, bude tedy umístěna do flash, protože se již během programu nemění. Pokud bychom využili lineární interpolace, bylo by možné ukládat menší množství hodnot funkce sinus.

<p align="center">
  <img width="420" height="300" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/Osci.PNG">
</p>

## Přiklad 10.2:
- V tomto případě je třeba osciloskop

```c
// DAC
#pragma config FOSC =   HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON            // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF            // Watchdog Timer Enable bits (WDT is always enabled. SWDTEN bit has no effect)

#include <stdint.h>
#include <xc.h>

#define _XTAL_FREQ 32E6         // definice fosc pro knihovnu
#define DAC_SS LATB3            // DAC slave select pin
#define DAC_CH1 0b00110000      // kanal 1/B
#define DAC_CH2 0b10110000      // kanal 2/A
#define LED LATDbits.LATD2      // ledka

    // <editor-fold defaultstate="collapsed" desc="SINTABLE">
    const unsigned char tabulka[128] = 
    {
        0x80,0x86,0x8c,0x92,0x98,0x9e,0xa5,0xaa,0xb0,0xb6,0xbc,0xc1,0xc6,0xcb,0xd0,0xd5,
        0xda,0xde,0xe2,0xe6,0xea,0xed,0xf0,0xf3,0xf5,0xf8,0xfa,0xfb,0xfd,0xfe,0xfe,0xff,
        0xff,0xff,0xfe,0xfe,0xfd,0xfb,0xfa,0xf8,0xf5,0xf3,0xf0,0xed,0xea,0xe6,0xe2,0xde,
        0xda,0xd5,0xd0,0xcb,0xc6,0xc1,0xbc,0xb6,0xb0,0xaa,0xa5,0x9e,0x98,0x92,0x8c,0x86,
        0x80,0x79,0x73,0x6d,0x67,0x61,0x5a,0x55,0x4f,0x49,0x43,0x3e,0x39,0x34,0x2f,0x2a,
        0x25,0x21,0x1d,0x19,0x15,0x12,0xf,0xc,0xa,0x7,0x5,0x4,0x2,0x1,0x1,0x0,
        0x0,0x0,0x1,0x1,0x2,0x4,0x5,0x7,0xa,0xc,0xf,0x12,0x15,0x19,0x1d,0x21,
        0x25,0x2a,0x2f,0x34,0x39,0x3e,0x43,0x49,0x4f,0x55,0x5a,0x61,0x67,0x6d,0x73,0x79,
    };
    // </editor-fold>


void init(void){
    
    /* vyber pinu jako vystupy */
    TRISCbits.TRISC3 = 0;
    TRISCbits.TRISC5 = 0;
    TRISBbits.TRISB3 = 0;
    TRISDbits.TRISD2 = 0;
 
    LATBbits.LATB3 = 1;         // DAC SS off
    
    SSP1CON1bits.SSPM = 0b0010; // SPI clock
    SSP1STATbits.CKE = 1;
    SSP1CON1bits.SSPEN = 1;     // SPI zapnuto
}
void SPIWrite(uint8_t channel ,uint8_t data);

void main(void) {
    init(); // provedeni inicializace
    LED = 0;
    uint8_t i = 0;
    uint8_t  j = 0;
         
    /* hlavni smycka */
    while(1){

            SPIWrite(DAC_CH1,i++);  
            SPIWrite(DAC_CH2,tabulka[j++]);
            if(j == 128) j=0;
        }
}
/* funkce zapisu SPI funkce zapisuje dva bajty za sebou */
void SPIWrite(uint8_t channel ,uint8_t data){
    
    uint8_t msb, lsb, flush;
    msb = (channel | (data>>4));        // prvni bajt
    lsb = (data<<4) & 0xFF;             // druhy bajt
    DAC_SS = 0;                         // slave select
    PIR1bits.SSPIF = 0;                 // vynulovani priznaku SPI
    SSPBUF = msb;                       // zapis do bufferu
    while(PIR1bits.SSPIF == 0)NOP();    // pockat nez SPI posle prvni bajt
    
    PIR1bits.SSPIF = 0;                 // vynulovani priznaku SPI
    SSPBUF = lsb;                       // zapis do bufferu
    while(PIR1bits.SSPIF == 0)NOP();    // pockat nez SPI posle druhy bajt
    
    DAC_SS = 1;                         // vypnout slave select
    flush = SSPBUF;                     // vycteni bufferu
    
}
```

### Zadání:

  1) Generujte trojúhelníkový signál namísto pily z příkladu 1. 
  2) Kopírujte na DAC hodnotu z potenciometrů. Máte dva potenciometry a dva kanály DAC.
  3) Přepínejte pila/trojúhleník/potenciometr tlačítkem.
  4) Zkuste sinusovku i v Serial oscilloscopu.
  5) Vygenerujte PWM a střídu ovládejte potenciometrem. Použijte s filtrem.
