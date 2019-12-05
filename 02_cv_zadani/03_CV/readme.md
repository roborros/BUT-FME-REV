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
