# REV - Šesté cvičení
- UART + STDIO

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
    TRISCbits.TRISC6 = 0;   // TX pin jako vystup
    TRISCbits.TRISC7 = 1;   // rx pin jako vstup
    
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 1
    RCSTA1bits.SPEN = 1;      // zapnuti UART
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
#include <stdio.h>              // pro printf

#define _XTAL_FREQ 32E6

void __interrupt() RC_ISR_HANDLER(){
    
    if(RC1IF && RC1IE){
        TXREG1 = RCREG1;
        RC1IF = 0;
    }
}

/*--------main--------*/
int main(void) {
    
    ANSELC = 0x00;          // vypnuti analogovych funkci na PORTC
    TRISD = 0x00;           // PORTD jako vystup
    TRISCbits.TRISC6 = 0;   // TX pin jako vystup
    TRISCbits.TRISC7 = 1;   // rx pin jako vstup
   
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 1
    
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
    
    RC1IE = 1;                // zap  preruseni od RCREG
    PEIE = 1;                // preruseni od periferii
    RC1IF = 0;                // nastavim priznak (pro jistotu)
    GIE = 1;                 // globalni preruseni
    
    while(1){
            //nic
    }
}
```
## Příklad 6.3:
```c
// uart
#pragma config FOSC = HSMP      // Externi oscilator
#pragma config PLLCFG = ON      // 4X PLL 
#pragma config FCMEN = ON       // Fail-Safe Clock 
#pragma config WDTEN = OFF      // Watchdog Timer OFF

#include <xc.h>             //-- pro prekladac XC8
#include <stdio.h>          //   pro printf

#define _XTAL_FREQ 32E6

void putch(unsigned char data);

/*--------main--------*/
int main(void) {
    
    ANSELC = 0x00;          // vypnuti analogovych funkci na PORTC
    TRISD = 0x00;           // PORTD jako vystup
    TRISCbits.TRISC6 = 0;   // TX pin jako vystup
    TRISCbits.TRISC7 = 1;   // rx pin jako vstup
   
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 11
    
    RCSTAbits.SPEN = 1;      // zapnuti UART
    TXSTAbits.TXEN = 1;      // zapnuti TX
    RCSTAbits.CREN = 1;      // zapnuti RX 
    
    
    while(1){
        __delay_ms(500);
        printf("ahoj");
    }
}

void putch(unsigned char data){
    while(!TXIF);
    TXREG1 = data;
}
```
### Zadání:

 1) Nahrejte a rozchodte ukazky 1 a 2.

 2) Vytvorte sadu funkci, ktera vytvori vrstvu pro znakovy vstup/vystup. Osetrete cekani na plny buffer a pripadne overrun 
 chyby. 
 
 ```c
int UART_GetChar();             // nacte jeden znak
void UART_PutChar(int c);       // vypise jeden znak
int UART_CharAvailable();       // vrati nenulovou hodnotu prave kdyz je alespon jeden znak k dispozici pro cteni
void UART_PutStr(char * str);   // vypise retezec az do nuloveho znaku
 ```
3) Vytvorte funkci int UART_Init(), do ktere presunte inicializacni kod. Spolecne s funkcemi z c) vytvorte knihovnu “UartIO.c” a k ni prislusny hlavickovy soubor “UartIO.h”

4) Vytvořte program, který bude načítat znaky z UARTU a ukládat je do pole tak dlouho, než načte znak '.'. Poté znaky pošle v opačném pořadí po UARTu zpět. Využijte funkce z předchozí úlohy.

5) Upravte program d) tak, aby znaky načítal a vysílal pomocí přerušení.

```
v přerušení nepoužívejte busy waiting; tzn. buď upravte funkce v UartIO tak, aby místo čekání vracely chybovou návratovou hodnotu, nebo je nepoužívejte
nezapomeňte na modifikátor volatile
```

6) Vytvořte funkce getch() a putch(), které budou realizovat standardní vstup a výstup přes UART. Funkce zaradte do knihovny UartIO.c. Vytvořte testovací program, který bude na terminál periodicky vypisovat (pomocí funkce printf()) čas od posledního restartu (v sekundách či jiných zvolených jednotkách).
