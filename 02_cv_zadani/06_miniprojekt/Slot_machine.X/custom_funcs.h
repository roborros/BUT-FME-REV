/* 
 * File:   custom_funcs.h
 * Author: adame
 *
 * Created on 17. b?ezna 2021, 13:55
 */

#ifndef CUSTOM_FUNCS_H
#define	CUSTOM_FUNCS_H

typedef struct {
    uint8_t id;
    uint8_t first_entry;
    uint8_t changed;
    uint16_t timeout;
} state_struct;

char generate_symbol(void);
uint8_t check_win(char* symbols);
void show_credit(uint8_t credit);
void change_state(state_struct* state, uint8_t state_id);

#endif	/* CUSTOM_FUNCS_H */

