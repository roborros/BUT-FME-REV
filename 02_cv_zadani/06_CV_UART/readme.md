# 🚀 REV - Šesté cvičení - UART

UART (Universal asynchronous receiver-transmitter) je jedna z komunikačních sběrnic. Na EduKitu je spojena s převodníkem FTDI, který zajišťuje převod na USB. To, že je sběrnice asynchronní znamená, že není použit s\nchronizační sygnál např. společný clock. Periferie odesílá jeden bajt, který je uveden start a ukončen stop bitem. Jak je patrné na následujícím obrázku jedná se o dvojici linek, které odesílají TX a příjmají RX zprávu. Při konfiguraci je třeba nastavit rychlost přenosu v Baudech. Jedná se o jednotku modulační rychlosti.

<p align="center">
  <img width="307" height="120" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/06_CV_UART/UartSchema.png">
</p>



## 🏗️  Příklad 6.1:

- příjem a odeslání znaku
  
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

void uart_transmit(uint8_t data) {
    // cekam na misto v tx bufferu
    while (!(USART3.STATUS & USART_DREIF_bm));
    USART3.TXDATAL = data;
}

uint8_t uart_receive(void) {
    // cekam na priznak ze RX buffer ma data
    while (!(USART3.STATUS & USART_RXCIF_bm));
    return USART3.RXDATAL;
}

int main(void) {
    
    // osci na 24MHz
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    // nastaveni uartu ve fci
    uart_init(F_CPU, BAUDRATE);
           
    while (1)
    {
    
        // Echo:
        uint8_t received_byte = uart_receive();
        uart_transmit(received_byte);

    }
}
```
##  🏗️ Příklad 6.2:
- vyvolání přerušení na  příchod znaku
```c
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <string.h>

#define F_CPU 24000000UL
#include <util/delay.h>

#define BAUDRATE 115200UL

ISR(USART3_RXC_vect)
{   
    uint8_t received_char = USART3.RXDATAL;
    
    while (!(USART3.STATUS & USART_DREIF_bm));
    USART3.TXDATAL = received_char;
   
}

void uart_init(uint32_t f_cpu, uint32_t baud)
{
    
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   

    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);        
    USART3.CTRLB |= USART_TXEN_bm | USART_RXEN_bm;
    
    USART3.CTRLA = USART_RXCIE_bm;
}

int main(void) {
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    uart_init(F_CPU, BAUDRATE);

    sei();
    
    while (1)
    {

    }
}
```

## 📝 Zadání:

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
