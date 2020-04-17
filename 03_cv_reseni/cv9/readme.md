## 1. Nakonfigurujte deep sleep a probouzejte MCU cca jednou za 1s. Po probuzení odešlete hodnotu POT2 přes UART do PC.

```c
// REV PWM
#pragma config FOSC =       HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG =     ON          // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN =   ON          // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN =      ON         // watchdog off
#pragma config WDTPS =      256
 
#include <xc.h>
#include <stdint.h>
#include <stdio.h>

#define _XTAL_FREQ 32E6

void putch(unsigned char data);

void main(void) {    
    //GPIO
    TRISD = 0b10000011;     // LEDs: 2..6 out
    TRISC = 0b11101111;     // RC0 BTN1, RC4 LED
    ANSELC = 0;
    ANSELD = 0;
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    IDLEN = 0;
        
    // ADC pro potenciometr
    ANSELE = 0b1;                   //AN5
    ADCON2bits.ADFM = 1;            //right justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //16
    ADCON0bits.ADON = 1;            //ADC zapnout
    ADCON0bits.CHS = 5;             // kanal AN5
    
    // UART
    TRISCbits.TRISC6 = 1;   // TX pin jako vstup
    TRISCbits.TRISC7 = 1;   // rx pin jako vstup
   
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 1
    
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
    
    uint16_t pot_val;
    
    while (1){         
        GODONE = 1;                 // spustim konverzi
        while(GODONE){};            // cekam na konverzi
        pot_val = (ADRESH << 8) | ADRESL;
        printf("%u\n", pot_val);
        LATD2 ^= 1;
        __delay_ms(1);
        __asm("SLEEP"); 
   }
}

void putch(unsigned char data){
    while(!TX1IF);
    TXREG1 = data;
}
```

## 2. Nakonfugurujte komunikaci s PC. Pokud nepříjde déle než 30s specifická zpráva (kterou si zvolte), tak dojde k SW resetu. Po resetu zobrazte na displeji, že zpráva nedošla.

```c
// REV PWM
#pragma config FOSC =       HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG =     OFF          // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN =   ON          // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN =      OFF
 
#include <xc.h>
#include <stdint.h>
#include <stdio.h>
#include "lcd.h"

#define _XTAL_FREQ 8E6
#define DELAY 0xFFFF - 250

volatile uint8_t timer_flag = 0;
volatile uint16_t i = 0;

void __interrupt() ISR() {    
    if (TMR1IE & TMR1IF) {
        i++;
        TMR1 = DELAY;
        if (i == 30000) {
            i = 0;
            timer_flag = 1;
        }
        TMR1IF = 0;
    }
}

void main(void) {  
    LCD_Init();
    
    //GPIO
    TRISD = 0b10000011;     // LEDs: 2..6 out
    TRISC = 0b11101111;     // RC0 BTN1, RC4 LED
    ANSELC = 0;
    ANSELD = 0;
    
    // Zhasnu ledky
    LATD2 = 1;
    LATD3 = 1;
    LATC4 = 1;
    LATD4 = 1;
    LATD5 = 1;
    LATD6 = 1;
    
    //Timer1
    T1CONbits.TMR1CS = 0b00;  // Fosc/4
    T1CONbits.T1CKPS = 0b11;  // 1:8
    TMR1IE = 1;
    TMR1IF = 0;
    PEIE = 1;
    GIE = 1;
    TMR1ON = 1;
        
    // UART
    TRISCbits.TRISC6 = 1;   // TX pin jako vstup
    TRISCbits.TRISC7 = 1;   // RX pin jako vstup
   
    /*baudrate*/
    SPBRG1 = 12;              // (8_000_000 / (64 * 9600)) - 1
    
    TXSTA1bits.SYNC = 0;      // nastaveni asynchroniho modu
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
        
    char text[17];
    
    sprintf(text, "                ");
    LCD_ShowString(1, text);
    
    if (!RCONbits.RI){
        sprintf(text, "Zprava nedosla! ");
        LCD_ShowString(1, text);
    }
        
    while (1){ 
        if(RC1IF) {
            if(RCREG == '.'){
                LATD2 ^= 1;
                i = 0;
                timer_flag = 0;
                TMR1 = DELAY;
            }
        }
        if(timer_flag){
            __asm("RESET");
        }
        
   }
}
```

## 3. Provozujte kontroler v IDLE módu. Kontrolér hned po inicilizaci uspěte a komunikujte přes uart. Tedy příchod zprávy MCU probudí. Zpráva se odešle zpět (ECHO) a MCU zase usne.

```c
// uart
#pragma config FOSC = HSMP      // Externi oscilator
#pragma config PLLCFG = ON      // 4X PLL 
#pragma config FCMEN = ON       // Fail-Safe Clock 
#pragma config WDTEN = OFF      // Watchdog Timer OFF

#include <xc.h>                 // pro prekladac XC8

void __interrupt() ISR(){    
    if(RC1IF && RC1IE){
        TXREG1 = RCREG1;
        __asm("SLEEP");
    }
}

/*--------main--------*/
int main(void) {
    ANSELC = 0;
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
    
    IDLEN = 1;
    __asm("SLEEP");
    
    while(1){            
    }
}
```