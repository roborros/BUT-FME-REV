# REV - Druhé cvičení
- Funkce()

## Úloha 2.1

### Vytvořte funkci: 
  1) int smysl_zivota(void) – vrátí číslo 42
  2) int mean(int a, int b, int c) – vrátí průměr hodnot a, b a c
  3) int fakt(int n), která vypočítá hodnotu faktoriálu z čísla n;
  4) void nasobilka(int x, int n) – vytiskne n prvních násobků čísla x
  5) int next() – první a druhé volání funkce vrátí 1, každý další člen Fibonacciho posloupnosti (využijte statickou lokální proměnnou)

Funkcionalitu ověřte na vhodném testovacím programu. Pracujte s kopii projektu REV_basic

## Úloha 2.2

1) Z předchozí úlohy vytvořte knihovnu fun.c a příslušný hlavičkový soubor fun.h.

  V hlavním souboru main.c načtěte hlavičkový soubor fun.h

Jak zhruba na to: ve vývojovém prostředí si vytvořte soubor fun.c, a přesuňte do něj definice funkcí. Dále si vytvořte soubor            fun.h, do kterého přesuňte deklarace. Do hlavního souboru pak vložte patřičný #include.
```
Nezapomeňte:
    soubory tr.c a tr.h musí být součástí projektu ve vývojovém prostředí
    pokud prostředí správně nereaguje na změny kódu, zkuste použít volbu “Rebuild all”
```

## Úloha 2.3

### Vytvořte funkci: 
  1) vytvořte funkci long decToBin(int), která převede desítkové číslo na binarní (tedy 11dec je 1011b).
  2) vytvořte funkci, která ověří, že je číslo prvočíslem.
  3) vytvořte funkci, která převede dvě 8bit čísla na jedno 16bit. (spojí horní a dolní bajt)


## Úloha 2.4: Rekurze:
Rekurzivní volání funkce není ve výchozím nastavení XC8 podporováno. Problém souvisí s implementací zásobníku tzv. STACK. Pro zprovoznění následujícího kódu, je třeba povolit softwerovou implementaci zásobníku v nastavení kompilátoru. 

Je na místě zapamatovat si, že rekurze často vede k velmi elegantní implementaci poměrně složitých problémů, ale je také více náročna na zdroje. V emebdded systémech to není nejlepší cesta. Implementace pomocí cyklů, bude také často rychlejší.

```c
// REV-Funkce
#pragma config FOSC = HSMP          // Oscillator Selection bits (HS oscillator (medium power 4-16 MHz))
#pragma config PLLCFG = ON          // 4X PLL Enable (Oscillator used directly)
#pragma config PRICLKEN = ON        // Primary clock enable bit (Primary clock is always enabled)
#pragma config WDTEN = OFF          // Watchdog Timer Enable bits (Watch dog timer is always disabled. SWDTEN has no effect.)

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <xc.h>
 
#include "rev-basic.h"
 
long sum(int n);

void main(void) {

    REV_init();
 
    for(;;){
        int n = 10;
        printf("Suma %d je: %ld\n", n, sum(n));

        __delay_ms(500);
    }
}

long sum(int n) {
    if (n!=0)
        return n + sum(n-1);
    else
        return n;
}
```
### Úkol
  1) Upravte program tak, že vypočítate faktorial n!. (Použijte zase rekurzi)
