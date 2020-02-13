## 1.program vypise fibonaciho posloupnost do 50 (0 1 1 2 3 5 8 13 21 34 55)

```c
	int i, f1=0, f2=1, dalsi;
	int n;
	
	n = 11;
		
	for(i=1; i<=n; i++){
		printf("%u\n", f1);
		dalsi = f1 + f2;
		f1 = f2;
		f2 = dalsi;
	}
```

## 2.program vyhodnotí jestli je číslo dělitelné 3, nebo 7, ale ne zároveň

```c
	int n = 21;
		
	if((n%3) != (n%7)){
		printf("ANO");
	}
	else{
		printf("NE");
	}
```
