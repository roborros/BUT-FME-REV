# 1 "ring_buff.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/PIC18F-K_DFP/1.4.87/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "ring_buff.c" 2
# 1 "./ring_buff.h" 1



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 2 3
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 127 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uintptr_t;
# 142 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long intptr_t;
# 158 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef __int24 int24_t;




typedef long int32_t;





typedef long long int64_t;
# 188 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef __uint24 uint24_t;




typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 229 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 2 3


typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;
typedef int24_t int_fast24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;
typedef uint24_t uint_fast24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 144 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 144 "C:\\Program Files\\Microchip\\xc8\\v2.31\\pic\\include\\c99\\stdint.h" 2 3
# 4 "./ring_buff.h" 2








typedef uint8_t ring_buffer_size_t;




typedef struct ring_buffer_t {

  char buffer[64];

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
# 1 "ring_buff.c" 2


void ring_buff_init(ring_buffer_t *const buffer) {
  buffer->tail_index = 0;
  buffer->head_index = 0;
}


uint8_t ring_buff_is_empty(ring_buffer_t *const buffer) {
  return (buffer->head_index == buffer->tail_index);
}


uint8_t ring_buff_is_full(ring_buffer_t *const buffer) {
  return ((buffer->head_index - buffer->tail_index) & (64 -1)) == (64 -1);
}


ring_buffer_size_t ring_buff_num_items(ring_buffer_t *const buffer) {
  return ((buffer->head_index - buffer->tail_index) & (64 -1));
}


void ring_buff_write(ring_buffer_t *const buffer, char data) {

  if(ring_buff_is_full(buffer)) {
    buffer->tail_index = ((buffer->tail_index + 1) & (64 -1));
  }

  buffer->buffer[buffer->head_index] = data;
  buffer->head_index = ((buffer->head_index + 1) & (64 -1));
}

void ring_buff_write_arr(ring_buffer_t *const buffer, const char *data, ring_buffer_size_t size) {

  ring_buffer_size_t i;
  for(i = 0; i < size; i++) {
    ring_buff_write(buffer, data[i]);
  }
}

uint8_t ring_buff_read(ring_buffer_t *const buffer, char *data) {
  if(ring_buff_is_empty(buffer)) {

    return 0;
  }

  *data = buffer->buffer[buffer->tail_index];
  buffer->tail_index = ((buffer->tail_index + 1) & (64 -1));
  return 1;
}

ring_buffer_size_t ring_buff_read_arr(ring_buffer_t *const buffer, char *data, ring_buffer_size_t len) {
  if(ring_buff_is_empty(buffer)) {

    return 0;
  }

  char *data_ptr = data;
  ring_buffer_size_t cnt = 0;
  while((cnt < len) && ring_buff_read(buffer, data_ptr)) {
    cnt++;
    data_ptr++;
  }
  return cnt;
}

uint8_t ring_buff_peek(ring_buffer_t *const buffer, char *data, ring_buffer_size_t index) {
  if(index >= ring_buff_num_items(buffer)) {
    return 0;
  }

  ring_buffer_size_t data_index = ((buffer->tail_index + index) & (64 -1));
  *data = buffer->buffer[data_index];
  return 1;
}
