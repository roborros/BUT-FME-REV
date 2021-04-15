#include "fsm.h"
#include "evt_queue.h"

static volatile evt_queue_t event_queue = {.head = 0, .tail = 0};

void fsm_add_event(uint8_t in){
    write_evt(&event_queue, in);
}

uint8_t fsm_get_event(uint8_t *out){
	return get_evt(&event_queue, out);
}


void fsm_init(fsm_t *fsm, state_fp init_state){
    fsm->state = init_state;
    fsm_dispatch(fsm, EV_ENTRY);
}

void fsm_dispatch(fsm_t *fsm, uint8_t event){
    (*(fsm)->state)(fsm, event);
}

void fsm_transition(fsm_t *fsm, state_fp new_state){
    fsm_dispatch(fsm, EV_EXIT);
    fsm->state = new_state;
    fsm_dispatch(fsm, EV_ENTRY);
}