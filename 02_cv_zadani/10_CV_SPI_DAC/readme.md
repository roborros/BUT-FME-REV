# REV - Desáté cvičení
- SPI a DAC

## SPI:
SPI je základní rozhraní MCU pro komunikaci s obvody např. ADC, DAC, externí paměti apod. Jedná se o poměrně jednoduché rozhraní, které je synchronni master/slave. Obsahuje 3 komunikační vodiče clock, dataout a datain. K určení s kterým zařízením probíhá komunikace je zde další vodič pro každé zařízení. Nevýhodou pak může být velký počet vodičů a to, že veškerou komunikaci musí řídit master a také nemohou komunikovat obvody mezi sebou. Výhodou je jednoduchost a rychlost, která je běžně v  řádu MHz.  

## 
<p align="center">
  <img width="500" height="350" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/SPIsync.png">
</p>

V našem datasheetu k MCU máme SPI periferii dobře popsanou. Poměrně důležité je pochopit různé mody SPI, které jsou 4. 
## MODY:
<p align="center">
  <img width="250" height="200" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/mody.png">
</p>

## DAC MCP 4802:
<p align="center">
  <img width="250" height="200" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/mody.png">
</p>

### Konfigurace:

    - #pragma config WDTEN = ON
    - #pragma config WDTPS = 256 (hodnota je dělička jako u timeru)


## Přiklad 10.1:
Program demostruje využití WDT. Funkce trap() schválně obsahuje nekonečnou smyčku, kde přeteče WDT a resetuje MCU. BIT RCONbits.TO pak mohu používat k detekci, že nastal reset. V příkladu nám to oznámí zablikáním poslední LED.
```c
// DAC
#pragma config FOSC =   HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON         // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF           // Watchdog Timer Enable bits (WDT is always enabled. SWDTEN bit has no effect)

#include <stdio.h>
#include <xc.h>

#define _XTAL_FREQ 32E6         // definice fosc pro knihovnu
#define DAC_SS LATB3            // DAC slave select pin
#define DAC_CH1 0b1011          // kanal A
#define DAC_CH2 0b0011          // kanal B
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


void SPIWrite(char chanel ,char data);

void main(void) {
    init(); // provedeni inicializace
    ADCON0bits.CHS = 13;                 // kanal AN13
    unsigned char i=0;
    
    /* hlavni smycka */
    while(1){
        SPIWrite(DAC_CH1, i++);                 //  nastaveni DAC 
        GODONE = 1;                             // spustit aproximaci
        while(GODONE);                          // cekam nez je hotovo
        TXREG = ADRESH;                         // poslu data
        __delay_ms(10);
    }
}
/* funkce zapisu SPI funkce zapisuje dva bajty za sebou */
void SPIWrite(char channel, char data){
    
    unsigned char msb, lsb, flush;
    msb = (channel<<4) | (data>>4);     // prvni bajt
    lsb = (data<<4);                    // druhy bajt
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

<p align="center">
  <img width="800" height="520" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/10_CV_SPI_DAC/Visual.png">
</p>

## Generování funkcí:

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

#include <xc.h>

#define _XTAL_FREQ 32E6         // definice fosc pro knihovnu
#define DAC_SS LATB3            // DAC slave select pin
#define DAC_CH1 0b1001          // kanal A
#define DAC_CH2 0b0001          // kanal B
#define LED LATDbits.LATD2      // ledka


void init(void){
    
    /* vyber pinu jako vystupy */
    TRISCbits.TRISC3 = 0;
    TRISCbits.TRISC5 = 0;
    TRISBbits.TRISB3 = 0;
    TRISDbits.TRISD2 = 0;
 
    LATBbits.LATB3 = 1;         // DAC SS off
    
    SSP1CON1bits.SSPM = 0b0010; // SPI clock
    SSP1CON1bits.SSPEN = 1;     // SPI zapnuto
}
void SPIWrite(char chanel ,char data);

void main(void) {
    init(); // provedeni inicializace
    LED = 0;
    unsigned int i = 0;
    unsigned int j = 0;
    
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
    
    /* hlavni smycka */
    while(1){

            SPIWrite(DAC_CH1,i++);  
            SPIWrite(DAC_CH2,tabulka[j++]);
            if(j == 128) j=0;
        }
}
/* funkce zapisu SPI funkce zapisuje dva bajty za sebou */
void SPIWrite(char channel, char data){
    
    unsigned char msb, lsb, flush;
    msb = (channel<<4) | (data>>4);     // prvni bajt
    lsb = (data<<4);                    // druhy bajt
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

  1) Nakonfigurujte deep sleep a probouzejte MCU cca jednou za 1s. Po probuzení odešlete hodnotu POT2 přes UART do PC. 

  2) Nakonfugurujte komunikaci s PC. Pokud nepříjde déle než 30s specifická zpráva (kterou si zvolte), tak dojde k SW resetu. Po resetu zobrazte na displeji, že zpráva nedošla.
  3) Provozujte kontroler v IDLE módu. Kontrolér hned po inicilizaci uspěte a komunikujte přes uart. Tedy příchod zprávy MCU probudí. Zpráva se odešle zpět (ECHO) a MCU zase usne.
