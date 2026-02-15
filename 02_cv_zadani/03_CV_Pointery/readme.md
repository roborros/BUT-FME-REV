# 🚀 REV - Třetí cvičení
- Pole, řetězce, struktury a pointery
## Příklad 3.1: pointery

💡 Vzpomeňte si:

   1)každá proměnná je místo v paměti, opatřené názvem, velikost místa v paměti je daná datovým typem
   
   2)ukazatel (přesněji ukazatel na DATOVY TYP) je taky promněnná, opatřená názvem, ukládá adresu v paměti
   
   3)protože ukazatel je datový typ, funkce jej mohou přijímat jako argument nebo jej vracet jako návratovou hodnotu
    
<p align="center">
  <img width="200" height="360" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/03_CV_Pointery/PointerMemory.png">
</p>
    
```c
#include <stdio.h>
 
//deklarace

void krat2(int *a);
int *max1(int *q, int *w);
 

int main(void){
  
        int a, b;      // deklarace promenne typu int
        int *p_i;      // deklarace promenne typu ukazatel na int

        p_i = &a;      // operator reference, p_i ukazuje na a

        printf("Vloz cislo A:");

        scanf("%d",p_i);   // stejne jako: scanf("%d",&a);

        printf("Cislo A = %d = %d\n", a, *p_i); // * je operator dereference
        printf("Cislo A je na adrese: %p = %p\n", &a, p_i);

        krat2(&a);     // stejne jako: krat2(p_i);

        printf("Cislo A*2 = %d\n",a);    // opet lze pouzit "*p_i" misto "a"

        printf("Vloz cislo B:");

        p_i = &b;    // zmena reference, p_i ukazuje na b

        scanf("%d",p_i);   // stejne jako: scanf("%d",&a);

        printf("Cislo B = %d = %d\n",b, *p_i); // * je operator dereference
        printf("Cislo B je na adrese: %p = %p\n",&b, p_i);

        p_i = max1(&a,&b);

        printf("Max (A,B) = %d\n",*p_i); // * je operator dereference
        
        void* p_v = &a; // void pointer ukazuje na bunku v pameti, ale nelze dereferencovat
        
        a = 771;
        
        printf("a: %d\n", a);
        printf("Prvni: %d a druhy: %d bajt \n", *(char*)p_v, *(char*)(p_v+1));

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
 ### ⚠️ Program demonstruje základní rysy práce s ukazateli-pointery. Povšimněte si:

   1) ukazatel se definuje jako proměnná, pouze se syntaktickou hvezdičkou navíc: int *p_i;
   2) operátorem reference & se získá adresa proměnné: p_i = &a;
   3) operátorem dereference * se získá hodnota na adrese ukazatele: a = *p_i;
   4) ukazatel jako argument funkce umožňuje tzv. volání referencí, tj. funkce může mj. měnit obsah referencované proměnné

### 📋 Úloha 3.2: Cvičení s ukazateli

1) Vytvořte funkci prohod(int *a, int *b), která prohodí obsahy proměnných a a b.

```
Poznámka: s výhodou můžete využít tělo programu z předchozího příkladu.
```
2) Vytvořte funkci pricti(int *a, int prirustek), která k hodnotě proměnné a připočte prirustek.

## 🏗️ Příklad 3.3: Pole

```c
#include <stdio.h>

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

        // nacitani v cyklu
        for(i = 0; i < DELKA; i++){
              printf("Vloz %d. cislo:\n", i + 1);

              // funkci getchar() se zadava ukazatel na prvek pole
              cisla[i] = getchar() - '0';
              getchar();
        }

        // vypis pole - pres index
        for(i = 0; i < DELKA; i++){
              printf("%d. cislo bylo %d\n",i + 1, cisla[i]);
        }

        // volani funkci - predava pole=konstantni pointer a delka
        vypis_pole(cisla,DELKA);   // nevraci nic
        a = max1(cisla,sizeof(cisla)/sizeof(cisla[0]));      // vraci int

        printf("Nejvetsi bylo cislo %d\n",a);

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
        if(max < p[i]){
          max = p[i];
        }
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


## 📋 Úloha 3.4: Polní cvičení

Vytvořte funkci pro práci s poli:

   1) void vypis_obracene(int *pole,int n) - pole procházejte pomocí ukazatele. Argument n udává delku pole.
   2) int sum(int *pole,int n) – sečte n prvních prvků pole pole a vrátí součet
   3) int *max(int *pole,int n) – projde n prvních prvků pole a vrátí pointer na nejvyšší hodnotu. V hlavním programu vypište nejvyšší hodnotu a její pozici v poli.
   4) void reverse(int *pole, int n) – obrati pole
   
### pole lze staticky inicializovat například takto:

```c
int pole[8] = {1,5,7,6,3,5,2,1};
```

## 📋 Úloha 3.5: Řetězce

