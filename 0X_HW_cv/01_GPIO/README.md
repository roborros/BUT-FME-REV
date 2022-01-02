# REV - HW cvičení - GPIO

## Úloha 1: Pull-up, pull-down rezistory

### Zadání
Naprogramujte REVkit tak, aby digitální pin RB4 snímal stav připojeného tlačítka a podle něj spínal LED1 na REVkitu. Pokud je tlačítko sepnuté LED svítí a opačně.

### Rozbor
Digitální vstupy integrovaných obvodů dávají na svém výstupu logickou hodnotu 0 nebo 1. Těmto hodnotám odpovídá určité rozmezí vstupních napětí. Pro náš mikrokontrolér je logická 0 do 0,8 V a logická 1 od 2 V (viz kapitola 27.8 v datasheetu našeho MCU). Mimo tato rozmezí není hodnota definována a může nabývat libovolný stav.

V případě, že digitální vstup není k ničemu připojen, je takzvaně plovoucí (*floating*). Nemůžeme určit, jaká bude hodnota napětí na tomto pinu a může být snadno ovlivněn rušením z okolí, od sousedních pinů atd. Digitální hodnota vstupu tedy může nabývat náhodné hodnoty podle okolních podmínek.

```
Sami si nyní vyzkoušejte, co se stane, pokud naprogramuje mikrokontrolér tak, že hodnotu na digitálním vstupu RB4, budete přímo zapisovat na pin ovládající LED1. Uvidíte, že i dotek prstu na pin RB4 můžete měnit stav LED1.
```

Pro správnou funkci je tedy nutné, aby na digitálním vstupu bylo neustále definované napětí.

### Zapojení
Z předchozího rozboru víme, že na digitálním vstupu musíme mít neustále nějakou definovanou hodnotu napětí. Při spínání tlačítka chceme rozlišit stav sepnuto a rozpojeno, musíme mít tedy dvě úrovně napětí.

Mohlo by vás napadnout použít zapojení zobrazené na obrázku níže. Pokud je tlačítko rozpojené, tak bychom měli na digitálním pinu 3,3 V tedy logickou jedničku a pokud je sepnuté, tak by byl pin spojený přes tlačítko do země, tedy 0 V a logická 0. Toto zapojení, je ale **CHYBNÉ**, jelikož při sepnutí tlačítka dojde zároveň ke zkratu mezi 3,3V a GND.

<p align="center">
  <img width="200" src="Figures/pull_incorrect.png">
</p>

Správné zapojení je zobrazeno níže na obrázku v levo, kdy je použit takzvaný *pull-up* (je spojen s napájecím napětím) rezistor mezi pinem RB4 a 3.3V. Tento rezistor nám omezuje proud tekoucí mezi 3,3 V a GND, pokud je tlačítko sepnuté. Obdobné zapojení je zobrazeno na schématu níže v pravo, kdy tlačítko připojuje na pin napětí 3,3 V a je zde použit *pull-down* (je spojen se zemí) rezistor mezi pinem a GND. V tomto případě budeme na digitálním pinu číst nulu v případě, že je tlačítko rozepnuté.

<p align="center">
  <img width="200" src="Figures/pull_up.png" />
  <img width="200" src="Figures/pull_down.png" />
</p>

Hodnotu pull-up/down rezistoru volíme zpravidla od 1 kΩ do 100 kΩ v závislosti na kapacitě cesty, frekvenci signálu, požadavcích na spotřebu a dalších vlivech. V našich aplikacích budeme používat hodnotu 10 kΩ.

## Úloha 2: Debouncing tlačítka

### Zadání
Naprogramujte REVkit tak, aby digitální vstup RB4 snímal stav připojeného tlačítka a při každém stlačení tlačítka měnil stav LED2 na REVkitu. První stlačení rozsvítí LED, druhé stlačení ji zhasne, třetí zase rozsvítí a tak dále.

