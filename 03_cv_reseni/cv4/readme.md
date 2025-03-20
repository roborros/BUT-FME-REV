## 1. Přidejte stejnou funkcionalitu LED3 blika jen po stisku BTN3

```c
// REV GPIO
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

volatile unsigned char TRISD     __at(0xf95);  
volatile unsigned char TRISC     __at(0xf94);

volatile unsigned char TRISA     __at(0xf92);
volatile unsigned char PORTA     __at(0xf80);
volatile unsigned char ANSELA    __at(0xf38);

volatile unsigned char LATD      __at(0xf8c);
volatile unsigned char LATC      __at(0xf8b);
volatile unsigned char PORTC     __at(0xf82);

int main(void) {
    
    TRISD &= ~(1 << 2);     // nastaveni RD2 jako výstup
    TRISC |= 0b1;           // nastavení RC0 jako vstup
    
    TRISA |= (1 << 3);      // nastaveni RA3 jako vstup
    TRISC &= ~(1 << 4);     // nastaveni RC4 jako vystup
    ANSELA &= ~(1 << 3);    // vypnuti analogu
    
    
    while(1){
        
        if (PORTC & 0b1){               //  kontrola stisknutí BTN1
            LATD ^= (1 << 2);           //  prevrácení LED1 pomocí XOR            
        }
        if (PORTA & 0b1000){
            LATC ^= (1 << 4);
        }
        for(long i=1; i<100000; i++);   //  cekání...  
    }
    return 0;                           // nikdy se neprovede
}
```

## 2. Had: Hada predstavuje dvojice sousednich sviticich LED. Had se posouva tak dlouho, než dorazi na konec radku, pak se otoci a plazi se zpet. Sekvence tedy bude vypadat takto: 00011 → 00110 → 01100 → 11000 → 01100 atd.

```c
void had(void){
    unsigned char led_state = 0b110000;
    for (int i = 0; i<4; i++){
        led_state = led_state >> 1;
        driveLED(led_state);
        for(long i=1; i<50000; i++);
    } 
    for (int i = 0; i<4; i++){
        led_state = led_state << 1;
        driveLED(led_state);
        for(long i=1; i<50000; i++);
    }
}
```

## 3. Knight rider: jednotlive LED se postupne poporade rozsveci a pak v opacnem poradi zhasinaji. Na 3 led by sekvence vypadala takto: 000 → 001 → 011 → 111 → 011 → 001

```c
void knight_rider(void){
    unsigned char led_state = 0;
    for (int i = 0; i<6; i++){
        led_state |= (1 << i);
        driveLED(led_state);
        for(long i=1; i<50000; i++);
    } 
    
    for (int i = 5; i>=0; i--){
        led_state &= ~(1 << i);
        driveLED(led_state);
        for(long i=1; i<50000; i++);
    }    
}
```


## 4. Counter strike alias binarni citani, sekvence vypada nasledovne: 0000 → 0001 → 0010 → 0011 → 0100 → …
```c
void counter_strike(void) {
    unsigned char led_state = 0;
    for (int i = 0; i<=64; i++){
        led_state++;
        driveLED(led_state);
        for(long i=1; i<50000; i++);
    }
}
```

## 5. Upravte program tak, aby jedno stisknuti tlacitka BUT1 zmenilo rychlost blikani cele rady LED. Definujte tri rychlosti, prepinejte mezi nimi cyklicky. Nezapomente na debouncing! Tlacitko BUT2 bude funkovat jako Pause/Resume. Tlacitko BUT3 bude fungovat jako prepinac jednotlivych rezimu (viz ulohy 2) - 4)) BONUS: tlacitko BUT4 bude fungovat jako prepinac intenzity svitu LED (pouzijte princip PWM)

