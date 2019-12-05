/* 
 * File:   lcd.h
 * Author: MBaMaster
 *
 * Created on 8. b?ezna 2019, 17:37
 */

#ifndef LCD_H
#define	LCD_H

#ifdef	__cplusplus
extern "C" {
#endif

void LCD_Init(void);
void LCD_ShowString(char lineNum, char textData[]);
void LCD_Send(unsigned char data);
void LCD_Clear(void);


#ifdef	__cplusplus
}
#endif

#endif	/* LCD_H */

