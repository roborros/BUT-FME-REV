## 5 - Úlohy 1 - 1. Rozšiřte Ukázku 1. tak, aby po stisknutí tlačítka změnila rychlost blikání. Definujte dvojici symbolických konstant (preprocesor makro #define).

```c
#define F_CPU 4000000UL
#include <avr/io.h>
#define F1 10000
#define F2 20000


int main(void) {
    
    PORTB.DIRSET = PIN3_bm;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    // Nastavení pinu jako VSTUP (Input)
    // Používáme registr DIRCLR
    PORTB.DIRCLR = PIN2_bm;
    // aktivace interního pull-up rezistoru a inverzní logiky
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
    int time = F1;
    while(1){
        if(PORTB.IN&4) // není zaveden debouncing
        {
            if(time==F1)
                time=F2;
            else
                time=F1;
        } 
        if(TCA0.SINGLE.CNT >= time){
            
            TCA0.SINGLE.CNT = 0x0000;
            PORTB.OUTTGL = PIN3_bm;
        
        }   
    } 
}
```

## 5 - Úlohy 1 - 2. Rozšiřte Ukázku 2. ve stejném duchu jako v úloze tj. pouze použijete přerušení. Tj. upravte program tak, aby do registru PER vkládal jednu ze dvou konstant, které upraví periodu.
```c
    ...
        while(1){
        if(PORTB.IN&4) // není zaveden debouncing
        {
            if(TCA0.SINGLE.PER==F1)
                TCA0.SINGLE.PER=F2;
            else
                TCA0.SINGLE.PER=F1;
        } 
```

## 5 - Úlohy 1 - 3. rozšiřte Ukázku 2. tak, že použijete i druhý časovač (TCA1) s rozdílnou délkou čítaní a rozblikejte druhou LED, která bude blikat s různou periodou. Stisknutím tlačítka periody blikání prohoďte (tou formou, že vyměníte hodnotu PER pro timery TCA0 TCA1).
```c
#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 4000000UL
#include <util/delay.h>

#define F1 49999
#define F2 20000

ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTB.OUTTGL = PIN3_bm;

}

ISR(TCA1_OVF_vect){
    
    TCA1.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTC.OUTTGL = PIN4_bm;

}


int main(void) {

    /* timto lze pripojit externi crystal
    _PROTECTED_WRITE(CLKCTRL_XOSCHFCTRLA, 0x05);
    _PROTECTED_WRITE(CLKCTRL_MCLKCTRLA, 0x03);
    
    while (!(CLKCTRL.MCLKSTATUS & (1 << 4)));
    */
    
    // timto lze zmenit frekvenci interniho osci na maximum 24 MHz
    //_PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    // PB3 a PC4 jako out
    PORTB.DIRSET = PIN3_bm;
    PORTC.DIRSET = PIN4_bm;

    
    // interrrupt na preteceni 
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    TCA1.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;

    // nastaveni priod registru (kolik bude perioda??)
    TCA0.SINGLE.PER = F1;
    TCA1.SINGLE.PER = F2;
    // zapneme timer
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    TCA1.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    // globalni enable preruseni
    sei();

    //cli(); to slouzi ke globalnimu vypnuti reruseni
    // Nastavení pinu jako VSTUP (Input)
    // Používáme registr DIRCLR
    PORTB.DIRCLR = PIN2_bm;
    // aktivace interního pull-up rezistoru a inverzní logiky
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
    int carry;
    while(1){
        if(PORTB.IN&4) // není zaveden debouncing
        {
            carry = TCA0.SINGLE.PER;
            TCA0.SINGLE.PER = TCA1.SINGLE.PER;    
            TCA1.SINGLE.PER = carry;       
        } 
    }    
}
```

## 5 - Úlohy 1 - 4. použijte druhé tlačítko pro zastavení a znovuspuštěni blikání. Použijte bity enable pro zastavení a znovuspuštěni čítače.

