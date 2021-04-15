#include <xc.h>
#include <stdio.h>
#include "lcd.h"
#define _XTAL_FREQ 32E6

void LCD_Init(void){
    
    ANSELDbits.ANSD0 = 0;
    ANSELDbits.ANSD1 = 0;
    
    TRISDbits.TRISD0 = 1;   // pin as input
    TRISDbits.TRISD1 = 1;   // pin as input
    TRISAbits.TRISA0 = 0;   // pin as input
    LATAbits.LATA0 = 1;
    
    
    SSP2CON1bits.SSPM = 0b1000; // I2C Master mode
    SSP2ADD = 19; 
    SSP2CON1bits.SSPEN = 1;     // enable
    
    __delay_ms(5);
    
    SSP2CON2bits.SEN = 1;
    while (SSP2CON2bits.SEN);
    SSP2IF = 0;
    
    // LCD addr:  0111110 (0x3E)
    // LCD write: 01111100 (0x7C)
    
    LCD_Send(0x7C); // device addr write
    LCD_Send(0x80); // Control byte
    LCD_Send(0x38); // function set
    LCD_Send(0x80);
    LCD_Send(0x39); // function set
    LCD_Send(0x80);
    LCD_Send(0x17); // internal OSC freq
    LCD_Send(0x80);
    LCD_Send(0x7A); // contrast set
    LCD_Send(0x80);
    LCD_Send(0x5E); // Power/ICON control/Contrast set
    LCD_Send(0x80);
    LCD_Send(0x6B); // Follower conrol
    LCD_Send(0x80);
    LCD_Send(0x0C); // Display ON/OFF
    LCD_Send(0x80);
    LCD_Send(0x01); // Clear display
    LCD_Send(0x80);
    LCD_Send(0x06);
    LCD_Send(0x80);
    LCD_Send(0x02);
  
    SSP2CON2bits.PEN = 1;
    while (SSP2CON2bits.PEN);
    
    __delay_ms(5);
}

void LCD_ShowString(char lineNum, char textData[])
{
    unsigned char i;
    i = 0;
    
    SSP2CON2bits.SEN = 1;
    while (SSP2CON2bits.SEN);
    SSP2IF = 0;
    
    LCD_Send(0x7c);

    LCD_Send(0x80);
    
    if(lineNum == 1){
        LCD_Send(0x80);
    }
    else if (lineNum == 2){
        LCD_Send(0xC0);
    }
    
    LCD_Send(0x40);
    
    for (i = 0; i<16; i++){
        LCD_Send(textData[i]);
    }
    
    SSP2CON2bits.PEN = 1;
    while (SSP2CON2bits.PEN);
}

static void LCD_Send(unsigned char data){
    
    SSP2BUF = data;
    while(SSP2STATbits.BF);
    while(!SSP2IF);
    SSP2IF = 0;
    
}

void LCD_Clear(void){
    SSP2CON2bits.SEN = 1;
    while (SSP2CON2bits.SEN);
    SSP2IF = 0;
    
    LCD_Send(0x7C); // device addr write
    LCD_Send(0x80); // Control byte
    LCD_Send(0x01); // Clear display
    
    SSP2CON2bits.PEN = 1;
    while (SSP2CON2bits.PEN);
    __delay_us(500);
}

void LCD_Reset(void){
    LATAbits.LATA0 = 0;
    __delay_us(100);
    LATAbits.LATA0 = 1;
}
