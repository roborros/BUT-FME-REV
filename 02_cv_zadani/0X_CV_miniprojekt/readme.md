# Miniprojekt

## Zadání
Vytvořte jednoduchý polyfonní přehrávač hudby. Hudba se bude přehrávat přes reproduktor v HW kitu, který bude spínán N-MOSFETem. Externím tlačítkem připojeným k REVkitu půjde přehrávání zastavit a znovu spustit (stiskem pozastavím, dalším stiskem pokračuji v přehrávání od stejného místa). Když je přehrávání pozastaveno, bude svítit externí LEDka připojená k REVkitu.

Zapojení:
* LED -> RB0
* Tlačítko -> RB4
* MOSFET -> RB5

## Postup
1. Na breadboardu si zapojte LED diodu a vyzkoušejte si její spínání. Využijte následující zapojení [Úloha 4: Zapojení externí LED](https://github.com/MBrablc/BUT-FME-REV/tree/master/0X_HW_cv/01_GPIO#%C3%BAloha-4-zapojen%C3%AD-extern%C3%AD-led)
2. Na breadboardu vytvořte obvod obsahující tlačítko a pull-up resistor. Vyzkoušejte funkcionalitu spínáním externí LED zapojené v předchozím kroku (tlačítko stisknuto = LED svítí a opačně). Využijte následující zapojení [Úloha 1: Pull-up, pull-down rezistory](https://github.com/MBrablc/BUT-FME-REV/tree/master/0X_HW_cv/01_GPIO#%C3%BAloha-1-pull-up-pull-down-rezistory)
3. Upravte program tak, aby se při každém stisku tlačítka měnil stav LED. Pozorujte chování LED a navrhněte řešení.
4. Připojte externí reproduktor spolu s MOSFETEM podle zapojení uvedeného v [Úloha 1: Zahrajme si komorní A](https://github.com/MBrablc/BUT-FME-REV/tree/master/0X_HW_cv/02_Timer_ISR#%C3%BAloha-1-zahrajme-si-komorn%C3%AD-a). Využijte timer k zahrání tónu komorního A.
5. Upravte program tak, abyste byli schopni přehrát skladbu dle návodu uvedeném v [Úloha 2: Přehrajte si písničku na REVkitu](https://github.com/MBrablc/BUT-FME-REV/tree/master/0X_HW_cv/02_Timer_ISR#%C3%BAloha-2-p%C5%99ehrajte-si-p%C3%ADsni%C4%8Dku-na-revkitu). Hlavičkový soubor s písničkou si stáhněte z předchozího odkazu.
6. Upravte celkovou funkcionalitu tak, aby odpovídala zadání úlohy.

## Pro rychlíky a rychlice
* Implementujte debouncing tlačítka s využitím časovače, posuvného registru, masky, stavových proměnných atd...
* Přidejte další tlačítko sloužící pro změnu skladby. Další noty naleznete na odkazu v hlavičkovém souboru.