```c
#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 4000000UL
#include <util/delay.h>

#define F1 49999
#define F2 20000

ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTB.OUTTGL = PIN3_bm;

}

ISR(TCA1_OVF_vect){
    
    TCA1.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTC.OUTTGL = PIN4_bm;

}


int main(void) {

    /* timto lze pripojit externi crystal
    _PROTECTED_WRITE(CLKCTRL_XOSCHFCTRLA, 0x05);
    _PROTECTED_WRITE(CLKCTRL_MCLKCTRLA, 0x03);
    
    while (!(CLKCTRL.MCLKSTATUS & (1 << 4)));
    */
    
    // timto lze zmenit frekvenci interniho osci na maximum 24 MHz
    //_PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    // PB3 a PC4 jako out
    PORTB.DIRSET = PIN3_bm;
    PORTC.DIRSET = PIN4_bm;

    
    // interrrupt na preteceni 
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    TCA1.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;

    // nastaveni priod registru (kolik bude perioda??)
    TCA0.SINGLE.PER = F1;
    TCA1.SINGLE.PER = F2;
    // zapneme timer
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    TCA1.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    // globalni enable preruseni
    sei();

    //cli(); to slouzi ke globalnimu vypnuti reruseni
    // Nastavení pinu jako VSTUP (Input)
    // Používáme registr DIRCLR
    PORTB.DIRCLR = PIN2_bm;
    PORTC.DIRCLR = PIN3_bm;
    // aktivace interního pull-up rezistoru a inverzní logiky
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
    PORTC.PIN3CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
    int carry;
    while(1){
        if(PORTB.IN&4)
        {
            _delay_ms(400);
            carry = TCA0.SINGLE.PER;
            TCA0.SINGLE.PER = TCA1.SINGLE.PER;    
            TCA1.SINGLE.PER = carry;       
        } 
        if(PORTC.IN&8) 
        {
            _delay_ms(150);
            TCA0.SINGLE.CTRLA ^= TCA_SINGLE_ENABLE_bm;  
            TCA1.SINGLE.CTRLA ^= TCA_SINGLE_ENABLE_bm; 
        } 
    }    
}
```

## 5 - Úlohy 1 - 5. Vytvořte obecnou obsluhu pomoci přerušení pro obě 2 tlačítka: pomoci jednoho časovače (tj. použijete jedno přerušení) periodicky detekujte stav na jednotlivých tlačítkách, a prováděje debouncing. V hlavním programu ovládejte celou sadu semafaru RGB led, zobrazujte na ních binární číslo n a reagujte na stisknutí jednotlivých tlačítek následovně: BUT1 – inkrementuje n, BUT2 – dekrementuje n,


```c
#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 4000000UL
#include <util/delay.h>

ISR(TCA0_OVF_vect){
    static int prev1=0;
    static int prev2=0;

    int state;
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    if(PORTB.IN&4)
    {
        if(prev1==0)
        {
            prev1==1;
            state = (PORTC.IN&(7<<4))>>4; // hodnoty na pinech 4,5,6
            state++;
            if(state>7)
            {state=0;}
            PORTC.OUT = (state<<4);
        }
    }
    else
    {
        prev1==0;
    }
    if(PORTC.IN&8)
    {
        if(prev2==0)
        {
            prev2==1;
            state = (PORTC.IN&(7<<4))>>4; // hodnoty na pinech 4,5,6
            state--;
            if(state<0)
            {state=7;}
            PORTC.OUT = (state<<4);
        }
    }
    else
    {
        prev2==0;
    }
}


int main(void) {

    /* timto lze pripojit externi crystal
    _PROTECTED_WRITE(CLKCTRL_XOSCHFCTRLA, 0x05);
    _PROTECTED_WRITE(CLKCTRL_MCLKCTRLA, 0x03);
    
    while (!(CLKCTRL.MCLKSTATUS & (1 << 4)));
    */
    
    // timto lze zmenit frekvenci interniho osci na maximum 24 MHz
    //_PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    // PB3 a PC4,5,6 jako out
    PORTB.DIRSET = PIN3_bm;
    PORTC.DIRSET = PIN4_bm;
    PORTC.DIRSET = PIN5_bm;
    PORTC.DIRSET = PIN6_bm;

    
    // interrrupt na preteceni 
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;

    // nastaveni priod registru (kolik bude perioda??)
    TCA0.SINGLE.PER = 10000;
    // zapneme timer
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
    // globalni enable preruseni
    sei();

    //cli(); to slouzi ke globalnimu vypnuti reruseni
    // Nastavení pinu jako VSTUP (Input)
    // Používáme registr DIRCLR
    PORTB.DIRCLR = PIN2_bm;
    PORTC.DIRCLR = PIN3_bm;
    // aktivace interního pull-up rezistoru a inverzní logiky
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
    PORTC.PIN3CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
    while(1){

    }    
}
```