### Rozbor
Pokud implementujete algoritmus ze zadání a použijete zapojení z předchozího úkolu, tak zjistíte, že občas LED bude reagovat nejen na stlačení, ale i na uvolnění tlačítka, případně dojde pouze k jejímu probliknutí. Tento jev je způsoben mechanickými odskoky kontaktů tlačítka (*bouncing*) při jeho stlačení a uvolnění, průběh napětí při tomto jevu je zobrazen na obrázku níže. Jednotlivé změny napětí způsobují změnu logické hodnoty, kterou čteme na digitálním pinu a tedy i změnu stavu LED.

<p align="center">
  <img width="350" src="Figures/bouncing.png">
</p>

Debouncing tlačítek se může řešit buď programově, pomocí pauzy, přerušením nebo hardwarově.

Častým řešením je použití RC filtru za výstupem tlačítka. Tento filtr nám pomůže odfiltrovat přechodový děj, jak lze vidět na obrázku níže. Výsledný signál má nyní exponenciální náběžnou i sestupnou hranu, a navíc i v tomto signálu může docházet ke kolísání hodnoty, která může způsobit chybnou detekci sepnutí. Ideálním řešením je použití integrovaného obvodu s hysterezí na vstupu, třeba Schmittův klopný obvod (*Schmitt trigger*). Tím získáme signál, který má ostré hrany bez jakéhokoliv přechodového děje.

<p align="center">
  <img width="350" src="Figures/bouncing_filtred.png">
</p>

### Zapojení
Pro debouncing použijeme zmíněný RC filtr podle zapojení na obrázku XX. Časová konstanta filtru nemůže být příliš malá, jinak by nemuselo dojít ke správnému odfiltrování přechodového děje. Na druhou stranu nemůže být ani příliš velká, aby nedošlo k přílišnému zpoždění signálu nebo nezaznamenání krátkých stisků tlačítka.

Přechodový děj může obvykle trvat od 100 us až po jednotky milisekund. Časovou konstantu filtru (R ∙ C) tedy budeme volit kolem hodnoty 1 ms. Obvyklá kombinace bývá 1 kΩ a 1µF. Tyto hodnoty se vždy musí přizpůsobit konkrétnímu obvodu.

<p align="center">
  <img width="200" src="Figures/debouncing.png">
</p>

## Úloha 3: Zapojení externí LED

### Zadání
Naprogramujte REVkit tak, aby digitální vstup RB4 snímal stav připojeného tlačítka podle něj spínal externí LED připojenou k pinu RB5.

### Rozbor
Jelikož LED je ve své podstatě dioda, tak nás budou u ní zajímat stejné parametry jako u ostatních diod a to konkrétně tyto:

1. Napětí v propustném směru V<sub>F</sub>, U<sub>F</sub> (*forward voltage*)
    - Jedná se o úbytek napětí na diodě.
    - Bývá specifikováno v datasheetu z pravidla jako rozsah napětí pro nominální proud diodou I<sub>F</sub>
    - Hodnoty tohoto napětí se liší podle typu PN přechodu diody, tedy podle vyzařovaného světla
        - IR: 1,6 V
        - Červená: 2,1 V
        - Zelená: 2,6 V
        - Modrá: 3 V
2. Proud v propustném směru I<sub>F</sub> (*forward current*)
    - Bývá udáván jako maximální hodnota proudu, který může diodou procházet.
    - Při překročení této hodnoty dochází k poškození diody.

Závislost těchto dvou veličin bývá specifikována v datasheetu, jak je vidět na obrázku níže.

<p align="center">
  <img width="350" src="Figures/LED_VA.png">
</p>

### Zapojení
Z rozboru víme, jaké parametry LED jsou pro návrh obvodu na obrázku níže důležité a v datasheetu si můžeme dohledat konkrétní hodnoty U<sub>F</sub> a I<sub>F</sub> pro naši diodu. Na základě znalostí těchto hodnot, hodnoty napájecího napětí U a Ohmova zákona můžeme určit hodnotu rezistoru zapojeného do série s LED následově:

<p align="center">
<img src="https://latex.codecogs.com/svg.image?R&space;=&space;\frac{U-U_F}{I_F}" title="R = \frac{U-U_F}{I_F}" />
</p>

<p align="center">
  <img width="350" src="Figures/LED.png">
</p>
