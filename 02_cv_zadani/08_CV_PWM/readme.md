# 🚀 REV - Osmé cvičení PWM, input capture

PWM periferie je určená pro aplikace k regulaci výkonu. Většina moderních aplikací z výkonové elektroniky používá k regulaci výkonu tranzistory ve spínacím režimu. Duležitým pojmem je perioda PWM a střída (duty cycle). V regulaci elektrických pohonů se setkáváme nejčastěji s frekvenci PWM 10-20 kHz. 

<p align="center">
  <img width="360" height="210" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/08_CV_PWM/PWM.png">
</p>

## 🏗️ Ukázka 8.1:
Nastavení jasu LED pomocí PWM
 
```c


void main(void) {

}
```

## 🏗️ Ukázka 8.2:
Genervání frekvence pro reproduktor
```c

void main(void) {
    
}
```

## 🏗️ Ukázka 8.3:
Měření signálu na pinu frekvence, PWM
```c

void main(void) {
    
}
```
### 📝  Zadání:

  1) Otestujte funkčnost kódu pro PWM

  2) Ovládejte rychlost a směr motoru pomocí potenciometru POT2. Pokud bude POT2 ve střední poloze, bude motor zastavený. Při otáčení potenciometrem do horní polohy bude motor postupně zrychlovat otáčení na jednu stranu. Při otočení potenciometru do spodní polohy bude motor postupně zrychlovat otáčení na opačnou stranu než v předchozím případě. 
  
  3) Nakonfigurujte PWM1 jako Half-bridge P1A motor a P1B LED5 (Tak že P1B je invertovaná k P1A).
  
