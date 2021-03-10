
#ifndef LCD_H
#define	LCD_H

void LCD_Init(void);
void LCD_ShowString(char line, char a[]);
static void LCD_Send(unsigned char data);
void LCD_Clear(void);
void LCD_Reset(void);


#endif	/* LCD_H */