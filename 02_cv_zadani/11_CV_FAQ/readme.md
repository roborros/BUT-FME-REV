
# REV - FSM

## Stavové automaty:

* Stavový automat je abstraktní popis problému, který jej uzavírá do tzv. Stavů. Lze je samozřejmě popsat matematicky.
* Podstatné však je, že funkcionalitu zařízení uzavírám do stavů a k přechodům z jednoho stavu do druhého používám události. 
* Stavový automat má vždy počáteční stav, ve kterém se nachází po uvedení do provozu.
* Kolem automatů existuje rozsáhlá teorie, důležitá je však základní myšlenka.
* Není přesně určeno jak se potom daný automat naprogramuje

* Popis pomocí stavového automatu je tedy převod komplexních systému, do abstraktního popisu pomocí stavů.

* Výhodou je právě to, že tato abstrakce umožňuje snadné ověření funkce, zda takto vytvořený automat skutečně myslí na vše (proofability)

* řešení pomocí stavového automatu je tedy jednoduší ověřit tzv verifikovat

* Možností jak FSM programovat je několik, jednoduché automaty lze dělat pomocí switch-case, což je poněkud nepřehledné, ale často se používá. Dále pak lze použít různý koncept tabulek a  struktur a pointery. 

<p align="center">
  <img width="520" height="600" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/fsm.jpg">
</p>

## Příklad FSM.x:
Projekt realizuje automat, ktery je v tomto případě řízen událostmi. Pro zachycení události je zde fronta událostí (kruhový buffer). Události mohu do fronty přidat třeba z ISR, nebo v podstate tam kde zavolám write_evt(evt). V této implementaci se využíva rekurze a k tomu je na platformě PIC18 třeba povolit reentrant stack v nastavení projektu. 

[Video k reentrant stack](https://www.youtube.com/watch?v=gs6YYRIwYAs)

### Zápis stavu pak může vypadat např.:
```c
void init(fsm_t *fsm, uint8_t event){
    
    switch(event){
        case EV_ENTRY:
            LCD_ShowString(1, "Welcome         ");
            bsp_set_timeout(5000);
            break;
        case EV_EXIT:
            printf("Init state exit\n");
            break;
        case EV_TIMEOUT:
            fsm_transition(fsm, &state1);
            break;
    }
}
```
## Úkol:
Upravte projekt FSM dostupný v tomto cvičení tak, aby stavový automat odpovídal diagramu níže.
<p align="center">
  <img width="600" src="https://github.com/MBrablc/BUT-FME-REV/blob/master/02_cv_zadani/11_CV_FAQ/FSM_diagram_ukol.png">
</p>

### Vyplňtě formulář a zapojte se tak k rozvoji REV:
[Klikni here!](https://forms.gle/XMxoySbtPJ3iUvsB7)
