# REV - První cvičení
- Seznamte se s vývojovým prostředím DEV C++. Prostředí obsahuje vše co začátečník v C potřebuje a je velmi jednoduché. Nepotřebuje žádnou dodatečnou instalaci kompilátoru atd. První seznámení s prostředím projdete s cvičícím.

## Odkaz na stažení DEV C++: 
[Odkaz ke stažení](https://sourceforge.net/projects/orwelldevcpp/)

<p align="center">
  <img width="700" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/01_CV_Uvod/Prostredi.png">
</p>

Prostředí DEV c++ ma intuitivní instalaci, kde je třeba jen projít instalační setup. Pokud je vše v pořádku půjde vám kompilovat a spustit zkušební kód, který vytiskne do konzole "Ahoj svete!". V prostředí můžete pracovat s jednotlivým scriptem, nebo projektem. Většinou je výhodné mít na vše projekt. Vytvořme si tedy projekt.

- pro spuštění programu je třeba jej zkompilovat (F9) a spustit (F10), nebo oboje (F11). Tlačítka jsou i na horní liště.

```c
#include <stdio.h>

/*
komentar
na
vice
radku
*/
int main(void) {
	
	printf("Ahoj svete!\n\r"); // komentar na radek
	return 0;
}
```

## 🚀 Příklad 1.1
* Následující výpis ukazuje jednoduchý příklad v jazyce C. 
Pokud si zatím nejste v jazyce jistí vše pro dnešní cvičení najdete: [C tutorial](https://www.programiz.com/c-programming/c-input-output)

```c
#include <stdio.h>

int main(void) {
	
	
	int a = 10;
	int b;
	b = 3;
	
	int c = a/b;
	printf("c = %d\n", c);
	
	float d = (float)a/b;
	printf("d = %f\n", d);
	
	printf("====================================================\n");
	
	char count;
	int k = 10;
	char znak = 'B';		// odpovida asci
	
	if(a==10){
		printf("Plati\n");
	}
	else{
		printf("Neplati\n");
	}
	
	switch(znak){
		case 'A':
			printf("A\n");
			break; //nezapomenout
		case 'B':
			printf("B\n");
			break; //nezapomenout
		default:
			printf("To ne!!");
	}
	
 
        for(count=0; count<13; count++){    	
            printf("count: %d (dec)\n",count);        
        }
	
        printf("====================================================\n");
        count = 10;
    
        while(count){  // blok se ukonci jakmile je FALSE tedy count = 0
    	   printf("count: %d (dec)\n",count);
    	   count--; // znamena count = count -1
	}
	printf("====================================================\n");
	
	do{
		
		printf("C = %d\n", count++); // proc se nevypise 10, zkuste ++count
		
	}while(count<10);
	
	return 0;
}
```

###  📋  Upravte příklad 1.1 takto:

   1) program vypíše řetězec “Ahoj svete!” třináctkrát za sebou. Každý řetězec bude na novém řádku a uvozen pořadovým číslem – využijte cyklus!
   2) pro každé pořadové číslo program zjistí, zda je číslo dělitelné pěti a vypíše poznámku do závorky.
   3) program vypíše jen sudá čísla do 30
   4) program vypise fibonaciho posloupnost do 55 (0 1 1 2 3 5 8 13 21 34 55)
   5) program vyhodnotí jestli je číslo dělitelné 3, nebo 7, ale ne zároveň

#  🚀  Debugging 
- projděte si základní debugging s cvičícím
- je nutné přepnout kompilátor na Debug pak (F5)
- program zastavuje breakpoint
- lze sledovat proměnné watches
- použíjte jednoduchý kód:
```c
// REV - debug

#include <stdio.h>


int main(void) {
    
	char i;
	char c;
   
	for (i=-2; i<3;i++){

		if (i>=2) {                          
		    c = 1;                       
		}
		else if (i<0) {
		    c = 0;
		} 
	}
	
	while(c<=10){
		printf("c:%d\n",c);
		c++;
	}
    	
    return 0;	
}
```

<p align="center">
  <img width="700" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/01_CV_Uvod/Debug.png">
</p>


# 🚀 Prompty pro studium C

Tento seznam obsahuje prompty pro LLM (jako Gemini nebo ChatGPT)

---

## 🏗️ 1. Popis základního programu v C
**Prompt:**
> Napiš jednoduchý program v C, který sečte dvě proměnné typu `int32_t` a výsledek vypíše. Vysvětli:
> - Význam `#include` (zejména `stdio.h` a `stdint.h`).
> - Proč je `main` tzv. **entry point**.
> - Mechanismus fungování `printf` a formátovacích značek (Použití standardních značek `%d`, `%f`, `%c` atd.).
> - Význam návratové hodnoty `return 0`.

## 📋 2. Datové typy a paměť
**Prompt:**
> Vysvětli základní datové typy v C (`int`, `char`, `float`, `double`). Vytvoř tabulku s jejich obvyklou velikostí v bajtech a rozsahem hodnot. Dále se zaměř na moderní standardy:
> 1. Vysvětli typy s pevnou šířkou z knihovny `<stdint.h>` (jako `int8_t`, `uint32_t`, `int16_t` atd.) a proč je lepší je používat místo běžného `int`.
> 2. Vysvětli použití knihovny `<stdbool.h>` pro práci s logickými hodnotami `true` a `false`.
> 3. Ujasni rozdíl mezi `signed` a `unsigned` variantami a co se stane při přetečení (overflow) u `unsigned` typu.

---

## 🔀 3. Řízení toku (Podmínky a Cykly)
**Prompt:**
> Vytvoř přehledné srovnání pro začátečníka v C:
> - Rozdíl mezi `if-else` a `switch-case` (kdy je co efektivnější a proč nezapomenout na `break`).
> - Srovnání cyklů `for`, `while` a `do-while` v tabulce.
> - Praktické ukázky použití příkazů `break` a `continue` uvnitř cyklů, aby bylo jasné, jak ovlivňují průběh.

---

## 🔢 4. Logické vs. Bitové operátory
**Prompt:**
> Vysvětli rozdíl mezi logickými operátory (`&&`, `||`, `!`) a bitovými operátory (`&`, `|`, `^`, `~`, `<<`, `>>`).
> - U bitových operátorů ukaž názorný příklad na dvou 8bitových číslech (např. 5 a 3) převedených do binární soustavy, aby bylo vidět, co se děje s jednotlivými bity.

---
