#include "ring_buff.h"

void ring_buff_init(ring_buffer_t *const buffer) {
  buffer->tail_index = 0;
  buffer->head_index = 0;
}


uint8_t ring_buff_is_empty(ring_buffer_t *const buffer) {
  return (buffer->head_index == buffer->tail_index);
}


uint8_t ring_buff_is_full(ring_buffer_t *const buffer) {
  return ((buffer->head_index - buffer->tail_index) & RING_BUFFER_MASK) == RING_BUFFER_MASK;
}


buff_t ring_buff_num_items(ring_buffer_t *const buffer) {
  return ((buffer->head_index - buffer->tail_index) & RING_BUFFER_MASK);
}


void ring_buff_write(ring_buffer_t *const buffer, char data) {

  if(ring_buff_is_full(buffer)) {
    buffer->tail_index = ((buffer->tail_index + 1) & RING_BUFFER_MASK);
  }

  buffer->buffer[buffer->head_index] = data;
  buffer->head_index = ((buffer->head_index + 1) & RING_BUFFER_MASK);
}

void ring_buff_write_arr(ring_buffer_t *const buffer, const char *data, buff_t size) {

  buff_t i;
  for(i = 0; i < size; i++) {
    ring_buff_write(buffer, data[i]);
  }
}

uint8_t ring_buff_read(ring_buffer_t *const buffer, char *data) {
  if(ring_buff_is_empty(buffer)) {

    return 0;
  }
  
  *data = buffer->buffer[buffer->tail_index];
  buffer->tail_index = ((buffer->tail_index + 1) & RING_BUFFER_MASK);
  return 1;
}

buff_t ring_buff_read_arr(ring_buffer_t *const buffer, char *data, buff_t len) {
  if(ring_buff_is_empty(buffer)) {

    return 0;
  }

  char *data_ptr = data;
  buff_t cnt = 0;
  while((cnt < len) && ring_buff_read(buffer, data_ptr)) {
    cnt++;
    data_ptr++;
  }
  return cnt;
}

uint8_t ring_buff_peek(ring_buffer_t *const buffer, char *data, buff_t index) {
  if(index >= ring_buff_num_items(buffer)) {
    return 0;
  }
  
  buff_t data_index = ((buffer->tail_index + index) & RING_BUFFER_MASK);
  *data = buffer->buffer[data_index];
  return 1;
}