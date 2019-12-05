
#ifndef REV_BASIC_H
#define	REV_BASIC_H

 
#define _XTAL_FREQ 16000000  

void REV_init(void);

int REV_pot(unsigned char adc_id);
void REV_led(char id, char state);
char REV_btn(char id);

void putch (char c);
char getche (void);
char getch (void);

#endif	/* REV_BASIC_H */

