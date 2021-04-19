/* 
 * File:   timer.h
 * Author: adame
 *
 * Created on 13. b?ezna 2021, 13:56
 */

#ifndef TIMER_H
#define	TIMER_H

void timer_init(void);
void timer_timeout_counter(void);
void timer_timeout_reset(void);
uint8_t timer_timeout_compare(uint16_t time);

#endif	/* TIMER_H */

