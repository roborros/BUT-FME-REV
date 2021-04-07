#ifndef PID_H
#define	PID_H

typedef struct{
    float kp;
    float ki;
    float _integral;
    float max;
    float min;
    float h;
}stPID;

void pid_init(stPID * const self, float kp, float ki, float max, float min, float h);

float pid_step(stPID * const self, float setpoint, float feedback);

void pid_reset(stPID * const self);

#endif	/* PID_H */

