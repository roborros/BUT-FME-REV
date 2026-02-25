## 1. Vytvořte funkci prohod(int *a, int *b), která prohodí obsahy proměnných a a b.

```c
void prohod(int *a, int *b) {
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}
```

## 2. Vytvořte funkci pricti(int *a, int prirustek), která k hodnotě proměnné a připočte přírůstek.

```c
void pricti(int *a, int prirustek) {
    *a = *a + prirustek;
}
```

## 3. void vypis_obracene(int *pole,int n) - pole procházejte pomocí ukazatele. Argument n udává delku pole.

```c
void vypis_obracene(int *pole,int n) {
    int i;
    for(i = n-1; i >= 0; i--){
          printf("%d. cislo bylo %d\n",i + 1, *(pole + i) );
    }
}
```


## 4. int sum(int *pole,int n) – sečte n prvních prvků pole pole a vrátí součet

```c
int sum(int *pole, int n) {
    int soucet = 0;
    for (int i = 0; i < n; i++) {
        soucet = soucet + pole[i];
    }
    return soucet;
}
```

## 5. int *max(int *pole,int n) – projde n prvních prvků pole a vrátí pointer na nejvyšší hodnotu. V hlavním programu vypište nejvyšší hodnotu a její pozici v poli. 

```c
int *max(int *pole, int n) {
    int max, i;
    
    max = pole[0];
    int *p;
 
    for(i = 1; i < n; i++){
        if(max < pole[i]){
          max = pole[i];
          p = &pole[i];
        }
    }
    return p;
}
```

## 6. void reverse(int *pole, int n) – obrátí pole

```c
void reverse(int *pole, int n) {
    int temp;    
    
    for (int i = 0; i < n/2; i++){
        temp = pole[i];
        pole[i] = pole[n - i - 1];
        pole[n - i - 1] = temp;
    }    
}
```

## 7. Vytvořte funkci, který bude načítat znaky z terminálu pomocí funkce getchar() až do načtení konce řádku ('\n'). Znaky ukládejte do řetězce, který poté vypište.

```c
void nacti(char pole[], char n){
	
	char i;
	
	for(i=0; i<n;i++){
		pole[i] = getchar();
		if(pole[i] == '\n'){
			pole[i] = '\0';
			return;
		}
	}
	
	pole[n-1] = '\0';
	return;
}
```

## 8. Program rozšiřte o funkci int delka(char *ret), který vrátí délku řetězce ve znacích. Využijte procházení pole pomocí indexů.

```c
int delka(char *ret) {
    int i = 0;
    while(1){
        if (ret[i] == '\0') {
            break;
        } else {
            i++;
        }
    }
    return i;
}
```

## 9. Program rozšiřte o funkci int naopak(char *ret), který vypíše řetězec naopak. Využijte procházení pole pomocí ukazatelů.

```c
void naopak(char *ret) {
    int n;
    n = delka(ret);
    for(int i = n-2; i >= 0; i--){
        printf("%c", *(ret + i));
    }
    printf("\n");
}
```
