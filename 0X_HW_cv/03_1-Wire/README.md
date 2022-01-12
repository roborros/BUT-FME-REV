# REV - HW cvičení - 1-Wire teplotní čidlo DS18B20

## Úloha 1: Knihovna k teplotnímu čidlu DS18B20

### Zadání
Vytvořte knihovnu pro komunikaci s teplotním čidlem DS18B20 připojeným k pinu RB4. Výslednou teplotu pošlete přes UART do PC.

### Rozbor
Teplotní čidlo DS18B20 od společnosti Maxim Integrated komunikuje prostřednictvím komunikační sběrnice 1-Wire. Tato sběrnice, jak už název vypovídá, používá pro příjem i odeslání dat pouze jednu komunikační linku, komunikační pin se tedy musí být schopen chovat jako digitální vstup i výstup. Jelikož se jedná o asynchronní sběrnici, je zde důležité i správné časování komunikace.

V další části nebudeme detailně popisovat, jak knihovnu naprogramovat. Spíš vám dáme návod, jak postupovat a na co si dát pozor.

**1. Najděte si datasheet k čidlu a prostudujte jej**

V datasheetu se zaměřte na:
- Obecný popis komponenty, co vlastně umí.
- Jaké je rozložení pinů (*pinout*) pouzdra (*package*), jak se jmenují, kde jsou a jaké jsou jejich funkce.
- Jaké je zapojení komponenty. Každý datasheet většinou obsahuje ukázku základního zapojení dané komponenty včetně všech potřebných obslužných komponent (*bižuterie*).
- Jaké je maximální dovolené napájecí napětí.
- Jak se s daným senzorem komunikuje. Jaké jsou příkazy a jaké je časování komunikace.

**2. Zapojení senzoru**

V datasheetu se můžete dočíst, že existují dvě různé možnosti zapojení, zvolte tu, ve které má senzor samostatné napájení.

**3. Základem je komunikace**

V datasheetu je uvedeno, že při každé komunikaci se senzorem je nutné dodržet určitou posloupnost příkazů. První příkaz je nicméně vždy stejný. Začněte tedy implementací této funkcionality. Tento příkaz je také vhodný z toho důvodu, že na něj senzor odpovídá, můžete si tedy ověřit, zda vše správně funguje.

Pro časování komunikace se bude hodit funkce `__delay_us()`.

**4. Pořádek dělá přátele**

Pokud vám již senzor odpovídá na první příkaz, nastudujte si, jaké jsou ostatní příkazy, jak se ze senzoru čtou jednotlivé bity a jak se do něj zapisují (vše je v datasheetu pěkně vysvětleno a znázorněno). Toto jsou základní bloky komunikace, které se budou používat při každém posílání nebo čtení dat. Bylo by tedy vhodné tuto funkcionalitu zabalit do vhodných funkcí, na kterých budete moct dále stavět.

Jakmile máme funkce pro zapisování bitů, můžeme je využít v dalších funkcích, které nám umožní zapisovat a číst celé bajty. Tyto funkce použijete pro posílání příkazů do senzoru.

**5. Tak kolik je stupňů?**

Jakmile umíme posílat do senzoru příkazy pro převod teploty a vyčtení paměti, zbývá nám jen poslední krok a to zjistit, kolik je vlastně stupňů. K tomu je nutné v datsheetu vyhledat, jak je teplota v údajích ze senzoru reprezentována. Výslednou teplotu pošlete přes UART do terminálu PC.

**6. Na co si dát pozor**

 - Ujistěte se, že víte, jaký je rozdíl v chování GPIO pinu, když je ve stavech Input, Output HIGH a Output LOW. Pokud má být linka v logické 1, tak nám k tomu slouží právě použitý pull-up, ne Output HIGH.
 - Časování je opravdu velmi důležité dodržet. Nezapomeňte i na správné prodlevy mezi jednotlivými bity.
 - U každé komunikace je důležité se ujistit, v jakém pořadí se posílají bajty, zda se pošle první LSb nebo MSb.
 - Pokud používáte jen jeden senzor, tak nezapomeňte, že si můžete komunikaci značně usnadnit přeskočením určitých kroků.

**7. Ta pravá zábava teprve začíná**

Pokud jste úspěšně prošli až sem, tak gratuluji a pokud ne, tak nezoufejte, internet je plný dobrých rad (až nebudete vědět kam dál, vždy je tu pro vás cvičící).

Nicméně nás senzorek toho umí víc, než jen vyčtení teploty, jak jste se mohli sami dočíst při procházení datasheetu.

Tím, že se pro komunikaci používá jen jedna linka, tak to znamená i to, že je komunikace poměrně pomalá. Jednou z možností, jak celý proces urychlit je nastavit nižší rozlišení senzoru a tím urychlit konverzi teploty (samozřejmě za cenu snížení rozlišení).

Můžete si také nastavit interní teplotní limity, které vás upozorní, zda teplota nepřekročila jednu ze zvolených mezí.

A na závěr si můžete zkusit číst teplotu z více senzorů (pokud vám tedy některý ze spolužáků svůj senzor půjčí). Jak jste se určitě sami dočetli, tak každý senzor má svůj jedinečný identifikátor, pomocí kterého je možné jednotlivé senzory adresovat a číst z nich data. Pomocí jednoho pinu jste tedy schopni měřit teplotu z velkého počtu senzorů.

### Zapojení

V datasheetu.
