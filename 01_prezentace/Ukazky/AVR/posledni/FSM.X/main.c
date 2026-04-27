#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <stdio.h>
#include <stdlib.h>

#define F_CPU 24000000UL
#include <util/delay.h>

#include "adc.h"
#include "uart.h"
#include "millis.h"
#include "debounce.h"
#include "fsm.h"
#include "lcd.h"

char char_buf[64];
char init_msg[] = "Start programu!";

void init(void){

    PORTB.DIRSET = PIN3_bm;
    PORTB.DIRCLR = PIN2_bm;
    PORTB.PIN2CTRL = PORT_INVEN_bm | PORT_PULLUPEN_bm;
    
}

void init_fcn(fsm_t *fsm, uint8_t event);
void run_fcn(fsm_t *fsm, uint8_t event);
void adc_fcn(fsm_t *fsm, uint8_t event);


int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    init();
    uart_init(F_CPU, 115200);
    adc_init();
    millis_init(); 
    LCD_Init();
    sei();
   
    adc_set_channel(3);
    uint32_t prev_time = get_millis();
    uint32_t prev_time_led = get_millis();
    fsm_t fsm;
    fsm_init(&fsm, init_fcn);
    btn_debounc_t btn = {.counter=0, .btn_state=0};
    
    while (1)
    {
        
        if((get_millis() - prev_time_led) >= 1000){
            prev_time_led = get_millis();
            PORTB.OUTTGL = PIN3_bm;
        }
        
        if((get_millis() - prev_time) >= 40){
            prev_time = get_millis();
            fsm_add_event(EV_TICK);
        }
        
        if (debounce(&btn, PORTB.IN & PIN2_bm)){
            fsm_add_event(EV_BTN_PRESSED);
            
        }
        
        uint8_t new_event;
        if (fsm_get_event(&new_event)){
            fsm_dispatch(&fsm, new_event);
        }  
    }
}

void init_fcn(fsm_t *fsm, uint8_t event){
    
    static uint8_t index = 1;
    
    switch(event){
    
        case EV_ENTRY:
        {   
            index = 1;
            break;
        }
        
        case EV_TICK:
        {
            snprintf(char_buf, index, "%s", init_msg);
            if(index<16){
                 LCD_Print(1, char_buf);
                 index++;
            }
            break;
        }
        
        case EV_BTN_PRESSED:
        {
            fsm_transition(fsm, adc_fcn);
            break;
        }

        case EV_EXIT:
        {
            LCD_Clear();
            break;
        }
    }
}

void adc_fcn(fsm_t *fsm, uint8_t event){

    switch(event){
    
        case EV_ENTRY:
        {   
            LCD_Print(1, "ADC:");   
            break;
        }
        
        case EV_TICK:
        {
            uint16_t adc_now = adc_read_raw();
            sprintf(char_buf, "ADC: %d    ", adc_now);
            LCD_Print(2, char_buf);
            break;
        }
        
        case EV_BTN_PRESSED:
        {
            fsm_transition(fsm, init_fcn);
            break;
        }

        case EV_EXIT:
        {
            LCD_Clear();
            break;
        }
    }

}
