# 1 "pid.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/PIC18F-K_DFP/1.4.87/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "pid.c" 2
# 1 "./pid.h" 1



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
# 1 "pid.c" 2


void pid_init( stPID * const self,
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

float pid_step( stPID * const self,
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
