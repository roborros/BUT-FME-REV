# REV - Třetí cvičení
- Pole, řetězce, struktury a pointery
## Příklad 3.1: pointery

Vzpomeňte si:

    1)každá proměnná je místo v paměti, opatřené názvem, velikost místa v paměti je daná datovým typem
    2)ukazatel (přesněji ukazatel na DATOVY TYP) je taky promněnná, opatřená názvem, ukládá adresu v paměti
    3)protože ukazatel je datový typ, funkce jej mohou přijímat jako argument nebo jej vracet jako návratovou hodnotu
    
```c
#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
 
#include "rev-basic.h"
#include "simdelay.h"
 
#pragma config WDTEN = OFF
#pragma config FOSC = INTIO7
#pragma config MCLRE = EXTMCLR
#pragma config FCMEN = ON
 
//deklarace
void krat2(int *a);
int *max1(int *q, int *w);
 
 
//main
void main(){
 
    int a, b;      // definice promenne typu int
    int *p_i;      // definice promenne typu ukazatel na int
 
    p_i = &a;      // operator reference, p_i ukazuje na a
 
    REV_init();
 
    printf("Vloz cislo A:");
 
    *p_i = getch() - '0';
    //scanf("%d",p_i);   // stejne jako: scanf("%d",&a);
 
    printf("Cislo A = %d = %d\n",a, *p_i); // * je operator dereference
    printf("Cislo A je na adrese: %p\n",&a);
 
    krat2(&a);     // stejne jako: krat2(p_i);
 
    printf("Cislo A*2 = %d\n",a);    // opet lze pouzit "*p_i" misto "a"
 
     printf("Vloz cislo B:");
 
    p_i = &b;    // zmena reference, p_i ukazuje na b
 
    //scanf("%d",p_i);   // stejne jako: scanf("%d",&a);
    *p_i = getch() - '0';
 
    printf("Cislo B = %d = %d\n",b, *p_i); // * je operator dereference
    printf("Cislo B je na adrese: %p\n",&b);
 
    p_i = max1(&a,&b);
 
    printf("Max (A,B) = %d\n",*p_i); // * je operator dereference
 
    printf("Vetsi bylo %c, tj. cislo na adrese %p\n",p_i == &a ? 'A' : 'B', p_i);
 
    getch();
}
 
 
// definice krat2
void krat2(int *a){
     *a *= 2;    
}
 
// definice max
int *max1(int *a, int* b){
    if(*a > *b) return a;
    return b;
}
```
 ### Program demonstruje základní rysy práce s ukazateli-pointery. Povšimněte si:

   1) ukazatel se definuje jako proměnná, pouze se syntaktickou hvezdičkou navíc: int *p_i;
   2) operátorem reference & se získá adresa proměnné: p_i = &a;
   3) operátorem dereference * se získá hodnota na adrese ukazatele: a = *p_i;
   4) ukazatel jako argument funkce umožňuje tzv. volání referencí, tj. funkce může mj. měnit obsah referencované proměnné

### Úloha 3.2: Cvičení s ukazateli

1) Vytvořte funkci prohod(int *a, int *b), která prohodí obsahy proměnných a a b.
```
Poznámka: s výhodou můžete využít tělo programu z předchozího příkladu.
```
2) Vytvořte funkci pricti(int *a, int prirustek), která k hodnotě proměnné a připočte prirustek.

## Příklad 3.3: Pole

```c
#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
 
#include "rev-basic.h"
#include "simdelay.h"
 
#pragma config WDTEN = OFF
#pragma config FOSC = INTIO7
#pragma config MCLRE = EXTMCLR
#pragma config FCMEN = ON
 
#define DELKA 5
 
// deklarace funkci
int max1(int *p,int len);
void vypis_pole(int *p,int len);
 
// funkce main
void main(void){
 
    // definice pole o delce dane symbolickou konstantou
    // delka musi byt vzdy konstanta!
    int cisla[DELKA];   
 
    /*
    // totez by bylo mozne takto:
    int cisla[5];
    */
 
    int i, a;
 
    REV_init();
 
    // nacitani v cyklu
    for(i = 0; i < DELKA; i++){
          printf("Vloz %d. cislo:", i + 1);
 
          // funkci getch() se zadava ukazatel na prvek pole
          cisla[i] = getch() - '0';
 
    }
 
    // vypis pole - pres index
    for(i = 0; i < DELKA; i++){
          printf("%d. cislo bylo %d\n",i + 1, cisla[i]);
    }
 
    // volani funkci - predava pole=konstantni pointer a delka
    vypis_pole(cisla,DELKA);   // nevraci nic
    a = max1(cisla,DELKA);      // vraci int
 
    printf("Nejvetsi bylo cislo %d\n",a);
 
    getch();
 
}
 
// definice funkce vypis pole
void vypis_pole(int *p,int len){
    int i;
    for(i = 0; i < len; i++){
          printf("%d. cislo bylo %d\n",i + 1, *(p + i) );
    }
}
 
// definice funkce max
int max1(int *p,int len){
    int max, i;
 
    if(len < 1) return 0;
 
    max = p[0];
 
    for(i = 1; i < len; i++){
          max = max > p[i] ? max : p[i];
    }
    return max;
}

```

 ### Povšimněte si:
   1) k prvkům pole se přistupuje prostřednictvím hranatých závorek

   2) pole jsou vždy indexovány od NULY

   3) index posledního prvku je tedy o jedna menší než délka pole

   4) jazyk C nekontroluje meze polí – překladač vás nechá zapisovat libovolně, avšak hrozí přepsání jiných dat, přepsaní textu programu a nebo (nejčastěji) havárie programu.

   5) funkcím se předává pole jako argument pouze prostřednictvím reference

   6) na první pohled tedy nepoznáte, zda se jedná o jednu proměnnou nebo o pole

   7) stejně tak funkce nikdy neví, jak je pole dlouhé

   8) hranaté závorky [] jsou ve skutečnosti operátor ukazatele “n-tá hodnota daného typu, počítáno od ukazatele”

   9) pole je v zásadě konstantní ukazatel


