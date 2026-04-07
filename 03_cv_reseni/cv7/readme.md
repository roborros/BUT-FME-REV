## 7 - 1. Vyzkoušejte příklad 7.1 a připojte k adc potenciometr a převeďte hodnotu na napětí ve voltech (float) pošlete zaokrouhleno na 3 číslice.
```c
...
float volt;
while (1)
{
    volt = (float)ADC_read()/(4095)*5;
    sprintf(txbuf, "adc: %.3f V\n", volt);
    uart_write_str(txbuf);
    _delay_ms(100);   
}
```

## 7 - 2. Rozšiřte předchozí úlohu tak, že budete moci změnit kanal ADC a přidejte na něj fotorezistor (měří intenzitu světla).
```c
float pot;
float fotorezistor;
while (1)
{
    pot = (float)ADC_read()/(4095)*5;
    ADC0.MUXPOS = ADC_MUXPOS_AIN2_gc;
    _delay_ms(100);
    fotorezistor = (float)ADC_read()/(4095)*5;
    ADC0.MUXPOS = ADC_MUXPOS_AIN3_gc;
    _delay_ms(100);
    
    sprintf(txbuf, "potenciometr: %.3f V, fotorezistor: %.3f V\n", pot, fotorezistor);
    uart_write_str(txbuf);
}
```

## 7 - 3. Upravte předchozí úlohy tak, že hodnotu z potenciometru zobrazujte na prvním řádku displeje. Hodnotu z fotorezistoru na druhém.
```c
LCD_Init(void);
...
...
sprintf(txbuf, "potak: %.3f V", pot); //text třeba zkratit, 'potenciometr: X.XXX V' se nevleze
LCD_Print(1, txbuf);
sprintf(txbuf, "fotoR: %.3f V", fotorezistor);
LCD_Print(2, txbuf);
```

## 7 - 5. Výstup DAC z předchozí úlohy snímejte pomocí ADC (nastavte také ref 2048 mV) a pošlete hodnotu do PC. Vygenerujte si preciznější sinus tabulku.
```c
// nastavení REF hodnot na 2,048 V
VREF.DAC0REF = VREF_REFSEL_2V048_gc;
VREF.ADC0REF = 0x1; //Datasheet s. 221
...
...
ADC_init();
    uart_init(F_CPU, BAUDRATE);
    dac_init();
    uint16_t i = 0;
    char txbuf[64];
    float dac;
    while (1)
    {
        dac = (float)ADC_read()/(4095)*2;
        sprintf(txbuf, "DAC: %.3f V\n", dac);
        uart_write_str(txbuf);
        
        DAC_setVal(sine_table[i++]);
        if(i >= sizeof(sine_table)/sizeof(sine_table[0])){
            i = 0;
        }
        _delay_ms(100);
    }
```

## 7 - 6. Vygenerujte na DAC trojúhelníkový signál. Snímejte pomocí ADC a zobrazte v PC v MATLABu pomocí serialscope.m
```c
int16_t i = 0;
int8_t add = 10; //krok změny mezi měřeními
while (1)
{
    dac = (float)ADC_read()/(4095)*2;
    sprintf(txbuf, "%.3f\n", dac);
    uart_write_str(txbuf);
    DAC_setVal(i);
    i += add; 
    if((i>1023)||(i<0))
        add = -add;
    _delay_ms(10);
}
```
