/* 
 * File:   lcd.h
 * Author: MBaMaster
 *
 * Created on 20. prosince 2018, 15:00
 */

#ifndef LCD_H
#define	LCD_H

#define I2C_ADDR 0b01111100

void LCD_Init(void);
void LCD_ShowString(char line, char a[]);
void LCD_Send(unsigned char data);
void LCD_Clear(void);
void LCD_Reset(void);


#endif	/* LCD_H */