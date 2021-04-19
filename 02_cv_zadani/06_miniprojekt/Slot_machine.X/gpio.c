#include "xc.h"
#include "gpio.h"

volatile static btn_filter_t buttons = {0};

void gpio_init(void) {
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
    
    ANSELA = 0;
    
    LED1 = 1;
    LED2 = 1;
    LED3 = 1;
    LED4 = 1;
    LED5 = 1;
    LED6 = 1;     
}

void gpio_drive_led(char input) {
    LED6 = input & 1 ? 0 : 1;
    LED5 = input & 2 ? 0 : 1;
    LED4 = input & 4 ? 0 : 1;
    LED3 = input & 8 ? 0 : 1;
    LED2 = input & 16 ? 0 : 1;
    LED1 = input & 32 ? 0 : 1;  
}

void gpio_btn_check(void) {    
    buttons.btn1_acc<<=1;
    buttons.btn1_acc |= BTN1;

    buttons.btn2_acc<<=1;
    buttons.btn2_acc |= BTN2;

    buttons.btn3_acc<<=1;
    buttons.btn3_acc |= BTN3;

    buttons.btn4_acc<<=1;
    buttons.btn4_acc |= BTN4;

    if(buttons.btn1_acc == RAISING_EDGE){
       buttons.btn1_stat = 1; 
    }
    if(buttons.btn2_acc == RAISING_EDGE){
       buttons.btn2_stat = 1; 
    }
    if(buttons.btn3_acc == RAISING_EDGE){
       buttons.btn3_stat = 1; 
    }
    if(buttons.btn4_acc == RAISING_EDGE){
       buttons.btn4_stat = 1; 
    }
}

char gpio_btn_state(char btn){
    switch(btn){
        case 1:
            if(buttons.btn1_stat){
                buttons.btn1_stat = 0;
                return 1;
            }
            else{
                return 0;
            }
            break;
        case 2:
            if(buttons.btn2_stat){
                buttons.btn2_stat = 0;
                return 1;
            }
            else{
                return 0;
            }
            break;
        case 3:
            if(buttons.btn3_stat){
                buttons.btn3_stat = 0;
                return 1;
            }
            else{
                return 0;
            }
            break;
        case 4:
            if(buttons.btn4_stat){
                buttons.btn4_stat = 0;
                return 1;
            }
            else{
                return 0;
            }
            break;
        default:
            return 0;
    }
}