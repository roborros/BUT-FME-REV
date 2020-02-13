## vytvořte funkci, která ověří, že je číslo prvočíslem.

```c
char is_a_prime(int n){
	int i;
	for(i=2; i<=(n/2); i++){
		if(n%i == 0){
			return 0;
		}
	}
	return 1;
}
```

## vytvořte funkci, která převede dvě 8bit čísla na jedno 16bit. (spojí horní a dolní bajt)

```c
uint16_t addLowHeight(uint8_t h, uint8_t l){
	return (h << 8) | l;
}
```

## vytvořte funkci long decToBin(int), která převede desítkové číslo na binarní (tedy 11dec je 1011b).

```c
long dec_to_bin(int n) {
    long binar = 0;
    int z, i = 1;
    while (n != 0) {
        z = n % 2;
        n /= 2;
        binar += z * i;
        i *= 10;
    }
    return binar;
}
```
