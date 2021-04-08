#ifndef RING_BUFF_H
#define	RING_BUFF_H

#include <stdint.h>
// buffer size
#define RING_BUFFER_SIZE 64

#if (RING_BUFFER_SIZE & (RING_BUFFER_SIZE - 1)) != 0
#error "RING_BUFFER_SIZE must be a power of two"
#endif

typedef uint8_t ring_buffer_size_t;

#define RING_BUFFER_MASK (RING_BUFFER_SIZE-1)

// buffer object
typedef struct ring_buffer_t {
 
  char buffer[RING_BUFFER_SIZE];

  ring_buffer_size_t tail_index;

  ring_buffer_size_t head_index;
}ring_buffer_t;


void ring_buff_init(ring_buffer_t *const buffer);

void ring_buff_write(ring_buffer_t *const buffer, char data);

void ring_buff_write_arr(ring_buffer_t *const buffer, const char *data, ring_buffer_size_t size);

uint8_t ring_buff_read(ring_buffer_t *const buffer, char *data);

ring_buffer_size_t ring_buff_read_arr(ring_buffer_t *const buffer, char *data, ring_buffer_size_t len);

uint8_t ring_buff_peek(ring_buffer_t *const buffer, char *data, ring_buffer_size_t index);

uint8_t ring_buff_is_empty(ring_buffer_t *const buffer);

uint8_t ring_buff_is_full(ring_buffer_t *const buffer);

ring_buffer_size_t ring_buff_num_items(ring_buffer_t *const buffer);


#endif	/* RING_BUFF_H */

