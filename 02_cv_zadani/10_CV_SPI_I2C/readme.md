# 🚀 REV - Desáté cvičení - SPI a I2C

## SPI sběrnice:
SPI je základní rozhraní MCU pro komunikaci s obvody např. ADC, DAC, externí paměti apod. Jedná se o poměrně jednoduché rozhraní, které je synchronni master/slave. Obsahuje 3 komunikační vodiče clock, dataout a datain. K určení s kterým zařízením probíhá komunikace je zde další vodič pro každé zařízení. Nevýhodou pak může být velký počet vodičů a to, že veškerou komunikaci musí řídit master a také nemohou komunikovat obvody mezi sebou. Výhodou je jednoduchost a rychlost, která je běžně v  řádu MHz.  

## 
<p align="center">
  <img width="500" height="350" src="spi_bus.png">
</p>

## I2C sběrnice:
I2C je základní rozhraní MCU pro komunikaci s obvody např. senzory, EEPROM pamětmi, RTC obvody atd. Jedná se o synchronní sériové rozhraní typu master/slave, které používá pouze dva komunikační vodiče: hodinový signál SCL a datový vodič SDA. Výhodou je malý počet vodičů a možnost připojit více zařízení na stejnou sběrnici, přičemž každé zařízení má svoji adresu. Nevýhodou je nižší rychlost oproti SPI, složitější protokol a nutnost řešit adresaci, potvrzování přenosu a správné časování sběrnice. Komunikaci obvykle řídí master, který zahajuje přenos a určuje, se kterým zařízením bude komunikovat. Běžné rychlosti jsou například 100 kHz, 400 kHz, 1 MHz.

<p align="center">
  <img width="500" height="350" src="i2c_bus.png">
</p>

## 🏗️ Přiklad 10.1:

<p align="center">
  <img width="750" height="500" src="flash_diagram.png">
</p>

```c
void main(void) {
    
    /* hlavni smycka */
    while(1){

    }
}
```

## 🏗️ Přiklad 10.2:

<p align="center">
  <img width="750" height="500" src="imu_diagram.png">
</p>

```c
void main(void) {
    
    /* hlavni smycka */
    while(1){

    }
}
```

### 📝 Zadání:

  1) Vyzkoušejte zadání 10.1 a připojte ke kitu spi flash paměť w25q. Pro ovládání flash použíjte knihovnu. Knihovna vyžaduje implementovat funkce pro spi transfér a pro ovládání CS. 
  2) Rozšiřte knihovnu o funkci na mazání kompletní flash a take o funkci na vyčtení JEDEC ID (pro náš čip: 0xEF, 0x40, 0x16). (datasheet je zde ve složce na gitu) 
  3) Uložte do flash několik zpráv o 16 znacích pro displej. Pomocí tlačítka vždy vyčěte data z flash a zobrazte zprávu na displej dokud nenarazíte na konec, kde se zase vraďte na začátek.  
  4) Vyzkoušejte zadání 10.2 a připojte ke kitu MPU6500(ACC,GYRO). Zahrňte do projektu knihovnu pro mpu. Zde je třeba poskytnou pointer na I2C funkce. Využíjte seriový plot.[serial plotter web](https://web-serial-plotter.atomic14.com/), [serial plotter app](https://github.com/hyOzd/serialplot/releases).
  5) Rozšiřte knihovnu tak, že bude můžné nastavovat range pro ACC a pro GYRO. Například přidat argumenty do init funkce. (defaultní je +-2G a +-250deg/s). Vytvořte také funkci na čtení teploty. (datasheet je zde ve složce na gitu) 
  6) Zobrazujte hodnoty ACC a GYRA na displej a to tak, že MPU6500 přidáte na další I2C sběrnici TWI1 a displej necháte na současné. Piny lze vybrat v PORTMUX v datasheetu. 
