#include "w25qxx.h"

// W25Q32 Opcodes
#define W25_WRITE_ENABLE      0x06
#define W25_READ_STATUS_1     0x05
#define W25_READ_DATA         0x03
#define W25_PAGE_PROGRAM      0x02
#define W25_SECTOR_ERASE      0x20
#define W25_GET_JEDEC_ID      0x9F


extern void CS_Select(bool active);
extern uint8_t spi_transfer(uint8_t data);

/**
 * Sends Write Enable instruction. Must be called before Erase/Program.
 */
void W25Q_WriteEnable(void) {
    CS_Select(true);
    spi_transfer(W25_WRITE_ENABLE);
    CS_Select(false);
}

/**
 * Programs a page (up to 256 bytes). 
 */
void W25Q_WritePage(uint32_t address, uint8_t *data, uint16_t length) {
    W25Q_WriteEnable();
    CS_Select(true);
    spi_transfer(W25_PAGE_PROGRAM);
    spi_transfer((address >> 16) & 0xFF);
    spi_transfer((address >> 8) & 0xFF);
    spi_transfer(address & 0xFF);

    for (uint16_t i = 0; i < length; i++) {
        spi_transfer(data[i]);
    }
    CS_Select(false);
}

/**
 * Checks if the internal write/erase operation is in progress.
 */
bool W25Q_IsBusy(void) {
    uint8_t status;
    CS_Select(true);
    spi_transfer(W25_READ_STATUS_1);
    status = spi_transfer(0xFF);
    CS_Select(false);
    return (status & 0x01); // Bit 0 is BUSY flag
}


/**
 * Reads JEDEC ID (Manufacturer, Memory Type, Capacity).
 * Expected for W25Q32: 0xEF, 0x40, 0x16.
 */
void W25Q_ReadID(uint8_t *id_buffer) {
    CS_Select(true);
    spi_transfer(W25_GET_JEDEC_ID);
    id_buffer[0] = spi_transfer(0xFF); 
    id_buffer[1] = spi_transfer(0xFF); 
    id_buffer[2] = spi_transfer(0xFF); 
    CS_Select(false);
}


/**
 * Reads data starting from address.
 */
void W25Q_ReadData(uint32_t address, uint8_t *buffer, uint32_t length) {
    CS_Select(true);
    spi_transfer(W25_READ_DATA);
    spi_transfer((address >> 16) & 0xFF);
    spi_transfer((address >> 8) & 0xFF);
    spi_transfer(address & 0xFF);
    
    for (uint32_t i = 0; i < length; i++) {
        buffer[i] = spi_transfer(0xFF);
    }
    CS_Select(false);
}


/**
 * Erases a 4KB sector.
 */
void W25Q_EraseSector(uint32_t address) {
    W25Q_WriteEnable();
    CS_Select(true);
    spi_transfer(W25_SECTOR_ERASE);
    // Send 24-bit address
    spi_transfer((address >> 16) & 0xFF);
    spi_transfer((address >> 8) & 0xFF);
    spi_transfer(address & 0xFF);
    CS_Select(false);
}
