# REV - MiniProjekt(Timer)
Vytvořte program na RevKitu , který realizuje časovač. Hodnotu zobrazujte na LCD displeji. 

## Postup:

  1, Založte projekt pro PIC18f46k22
  2, Nastavte optimalizace na 2
  3, Nastavte potřebné konfigurační bity (FOSC=32MHz, vypnout WDT)
  4, Budeme potřebovat zahrnout stdio.h a stdint.h
  5, Vytvořte knihovnu pro RevKit BSL.h Board Support lib. (založte tam definice GPIO lEDky a Tlacitka)
  6, Vytvorte inicializační funkce pro GPIO a Timer1
  7, Nakonfigurujte Timer1 tak, že dochází k přerušení každých 10ms
  8, Přidejte do projekt knihovnu LCD
  9, Naprogramujte program, který na prvním řádku displeje zobrazí Timer: a na druhém uběhnutý čas ve formátu 00:00.00, tedy      minuty, sekundy a setiny.
  10, Ovládejte časovač tlačítky BTN1-start, BTN2-pause, BTN3 reset (tlačítka kkontrolujte v přerušení + debouncing)
  11, Použíjte switch-case pro jednotlivé režimy
  12, Pokud časovač běží blika celá řada ledek s periodou 1s