### Řetězce jsou v C realizovány jako pole typu char, například:
```c
char buf[5];
char retez[80] = "Ahoj!";
```
Důležité je, že řetězec je vždy ukončen znakem '\0' (ordinálni hodnota 0). To znamená, že uložení řetězce “ahoj” vyžaduje pole o minimální délce pět znaků.

1) Vytvořte program, který bude načítat znaky z terminálu pomocí funkce getchar() až do načtení konce řádku ('\n'). Znaky ukládejte do řetězce, který poté vypište.

2) Program rozšiřte o funkci int delka(char *ret), který vrátí délku řetězce ve znacích. Využijte procházení pole pomocí indexů.

3) Program rozšiřte o funkci int naopak(char *ret), který vypíše řetězec naopak. Využijte procházení pole pomocí ukazatelů.

## 🏗️ Příklad 3.6: Základní práce se strukturou

- Ukázka demonstruje základní práci se strukturou - definici struktury a datového typu, definici a inicializaci proměnné tohoto typu, práci s prvky struktury, práci s ukazatelem: 

```c
#include <stdio.h>
#include <string.h>	// obsahuje strcpy

typedef struct{
    char    jmeno[25];
    int     vek;
    int     vyska;
    void (*pozdrav)(void);
} clovek;

int zmer(clovek* kdo);
void pozdrav(void);

int main() {

        clovek Petr = {"Petr Novak", 25, 178};
        clovek Michal;
        Michal.pozdrav = &pozdrav;

        clovek* p_Petr = &Petr;

        Michal.vek = 16;
        Michal.vyska = 193;

        strcpy(Michal.jmeno, "Michal Novak");

        printf("Petr ma %d let\n",  Petr.vek);
        printf("Michal se jmenuje %s\n",  Michal.jmeno);

        printf("Petr meri %d cm\n",  p_Petr->vyska);

        printf("Michal ma %d let\n", zmer(&Michal));
        
        Michal.pozdrav();

    return 0;
}

int zmer(clovek *kdo){
	return kdo->vyska;
}

void pozdrav(void){
	printf("Ahoj\n");
}
```



# 🚀 Prompty pro studium C

Tento seznam obsahuje prompty pro LLM (jako Gemini nebo ChatGPT)

---
## 📍 1. Pointery (Ukazatele) a paměť
**Prompt:**
> Vysvětli základy pointerů v C:
> - **Operátory `&` a `*`:** Rozdíl mezi získáním adresy a čtením hodnoty z adresy.
> - **Typy:** Co nám říká typ pointeru (např. `int32_t *`) o datech, na která ukazuje.
> - **NULL:** Význam `NULL` pointeru jako bezpečnostního prvku.

## 📏 2. Pole a Pointerová aritmetika
**Prompt:**
> Vysvětli vztah mezi polem a ukazatelem:
> - **Identita:** Proč je jméno pole v podstatě pointer na první prvek.
> - **Aritmetika:** Jak funguje posouvání v paměti pomocí `*(ptr + i)`.
> - **Funkce:** Jak správně předat pole do funkce (včetně předání jeho délky).

---

## 🔤 3. Znaky a řetězce (Strings)
**Prompt:**
> Vysvětli práci s textem v C jako s polem charakterů:
> - **Null Terminator:** Význam znaku `\0` pro ukončení řetězce a jeho vliv na délku pole.
> - **Literály:** Rozdíl mezi zápisem znaků v `' '` a řetězců v `" "`.
> - **Knihovna <string.h>:** Proč pro práci s textem potřebujeme funkce jako `strlen`, `strcpy` a `strcmp` namísto běžných operátorů.
> - **Bezpečnost:** Na co si dát pozor, aby nedošlo k přetečení pole při kopírování textu.

---

## 🧠 4. Dynamická alokace a alokace ve funkcích
**Prompt:**
> Vysvětli principy správy paměti na haldě (heap):
> - **malloc & free:** Základní životní cyklus paměti a prevence Memory Leaků.
> - **Alokace skrze argument:** Proč pro alokaci paměti uvnitř funkce potřebujeme double pointer (`**`).
> - **Předávání adresou:** Rozdíl mezi změnou hodnoty a změnou adresy, na kterou pointer ukazuje.
> - **Bezpečnost:** Kontrola návratové hodnoty mallocu a nulování pointerů po uvolnění.
---

## 🏗️ 5. Složené typy a paměť (struct, union, enum)
**Prompt:**
> Vysvětli tvorbu vlastních datových typů a jejich uložení v paměti:
> - **Struct & Padding:** Jak definovat strukturu a proč vzniká "vatar" (padding) mezi prvky kvůli zarovnání paměti.
> - **Typedef:** Vytváření čitelných přezdívek pro složité typy.
> - **Union:** Sdílení jednoho paměťového místa různými proměnnými a praktické využití.
> - **Enum:** Definice pojmenovaných celočíselných konstant pro přehlednější kód.
---
