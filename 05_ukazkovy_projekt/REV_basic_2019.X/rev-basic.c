
#include <xc.h>
#include "rev-basic.h"

#include "lcd.h"




void REV_init(void){
    char dummy_char;
    int dummy_int;
    

    OSCCON = (unsigned char)((OSCCON & 0b10001111) | 0b01110000);    // internal oscillator at full speed (16 MHz)
    
//    // IO
//    TRISA = 0b11111111; // all inputs
//    ANSELA = 0b00000011;// ADC0 and ADC1 are analog inputs
//    
//    
//    TRISB = 0b11111111; // five buttons in + unused + PGC, PGD
//    LATB = 0xff;        // pull-up by default
//    ANSELB = 0;         // no ADC inputs
//    
//    TRISC = 0b10000001; // RC4 LED
//    ANSELC = 0;
//    
//    TRISD = 0b10000011; // LEDs: 2..6 out
//    LATD = 0b00000000;
//    ANSELD = 0;
//    
//    TRISAbits.RA5 = 1;
//    
//    ADON = 1;
//    ADCON1 = 0;
//    ADCON2 = ADCON2 | 0b00110101;     // holding cap is connected 16 cycles before sampling, freq = osc/16
//    
//    ADCON2bits.ADFM = 1;
//    ADCON2bits.ADCS = 0b101;
//    ADCON0bits.ADON = 1;    // set ADC ON
//    
//    //TRISE = 0b00000011; // EXTRA = in, RE2 is out (LCD backlight control))
//    //LATE = 0b00000100;
//    //ANSELE = 0;
//    
//    // UART 1 (USB)
//    //SPBRG = ((16000000 / 9600) / 64 ) - 1;
//    SPBRG = 25;
//    TXSTA1 = 0b00100000;
//    RCSTA1 = 0b10010000;
//    
//    // dummy reads
//    dummy_int = REV_pot(1);
//    //dummy_char = getche();
//    //dummy_char = getch();
//    
    
    
    
    // INIT
    
    // LEDs
    TRISDbits.RD2 = 0;
    TRISDbits.RD3 = 0;
    TRISCbits.RC4 = 0;
    TRISDbits.RD4 = 0;
    TRISDbits.RD5 = 0;
    TRISDbits.RD6 = 0;
    
    ANSELDbits.ANSD2 = 0;
    ANSELDbits.ANSD3 = 0;
    ANSELCbits.ANSC4 = 0;
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
    TRISCbits.RC6 = 0; // TX
    TRISCbits.RC7 = 1; // RX
    
    
    TXSTA1 = 0b00100000;
    RCSTA1 = 0b10010000;
    BAUDCON1bits.BRG16 = 1;
    TXSTA1bits.BRGH = 1;
                   
            
    
    SPBRG = 34;  //SPBRG = ((16000000 / 115200) / 4 ) - 1;
    
    
    // LCD
    LCD_Init();
    
    
    // dummy calls to avoid "function not called" warnings
    dummy_char = REV_btn(1);
    REV_led(1,1);
    putch('a');
    dummy_int = REV_pot(1);
    
}


int REV_pot(unsigned char adc_id){
    int result;
    
//    CHS4 = CHS3 = CHS2 = CHS1 = 0;
//    CHS0 = adc_id + 3;
    
    
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
    
    result = (ADRESH << 8) | ADRESL;
    
    return result;
}

char REV_btn(char id){
    // BTN1-4 : C0 A4 A3 A2
    
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
    
    __delay_ms(2);
    
    
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
    while(!TRMT1);
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