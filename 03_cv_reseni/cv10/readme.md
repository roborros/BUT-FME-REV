## 10 - 1. Vyzkoušejte zadání 10.1 a připojte ke kitu spi flash paměť w25q. Pro ovládání flash použíjte knihovnu. Knihovna vyžaduje implementovat funkce pro spi transfér a pro ovládání CS.
```c
void CS_Select(bool active)
{
    
    if(active){
        PORTA.OUTCLR = PIN7_bm;
    }else{
        PORTA.OUTSET = PIN7_bm;
    }
}

uint8_t spi_transfer(uint8_t data) 
{
    // zapis dat do transfer registru
    SPI0.DATA = data;

    // cekam na transfer
    while (!(SPI0.INTFLAGS & SPI_IF_bm));

    // vratim prijata data
    return SPI0.DATA;
}
```

## 8 - 2. Rozšiřte knihovnu o funkci na mazání kompletní flash a take o funkci na vyčtení JEDEC ID (pro náš čip: 0xEF, 0x40, 0x16). (datasheet je zde ve složce na gitu).
```c
//.h
void W25Q_EraseFlash(void);
void W25Q32_ReadID(uint8_t *ID);
//.c
void W25Q_EraseFlash(void)  {
    W25Q_WriteEnable();
    CS_Select(true);
    spi_transfer(W25_FLASH_ERASE);
    CS_Select(false);
}


void W25Q32_ReadID(uint8_t *ID) {
    CS_Select(true);
    spi_transfer(W25_GET_JEDEC_ID);
    for (uint8_t i = 0; i < 3; i++) {
        ID[i] = spi_transfer(0xFF);
    }
    CS_Select(false);
}

//main
char txbuf[64];
uint8_t idbuf[3];
W25Q_EraseFlash();
...
W25Q32_ReadID(idbuf);
sprintf(txbuf, "ID: %d%d%d \n", idbuf[0], idbuf[1], idbuf[2]);
uart_write_str(txbuf);

```

## 8 - 3. Uložte do flash několik zpráv o 16 znacích pro displej. Pomocí tlačítka vždy vyčtěte data z flash a zobrazte zprávu na displej dokud nenarazíte na konec, kde se zase vraďte na začátek.
```c
W25Q_EraseFlash();
while(W25Q_IsBusy());

char msg[] = "tak at se dari!\n";
W25Q_WritePage(0, (uint8_t*)msg, sizeof(msg));
while(W25Q_IsBusy());
strcpy(msg,"druha zprava je\n");
W25Q_WritePage(sizeof(msg)*1, (uint8_t*)msg, sizeof(msg));
while(W25Q_IsBusy());
strcpy(msg,"REV je super :D\n");
W25Q_WritePage(sizeof(msg)*2, (uint8_t*)msg, sizeof(msg));
while(W25Q_IsBusy());
strcpy(msg,"programovani OK\n");
W25Q_WritePage(sizeof(msg)*3, (uint8_t*)msg, sizeof(msg));
while(W25Q_IsBusy());
strcpy(msg,"cookie is a lie\n");
W25Q_WritePage(sizeof(msg)*4, (uint8_t*)msg, sizeof(msg));
while(W25Q_IsBusy());

PORTB.DIRCLR = PIN2_bm;
// aktivace interního pull-up rezistoru a inverzní logiky
PORTB.PIN2CTRL = PORT_PULLUPEN_bm | PORT_INVEN_bm;
uint8_t counter = 0;
    while (1) {
        if(PORTB.IN&PIN2_bm) 
        {
            W25Q_ReadData(counter, data, 16);
        
            for(uint8_t i=0; i<16; i++){
                uart_write_byte(data[i]);
                _delay_ms(20);
            }
            counter += sizeof(msg);
            if(counter>sizeof(msg)*4) {
                counter=0;
            }
        }
    }
...


```

## 8 - 4. Vyzkoušejte zadání 10.2 a připojte ke kitu MPU6500(ACC,GYRO). Zahrňte do projektu knihovnu pro mpu. Zde je třeba poskytnou pointer na I2C funkce. Přepočítejte surová data na reálné jednotky. Využíjte seriový plot. (serial plotter web, serial plotter app).
```c
int main(void)
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    twi0_init();
    uart_init(F_CPU, 115200);
    PORTC.DIRSET = PIN3_bm;
    
    mpu6050_dev_t  mpu_dev = {.addr=0x68, .read_regs=i2c_read_regs, .write_reg=i2c_write_reg};
    
    mpu6050_raw_t imu;
    
    mpu6050_init(&mpu_dev);
    char text[32];
    
    while(1){

        if (mpu6050_read_raw(&mpu_dev, &imu))
        {
            float x = (float)imu.ax*ACCEL_SCALE;
            float y = (float)imu.ay*ACCEL_SCALE;
            float z = (float)imu.az*ACCEL_SCALE;
            
            float gx = (float)imu.gx*GYRO_SCALE;
            float gy = (float)imu.gy*GYRO_SCALE;
            float gz = (float)imu.gz*GYRO_SCALE;
            
            sprintf(text, "acc %.4f,%.4f,%.4f\r\n", x, y, z);
            uart_write_str(text);
            sprintf(text, "gyro %.4f,%.4f,%.4f\r\n", gx, gy, gz);
            uart_write_str(text);
            
            PORTC.OUTCLR = PIN3_bm;
        }

        
       
        _delay_ms(1000);
    }
}
```

## 8 - 5. Rozšiřte knihovnu tak, že bude možné nastavovat range pro ACC a pro GYRO. Například přidat argumenty do init funkce. (defaultní je +-2G a +-250deg/s). Vytvořte také funkci na čtení teploty. (datasheet je zde ve složce na gitu).
```c
TODO
```

## 8 - 6. Zobrazujte hodnoty ACC a GYRA na displej a to tak, že MPU6500 přidáte na další I2C sběrnici TWI1 a displej necháte na současné. Piny lze vybrat v PORTMUX v datasheetu.
```c
TODO
```

## 8 - 7. Vytvořte program, který bude každých 10 ms ukládat data z ACC. Využíjte koncept double buffer(tedy do jednoho pole se ukládá a druhé se zapisuje, potom se prohodí), a ukládejte data do flash jako celý page write. Využíjte nějáký způsob časování s timerem tak, že data jsou opravdu čtena přesně každých 10ms.
```c
TODO
```

