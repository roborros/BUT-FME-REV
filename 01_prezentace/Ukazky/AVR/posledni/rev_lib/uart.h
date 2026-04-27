#ifndef UART_H
#define	UART_H

#include <stdint.h>

void uart_init(uint32_t f_cpu, uint32_t baud);
void uart_write_byte(uint8_t data);
void uart_write_str(char *str);

#endif	/* UART_H */

