## 1. Načítejte hodnoty z potenciometru (vstup AN4) a postupně rozsvicujte jednotlivé LED0-LED5 (bargraph). Použij funkci driveLED.

```c
// REV ADC
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdint.h>
#include <stdio.h>

#define _XTAL_FREQ 32e6

#define LED_1 LATDbits.LATD2
#define LED_2 LATDbits.LATD3
#define LED_3 LATCbits.LATC4
#define LED_4 LATDbits.LATD4
#define LED_5 LATDbits.LATD5
#define LED_6 LATDbits.LATD6
 

volatile uint16_t pot1_val;

void gpio_init();
void drive_LED(char state);

void __interrupt() ISR() {
    if (ADIE && ADIF) {
        pot1_val = (ADRESH << 8) | ADRESL;
        ADIF = 0;
    }

}

void main(void) {
        
    gpio_init();
    
    TRISAbits.RA5 = 1;
    ANSELAbits.ANSA5 = 1;
    
    ADCON2bits.ADCS = 0b110; // Fosc/64
    ADCON1bits.PVCFG = 0b00; // Vrefp = Vdd 3,3 V
    ADCON1bits.NVCFG = 0b00; // Vrefn = Vss 0,0 V
    ADCON0bits.CHS = 0b00100; // AN4
    ADCON2bits.ADFM = 1; // Right justified
    ADCON2bits.ACQT = 0b110; // 16Tad
    
    ADIF = 0;
    ADIE = 1;
    PEIE = 1;
    GIE = 1;
    
    ADCON0bits.ADON = 1;
    
    uint8_t led_state = 0;
    
    while(1) {
        ADCON0bits.GODONE = 1;
        
        if (pot1_val < 145) {
            led_state = 0;
        } else if (pot1_val >= 145 && pot1_val < 290) {
            led_state = 0b100000;
        } else if (pot1_val >= 290 && pot1_val < 435) {
            led_state = 0b110000;
        } else if (pot1_val >= 435 && pot1_val < 580) {
            led_state = 0b111000;
        } else if (pot1_val >= 580 && pot1_val < 725) {
            led_state = 0b111100;
        } else if (pot1_val >= 725 && pot1_val < 870) {
            led_state = 0b111110;
        } else if (pot1_val >= 870) {
            led_state = 0b111111;
        }
        
        drive_LED(led_state);
        __delay_ms(50);
    }
    
    return;
}

void gpio_init() {
    TRISDbits.RD2 = 0;
    TRISDbits.RD3 = 0;
    TRISCbits.RC4 = 0;
    TRISDbits.RD4 = 0;
    TRISDbits.RD5 = 0;
    TRISDbits.RD6 = 0;
    
    LED_1 = 1;
    LED_2 = 1;
    LED_3 = 1;
    LED_4 = 1;
    LED_5 = 1;
    LED_6 = 1;
}

void drive_LED(char state) {
    LED_6 = state & 1 ? 0 : 1; 
    LED_5 = state & 2 ? 0 : 1; 
    LED_4 = state & 4 ? 0 : 1; 
    LED_3 = state & 8 ? 0 : 1; 
    LED_2 = state & 16 ? 0 : 1; 
    LED_1 = state & 32 ? 0 : 1; 
}
```

## 2. Vypisujte na UART hodnotu POT1 v celočíselném formátu (cca 1x za sekundu).

```c
// REV ADC
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdint.h>
#include <stdio.h>

#define _XTAL_FREQ 32e6
 

volatile uint16_t pot1_val;

void uart_init();

void __interrupt() ISR() {
    if (ADIE && ADIF) {
        pot1_val = (ADRESH << 8) | ADRESL;
        ADIF = 0;
    }

}

void main(void) {
    uart_init();
    
    TRISAbits.RA5 = 1;
    ANSELAbits.ANSA5 = 1;
    
    ADCON2bits.ADCS = 0b110; // Fosc/64
    ADCON1bits.PVCFG = 0b00; // Vrefp = Vdd 3,3 V
    ADCON1bits.NVCFG = 0b00; // Vrefn = Vss 0,0 V
    ADCON0bits.CHS = 0b00100; // AN4
    ADCON2bits.ADFM = 1; // Right justified
    ADCON2bits.ACQT = 0b110; // 16Tad
    
    ADIF = 0;
    ADIE = 1;
    PEIE = 1;
    GIE = 1;
    
    ADCON0bits.ADON = 1;
    
    uint8_t led_state = 0;
    
    while(1) {
        ADCON0bits.GODONE = 1;
        
        printf("%d\n", pot1_val);
        
        __delay_ms(1000);
    }
    
    return;
}

void uart_init() {
    ANSELC = 0;
    
    SPBRG1 = 51;
    TRISCbits.RC6 = 1;
    TRISCbits.RC7 = 1;
    
    TXSTA1bits.SYNC = 0;
    RCSTA1bits.SPEN = 1;
    TXSTA1bits.TXEN = 1;
    RCSTA1bits.CREN = 1;
    
    PIE1bits.RC1IE = 1;
    INTCONbits.PEIE = 1;
    INTCONbits.GIE = 1;
}

void putch(unsigned char data){
    while(!TX1IF);
    TXREG1 = data;
}
```

## 3. Vypisujte POT1 a POT2 na displej ve voltech na na tři desetinná místa (použijte knihovnu pro LCD).

```c
// REV ADC
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdio.h>
#include "lcd.h"

#define _XTAL_FREQ 32e6

void init(void){
  
    ANSELA = 0b00100000;            //AN4 (RA5)
    ANSELE = 0b1;                   //AN5 (RE0)
 
    ADCON2bits.ADFM = 1;            //right justified
    ADCON2bits.ADCS = 0b110;        //Fosc/64
    ADCON2bits.ACQT = 0b110;        //acquisition time 16 Tad
    ADCON0bits.ADON = 1;            //ADC zapnout
}

void main(void)
{
    init();
    LCD_Init();
    
    unsigned int  pot1;
    unsigned int  pot2;
    char text [17];
    float volt;
    
    while(1){
        ADCON0bits.CHS = 5;                 // kanal AN5
        GODONE = 1;                         // spustit aproximaci
        while(GODONE);                      // cekam nez je hotovo
        pot2 = (ADRESH << 8) | ADRESL;      // cteni vysledku
        
        ADCON0bits.CHS = 4;                 // kanal AN4
        GODONE = 1;                         // spustit aproximaci
        while(GODONE);                      // cekam nez je hotovo
        pot1 = (ADRESH << 8) | ADRESL;      // cteni vysledku
        
        volt = pot1/1023.0 * 3.3;
        sprintf(text, "                ");
        sprintf(text, "POT1 = %.3f", volt);
        LCD_ShowString(1, text);
        
        volt = pot2/1023.0 * 3.3;
        sprintf(text, "                ");      
        sprintf(text, "POT2 = %.3f", volt);
        LCD_ShowString(2, text);
        
        __delay_ms(50);
                
        
    }    
}
```