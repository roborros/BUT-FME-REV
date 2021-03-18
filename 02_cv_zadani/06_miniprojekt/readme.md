# REV - MiniProjekt(MechLAB Bandita)

## Zadání
Cílem projektu je vytvořit program hracího automatu na principu jednorukého bandity.

### Funkcionalita:
*	Přes UART se bude posílat číslo 1, 2 nebo 5 symbolizující vhozenou minci. Její hodnota odpovídá počtu pokusů.
*	Počet pokusů/kreditů je zobrazen na LEDkách, 1 LEDka = 1 pokus. Pokud je pokusů více jak 6, tak svítí všechny LEDky.
*	Mince lze hodit kdykoliv během hry a aktualizovaný počet kreditů se ihned zobrazí na LEDkách.
*	Tlačítkem 4 se náhodně vygenerují 3 symboly, které se zobrazí na displej. Symboly mohou být @, #, &, %.
*	Pokud dojde k vygenerování tří stejných symbolů, určí se výhra podle následujícího klíče. Vyhrané kredity se připočítají k celkovým kreditům.
**	#  #  #	 = 5 kreditů
**	@@@ 	= 3 kredity
**	& & &	= 2 kredity
**	% % %	= 1 kredit
*	Pokud v prvním kole nepadla výhra, může se stisknutím tlačítka 1,2 nebo 3 vygenerovat na příslušné pozici nový symbol. Následně se znovu vyhodnotí výhra podle předchozího bodu.
*	Případná výhra se zobrazí na displej.
*	Jednotlivé části programu implementujte jako stavy stavového automatu, dle obrázku níže.
*	V jednotlivých stavech vypisujte aktuální informace do terminálu.


## Postup:

1,	Vytvořte si samostatnou knihovnu pro obsluhu periferie UART.
**	Knihovna bude obsahovat inicializační funkci a funkce pro posílání dat do terminálu
2,	Vytvořte si samostatnou knihovnu pro obsluhu periferie GPIO (LEDky).
**	Knihovna bude obsahovat inicializační funkci a funkce LEDek.
3,	Implementujte funkcionalitu „vhození mince“ přes UART a zobrazení počtu pokusů na LEDkách.
4,	Předchozí funkcionalitu implementujte do vlastní knihovny uživatelských funkcí.
5,	Vytvořte si vlastní funkci pro generování náhodných symbolů.
6,	Vložte do programu LCD knihovnu a využijte ji k zobrazení symbolů z předchozího kroku.
7,	Vytvořte si vlastní funkci pro vyhodnocování výhry.
8,	Implementujte do programu práci s tlačítky s využitím debouncingu. Můžete využít metodu ukázanou na předchozím cvičení.
9,	Implementujte stavový automat. Čekání ve stavu můžete vyřešit funkcí delay.
10,	Na začátek programu doplňte návod k použití, který bude zobrazován v terminálu při startu.
11,	Funkci delay nahraďte pomocí timeru a vlastní funkcí pro kontrolu času stráveného v daném stavu.

  
