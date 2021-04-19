/* 
 * File:   gpio.h
 * Author: adame
 *
 * Created on 12. b?ezna 2021, 14:41
 */

#ifndef GPIO_H
#define	GPIO_H

#define LED1 LATDbits.LD2
#define LED2 LATDbits.LD3
#define LED3 LATCbits.LC4
#define LED4 LATDbits.LD4
#define LED5 LATDbits.LD5
#define LED6 LATDbits.LD6

#define BTN1 PORTCbits.RC0
#define BTN2 PORTAbits.RA4
#define BTN3 PORTAbits.RA3
#define BTN4 PORTAbits.RA2

#define RAISING_EDGE 0b01111111
#define FALLING_EDGE 0b10000000

typedef struct {
    char btn1_acc;
    char btn1_stat;
    
    char btn2_acc;
    char btn2_stat;
    
    char btn3_acc;
    char btn3_stat;
    
    char btn4_acc;
    char btn4_stat;
}btn_filter_t;

void gpio_init(void);
void gpio_drive_led(char input);
void gpio_btn_check(void);
char gpio_btn_state(char btn);
#endif	/* GPIO_H */

