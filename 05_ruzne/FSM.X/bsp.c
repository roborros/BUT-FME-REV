#include "xc.h"
#include "bsp.h"
#include "fsm.h"

volatile static long bsp_timeout;
volatile static btn_filter_t buttons = {0};

void bsp_init(void) {
    TRISCbits.RC0 = 1;
    TRISAbits.RA4 = 1;
    TRISAbits.RA3 = 1;
    TRISAbits.RA2 = 1;
    
    TRISDbits.RD2 = 0;
    TRISDbits.RD3 = 0;
    TRISCbits.RC4 = 0;
    TRISDbits.RD4 = 0;
    TRISDbits.RD5 = 0;
    TRISDbits.RD6 = 0;
    
    TRISBbits.TRISB5 = 0;
    
    ANSELA = 0;
    
    LED1 = 1;
    LED2 = 1;
    LED3 = 1;
    LED4 = 1;
    LED5 = 1;
    LED6 = 1;   
    
    T2CONbits.T2CKPS = 0b11;        
    T2CONbits.T2OUTPS = 0b1001;     
    PR2 = 250;                      
    IPR1bits.TMR2IP = 0;            
    TMR2IE = 1;                     
    TMR2IF = 0;
    
    T6CONbits.T6CKPS = 0b11;        
    T6CONbits.T6OUTPS = 0b0100;     
    PR6 = 100;                                  
    TMR6IE = 1;                     
    TMR6IF = 0;
    
    
    T1CONbits.TMR1CS = 0b00;        
    T1CONbits.T1CKPS = 0b11;        
    TMR1IE = 1;
    TMR1IF = 0;  
    
    IPEN = 1;
}

void bsp_drive_led(char input) {
    LED6 = input & 1 ? 0 : 1;
    LED5 = input & 2 ? 0 : 1;
    LED4 = input & 4 ? 0 : 1;
    LED3 = input & 8 ? 0 : 1;
    LED2 = input & 16 ? 0 : 1;
    LED1 = input & 32 ? 0 : 1;  
}


void bsp_set_timeout(long timeout_in){
    bsp_timeout = timeout_in;
    TMR6 = 0;
    TMR6ON = 1;
}

long bsp_get_timeout(void){
    return bsp_timeout;
}

void bsp_stop_timeout(void){
    TMR6ON = 0;
}

void __interrupt(high_priority) HIGH_ISR(void){
    
    if (TMR1IF && TMR1IE ){  
        fsm_add_event(EV_TICK);
        TMR1 = 55535;
        TMR1IF = 0;                    
    }
    
    if (TMR6IF && TMR6IE ){             
        if(--bsp_timeout <= 0){
            fsm_add_event(EV_TIMEOUT);
            TMR6ON = 0;
        }
        RB5 ^= 1;
        TMR6IF = 0;                    
    }
}

void __interrupt(low_priority) LOW_ISR(void){
     
    if (TMR2IF && TMR2IE ){            
        
        buttons.btn1_acc<<=1;
        buttons.btn1_acc |= BTN1;
        
        buttons.btn2_acc<<=1;
        buttons.btn2_acc |= BTN2;
        
        buttons.btn3_acc<<=1;
        buttons.btn3_acc |= BTN3;
        
        buttons.btn4_acc<<=1;
        buttons.btn4_acc |= BTN4;
        
        if(buttons.btn1_acc == RAISING_EDGE){
           fsm_add_event(EV_BTN1_PRESSED);
        }
        if(buttons.btn2_acc == RAISING_EDGE){
           fsm_add_event(EV_BTN2_PRESSED); 
        }
        if(buttons.btn3_acc == RAISING_EDGE){
           fsm_add_event(EV_BTN3_PRESSED); 
        }
        if(buttons.btn4_acc == RAISING_EDGE){
           fsm_add_event(EV_BTN4_PRESSED); 
        }

        TMR2IF = 0;                     
    }
}