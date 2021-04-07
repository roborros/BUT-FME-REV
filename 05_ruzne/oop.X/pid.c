#include "pid.h"

void pid_init(  stPID * const self, 
                float kp, 
                float ki, 
                float max, 
                float min, 
                float h){
    
    self->kp = kp;
    self->ki = ki;
    self->h = h;
    self->max = max;
    self->min = min;
    self->_integral = 0;

}

float pid_step(     stPID * const self, 
                    float setpoint, 
                    float feedback){
    
    float err = setpoint - feedback;
    
    float kgain = err * self->kp;
    
    self->_integral += err * self->ki * self->h;
    
    float action = kgain + self->_integral;
            
    if (action < self->min)
        return self->min;
    else if(action > self->max)
        return self->max;
    else
        return action;

}

void pid_reset(stPID * const self){

    pid_init(self, self->kp, self->ki, self->max, self->min, self->h);    

}
