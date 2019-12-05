/*
/**
 * File:   newmain.c
 * Author: MBaMaster
 *
 * Created on 6. b?ezna 2019, 18:30
 **/

// PIC18F46K22 Configuration Bit Settings

// 'C' source line config statements

#include <xc.h>
#include <stdio.h>
#include "lcd.h"


#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config IESO = OFF       // Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)


#define BTN1    PORTCbits.RC0
#define BTN2    PORTAbits.RA4
#define BTN3    PORTAbits.RA3
#define BTN4    PORTAbits.RA2

#define LED1    LATDbits.LATD2
#define LED2    LATDbits.LATD3
#define LED3    LATCbits.LATC4
#define LED4    LATDbits.LATD4
#define LED5    LATDbits.LATD5
#define LED6    LATDbits.LATD6


void __interrupt() ISR(void){
   if(TMR1IE & TMR1IF){
        TMR1 = 0x8000;
        LED1 ^= 1;
        TMR1IF = 0;
   }
    
   if(TMR5IE & TMR5IF){
        TMR5 = 0;
        LED2 ^= 1;
        TMR5IF = 0;
   }
}

void init(void){
    // disable analog properties
    ANSELA = 0x00;
    ANSELC = 0x00;
    
    // set pins as outputs
    TRISDbits.TRISD2 = 0;
    TRISDbits.TRISD3 = 0;
    TRISCbits.TRISC4 = 0;
    TRISDbits.TRISD4 = 0;
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD6 = 0;
    
    // set pins as inputs
    TRISAbits.TRISA4 = 1;
    TRISAbits.TRISA3 = 1;
    TRISAbits.TRISA2 = 1;
    TRISCbits.TRISC0 = 1;
        
    // interupts
    T1CONbits.TMR1CS = 0b00;
    T1CONbits.T1CKPS = 0b11;   // TMR1 prescaler
    T1CONbits.TMR1ON = 1;       // TMR1 on
    
    T5CONbits.TMR5CS = 0b00;
    T5CONbits.T5CKPS = 0b11;   // TMR1 prescaler
    T5CONbits.TMR5ON = 1;       // TMR1 on
 
    /* init - interrupts */
    PEIE = 1;           // global interrupt enable
    GIE = 1;            // peripheral interrupt enable
    TMR1IE = 1;        // enable TMR1 interrupt
    TMR5IE = 1;        // enable TMR1 interrupt
    
    //switch leds of
    LED1 = 1; asm("nop");
    LED2 = 1; asm("nop");
    LED3 = 1; asm("nop");
    LED4 = 1; asm("nop");
    LED5 = 1; asm("nop");
    LED6 = 1; asm("nop");
}


void main(void)
{   
    init();
    LCD_Init();
    char text[17];
    sprintf(text, "Mechalab je bozi");
    LCD_ShowString(1,text);
    
    while(1){
        if(BTN1){
            LCD_Clear();
        }
    }
}

