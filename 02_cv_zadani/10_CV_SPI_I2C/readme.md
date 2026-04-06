# REV - Desáté cvičení - SPI a I2C

## SPI:
SPI je základní rozhraní MCU pro komunikaci s obvody např. ADC, DAC, externí paměti apod. Jedná se o poměrně jednoduché rozhraní, které je synchronni master/slave. Obsahuje 3 komunikační vodiče clock, dataout a datain. K určení s kterým zařízením probíhá komunikace je zde další vodič pro každé zařízení. Nevýhodou pak může být velký počet vodičů a to, že veškerou komunikaci musí řídit master a také nemohou komunikovat obvody mezi sebou. Výhodou je jednoduchost a rychlost, která je běžně v  řádu MHz.  

## 
<p align="center">
  <img width="500" height="350" src="spi_bus.png">
</p>

V našem datasheetu k MCU máme SPI periferii dobře popsanou. Poměrně důležité je pochopit různé mody SPI, které jsou 4. 

## MODY:
<p align="center">
  <img width="500" height="350" src="spi_mods.png">
</p>

## Přiklad 10.1:

```c
void main(void) {
    
    /* hlavni smycka */
    while(1){

    }
}
```

## Přiklad 10.2:

```c
void main(void) {
    
    /* hlavni smycka */
    while(1){

    }
}
```

### Zadání:

  1) spi flash
  2) spi flash
  3) spi flash
  4) i2c imu
  5) i2c imu
  6) i2c imu
