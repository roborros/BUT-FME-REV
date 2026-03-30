## 6 - 2. Vytvořte funkci pro odeslání řetězce až do nulového znaku.
```c
#define BUFFER 100 //maximálni delka řetezce
...
...
void uart_write_str(uint8_t *s)
{
    uint8_t i = 0;
    while((*(s+i)!=0)&&(i<BUFFER)) // odešle se do nulového znaku, nebo délky BUFFER
    {
        uart_transmit(*(s+i));
        i++;
    }
}
...
...
    char retez[BUFFER] = "Ahoj!\n";
    uart_write_str(retez);
```

## 6 - 3. Z ukázek a řešení druhé úlohy vytvořte knihovnu “Uart.c” a k ní příslušný hlavičkový soubor “Uart.h”. Přesuňte do ní funkce k uartu. (Inicializace, příjem/odeslání znaku, odeslání řetězce)
```c
// Uart.h
void uart_transmit(uint8_t data);
uint8_t uart_receive(void);
void uart_write_str(uint8_t *s);
void uart_init(uint32_t f_cpu, uint32_t baud);
```
```c
// Uart.c
#include <xc.h> // include processor files - each processor file is guarded.  

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

void uart_write_str(uint8_t *s) 
{
    uint8_t i = 0;
    while((*(s+i)!=0)) //BUFFER definován pouze v main
    {
        uart_transmit(*(s+i));
        i++;
    }
}

void uart_init(uint32_t f_cpu, uint32_t baud)
{
    // nastaveni pinu TX RX
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;

    // baudrate str. 380
    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);\
    // zapnuti TX a RX        
    USART3.CTRLB |= USART_TXEN_bm | USART_RXEN_bm;
    // zapnuti RX interrupt
    USART3.CTRLA = USART_RXCIE_bm;
}
```

## 6 - 4. Vytvořte program, který bude načítat znaky z UARTU (pomocí přerušení) a ukládat je do pole tak dlouho, než načte znak '\n' (LF). Poté znaky pošle v opačném pořadí po UARTu zpět.
```c
volatile uint8_t *buffer_pos;
volatile uint8_t status = 0;


ISR(USART3_RXC_vect)
{   
    static uint8_t poss = 0;
    *(buffer_pos+poss) = USART3.RXDATAL;
    if(*(buffer_pos+poss)=='\n')
    {
        poss = 0;
        status = 1;
    }
    else
    {
        poss++;
    }
   
}

int main(void) {
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    _delay_ms(10);   // počkej na ustálení
    uart_init(F_CPU, BAUDRATE);

    sei();
    _delay_ms(10);
    uart_transmit('\n'); // LF
    
    uint8_t buffer[BUFFER];
    buffer_pos = buffer;

    
    while (1)
    {
        if(status)
        {
            char i;
            for(i=BUFFER;i>0;i--)
            {
                if(buffer[i-1]!=0)
                    uart_transmit(*(buffer_pos+i-1));
                *(buffer_pos+i-1) = 0;
            }
            status = 0;
            uart_transmit('\n');
            
        }
    }
}
```

## 6 - 5. Vytvořte program, který pomocí zpráv z PC bude ovládat LED diodu. ON - zapne, OFF - vypne. Využíjte výsledek z minulé úlohy. (využíjte funkce z knihovny string.h)
```c
...
    PORTB.DIRSET = PIN3_bm;
    
    while (1)
    {
        if(status)
        {
            if((strncmp(buffer,"ON",2))==0)
                PORTB.OUTCLR = PIN3_bm;
            else if((strncmp(buffer,"OFF",3))==0)
                PORTB.OUTSET = PIN3_bm;
            memset(buffer, 0, 4); // smazání staré zprávy
            status = 0;
        }
```

## 6 - 6. Příjmutý řetězec vypište na displej. V pořadí první na první řádek, druhá zpráva na druhý a třetí zase na první atd. Základní práci s displejem projdeme na cvičení.
```c
    #include "lcd.h"
    ...
    ...
    uint8_t line = 0;
    LCD_Init();
    ...
    ...
    if(line==0)
            {
                LCD_Print(LCD_LINE1, buffer);

            }
            else
            {
                LCD_Print(LCD_LINE2, buffer);
            }
    line = ~line;
```
