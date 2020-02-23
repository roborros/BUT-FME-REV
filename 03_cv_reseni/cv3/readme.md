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
