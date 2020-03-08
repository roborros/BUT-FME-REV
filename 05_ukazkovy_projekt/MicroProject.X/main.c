// REV MicroProject
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>                 // knihovna microchip
#include <stdio.h>              // std pro sprintf
#include <stdint.h>             // unifikovane datove typy

#include "bsl.h"                // knihovna pro REVkit
#include "lcd.h"                // knihovna pro LCD

// definice 
#define DELAY (0xffff - 10000)   // delay 10ms
#define START BTN1
#define PAUSE BTN2
#define RES BTN3

volatile uint8_t g_timer_flag=0;
volatile uint8_t g_state=1;


void __interrupt() ISR(void){
    volatile static uint8_t start,
                            pause,
                            reset;

    
    if (TMR1IE && TMR1IF){
        if (START){
           start++;
           if (start>5) g_state=2;
        }
        else{
            start = 0;
        }
        
        if (PAUSE){
           pause++;
           if (pause>5) g_state=1;
        }
        else{
            pause = 0;
        }
        
        if (RES){
           reset++;
           if (reset>5) g_state=3;
        }
        else{
            reset = 0;
        }
        
        g_timer_flag = 1;
        TMR1 = DELAY;
        TMR1IF = 0;
    }

}

int main(void) {
    
    init_gpio();                // provedu nastaveni SFR pro GPIO
    LCD_Init();                 // inicializace LCD
    init_tmr1();                // provedu nastaveni SFR pro TMR1
    
    PEIE = 1;                   // preruseni periferie
    GIE = 1;                    // preruseni globalne
    TMR1 = DELAY;               // nastavim registr timeru1
    T1CONbits.TMR1ON = 1;       // zapnu timer
    
    char text[17];
    uint8_t hos=0,
            minutes=0,
            seconds=0;
    char leds = 0b111111;
    
    LCD_ShowString(1, "Timer:        ");
    
    while(1){
        if (g_timer_flag){
            switch (g_state){

                case 1:
                    break;
                case 2:
                    hos++;
                    if (hos >=100){
                        seconds++;
                        hos = 0;
                        leds ^= 0b111111;
                        drive_leds(leds);
                        if (seconds >=60){
                            minutes++;
                            seconds = 0;
                            if (minutes >= 99)
                                minutes = 0;
                        }
                    }
                    break;
                case 3:
                    hos = 0;
                    seconds = 0;
                    minutes = 0;
                    break;
                default:
                    break;
            }
            g_timer_flag = 0;
        }
                  
        sprintf(text, "%02d:%02d.%02d       ", minutes, seconds, hos);
        LCD_ShowString(2, text);
        }
        return 0; 
    }
                    

