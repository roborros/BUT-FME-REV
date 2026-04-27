#ifndef FSM_H_
#define FSM_H_

#include <stdint.h>

#define EV_ENTRY            1U
#define EV_EXIT             2U
#define EV_BTN_PRESSED      3U
#define EV_TICK             4U

typedef struct{
    uint8_t fifo[256];
    uint8_t head;
    uint8_t tail;
}queue_t;

typedef struct fsm_t fsm_t;

typedef void(*state_fp)(fsm_t *fsm, uint8_t event);

struct fsm_t{
    state_fp state;
};

void fsm_init(fsm_t *fsm, state_fp init_state);
void fsm_dispatch(fsm_t *fsm, uint8_t event);
void fsm_transition(fsm_t *fsm, state_fp new_state);

void fsm_add_event(uint8_t in);
uint8_t fsm_get_event(uint8_t *out);


#endif /* FSM_H_ */
