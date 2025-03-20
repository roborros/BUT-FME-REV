/* 
 * File:   UartIO.h
 * Author: adame
 *
 * Created on 21. ledna 2020, 13:05
 */


#ifndef UARTIO_H
#define	UARTIO_H

int UART_GetChar(void);                 // nacte jeden znak
void UART_PutChar(char);               // vypise jeden znak
int UART_CharAvailable(void);           // vrati nenulovou hodnotu prave kdyz je alespon jeden znak k dispozici pro cteni
void UART_PutStr(char * str);   // vypise retezec az do nuloveho znaku
void putch(unsigned char data);
char getch(void);

#endif	