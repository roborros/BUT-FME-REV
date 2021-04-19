//<editor-fold defaultstate="collapsed" desc="Config">
// CONFIG1H
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config IESO = OFF       // Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

// CONFIG2L
#pragma config PWRTEN = OFF     // Power-up Timer Enable bit (Power up timer disabled)
#pragma config BOREN = SBORDIS  // Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))
#pragma config BORV = 190       // Brown Out Reset Voltage bits (VBOR set to 1.90 V nominal)

// CONFIG2H
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)
#pragma config WDTPS = 32768    // Watchdog Timer Postscale Select bits (1:32768)

// CONFIG3H
#pragma config CCP2MX = PORTC1  // CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
#pragma config PBADEN = ON      // PORTB A/D Enable bit (PORTB<5:0> pins are configured as analog input channels on Reset)
#pragma config CCP3MX = PORTB5  // P3A/CCP3 Mux bit (P3A/CCP3 input/output is multiplexed with RB5)
#pragma config HFOFST = ON      // HFINTOSC Fast Start-up (HFINTOSC output and ready status are not delayed by the oscillator stable status)
#pragma config T3CMX = PORTC0   // Timer3 Clock input mux bit (T3CKI is on RC0)
#pragma config P2BMX = PORTD2   // ECCP2 B output mux bit (P2B is on RD2)
#pragma config MCLRE = EXTMCLR  // MCLR Pin Enable bit (MCLR pin enabled, RE3 input pin disabled)

// CONFIG4L
#pragma config STVREN = ON      // Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
#pragma config LVP = ON         // Single-Supply ICSP Enable bit (Single-Supply ICSP enabled if MCLRE is also 1)
#pragma config XINST = OFF      // Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

// CONFIG5L
#pragma config CP0 = OFF        // Code Protection Block 0 (Block 0 (000800-003FFFh) not code-protected)
#pragma config CP1 = OFF        // Code Protection Block 1 (Block 1 (004000-007FFFh) not code-protected)
#pragma config CP2 = OFF        // Code Protection Block 2 (Block 2 (008000-00BFFFh) not code-protected)
#pragma config CP3 = OFF        // Code Protection Block 3 (Block 3 (00C000-00FFFFh) not code-protected)

// CONFIG5H
#pragma config CPB = OFF        // Boot Block Code Protection bit (Boot block (000000-0007FFh) not code-protected)
#pragma config CPD = OFF        // Data EEPROM Code Protection bit (Data EEPROM not code-protected)

// CONFIG6L
#pragma config WRT0 = OFF       // Write Protection Block 0 (Block 0 (000800-003FFFh) not write-protected)
#pragma config WRT1 = OFF       // Write Protection Block 1 (Block 1 (004000-007FFFh) not write-protected)
#pragma config WRT2 = OFF       // Write Protection Block 2 (Block 2 (008000-00BFFFh) not write-protected)
#pragma config WRT3 = OFF       // Write Protection Block 3 (Block 3 (00C000-00FFFFh) not write-protected)

// CONFIG6H
#pragma config WRTC = OFF       // Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) not write-protected)
#pragma config WRTB = OFF       // Boot Block Write Protection bit (Boot Block (000000-0007FFh) not write-protected)
#pragma config WRTD = OFF       // Data EEPROM Write Protection bit (Data EEPROM not write-protected)

// CONFIG7L
#pragma config EBTR0 = OFF      // Table Read Protection Block 0 (Block 0 (000800-003FFFh) not protected from table reads executed in other blocks)
#pragma config EBTR1 = OFF      // Table Read Protection Block 1 (Block 1 (004000-007FFFh) not protected from table reads executed in other blocks)
#pragma config EBTR2 = OFF      // Table Read Protection Block 2 (Block 2 (008000-00BFFFh) not protected from table reads executed in other blocks)
#pragma config EBTR3 = OFF      // Table Read Protection Block 3 (Block 3 (00C000-00FFFFh) not protected from table reads executed in other blocks)

// CONFIG7H
#pragma config EBTRB = OFF      // Boot Block Table Read Protection bit (Boot Block (000000-0007FFh) not protected from table reads executed in other blocks)
//</editor-fold>

#include <xc.h>
#include <stdio.h>
#include <stdint.h>

#include "lcd.h"
#include "gpio.h"
#include "uart.h"
#include "timer.h"
#include "custom_funcs.h"

#define _XTAL_FREQ 32e6

#define IDLE_STATE 0
#define FIRST_SPIN_STATE 1
#define SECOND_SPIN_STATE 2
#define JACKPOT_STATE 3
#define NO_WIN_STATE 4

volatile uint8_t credit = 0;

