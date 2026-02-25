# REV - Páte cvičení
- čítače, přerušení


## Příklad 5.1:


## Výpočet:



### Registry:


```c 

void init(void){

}

void main(void) {

}
```

## Příklad 5.2:

```

```

### Nastavení interruptu:


```c
void init(void){
    

}

void main(void) {

}
```

## Rozšiřující úlohy:

1) rozšiřte Ukázku 1 tak, aby po stisknutí tlačítka změnila rychlost blikání. Definujte dvojici symbolických konstant.

2) rozšiřte Ukázku 2 ve stejném duchu jako v úloze tj. pouze použijete přerušení. Tj. upravte program tak, aby do registru TMR1 vkládal jednu ze dvou konstant, které upraví periodu čekání.

3) rozšiřte Ukázku 2 tak, že použijete i druhý časovač (dle datasheetu použijte Timer5) s rozdílnou délkou čítaní a rozblikejte druhou LED, která bude blikat s různou periodou. Stisknutím tlačítka periody blikání prohoďte (tou formou, že vyměníte hodnotu vkládanou do TMR1 a TMR5).

4) použijte druhé tlačítko pro zastavení a znovuspuštěni blikání. Použijte bity TMRxON pro zastavení a znovuspuštěni čítače (T1CONbits.TMR1ON pro TMR1 a T5CONbits.TMR5ON pro TMR5).

5) Vytvořte obecnou obsluhu pomoci přerušení pro všechna 4 tlačítka: pomoci jednoho časovače (tj. použijete jedno přerušení) periodicky detekujte stav na jednotlivých tlačítkách, a prováděje debouncing. V hlavním programu ovládejte celou sadu LED, zobrazujte na ní binární číslo n a reagujte na stisknutí jednotlivých tlačítek následovně:

    - BUT1 – inkrementuje n,
    - BUT2 – dekrementuje n,

## Příklad 5.3:
Jednotlive ISR a hlavní program si mohou předávat informace pomocí globálních proměnných. Tyto proměnné musí být ozančeny jako volatile. Jedná se o informaci pro překladač, aby neprováděl žádné optimalizace. Ten by jinak mohl proměnou považovat za optimalizovatelnou. Proměnná je však potřebná v programu přerušení. Volatile jsou proměnné, které mohou měnit hodnotu asynchronně, nehledě na hlavní program. Případně proměnné. Jsou to i některé SFR např. PORTx mění hodnotu na základě napětí na pinu. V příkladu je takovou proměnou volatile char flag. Slouží k jednoduchému řízení. Je zde zavedene i volatile static uint i. 
jako statické označujeme proměnné, které lze používat pouze vně bloku, v tomto případě jen programu přerušení. Chová se však jako globální proměnná. Zachovává si hodnotu. 

<p align="center">
  <img width="400" height="320" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/05_CV_Timer_ISR/main_isr_flag.png">
</p>
    
```c 



void init(void){
    
}

void main(void) {

}
```
## Další:
1) Rozchoďte TMR1 a TMR2 (TMR2 je trochu jiný--ma jen 8 bitu a obsahuje postscaler, a period register)
2) Použíjte obě priority PIC18 funkce se odlišují  __interrupt(low_priority); __interrupt(high_priority)
3) Je treba nastavit IPRx registry pro low_priority pro TMR2IF
4) Vyšší priorita je schopna přerušit nižší! Vyzkoušejte třeba umístěním while(BTN1), tedy něco co bychom normálně dělat něměli!!
