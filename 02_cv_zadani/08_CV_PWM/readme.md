# 🚀 REV - Osmé cvičení PWM, input capture

PWM (Pulse Width Modulation) je způsob, jak pomocí rychlého přepínání digitálního výstupu vytvořit signál s nastavitelnou střídou, tedy poměrem doby v logické jedničce k celé periodě. Díky tomu lze efektivně řídit například jas LED, otáčky motoru nebo střední napětí na výstupu. Na mikrokontroléru AVR128DB48 budeme PWM generovat pomocí časovače, typicky TCA. Změnou periody určujeme frekvenci PWM a změnou compare hodnoty nastavujeme střídu. Výhodou je, že generování probíhá hardwarově bez nutnosti neustálého zásahu procesoru.

Input Capture je funkce časovače, která umožňuje přesně zaznamenat okamžik příchodu hrany na vstupní pin a uložit aktuální hodnotu čítače do speciálního registru. Díky tomu můžeme velmi přesně měřit periodu, frekvenci i šířku pulzu vstupního signálu, například u externího PWM. U AVR128DB48 má TCB přímo režimy Input Capture Frequency Measurement, Input Capture Pulse-Width Measurement a také Input Capture Frequency and Pulse-Width Measurement.

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
  