## 5 - Úlohy 2 - 1. Nakonfigurujte externí interrupt i na další přídavné tlačítko. Připojte ho na vybraný pin.
```c
#include <avr/io.h>
#include <avr/interrupt.h>


void io_init(void) {
    // PB3, PC4 out
    PORTB.DIRSET = PIN3_bm;
    PORTC.DIRSET = PIN4_bm;

    // PB2, PC3 je vstup
    PORTB.DIRCLR = PIN2_bm;
    PORTC.DIRCLR = PIN3_bm;

    // PULL-UP a preruseni na sestupnou hranu
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_ISC_FALLING_gc;
    PORTC.PIN3CTRL = PORT_PULLUPEN_bm | PORT_ISC_FALLING_gc;

}  

ISR(PORTB_PORT_vect) {
    // Kontrola, zda přerušení způsobil PIN2 (pomocí registru INTFLAGS)
    if (PORTB.INTFLAGS & PIN2_bm) {
        
        // Otočení (toggle) stavu pinu PB3
        PORTB.OUTTGL = PIN3_bm;

        // Vynulování příznaku přerušení pro PIN2
        PORTB.INTFLAGS = PIN2_bm;
    }
}

ISR(PORTC_PORT_vect) {
    // Kontrola, zda přerušení způsobil PIN3 (pomocí registru INTFLAGS)
    if (PORTC.INTFLAGS & PIN3_bm) {
        
        // Otočení (toggle) stavu pinu PC4
        PORTC.OUTTGL = PIN4_bm;

        // Vynulování příznaku přerušení pro PIN3
        PORTC.INTFLAGS = PIN3_bm;
    }
}


int main(void) {
    
    io_init();
    
    sei(); // globalni povoleni preruseni

    while (1) {
        // nic tu neni, ale musi byt loop
    }
}
```

## 5 - Úlohy 2 - 2. Rozchoďte i druhý typ timeru TCB (je trochu jiný než TCA). Nastavte main clk na 24MHz a nastavte TCB a jeho přerušení tak, že bliknete LED každých 100ms.
```c
#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 24000000UL
#include <util/delay.h>

ISR(TCB0_INT_vect){
    static int counter=0;
    counter++;
    TCB0.INTFLAGS = TCB_CAPT_bm;
    if(counter==100){
    PORTB.OUTTGL = PIN3_bm;
    counter=0;
    }
}

int main(void) {

    /* timto lze pripojit externi crystal
    _PROTECTED_WRITE(CLKCTRL_XOSCHFCTRLA, 0x05);
    _PROTECTED_WRITE(CLKCTRL_MCLKCTRLA, 0x03);
    
    while (!(CLKCTRL.MCLKSTATUS & (1 << 4)));
    */
    
    // timto lze zmenit frekvenci interniho osci na maximum 24 MHz
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    // PB3 jako out
    PORTB.DIRSET = PIN3_bm;
    
    // interrrupt na preteceni 
    TCB0.INTCTRL = TCB_CAPT_bm;
    // TCB nemá nastavení periody, musí se nastavit CNT tak, aby za určitý počet tiků došlo k přetečení
    TCB0.CCMP = 11999;
    // zapneme timer
    TCB0.CTRLA = TCB_CLKSEL_DIV2_gc | TCB_ENABLE_bm;
    // globalni enable preruseni
    sei();

    //cli(); to slouzi ke globalnimu vypnuti preruseni

    while(1){ 

    }    
}
```

## 5 - Úlohy 2 - 3. Zkuste použít priority přerušení, kde můžete jednomu ISR přidělit vyšší prioritu tak, že může přerušovat ostatní. (datasheet str. 135)
```c
#include <avr/io.h>
#include <avr/interrupt.h>


#define F_CPU 24000000UL
#include <util/delay.h>

#define BAUDRATE 115200UL

ISR(TCA0_OVF_vect){
    
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
    
    PORTB.OUTTGL = PIN3_bm;

}

ISR(USART3_RXC_vect)
{   
    uint8_t received_char = USART3.RXDATAL;
    
    while (!(USART3.STATUS & USART_DREIF_bm));
    USART3.TXDATAL = received_char;
   
}


void uart_init(uint32_t f_cpu, uint32_t baud)
{
    // nastaveni pinu TX RX
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;

    // baudrate str. 380
    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);\
    // zapnuti TX a RX        
    USART3.CTRLB |= USART_TXEN_bm | USART_RXEN_bm;
    // zapnuti RX interrupt
    USART3.CTRLA = USART_RXCIE_bm;
}

void timer_init(void)
{
    // interrrupt na preteceni 
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    // nastaveni priod registru (kolik bude perioda??)
    TCA0.SINGLE.PER = 49999;
    // zapneme timer
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV64_gc | TCA_SINGLE_ENABLE_bm;
}


int main(void) {

    /* timto lze pripojit externi crystal
    _PROTECTED_WRITE(CLKCTRL_XOSCHFCTRLA, 0x05);
    _PROTECTED_WRITE(CLKCTRL_MCLKCTRLA, 0x03);
    
    while (!(CLKCTRL.MCLKSTATUS & (1 << 4)));
    */
    
    // timto lze zmenit frekvenci interniho osci na maximum 24 MHz
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
            
    uart_init(F_CPU, BAUDRATE);
    timer_init();
    
    // PB3 jako out
    PORTB.DIRSET = PIN3_bm;
    
    //přijmani znaku přes UART má vyšší prioritu
    CPUINT.LVL1VEC = USART3_RXC_vect_num;
    
    // globalni enable preruseni
    sei();

    //cli(); to slouzi ke globalnimu vypnuti reruseni

    while(1){ 

    }    
}
```
