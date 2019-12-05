# REV - První cvičení
- Seznam me se s vývojovým prostředím MPLAB. Stahněte ukázkový projekt, zkompilujte jej a nahrajte do MCU.
## Příklad 1.1
- Následující výpis ukazuje jednoduchý příklad v jazyce C. Program vypisuje hodnotu proměnné count a binárně bliká třemi LEDkami. 
```c
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <xc.h>
 
#include "rev-basic.h"
#include "simdelay.h"
 
#pragma config WDTEN = OFF
#pragma config FOSC = INTIO7
#pragma config MCLRE = EXTMCLR
#pragma config FCMEN = ON
 
void main(void) {
    char count = 0;
    int i;
    char a = 'x';
 
    REV_init();
 
    while(1){
        count++;
 
        REV_led(1,count & 1);
        REV_led(2,count & 2);
        REV_led(3,count & 4);
 
        printf("count: %d (0x%x) (%c)\n",count,count,a);
 
        DelayMs(100);
    }
}
```
