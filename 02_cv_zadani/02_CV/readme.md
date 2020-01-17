# REV - Druhé cvičení
- Funkce() hlavičkové soubory

## Úloha 2.1

### Vytvořte funkci: 
  1) int smysl_zivota(void) – vrátí číslo 42
  2) int mean(int a, int b, int c) – vrátí průměr hodnot a, b a c
  3) int fakt(int n), která vypočítá hodnotu faktoriálu z čísla n; využijte rekurze
  4) void nasobilka(int x, int n) – vytiskne n prvních násobků čísla x
  5) int next() – první a druhé volání funkce vrátí 1, každý další člen Fibonacciho posloupnosti (využijte statickou lokální proměnnou)

Funkcionalitu ověřte na vhodném testovacím programu. Pracujte s kopii projektu REV_basic

## Úloha 2.2

1) Z předchozí úlohy 6) vytvořte knihovnu tr.c a příslušný hlavičkový soubor tr.h.

  V hlavním souboru main.c načtěte hlavičkový soubor tr.h, načtěte od uživatele strany trojúhelníku a otestuje jednotlivé funkce.

Jak zhruba na to: ve vývojovém prostředí si vytvořte soubor tr.c, a přesuňte do něj definice funkcí. Dále si vytvořte soubor            tr.h, do kterého přesuňte deklarace. Do hlavního souboru pak vložte patřičný #include.
```
Nezapomeňte:
    soubory tr.c a tr.h musí být součástí projektu ve vývojovém prostředí
    pokud prostředí správně nereaguje na změny kódu, zkuste použít volbu “Rebuild all”
```
2) Upravte funkce tr_ok(), tr_plocha() a tr_obvod() tak, aby si modul tr.c “zapamatoval” celkový počet volání funkcí knihovny tr.c. Využijte globální proměnnou, definovanou v modulu tr.c.

## Rekurze:
Rekurzivní volání funkce není defaultně v XC8 podporováno. Problém souvisí s implementací zásobníku tzv. STACK. Pro zprovozněnní následujícího kódu je třeba povolit softwerovou implementaci zásobníku v nastavení kompilátoru. 

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
 
long factorial(int n);

void main(void) {
    char count = 0;
    int i;
    char a = 'x';
 
    REV_init();
 
    for(;;){
        int n = 6;
        printf("Factorial %d je: %ld\n", n, factorial(n));

        __delay_ms(500);
    }
}

long factorial(int n) {
    if (n>=1)
        return n*factorial(n-1);
    else
        return 1;
}
```
