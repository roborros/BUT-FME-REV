# REV - Závěrečný projekt
- Odkaz video

## - Rozbalte a vygenerujte si zadaní (vstupem je číslo studenta, možná budete muset potvrdit spuštění neznámé aplikace)


Kód je níže, můžete použít online interpreter Pythonu např. 
-https://www.programiz.com/python-programming/online-compiler/
```Python
import random


GPIO = ['GPIO-Knight rider', 'GPIO-had', 'GPIO-Blikani s ruznou periodou  prepinani BTN2', 
        'GPIO-Tetris','GPIO-Binarni citac BTN2',
        'GPIO-Rozsvecovani led BTN2 0 az 6 ledek pak preteceni', 'GPIO-Blikani SOS']
UART = ['UART-Poslani retezce naopak', 'UART-Vypis zpravy na displej',
        'UART-Volba stavu pres uart','UART-Prevod znaků na morseovku (ABCDE)', 
        'UART-Mod kalkulacka secteni/odecteni dvou cisel', 'UART-Echo vraceni znaku']
ADC =  ['ADC-Vypis pot1 a pot2 na displej ve V','ADC-Teploměr',
        'ADC-Ovladani bargraph (led) POT1','ADC-Ovládání bargraph - vyplňuje jeden řádek displeje',
        'ADC-Prepnuti sviti nesviti v polovine rozsahu potenciometru', 
        'ADC-kombinace obou kanalu adc pot1 a pot2 dolnich/hornich 10 bit', 'ADC-Pot1 v rozlišení 8 bit násobí hodnotu POT2 10 bit']
PWM =  ['PWM-Ovladani rychlosti motoru potenciometrem led5 je stejna PWM1',
        'PWM-Ovladani rychlosti motoru potenciometrem led5 je opacna PWM1', 'PWM-Ovladani rychlosti motoru potenciometrem bez led',
        'PWM-BTN2 přepíná jas LED mezi pěti úrovněmi', 'PWM-blikání s plynulou změnou jasu (sinus)',
        'PWM-blikání s plynulou změnou jasu (trojuhelnik)','PWM-Ovládání rychlosti motoru tlačítky']
GAME = ['GAME-Závody BTN', 'GAME-Závody POT', 
        'GAME-1D Pong', 'GAME-Guitar Hero', 'GAME-Ladění poťáku', 'GAME-Uhodni číslo', 
        'GAME-Rychlost reakce', 'GAME-Odhad času', 'GAME-Love Machine']
DAC =   ['DAC-Signalovy generator', 'DAC-Generator trojuhelniku', 'DAC-Generator pulkruh',
         'DAC-Spinani triaku', 'DAC-Orezana sinusovka']
STATEMACHINE = [GPIO, UART, PWM, ADC, DAC, GAME]

def generate():

    while(True):
        print("Zadej cislo studenta:")
        student = int(input())
        random.seed(student)
        for i in range(6):
            print("{}:{}".format(i,random.choice(STATEMACHINE[i])))




if __name__=="__main__":
    generate()
```
