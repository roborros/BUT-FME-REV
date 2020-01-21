
#include <xc.h>
#include "rev-basic.h"
#include "lcd.h"

void REV_init(void){
    char dummy_char;
    int dummy_int;
    
    TRISDbits.RD2 = 0;
    TRISDbits.RD3 = 0;
    TRISCbits.RC4 = 0;
    TRISDbits.RD4 = 0;
    TRISDbits.RD5 = 0;
    TRISDbits.RD6 = 0;
    
    ANSELDbits.ANSD2 = 0;
    ANSELDbits.ANSD3 = 0;
    ANSELCbits.ANSC4 = 0;
    ANSELCbits.ANSC7 = 0;
    ANSELDbits.ANSD4 = 0;
    ANSELDbits.ANSD5 = 0;
    ANSELDbits.ANSD6 = 0;
    
    LATDbits.LATD2 = 1;
    LATDbits.LATD3 = 1;
    LATCbits.LATC4 = 1;
    LATDbits.LATD4 = 1;
    LATDbits.LATD6 = 1;
    LATDbits.LATD5 = 1;
    
    // BUTs
    TRISCbits.RC0 = 1;
    TRISAbits.RA4 = 1;
    TRISAbits.RA3 = 1;
    TRISAbits.RA2 = 1;
    
    TRISCbits.TRISC6 = 1;   // TX pin jako vystup
    TRISCbits.TRISC7 = 1;   // RX pin jako vstup


    ANSELAbits.ANSA3 = 0;
    ANSELAbits.ANSA2 = 0; // C0,A4 - no analog channels
    
    // POTs
    TRISAbits.RA5 = 1;
    TRISEbits.RE0 = 1;
    
    TRISAbits.RA5 = 1;
    TRISEbits.RE0 = 1;

    ADON = 1;
    ADCON1 = 0;
    ADCON2 = (unsigned char)(ADCON2 | 0b00110101);     // holding cap is connected 16 cycles before sampling, freq = osc/16
    
    ADCON2bits.ADFM = 1;
    ADCON2bits.ADCS = 0b101;
    ADCON0bits.ADON = 1;    // set ADC ON
    
    //UART
    /*baudrate*/
    SPBRG1 = 51;              // (32_000_000 / (64 * 9600)) - 11
    
    TXSTA1bits.TXEN = 1;      // zapnuti TX
    RCSTA1bits.CREN = 1;      // zapnuti RX 
    RCSTA1bits.SPEN = 1;      // zapnuti UART
    
    // LCD
    LCD_Init();
    
}

int REV_pot(unsigned char adc_id){
 
    switch(adc_id){
        case 1: 
            ADCON0bits.CHS = 0b00100;
            break;
        case 2: 
            ADCON0bits.CHS = 0b00101;
            break;
        default:
            return 0;
    }
    
    GODONE = 1;
    while (GODONE);
    
    return ((ADRESH << 8) | ADRESL); 
}

char REV_btn(char id){
    
    char btn_state;
    
    switch(id){
        case 1: 
            btn_state = PORTCbits.RC0;
            break;
        case 2: 
            btn_state = PORTAbits.RA4;
            break;
        case 3: 
            btn_state = PORTAbits.RA3;
            break;
        case 4: 
            btn_state = PORTAbits.RA2;
            break;
        default:
            break;
    }
    
    __delay_ms(5);
    
    switch(id){
        case 1:
            btn_state &= PORTCbits.RC0;
            break;
        case 2: 
            btn_state &= PORTAbits.RA4;
            break;
        case 3: 
            btn_state &= PORTAbits.RA3;
            break;
        case 4: 
            btn_state &= PORTAbits.RA2;
            break;
        default:
            break;
    }
    
    return btn_state;  
}

void REV_led(char id, char state){
    /*
     LED1 RD2
     LED2 RD3
     LED6 RC4
     LED5 RD4
     LED3 RD5
     LED4 RD6
     */
    state = (unsigned char)(state == 0 ? 1 : 0);
    switch(id){
        case 1: 
            LATD2 = state;
            break;
        case 2: 
            LATD3 = state;
            break;
        case 3: 
            LATC4 = state;
            break;
        case 4: 
            LATD4 = state;
            break;
        case 5: 
            LATD5 = state;
            break;
        case 6: 
            LATD6 = state;
            break;
        default:
            break;
    }
}


void putch (char c){
    // blocking
    while(!TX1IF);
    // put char
    TXREG1 = c;
}

char getche (void){
    
    while(!RC1IF);
    
    return RCREG1;
}

char getch (void){
    return getche();
}
