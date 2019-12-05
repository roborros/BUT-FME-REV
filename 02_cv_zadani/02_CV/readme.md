# REV - Druhé cvičení
- Dnes se naučíme používat funkce a hlavičkové soubory.
## Úloha 2.1
### Vytvořte funkci: 
  1) int smysl_zivota(void) – vrátí číslo 42
  2) int mean(int a, int b, int c) – vrátí průměr hodnot a, b a c
  3) int fakt(int n), která vypočítá hodnotu faktoriálu z čísla n; využijte rekurze
  4) void nasobilka(int x, int n) – vytiskne n prvních násobků čísla x
  5) int next() – první a druhé volání funkce vrátí 1, každý další člen Fibonacciho posloupnosti (využijte statickou lokální proměnnou)

  6) vytvořte sadu funkcí, kde všechny funkce načítají tři parametry typu double a interpretuje je jako strany trojúhelníka:
    tr_ok() – vrací 1 pokud jsou strany platné
    tr_obvod() – vrací obvod trojúhelníka, pokud není platný vrací -1;
    tr_plocha() – vrací plochu trojúhelníka, pokud není platný vrací -1;

Funkcionalitu ověřte na vhodném testovacím programu. 

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
