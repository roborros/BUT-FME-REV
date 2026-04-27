#include "fsm.h"
#include <util/atomic.h>


static volatile queue_t event_queue = {.head = 0, .tail = 0};

void fsm_add_event(uint8_t in){
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {   
        event_queue.fifo[event_queue.head++] = in;
    }
}

uint8_t fsm_get_event(uint8_t *out){
    
	if(event_queue.head == event_queue.tail){
    	return 0;
    }

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {   
        *out = event_queue.fifo[event_queue.tail++];
	}
	return 1;
}


void fsm_init(fsm_t *fsm, state_fp init_state){
    fsm->state = init_state;
    fsm_dispatch(fsm, EV_ENTRY);
}

void fsm_dispatch(fsm_t *fsm, uint8_t event){
    fsm->state(fsm, event);
}

void fsm_transition(fsm_t *fsm, state_fp new_state){
    fsm_dispatch(fsm, EV_EXIT);
    fsm->state = new_state;
    fsm_dispatch(fsm, EV_ENTRY);
}