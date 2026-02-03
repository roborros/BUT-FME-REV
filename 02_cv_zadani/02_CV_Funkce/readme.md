# 🚀 REV - Druhé cvičení-Funkce()
```c
// REV-funkce

#include <stdio.h>
#include <stdint.h>

// deklarace
void tisk(void);
int16_t sum(int16_t a, int16_t b);

void main(void) {
    
    
    int16_t a=10, b=20;
    
    char i=10;
    while(i--){
    	
        tisk();
		printf("Iterace: %d\n", i);
        printf("Sum je: %d\n", sum(a, b)); 
    }
}

// definice
void tisk(void){
    printf("Tisk Z funkce\n");
}

// definice
int16_t sum(int16_t a, int16_t b)
{
    return a + b;
}
```

## 📋 Úloha 2.1

### Vytvořte funkci: 
  1) int smysl_zivota(void) – vrátí číslo 42
  2) int mean(int a, int b, int c) – vrátí průměr hodnot a, b a c
  3) int fakt(int n), která vypočítá hodnotu faktoriálu z čísla n;
  4) void nasobilka(int x, int n) – vytiskne n prvních násobků čísla x
  5) int next() – první a druhé volání funkce vrátí 1, každý další člen Fibonacciho posloupnosti (využijte statickou lokální proměnnou)


## 📋 Úloha 2.2

1) Z předchozí úlohy vytvořte knihovnu fun.c a příslušný hlavičkový soubor fun.h.

  V hlavním souboru main.c načtěte hlavičkový soubor fun.h

Jak zhruba na to: 
ve vývojovém prostředí si vytvořte soubor fun.c, a přesuňte do něj definice funkcí. Dále si vytvořte soubor            fun.h, do kterého přesuňte deklarace. Do hlavního souboru pak vložte patřičný #include.
```
Nezapomeňte:
    soubory fun.c a fun.h musí být součástí projektu ve vývojovém prostředí
```

## 📋 Úloha 2.3

### Vytvořte funkci: 
  1) vytvořte funkci, která ověří, že je číslo prvočíslem.
  2) vytvořte funkci, která převede dvě 8bit čísla na jedno 16bit. (spojí horní a dolní bajt)
  3) vytvořte funkci long decToBin(int), která převede desítkové číslo na binarní (tedy 11dec je 1011b).


## 🏗️ Úloha 2.4: Rekurze:
Je na místě zapamatovat si, že rekurze často vede k velmi elegantní implementaci poměrně složitých problémů, ale je také více náročna na zdroje. V emebdded systémech to není nejlepší cesta. Implementace pomocí cyklů, bude také často rychlejší.


```c
// REV-Funkce

#include <stdio.h>
#include <stdint.h>

int sum(int n);

void main(void) {


    char cislo;
    printf("Vloz cislo:");
    cislo = getchar() - '0';
    printf("\n");
        
    printf("Suma %d je: %ld\n", (int)cislo, sum((int)cislo));

}

int sum(int n) {
    if (n!=0)
        return n + sum(n-1);
    else
        return n;
}
```
### 📋 Úkol
  1) Upravte program tak, že vypočítate faktorial n!. (Použijte zase rekurzi)

# 🚀 Prompty pro studium C

Tento seznam obsahuje prompty pro LLM (jako Gemini nebo ChatGPT)

---

## ⚙️ 1. Funkce a jejich mechanismy
**Prompt:**
> Vysvětli princip fungování funkcí v C na příkladu výpočtu obsahu obdélníka:
> - **Prototypy:** Rozdíl mezi deklarací (nad `main`) a definicí (pod `main`).
> - **Pass by Value:** Vysvětlení, že funkce pracuje s kopií dat a neovlivňuje původní proměnné.
> - **Typy funkcí:** Rozdíl mezi `void` (pro akce) a návratovými typy (pro výpočty).
> - **Scope:** Životní cyklus a viditelnost lokálních proměnných.

## 📁 2. Rozdělení kódu do souborů (.h a .c)
**Prompt:**
> Vysvětli princip spolupráce mezi hlavičkovým (.h) a zdrojovým (.c) souborem:
> - **Mechanismus #include:** Jak funguje vkládání obsahu jednoho souboru do druhého.
> - **Ochrana hlaviček:** K čemu slouží blok `#ifndef / #define / #endif` (tzv. Header Guards).
> - **Oddělení popisu od práce:** Proč hlavička obsahuje jen "seznam" funkcí a .c soubor jejich "logiku".
> - **Cesta k souborům:** Rozdíl mezi použitím `< >` a `" "`.

---

## 🌐 8. Viditelnost proměnných: extern a static
**Prompt:**
> Vysvětli rozdíl v přístupu k proměnným napříč soubory:
> - **Klíčové slovo `extern`:** Jak sdílet jednu globální proměnnou mezi více .c soubory.
> - **Globální `static`:** Jak omezit viditelnost proměnné pouze na jeden konkrétní soubor (soukromá proměnná).
> - **Lokální `static`:** Jak zařídit, aby si funkce "pamatovala" hodnotu proměnné i po svém skončení mezi jednotlivými voláními.
> - **Lifetime vs. Scope:** Rozdíl mezi tím, jak dlouho proměnná žije a odkud je vidět.
---

