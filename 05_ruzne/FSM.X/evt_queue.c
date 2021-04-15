#include "evt_queue.h"

void write_evt(volatile evt_queue_t *queue, uint8_t in){
	ENTER_CRITICAL();
    queue->fifo[queue->tail++] = in;
    LEAVE_CRITICAL();
}

uint8_t get_evt(volatile evt_queue_t *queue, uint8_t *out){
    while(queue->head == queue->tail){
    	return 0;
    }

	ENTER_CRITICAL();
    *out = queue->fifo[queue->head++];
	LEAVE_CRITICAL();
	return 1;
}
