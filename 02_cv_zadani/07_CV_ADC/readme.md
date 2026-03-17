# 🚀 REV - Sedmé cvičení - ADC/DAC

## 💡 Blokové schema ADC:

<p align="center">
  <img width="850" height="350" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/07_CV_ADC/ADCscheme.png">
</p>

### Konfigurace:

    - žádaným vstupům (piny) je třeba přiřadit analogovou funkci (registry ANSELx)
    - nastavení vstupního rozsahu, tj. volba napěťové reference (pole VCFG v registru ADCON1)
    - nastavení vstupů pro zvolený kanál (AN4 a AN5 v našem případě)
    - zapnutí ADC modulu (ADCON0bits.ADON)

### Čtení:

    - spuštění vzorkování
    - krátká prodleva
    - spuštění konverze (kvantizace)
    - čekání na dokončení konverze (kontrolou ADCON0bits.DONE)
    - čtení výsledku konverze (registr ADRESH nebo ADRESL)


## 🏗️ Přiklad 7.1:
Rozsviťe LED v případě, že je potenciometr v horní polovině svého rozsahu a zhasněte ji, je-li potenciometr v dolní polovině svého rozsahu.
```c

void main(void)
{

    
}
```

## 🏗️ Přiklad 7.2 (je treba LCD knihovna):
Vypište hodnotu z AD převhodníku na LCD displej.
```c


void main(void) {
    
}

```
## 🏗️  Přiklad 7.3 vyvolani preruseni na dokoncenou konverzi a využití timeru:

```c

void main(void) {
    

}

```

## 🏗️  Přiklad 7.4 využití DAC převodníku:

```c

void main(void) {
    

}

```

### 📝 Zadání:

 1) Načítejte hodnoty z potenciometru (vstup AN4) a postupně rozsvicujte jednotlivé LED0-LED5 (bargraph). Použij funkci driveLED.

 2) Vypisujte na UART hodnotu POT1 v celočíselném formátu (cca 1x za sekundu).

 3) Vypisujte POT1 a POT2 na displej ve voltech na na tři desetinná místa (použijte knihovnu pro LCD).
 

