#include "lcd.h"

#define F_CPU 4000000UL
#include <util/delay.h>

/* ===== PCF8574 bit map ===== */
#define LCD_BACKLIGHT  0x08
#define LCD_ENABLE     0x04
#define LCD_RW         0x02
#define LCD_RS         0x01

/* ================================================= */
/*                    TWI INIT                       */
/* ================================================= */

static void TWI0_Init(void)
{
    
    TWI0.MBAUD = (uint8_t)((F_CPU / (2 * 100000)) - 6);;
    TWI0.MCTRLA = TWI_ENABLE_bm;
    TWI0.MSTATUS = TWI_BUSSTATE_IDLE_gc;
}

static void TWI0_Start(uint8_t address)
{
    TWI0.MADDR = (address << 1);
    while (!(TWI0.MSTATUS & TWI_WIF_bm));
}

static void TWI0_Write(uint8_t data)
{
    TWI0.MDATA = data;
    while (!(TWI0.MSTATUS & TWI_WIF_bm));
}

static void TWI0_Stop(void)
{
    TWI0.MCTRLB = TWI_MCMD_STOP_gc;
}

/* ================================================= */
/*                    LCD LOW LEVEL                  */
/* ================================================= */

static void LCD_WriteNibble(uint8_t nibble, uint8_t control)
{
    uint8_t data = (nibble & 0xF0) | control | LCD_BACKLIGHT;

    TWI0_Write(data);
    TWI0_Write(data | LCD_ENABLE);
    _delay_us(1);
    TWI0_Write(data & ~LCD_ENABLE);
}

static void LCD_Send(uint8_t value, uint8_t mode)
{
    TWI0_Start(LCD_ADDR);

    LCD_WriteNibble(value & 0xF0, mode);
    LCD_WriteNibble((value << 4) & 0xF0, mode);

    TWI0_Stop();
}

/* ================================================= */
/*                    PUBLIC API                     */
/* ================================================= */

void LCD_Init(void)
{
    TWI0_Init();
    _delay_ms(50);

    // 4bit inicializace HD44780
    LCD_Send(0x33, 0);
    LCD_Send(0x32, 0);
    LCD_Send(0x28, 0); // 4bit, 2 ?ádky
    LCD_Send(0x0C, 0); // display ON
    LCD_Send(0x06, 0); // entry mode
    LCD_Send(0x01, 0); // clear

    _delay_ms(2);
}

void LCD_Clear(void)
{
    LCD_Send(0x01, 0);
    _delay_ms(2);
}

void LCD_SetCursor(uint8_t line, uint8_t position)
{
    uint8_t addr;

    if(line == LCD_LINE1)
        addr = 0x80 + position;
    else
        addr = 0xC0 + position;

    LCD_Send(addr, 0);
}

void LCD_Print(uint8_t line, const char *text)
{
    LCD_SetCursor(line, 0);

    while(*text)
    {
        LCD_Send(*text++, LCD_RS);
    }
}