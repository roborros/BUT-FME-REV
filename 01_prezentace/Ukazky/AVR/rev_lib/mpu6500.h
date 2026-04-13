#ifndef MPU6500_H
#define	MPU6500_H

#include <stdint.h>
#include <stdbool.h>


#define MPU6500_REG_SMPLRT_DIV    0x19
#define MPU6500_REG_CONFIG        0x1A
#define MPU6500_REG_GYRO_CONFIG   0x1B
#define MPU6500_REG_ACCEL_CONFIG  0x1C
#define MPU6500_REG_ACCEL_CONFIG2 0x1D
#define MPU6500_REG_PWR_MGMT_1    0x6B
#define MPU6500_REG_WHO_AM_I      0x75
#define MPU6500_REG_ACCEL_XOUT_H  0x3B

typedef struct
{
    uint8_t addr;
    bool (*write_reg)(uint8_t dev7, uint8_t reg, uint8_t value);
    bool (*read_regs)(uint8_t dev7, uint8_t start_reg, uint8_t *buf, uint8_t len);
    
} mpu6050_dev_t;

typedef struct
{
    int16_t ax;
    int16_t ay;
    int16_t az;
    int16_t gx;
    int16_t gy;
    int16_t gz;
    
} mpu6050_raw_t;

bool mpu6050_init(mpu6050_dev_t *dev);
bool mpu6050_read_raw(mpu6050_dev_t *dev, mpu6050_raw_t *raw);

#endif	/* MPU6500_H */

