#include "mpu6500.h"

bool mpu6050_init(mpu6050_dev_t *dev)
{
    dev->write_reg(dev->addr, MPU6500_REG_PWR_MGMT_1, 0x00);  // wake up
    
    for(volatile uint16_t i=0; i<10000; i++);
    
    dev->write_reg(dev->addr, MPU6500_REG_CONFIG,        0x03); // DLPF
    dev->write_reg(dev->addr, MPU6500_REG_SMPLRT_DIV,    0x00); // sample divider
    dev->write_reg(dev->addr, MPU6500_REG_GYRO_CONFIG,   0x00); // ±250 dps
    dev->write_reg(dev->addr, MPU6500_REG_ACCEL_CONFIG,  0x00); // ±2 g
    dev->write_reg(dev->addr, MPU6500_REG_ACCEL_CONFIG2, 0x03); // accel DLPF

    return true;
}

bool mpu6050_read_raw(mpu6050_dev_t *dev, mpu6050_raw_t *raw)
{
    uint8_t b[14];

    if (dev->read_regs(dev->addr, MPU6500_REG_ACCEL_XOUT_H, b, 14) != true)
    {
        return false;
    }

    raw->ax = (int16_t)((b[0]  << 8) | b[1]);
    raw->ay = (int16_t)((b[2]  << 8) | b[3]);
    raw->az = (int16_t)((b[4]  << 8) | b[5]);

    // b[6], b[7] = temperature, ignored here

    raw->gx = (int16_t)((b[8]  << 8) | b[9]);
    raw->gy = (int16_t)((b[10] << 8) | b[11]);
    raw->gz = (int16_t)((b[12] << 8) | b[13]);

    return true;
}

