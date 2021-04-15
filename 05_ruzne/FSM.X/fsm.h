#ifndef FSM_H_
#define FSM_H_

#include <stdint.h>

#define EV_ENTRY            1U
#define EV_EXIT             2U
#define EV_BTN1_PRESSED     3U
#define EV_BTN2_PRESSED     4U
#define EV_BTN3_PRESSED     5U
#define EV_BTN4_PRESSED     6U
#define EV_TIMEOUT          7U
#define EV_TICK             8U

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
