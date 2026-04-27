#ifndef W25QXX_H
#define	W25QXX_H

#include <stdint.h>
#include <stdbool.h>

void W25Q_WriteEnable(void);

void W25Q_WritePage(uint32_t address, uint8_t *data, uint16_t length);

bool W25Q_IsBusy(void);

void W25Q_ReadID(uint8_t *id_buffer);

void W25Q_ReadData(uint32_t address, uint8_t *buffer, uint32_t length);

void W25Q_EraseSector(uint32_t address);

#endif	/* W25QXX_H */

