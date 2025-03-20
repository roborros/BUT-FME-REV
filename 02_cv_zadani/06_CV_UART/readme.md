# REV - Šesté cvičení
- UART + STDIO
[Link na video-návod](https://youtu.be/h85Gad3aX6E)

## POZOR je zadán úkol!!

UART (Universal asynchronous receiver-transmitter) je jedna z komunikačních sběrnic. Na EduKitu je spojena s převodníkem FTDI, který zajišťuje převod na USB. To, že je sběrnice asynchronní znamená, že není přitomno propojení k synchronizaci např společný clock signál. Periferie odesílá jeden bajt, který je uveden start a ukončen stop bitem. Jak je patrné na následujícím obrázku jedná se o dvojici linek, které odesílají TX a příjmají RX zprávu. Při konfiguraci je třeba nastavit rychlost přenosu v Baudech. Jedná se o jednotku modulační rychlosti viz. wiki...
## Registry UART:
- RCSTAx
- TXSTAx
- SPBRGx

<p align="center">
  <img width="307" height="120" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/06_CV_UART/UartSchema.png">
</p>

## Příklad 6.1:
- příjem a odeslání znaku
```c
// uart
#pragma config FOSC = HSMP      // Externi oscilator
#pragma config PLLCFG = ON      // 4X PLL 
#pragma config FCMEN = ON       // Fail-Safe Clock 
#pragma config WDTEN = OFF      // Watchdog Timer OFF

#include <xc.h>             //-- pro prekladac XC8
/*--------main--------*/
int main(void) {
    
    ANSELC = 0x00;          // vypnuti analogovych funkci na PORTC
    TRISD = 0x00;           // PORTD jako vystup
    TRISCbits.TRISC6 = 1;   // TX pin jako vstup
    TRISCbits.TRISC7 = 1;   // RX pin jako vstup
    
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 1
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 

    while(1){
        if (RC1IF){
            LATD2 ^= 1;     // LED 
            TXREG1 = RCREG1;      // precist a poslad zpet
        }
    }
}
```

## Příklad 6.2:
- vyvolání přerušení na  příchod znaku
```c
// uart
#pragma config FOSC = HSMP      // Externi oscilator
#pragma config PLLCFG = ON      // 4X PLL 
#pragma config FCMEN = ON       // Fail-Safe Clock 
#pragma config WDTEN = OFF      // Watchdog Timer OFF

#include <xc.h>                 // pro prekladac XC8

#define _XTAL_FREQ 32E6

void __interrupt() RC_ISR_HANDLER(){
    
    if(RC1IF && RC1IE){
        TXREG1 = RCREG1;        
    }
}

/*--------main--------*/
int main(void) {
    
    ANSELC = 0x00;          // vypnuti analogovych funkci na PORTC
    TRISD = 0x00;           // PORTD jako vystup
    TRISCbits.TRISC6 = 1;   // TX pin jako vstup
    TRISCbits.TRISC7 = 1;   // rx pin jako vstup
   
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 1
    
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
    
    RC1IE = 1;                // zap  preruseni od RCREG
    PEIE = 1;                // preruseni od periferii    
    GIE = 1;                 // globalni preruseni
    
    while(1){
            //nic
    }
}
```
## Příklad 6.3:
- mailbox 

<p align="center">
  <img width="400" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/06_CV_UART/mailbox.png">
</p>

```c
// uart
#pragma config FOSC = HSMP      // Externi oscilator
#pragma config PLLCFG = ON      // 4X PLL 
#pragma config FCMEN = ON       // Fail-Safe Clock 
#pragma config WDTEN = OFF      // Watchdog Timer OFF

#include <xc.h>             //-- pro prekladac XC8

#define _XTAL_FREQ 32E6

typedef struct
{
    char data;
    char full;
} mailbox;

volatile mailbox g_mail = {0,0};

void __interrupt() ISR(void)
{
    if(RC1IF & RC1IE)
    {
        g_mail.data = RC1REG;
        g_mail.full = 1;        
    }
}

void main(void)
{ 
    ANSELC = 0x00;          // vypnuti analogovych funkci na PORTC
    TRISD = 0x00;           // PORTD jako vystup
    TRISCbits.TRISC6 = 1;   // TX pin jako vstup
    TRISCbits.TRISC7 = 1;   // rx pin jako vstup
   
    /*baudrate*/
    SPBRG1 = 51;            // (32_000_000 / (64 * 9600)) - 1
    
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    RCSTA1bits.SPEN = 1;    // zapnuti UART
    TXSTA1bits.TXEN = 1;    // zapnuti TX
    RCSTA1bits.CREN = 1;    // zapnuti RX 
    
    RC1IE = 1;              // zap  preruseni od RCREG
    PEIE = 1;               // preruseni od periferii    
    GIE = 1;                // globalni preruseni
    
    while(1)
    {
        if(g_mail.full)
        {
            while(!TX1IF);
            TXREG = g_mail.data;
            g_mail.full = 0;
        }
    }
}
```
## Příklad 6.4:
- STDIO

```c
// uart
#pragma config FOSC = HSMP      // Externi oscilator
#pragma config PLLCFG = ON      // 4X PLL 
#pragma config FCMEN = ON       // Fail-Safe Clock 
#pragma config WDTEN = OFF      // Watchdog Timer OFF

#include <xc.h>             //-- pro prekladac XC8
#include <stdio.h>          //   pro printf

#define _XTAL_FREQ 32E6

void putch(char data);

/*--------main--------*/
int main(void) {
    
    ANSELC = 0x00;          // vypnuti analogovych funkci na PORTC
    TRISD = 0x00;           // PORTD jako vystup
    TRISCbits.TRISC6 = 1;   // TX pin jako vstup
    TRISCbits.TRISC7 = 1;   // rx pin jako vstup
   
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 1
    
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
    
    
    while(1){
        __delay_ms(500);
        printf("ahoj\n");
    }
}

void putch(char data){
    while(!TX1IF);
    TXREG1 = data;
}
```

### Zadání:

 1) Nahrejte a rozchodte ukazky 6.1 až 6.4.

 2) Vytvořte sadu funkcí, která vytvoří vrstvu pro znakový vstup/vystup. Ošetřete čekání na plný buffer a případné overrun 
 chyby. 
 
 ```c
int UART_GetChar();             // nacte jeden znak
void UART_PutChar(int c);       // vypise jeden znak
int UART_CharAvailable();       // vrati nenulovou hodnotu prave kdyz je alespon jeden znak k dispozici pro cteni
void UART_PutStr(char * str);   // vypise retezec az do nuloveho znaku
 ```
3) Vytvořte funkci int UART_Init(), do které přesunte inicializační kód. Společně s funkcemi z 2. vytvořte knihovnu “UartIO.c” a k ní příslušný hlavičkový soubor “UartIO.h”

4) Vytvořte program, který bude načítat znaky z UARTU a ukládat je do pole tak dlouho, než načte znak '.'. Poté znaky pošle v opačném pořadí po UARTu zpět. Využijte funkce z předchozí úlohy.

5) Upravte program tak, aby znaky načítal a vysílal pomocí přerušení.

```
Tip:
v přerušení nepoužívejte busy waiting; tzn. buď upravte funkce v UartIO tak, aby místo čekání vracely chybovou návratovou hodnotu, nebo je nepoužívejte
nezapomeňte na modifikátor volatile
```

6) Vytvořte funkce getch() a putch(), které budou realizovat standardní vstup a výstup přes UART. Funkce zaradte do knihovny UartIO.c. Vytvořte testovací program, který bude na terminál periodicky vypisovat (pomocí funkce printf()) čas od posledního restartu (v sekundách či jiných zvolených jednotkách).
