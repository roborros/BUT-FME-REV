## 4.2 - 1. Přidejte tlačítko, i pomocí tohoto přístupu a zapněte interní pull-up rezistor.

```c
#define F_CPU 4000000UL    // Definice frekvence (výchozi je 4 MHz)
#include <avr/io.h>
#include <util/delay.h>


int main(void) {
    // Nastavení pinu jako VÝSTUP (Output)
    // Používáme registr DIRSET
    PORTB.DIRSET = PIN3_bm;
    // Nastavení pinu jako VSTUP (Input)
    // Používáme registr DIRCLR
    PORTB.DIRCLR = PIN2_bm;
    // aktivace interního pull-up rezistoru a inverzní logiky
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
    


    while (1) {
        
        // kontrola zmáčknutí tlačítka
        if(PORTB.IN&0b00000100) //lze zadat i v decimálním dormátu (PORTB.IN&4)
        {
            // Překlopení (Toggle) stavu pinu
            // Každým zápisem 1 do OUTTGL se stav LED změní (z 0 na 1 a naopak)
            PORTB.OUTTGL = PIN3_bm;

            // Čekání 
            _delay_ms(500);
        }
    }
}
```

## 4.2 - 2. Zapojte semafor dle obrázku níže. Nastavte příslušné piny jako output a vyzkoušejte funkčnost.

```c
    PORTC.DIRSET = PIN4_bm;  //Red LED
    PORTC.DIRSET = PIN5_bm;  //Yellow LED
    PORTC.DIRSET = PIN6_bm;  //Green LED
    
    //power on LED
    PORTC.OUTSET = PIN4_bm | PIN5_bm | PIN6_bm;
    //alternativně
    //PORTC.OUTSET = 0b01110000;
    //PORTC.OUTSET = 112;
    //PORTC.OUTSET = 0x70;
    //PORTC.OUTSET = (7<<4);
    //PORTC.OUTSET = (1<<4)|(1<<5)|(1<<6);
```

## 4.2 - 3. Knight rider: jednotlivé led se postupně rozsvěcují. Na 3 led sekvence vypadá takto: 000 → 001 → 011 → 111 → 011 → 001

```c
    // vytvoření pole výstupů a ukazatelu na pole
    char raider[6] = {1,3,7,3,1,0};
    int i;
    ... 

    ...
    // nastavení výstupu
    for(i=0;i<6;i++)
    {   
        PORTC.OUT = (raider[i]<<4);
        // Čekání 
        _delay_ms(500);
    }
```

## 4.2 - 4. Counter strike alias binární čítání, sekvence vypadá následovně: 000 → 001 → 010 → 011 → 100 → ...

```c
    char counter = 0;
    ...

    ...
    PORTC.OUT = (counter<<4);
    counter++;
    if(counter>7)
    {counter = 0;}
    // Čekání 
    _delay_ms(500);
```

## Další tlačítko 1. Tlačítka jsou zapojena tak, že mají opačnou logiku, tedy stisknuto je 0. Upravte to v configuračním registru pinu, aby byla invertovaná.

```c
    // Nastavení pinu jako VSTUP (Input)
    // Používáme registr DIRCLR
    PORTB.DIRCLR = PIN2_bm;
    PORTD.DIRCLR = PIN3_bm;

    // aktivace interního pull-up rezistoru a inverzní logiky
    PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
    PORTD.PIN3CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
```

## Další tlačítko 2. Upravte program tak, aby jedno stisknutí tlačítka BUT1 změnilo rychlost blikání celé řady LED. Definujte tři rychlosti, přepínejte mezi nimi cyklicky. (detekujte pouze stisknutí a řešte debouncing)

```c
int counter = 0;
int buffer = 0;
int prew_buffer = 0;
int const0 = 500;
int const1 = 300;
int const2 = 100;
char speed = 0;


while (1) {
    
    // kontrola zmáčknutí tlačítka
    if(PORTB.IN&0b00000100) //lze zadat i v decimálním dormátu (PORTB.IN&4)
    {
        buffer ++;
        if (buffer>1)
        {   
            if(prew_buffer==0) // hledáme náběžnou hranu
                speed++;
                PORTB.OUTSET = PIN3_bm; //kontroa načtení bufferu
            if(buffer>5)
                buffer=5; // ochrana proti přetečení
            prew_buffer = buffer;
        }
    }
    else
    {
        if(buffer>0)
        {
            PORTB.OUTSET = PIN3_bm; //kontroa načtení bufferu
            buffer --;}
        else
        {
            PORTB.OUTCLR = PIN3_bm;
            prew_buffer =0;}
    }
    PORTC.OUTTGL = (7<<4);
    switch(speed){
        case 0:
            _delay_ms(const0);
            break;
        case 1:
            _delay_ms(const1);
            break;
        case 2:
            _delay_ms(const2);
            break;
        default:
            speed = 0;
            
    }
}


```

