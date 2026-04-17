#ifndef LCD_H_
#define LCD_H_

#include <avr/io.h>
#include <stdint.h>

/* ===== Nastavení ===== */

#define LCD_ADDR        0x27    // zm?? na 0x3F pokud je pot?eba
#define LCD_LINE1       1
#define LCD_LINE2       2

/* ===== Ve?ejné funkce ===== */

void LCD_Init(void);
void LCD_Clear(void);
void LCD_SetCursor(uint8_t line, uint8_t position);
void LCD_Print(uint8_t line, const char *text);

#endif