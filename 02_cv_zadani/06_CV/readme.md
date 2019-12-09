# REV - První cvičení
- UART + STDIO

## Ukázka 1:

```c
/*
 * File:   03.01-UART_basic/main.c
 * Author: res, mat
 */
 
/* fuses */
#pragma config WDTEN = OFF      // Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
#pragma config FOSC = INTIO7    // Oscillator Selection bits 
#pragma config MCLRE = EXTMCLR  // reset function
#pragma config FCMEN = ON
 
 
// device include
#include <xc.h>             //-- pro prekladac XC8
 
 
/* local defines */
 
#define DELAY 0x3000
 
/*
 *  main()
 */
int main(void) {
 
    // configure oscillator
    OSCCON = (OSCCON & 0b10001111) | 0b01110000;    // internal oscillator at full speed (16 MHz)
 
    /* init - tristate */
    ANSELA = 0;
    TRISC = 0b00000001; // RC0 BTN1, RC4 LED
    ANSELC = 0;
    TRISD = 0b10000011; // LEDs: 2..6 out
    ANSELD = 0;
 
    /* init - timer1 */
    T1CONbits.T1CKPS = 0b11;    // TMR1 prescaler
    T1CONbits.TMR1ON = 1;       // TMR1 on
 
    /*
    ---- UART1  9600 8n1 (8bits, no parity, 1stop-bit)
    */
 
    TRISCbits.TRISC6 = 0;   // uart TX as output
 
    SPBRG = 25;     // (16_000_000 / (64 * 9600)) - 1
 
    // final enable
    RCSTAbits.SPEN = 1;      // enable UART peripheral
    TXSTAbits.TXEN = 1;      // enable TX
 
    /* main program */
    // put ones to LATC+LATD ~all LEDs
    LATC = 0xff;
    LATD = 0xff;
 
    unsigned char i = 0;
 
    /* main loop */
    while(1){
        while (TMR1 < DELAY);       // busy waiting for TMR1
 
        LATD2 = ~LATD2;
        TMR1 = 0;
 
        TXREG = '0' + i;          // char '0' + index
        i = (i == 9 ? 0 : i + 1);     // cycle 0...9
    }// end of main loop
}
```

## Ukázka 2:

* Další důležitou strukturou jsou cykly. Příklad využití cyklu while: 
```c
/*
 * File:   03.02-UART_echo/main.c
 * Author: res, mat
 */
 
 
/* fuses */
#pragma config WDTEN = OFF      // Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
#pragma config FOSC = INTIO7    // Oscillator Selection bits 
#pragma config MCLRE = EXTMCLR  // reset function
#pragma config FCMEN = ON
 
 
// device include
#include <xc.h>             //-- pro prekladac XC8
 
 
/*
 *  main()
 */
int main(void) {
 
    // configure oscillator
    OSCCON = (OSCCON & 0b10001111) | 0b01110000;    // internal oscillator at full speed (16 MHz)
 
    /* init - tristate */
    ANSELA = 0;
    TRISC = 0b00000001; // RC0 BTN1, RC4 LED
    ANSELC = 0;
    TRISD = 0b10000011; // LEDs: 2..6 out
    ANSELD = 0;
 
 
    /*
    ---- UART1  9600 8n1 (8bits, no parity, 1stop-bit)
    */
 
    TRISCbits.TRISC6 = 0;   // uart TX as output
    TRISCbits.TRISC7 = 1;   // uart RX as output
 
    SPBRG = 25;     // (16_000_000 / (64 * 9600)) - 1
 
    // final enable
    RCSTAbits.SPEN = 1;      // enable UART peripheral
    TXSTAbits.TXEN = 1;      // enable TX
    RCSTAbits.CREN = 1;      // enable RX (aka Continuous receive)
 
    /* main program */
    // put ones to LATC+LATD ~all LEDs
    LATC = 0xff;
    LATD = 0xff;
 
    /* main loop */
    while(1){
        while(!PIR1bits.RCIF);  // waiting for data available flag
        LATB0 = ~LATB0;         // LED signal
        TXREG = RCREG;          // read byte and send it back
    }// end of main loop
}
```
## Ukázka 3:
```c
/*
 * File:   03.05-UART_int_basic/main.c
 * Author: res, mat
 */
 
 
/* fuses */
#pragma config WDTEN = OFF      // Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
#pragma config FOSC = INTIO7    // Oscillator Selection bits 
#pragma config MCLRE = EXTMCLR  // reset function
#pragma config FCMEN = ON
 
 
// device include
#include <xc.h>             //-- pro prekladac XC8
 
/* interrupt handler - UART reception */
void __interrupt() handle(void){
 
    // check both interrupt enable & interrupt flag
    if (PIE1bits.RC1IE && PIR1bits.RCIF){
        TXREG = RCREG; // Transmit back one character
        LATD2 = ~LATD2;
        PIR1bits.RCIF = 0;
    }
 
    return;
}
 
/*
 *  main()
 */
int main(void) {
 
    // configure oscillator
    OSCCON = (OSCCON & 0b10001111) | 0b01110000;    // internal oscillator at full speed (16 MHz)
 
    /* init - tristate */
    ANSELA = 0;
    TRISC = 0b00000001; // RC0 BTN1, RC4 LED
    ANSELC = 0;
    TRISD = 0b10000011; // LEDs: 2..6 out
    ANSELD = 0;
 
 
    /*
    ---- UART1  9600 8n1 (8bits, no parity, 1stop-bit)
    */
 
    TRISCbits.TRISC6 = 0;   // uart TX as output
    TRISCbits.TRISC7 = 1;   // uart RX as output
 
    SPBRG = 25;     // (16_000_000 / (64 * 9600)) - 1
 
    // interrupt enables
    RCIE = 1;           //RX interrupt enable
    PEIE = 1;           // global interrupt enable
    GIE = 1;            // peripheral interrupt enable
 
    // final enable
    RCSTAbits.SPEN = 1;      // enable UART peripheral
    TXSTAbits.TXEN = 1;      // enable TX
    RCSTAbits.CREN = 1;      // enable RX (aka Continuous receive)
 
 
    /* main program */
    // put ones to LATC+LATD ~all LEDs
    LATC = 0xff;
    LATD = 0xff;
 
    /* main loop */
    while(1){
        // do nothing
    }// end of main loop
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

Inspirujte se Ukázkou 3, dílčí informace pro přerušení naleznete v datasheetu.
v přerušení nepoužívejte busy waiting; tzn. buď upravte funkce v UartIO tak, aby místo čekání vracely chybovou návratovou hodnotu, nebo je nepoužívejte
nezapomeňte na modifikátor volatile

6) Vytvořte funkce getch() a putch(), které budou realizovat standardní vstup a výstup přes UART. Funkce zaradte do knihovny UartIO.c. Vytvořte testovací program, který bude na terminál periodicky vypisovat (pomocí funkce printf()) čas od posledního restartu (v sekundách či jiných zvolených jednotkách).
