#include <avr/io.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <math.h>

#define F_CPU 24000000UL
#include <util/delay.h>

#include "mpu6500.h"

#define GYRO_SCALE 0.00762939453F
#define ACCEL_SCALE 0.00006103515F


void tca0_frq_init(void)
{
    // vyberu portc jako alternativni vystup
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTC_gc;
    // je treba nastavit jako out        
    PORTC.DIRSET = PIN0_bm;
    // povolim komparator a mod periferie je generovani frekvence
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_FRQ_gc | TCA_SINGLE_CMP0EN_bm;             
    // zapisu nula do komparatoru
    TCA0.SINGLE.CMP0 = 0;
    // nastaveni delicky a zapnuti
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV4_gc | TCA_SINGLE_ENABLE_bm;
}

void uart_init(uint32_t f_cpu, uint32_t baud)
{
    PORTB.DIRSET = PIN0_bm;   
    PORTB.DIRCLR = PIN1_bm;   

    USART3.BAUD  = (uint16_t)((f_cpu * 4UL) / baud);        
    USART3.CTRLB |= USART_TXEN_bm;
}

void uart_write_byte(uint8_t c)
{
    while(!(USART3.STATUS & USART_DREIF_bm)){} 
    USART3.TXDATAL = c;
}

void uart_write_str(const char *s)
{
    while(*s){
        
        uart_write_byte((uint8_t)*s++);
        
    }
}

void twi0_init(void)
{
    // baud 24e6/(2*400000) - (5 + (24e6 * 600e-9)/2)
    TWI0.MBAUD = 18;
    // zapnuti master mode
    TWI0.MCTRLA = TWI_ENABLE_bm;
    // stav sbernice idle 
    TWI0.MSTATUS = TWI_BUSSTATE_IDLE_gc;
}

bool twi0_wait_write(void)
{
    while (1)
    {
        if (TWI0.MSTATUS & (TWI_WIF_bm | TWI_RIF_bm))
        {
            return ((TWI0.MSTATUS & TWI_RXACK_bm) == 0);
        }

        if (TWI0.MSTATUS & (TWI_BUSERR_bm | TWI_ARBLOST_bm))
        {
            return false;
        }
    }
}

bool twi0_wait_read_ready(void)
{
    while (1)
    {
        if (TWI0.MSTATUS & TWI_RIF_bm)
        {
            return true;
        }

        if (TWI0.MSTATUS & (TWI_BUSERR_bm | TWI_ARBLOST_bm))
        {
            return false;
        }
    }
}

bool i2c_write_reg(uint8_t dev7, uint8_t reg, uint8_t value)
{
    TWI0.MADDR = (uint8_t)(dev7 << 1);   // Write
    if (!twi0_wait_write())
    {
        TWI0.MCTRLB = TWI_MCMD_STOP_gc;
        return false;
    }

    TWI0.MDATA = reg;
    if (!twi0_wait_write())
    {
        TWI0.MCTRLB = TWI_MCMD_STOP_gc;
        return false;
    }

    TWI0.MDATA = value;
    if (!twi0_wait_write())
    {
        TWI0.MCTRLB = TWI_MCMD_STOP_gc;
        return false;
    }

    TWI0.MCTRLB = TWI_MCMD_STOP_gc;
    return true;
}

bool i2c_read_regs(uint8_t dev7, uint8_t start_reg, uint8_t *buf, uint8_t len)
{
    // Write register address
    TWI0.MADDR = (uint8_t)(dev7 << 1);   // Write
    if (!twi0_wait_write())
    {
        TWI0.MCTRLB = TWI_MCMD_STOP_gc;
        return false;
    }

    TWI0.MDATA = start_reg;
    if (!twi0_wait_write())
    {
        TWI0.MCTRLB = TWI_MCMD_STOP_gc;
        return false;
    }

    // Repeated START + read
    TWI0.MADDR = (uint8_t)((dev7 << 1) | 0x01);
    if (!twi0_wait_write())
    {
        TWI0.MCTRLB = TWI_MCMD_STOP_gc;
        return false;
    }

    for (uint8_t i = 0; i < len; i++)
    {
        if (!twi0_wait_read_ready())
        {
            TWI0.MCTRLB = TWI_MCMD_STOP_gc;
            return false;
        }

        buf[i] = TWI0.MDATA;

        if (i == (len - 1))
        {
            // Last byte: NACK + STOP
            TWI0.MCTRLB = TWI_ACKACT_bm | TWI_MCMD_STOP_gc;
        }
        else
        {
            // Continue reception
            TWI0.MCTRLB = TWI_MCMD_RECVTRANS_gc;
        }
    }

    return true;
}


int main(void)
{
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    
    twi0_init();
    uart_init(F_CPU, 115200);
    tca0_frq_init();
    PORTC.DIRSET = PIN3_bm;
    
    mpu6050_dev_t  mpu_dev = {.addr=0x68, .read_regs=i2c_read_regs, .write_reg=i2c_write_reg};
    
    mpu6050_raw_t imu;
    
    mpu6050_init(&mpu_dev);
    char text[32];
    
    uint8_t fall = 0;
    
    while(1){
        if (mpu6050_read_raw(&mpu_dev, &imu))
        {
            
            float x = (float)imu.ax*ACCEL_SCALE;
            float y = (float)imu.ay*ACCEL_SCALE;
            float z = (float)imu.az*ACCEL_SCALE;
            
            float acc_abs = sqrtf(x*x + y*y + z*z);

            if(acc_abs < 0.2f){
                
                sprintf(text, "DETECTED");
                uart_write_str(text);
                fall = 100;
            }
        }
        
        if(fall-- > 0){
            TCA0.SINGLE.CMP0 = 1000;
        }else{
            TCA0.SINGLE.CMP0 = 0;
            fall = 0;
        }

        
        _delay_ms(10);
    }
}