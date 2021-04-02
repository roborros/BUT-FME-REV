// DAC
#pragma config FOSC =   HSMP        // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON         // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF           // Watchdog Timer Enable bits (WDT is always enabled. SWDTEN bit has no effect)

#include <stdio.h>
#include <stdint.h>
#include <xc.h>

#define _XTAL_FREQ 32E6         // definice fosc pro knihovnu
#define DAC_SS LATB3            // DAC slave select pin
#define DAC_CH1 0b00110000      // kanal A
#define DAC_CH2 0b10110000      // kanal B
#define LED LATDbits.LATD2      // ledka


typedef struct {
    uint8_t alpha;
    int32_t avg;
}filter_t;

void filter_init(filter_t * self, uint8_t alpha){
    self->alpha = alpha;
    self->avg = 0;
}

int16_t filter_step(filter_t * self, int16_t in){
    int32_t mes = (int32_t)(in)<<10;
    self->avg += ((mes - self->avg)>>self->alpha);
    return (int16_t)(self->avg>>10);
}

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
    ADCON2bits.ADFM = 1;            //justified
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


void SPIWrite(uint8_t channel ,uint8_t data);
void putch(unsigned char data);

void main(void) {
    init(); // provedeni inicializace
    
    filter_t filter; 
    filter_init(&filter, 8);
    
    ADCON0bits.CHS = 13;                 // kanal AN13
    unsigned char i=0;
    
    uint8_t comp = 128;
    
    int16_t adc_value = 0;
    /* hlavni smycka */
    while(1){
        SPIWrite(DAC_CH1, i++);                 // nastaveni DAC 
        if(i > comp){
            SPIWrite(DAC_CH2, 200);                 // nastaveni DAC 
        }
        else{
            SPIWrite(DAC_CH2, 0);                 // nastaveni DAC 
        }
        GODONE = 1;                             // spustit aproximaci
        while(GODONE);                          // cekam nez je hotovo
        adc_value = ((ADRESH<<8) | ADRESL);
        printf("%d,%d,\r", adc_value, filter_step(&filter, adc_value));
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

void putch(unsigned char data){
    while(!TX1IF);
    TXREG1 = data;
}


