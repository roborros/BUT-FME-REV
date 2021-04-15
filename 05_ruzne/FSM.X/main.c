// REV FSM
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdio.h>
#include <stdint.h>

#include "bsp.h"
#include "uart.h"
#include "fsm.h"
#include "lcd.h"
#include "adc.h"

#define _XTAL_FREQ 32e6

void init(fsm_t *fsm, uint8_t event);
void state1(fsm_t *fsm, uint8_t event);
void state2(fsm_t *fsm, uint8_t event);

int main(void) {
    __delay_ms(100);
    bsp_init();
    uart_init();
    adc_init();
    LCD_Init();
    
    
    GIEL = 1;                       
    GIEH = 1; 
    
    TMR2ON = 1;                     
    TMR1ON = 1;
    
    
	fsm_t   fsm; 
    uint8_t event = 0; 

    fsm_init(&fsm, &init);

    while(1){
        if (fsm_get_event(&event)){

            fsm_dispatch(&fsm, event);

        }
    }
	
	return 0;
}

//State functions
//##############################################################################

void init(fsm_t *fsm, uint8_t event){
    
    switch(event){
        case EV_ENTRY:
            LCD_ShowString(1, "Welcome         ");
            bsp_set_timeout(5000);
            break;
        case EV_EXIT:
            printf("Init state exit\n");
            break;
        case EV_TIMEOUT:
            fsm_transition(fsm, &state1);
            break;
    }
}

void state1(fsm_t *fsm, uint8_t event){
    
	switch(event){
        case EV_ENTRY:
            bsp_set_timeout(1000);
            LCD_ShowString(1, "State1           ");
            break;
        case EV_EXIT:
            bsp_stop_timeout();
            printf("Exit state 1\n");
            break;
        case EV_BTN1_PRESSED:
            fsm_transition(fsm, &state2);
            break;
        case EV_TIMEOUT:
            LED6 ^= 1;
            bsp_set_timeout(1000);
            break;
        case EV_BTN4_PRESSED:
            LED1 ^= 1;
            break;
    }
}

void state2(fsm_t *fsm, uint8_t event){
    
	switch(event){
        case EV_ENTRY:
            LCD_ShowString(1, "State2           ");
            break;
        case EV_EXIT:
            printf("Exit state 2\n");
            LCD_Clear();
            break;
        case EV_BTN1_PRESSED:
            fsm_transition(fsm, &state1);
            break;
        case EV_BTN2_PRESSED:
            bsp_set_timeout(1000);
            break;
        case EV_TIMEOUT:
            fsm_transition(fsm, &state1);
            break;
        case EV_TICK:
        {
            char str[17];
            sprintf(str, "POT: %d          ", adc_read(POT1));
            LCD_ShowString(2, str);
            break;
        }
    }
}