## Úloha 3.4: Polní cvičení

Vytvořte funkci pro práci s poli:

   1) void vypis_obracene(int *pole,int n) - pole procházejte pomocí ukazatele. Argument n udává delku pole.
   2) int sum(int *pole,int n) – sečte n prvních prvků pole pole a vrátí součet
   3) int *max(int *pole,int n) – projde n prvních prvků pole pole a vrátí pointer na nejvyšší hodnotu. V hlavním programu vypište nejvyšší hodnotu a její pozici v poli.
   4) int *najdi(int co, int *kde,int n) – projde n prvních prvků pole kde a vrátí pointer na první výskyt hodnoty co. Vytvořte hlavní program, který od uživatele načte číslo a ve staticky inicializovaném poli nalezne všechny jeho výskyty a vypíše je.
   5) (bonus) int fibonacci(int *pole,int n) – naplní pole prvními n členy Fibonacciho posloupnosti
    
### pole lze staticky inicializovat například takto:
```c
int pole[8] = {1,5,7,6,3,5,2,1};
```
## Úloha 3.5: Řetězce

### Řetězce jsou v C realizovány jako pole typu char, například:
```c
char buf[5];
char retez[80] = "Ahoj!";
```
Důležité je, že řetězec je vždy ukončen znakem '\0' (ordinálni hodnota 0). To znamená, že uložení řetězce “ahoj” vyžaduje pole o minimální délce pět znaků.

1) Vytvořte program, který bude načítat znaky z terminálu pomocí funkce getch() až do načtení konce řádku ('\n'). Znaky ukládejte do řetězce, který poté vypište.

2) Program rozšiřte o funkci int delka(char *ret), který vrátí délku řetězce ve znacích. Využijte procházení pole pomocí indexů.

3) Program rozšiřte o funkci int naopak(char *ret), který vypíše řetězec naopak. Využijte procházení pole pomocí ukazatelů.

## Příklad 4.1: Základní práce se strukturou

-Ukázka demonstruje základní práci se strukturou - definici struktury a datového typu, definici a inicializaci proměnné tohoto typu, práci s prvky struktury, práci s ukazatelem na pointer: 

```c
#include <stdio.h>
#include <stdlib.h>
 
#define DELKA_JMENA 30
 
// definice typu "t_kopec"
typedef struct {
        char jmeno[DELKA_JMENA + 1];
        int vyska;        
}t_kopec;
 
// deklarace fce, ktera prijima parametr typu "t_kopec"
void vypis_kopec(t_kopec kopec);
 
// funkce main
int main(void){
 
    // definice s inicializaci
    t_kopec palacak = {"Palackeho vrch",340};
    t_kopec *aktualni;
 
    // definice bez inicialize
    t_kopec kozi;
 
    // pristup k prvkum struktury
    strncpy(kozi.jmeno,"Kozi hora",DELKA_JMENA);  // nelze kozi.jmeno = "Kozi hora"
    kozi.vyska = 286;
 
    printf("Zname tyto kopce:\n");
 
    // vypis pomoci funkce, ktere predame jednotlive struktury jako parametr
    vypis_kopec(palacak);    
    vypis_kopec(kozi);
 
    // pouzijeme ukazatel
    aktualni = &palacak;
 
    // zmenime hodnotu
    aktualni->vyska = aktualni->vyska + 2;
 
    // a znovu vypiseme
    vypis_kopec(palacak);    
 
    getch();
    return 0;
}
 
// definice fce, ktera prijima parametr typu "t_kopec"
void vypis_kopec(t_kopec kopec){
    printf ("  Kopec jmenem \"%s\" je vysoky %d m\n", kopec.jmeno, kopec.vyska);
}

```