```c
// REV GPIO
#pragma config FOSC = HSMP      // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON      // 4X PLL Enable (Oscillator multiplied by 4)
#pragma config PRICLKEN = ON    // Primary clock enable bit (Primary clock is always enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDTEN = OFF      // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <xc.h>
#include <stdbool.h>

#define LED1 LATDbits.LATD2
#define LED2 LATDbits.LATD3
#define LED3 LATCbits.LATC4
#define LED4 LATDbits.LATD4
#define LED5 LATDbits.LATD5
#define LED6 LATDbits.LATD6

#define BTN1 PORTCbits.RC0
#define BTN2 PORTAbits.RA4
#define BTN3 PORTAbits.RA3
#define BTN4 PORTAbits.RA2

void driveLED(char in);

char had(void);
char knight_rider(void);
char counter_strike(void);
char button_press(void);

int main(void) {
    
    TRISDbits.TRISD2 = 0;
    TRISDbits.TRISD3 = 0;
    TRISCbits.TRISC4 = 0;
    TRISDbits.TRISD4 = 0;
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD6 = 0;
    
    TRISCbits.TRISC0 = 1;
    TRISAbits.TRISA4 = 1;
    TRISAbits.TRISA3 = 1;
    ANSELAbits.ANSA3 = 0;
    ANSELAbits.ANSA2 = 0;
    TRISAbits.TRISA2 = 1;
    
    char btn_state = 0;
    char debounce_btn_state = 0;
    char prev_btn_state = 0;
    bool btn_changed = false;
    long btn_timer = 0;
    int mode = 0;
    long delay = 6000;
    bool pause = false;
    long i = 0;
    char led_state;
    char pwm_per = 20;
    int duty = 20;
    
    while(1){        
        
        btn_state = button_press();
        // Debouncing
        if ((btn_state != prev_btn_state) && (prev_btn_state == 0) && btn_changed == false) {
            btn_changed = true;
            btn_timer = i;
        } else {
            debounce_btn_state = 0;
        }
        if (btn_changed && (i - btn_timer > 50)) {
            debounce_btn_state = btn_state;
            btn_changed = false;
        }
        prev_btn_state = btn_state;
        
        switch(debounce_btn_state){
            case 0b100:
                mode++;
                if (mode > 2) mode = 0;
                break;
            case 0b1:
                delay -= 2500;
                if (delay < 1000) delay = 6000;
                break;
            case 0b10:
                pause = ~pause;
                break;
            case 0b1000:
                duty -= 5;
                if (duty < 0) duty = pwm_per;
                break;
        }
        
        if (~pause && i > delay) {
            switch(mode){
                case 0:
                    led_state = had();
                    break;
                case 1:
                    led_state = counter_strike();
                    break;
                case 2:
                    led_state = knight_rider();
                    break;
            }            
            i = 0;
        }
        
        // SW PWM
        if (i % pwm_per <= duty)
            driveLED(led_state);
        else
            driveLED(0);
        
        i++;            
    }
    return 0;                           
}

void driveLED(char in){
        LED6 = in & 1 ? 0 : 1; asm("nop"); //LED0
        LED5 = in & 2 ? 0 : 1; asm("nop"); //LED1
        LED4 = in & 4 ? 0 : 1; asm("nop"); //LED2
        LED3 = in & 8 ? 0 : 1; asm("nop"); //LED3
        LED2 = in & 16 ? 0 : 1; asm("nop"); //LED4
        LED1 = in & 32 ? 0 : 1; asm("nop"); //LED5
}

char had(void){
    static int i = 0;
    static bool state = true;
    static  char led_state = 0b110000;
    
    if (state) {
        led_state = led_state >> 1;        
    } else {
        led_state = led_state << 1;        
    }
    i++;    
    if (i >= 4) {
        i = 0;
        state = ~state;
    }   
    return led_state;
}

char knight_rider(void){
    static char led_state = 0;
    static int i = 0;
    static bool state = true;
    
    if (state) {
        led_state |= (1 << i);        
        i++;
        if (i > 5) state = ~state;
    } else {
        led_state &= ~(1 << i);        
        i--;
        if (i < 0) state = ~state;
    } 
    return led_state;
}

char counter_strike(void) {
    static char led_state = 0;
    static int i = 0;
    
    led_state++;    
    
    if (i > 64 ) {
        i = 0;
        led_state = 0;
    } 
    return led_state;
}

char button_press(void) {
    static char prev_btn = 0;
    char btn;    
    btn = BTN1 | (BTN2 << 1) | (BTN3 << 2) | (BTN4 << 3);    
    return btn;
}