void __interrupt() ISR(void) {
    char chachar;
    
    if(RC1IE && RC1IF) {
        chachar = RCREG1 - 48;
        if(chachar == 1 || chachar == 2 || chachar == 5){   
            credit = credit + chachar; 
        }
    }
    
    if(TMR1IF && TMR1IE) {
        timer_timeout_counter();
        TMR1IF = 0;
    }
    
    if (TMR2IF && TMR2IE ){
        gpio_btn_check();
        TMR2IF = 0;                     // smazani IF
    }
}

void main(void) {
    gpio_init();
    uart_init();
    timer_init();    
    __delay_ms(40);
    LCD_Init();
    
    PEIE = 1;
    GIE = 1;
    
    char text[17];    
    char symbols[3];
    uint16_t win;
    uint8_t respin;
    
    state_struct state;
    state.id = IDLE_STATE;
    state.first_entry = 1;
    state.changed = 0;
        
    int i;
    
    printf("Pred zahajenim hry je nutne vhodit minci v hodnote 1,2 nebo 5 kreditu.\n");
    printf("Pro zahajeni hry stisknete BTN4.\n");
    printf("Pro znovuroztoceni jednotlivych kol stisknete tlacitka BTN1 | BTN2 | BTN 3.\n");
    
    while(1) {    
        switch(state.id) {
            // IDLE
            case IDLE_STATE:
                if(state.first_entry) {                    
                    state.first_entry = 0;
                    printf("Vas kredit je: %d\n", credit);
                    sprintf(text, "MECHLAB  BANDITA");
                    LCD_ShowString(1, text);
                    LCD_ShowString(2, "               ");
                }
                
                if(gpio_btn_state(4)) {                    
                    if(credit > 0) {
                        credit--;
                        change_state(&state, FIRST_SPIN_STATE);
                    }
                }
                
                if(state.changed) {
                    state.first_entry = 1;
                    state.changed = 0;
                }
                break;
                
            // SPIN 1st
            case FIRST_SPIN_STATE:
                // Generate symbols
                for (i = 0; i < 3; i++) {
                    symbols[i] = generate_symbol();
                }
                // Show symbols
                sprintf(text, "   |%c| |%c| |%c|  ", symbols[0], symbols[1], symbols[2]);
                LCD_ShowString(2, text);
                
                win = check_win(symbols);
                if(win) {
                    change_state(&state, JACKPOT_STATE);
                } else {
                    change_state(&state, SECOND_SPIN_STATE);
                    printf("Muzete roztocit libovolne kolo jeste jednou.\n");
                }   
                
                if(state.changed){
                    state.first_entry = 1;
                    state.changed = 0;
                }
                break;   
            
            // SIN 2st
            case SECOND_SPIN_STATE:
                respin = 0;
                if(gpio_btn_state(4)) {                    
                    change_state(&state, NO_WIN_STATE);
                } else if(gpio_btn_state(1)){
                    symbols[0] = generate_symbol();
                    respin = 1;
                }else if(gpio_btn_state(2)) {
                    symbols[1] = generate_symbol();
                    respin = 1;
                }else if(gpio_btn_state(3)) {                        
                    symbols[2] = generate_symbol();
                    respin = 1;
                }
                if(respin){
                    // Show symbols
                    sprintf(text, "   |%c| |%c| |%c|  ", symbols[0], symbols[1], symbols[2]);
                    LCD_ShowString(2, text);

                    win = check_win(symbols);
                    if(win) {
                        change_state(&state, JACKPOT_STATE);
                    } else {
                        change_state(&state, NO_WIN_STATE);
                    }                                 
                } 
                if(state.changed){
                    state.first_entry = 1;
                    state.changed = 0;
                }
                break;
            
            // WIN
            case JACKPOT_STATE:
                if(state.first_entry){
                    state.first_entry = 0;
                    credit += win;
                    sprintf(text, "                ");
                    sprintf(text, "JACKPOT: %d", win);
                    LCD_ShowString(1, text);
                    printf("JACPOT: vase vyhra je %d kreditu.\n", win);
                    timer_timeout_reset();
                }
                                
                if (timer_timeout_compare(2000)){
                    change_state(&state, IDLE_STATE);
                }
                
                if(state.changed){
                    state.first_entry = 1;
                    state.changed = 0;
                }
                break;
                
            case NO_WIN_STATE:
                if(state.first_entry) {
                    state.first_entry = 0;
                    printf("Zadna vyhra, zkuste to znovu.\n");    
                    timer_timeout_reset();
                }
                if (timer_timeout_compare(2000)){
                    change_state(&state, IDLE_STATE);
                }
                
                if(state.changed){
                    state.first_entry = 1;
                    state.changed = 0;
                }
        }        
                
        show_credit(credit);
    }    
    return;
}


