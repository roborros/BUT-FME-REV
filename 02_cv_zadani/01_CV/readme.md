# REV - První cvičení
## Příklad 1.1
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
 
    for(;;){
        count++;
 
        REV_led(1,count & 1);
        REV_led(2,count & 2);
        REV_led(3,count & 4);
 
        printf("count: %d (0x%x) (%c)\n",count,count,a);
 
        DelayMs(100);
    }
}
```
