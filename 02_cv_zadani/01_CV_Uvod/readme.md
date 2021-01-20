# REV - První cvičení
- Seznamte se s vývojovým prostředím DEV C++. Prostředí obsahuje vše co začátečník v C potřebuje a je velmi jednoduché. Nepotřebuje žádnou dodatečnou instalaci kompilátoru atd. První seznámení s prostředím projdete s cvičícím.

## Odkaz na stažení DEV C++: [IDE](https://sourceforge.net/projects/orwelldevcpp/).
Prostředí DEV c++ ma intuitivní instalaci, kde je třeba jen projít instalační setup. Pokud je vše v pořádku pojde vám kompilovat a spustit zkušební kód, který vytiskne do konzole "Ahoj svete!". V prostředí můžete pracovat s jednotlivým scriptem, nebo projektem. Většinou je výhodné mít na vše projekt. Vytvořme si tedy projekt.


<p align="center">
  <img width="700" height="450" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/01_CV_Uvod/Prostredi.png">
</p>

- pro spuštění programu je třeba jej zkompilovat (F9) a spustit (F10), nebo oboje (F11). Tlačítka jsou i na horní liště.

## Příklad 1.1
* Následující výpis ukazuje jednoduchý příklad v jazyce C. Program vypisuje hodnotu proměnné count. Zamyslete se, nad rozsahy proměnných v C a nad tím, že mají znaménko. 

```c
// REV-Basic

#include <stdio.h>		// načtení standardní knihovny

void main(void) {
	
    char count = 0;
    char a = 'x';
  
    for(;;){
    	
        count++;
        printf("count: %d (0x%x) (%c)\n",count,count,a);		// funkce s stdio.h
        
        if (count == 0) break;
 
    }
}
```

## Dále:

* Příklad využití cyklu while: 
```c
// plny nazev promenne
int cislo = 10;
 
while(cislo > 0){
  printf("Akutalni hodnota: %d\n",cislo);
  cislo--;
}
```

* Příklad využití cyklu for a uživatelského makra: 
```c
#define LIMIT 10
 
// kratky nazev pro index
int i;
 
for(i = 1; i < LIMIT; i++ ){
  printf("Akutalni hodnota: %d\n", i);
}
```
### Upravte příklad 1.1 takto:

   1) program vypíše řetězec “Ahoj svete!” třináctkrát za sebou. Každý řetězec bude na novém řádku a uvozen pořadovým číslem – využijte cyklus!
   2) pro každé pořadové číslo program zjistí, zda je číslo dělitelné pěti a vypíše poznámku do závorky.
   3) program vypíše jen sudá čísla do 30
   4) program vypise fibonaciho posloupnost do 55 (0 1 1 2 3 5 8 13 21 34 55)
   5) program vyhodnotí jestli je číslo dělitelné 3, nebo 7, ale ne zároveň

# Debugging 
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
