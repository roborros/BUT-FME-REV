#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <stdio.h>
#include <stdlib.h>
#define F_CPU 24000000UL
#include <util/delay.h>
#include "adc.h"
#include "dac.h"
#include "uart.h"
#include "millis.h"
#include "debounce.h"

const uint16_t waveform_lut[255] = {
    512, 538, 564, 591, 616, 642, 667, 691, 714, 737, 759, 779,
    799, 818, 835, 852, 867, 880, 893, 904, 915, 924, 931, 938,
    943, 948, 951, 954, 955, 956, 956, 956, 955, 954, 952, 950,
    948, 946, 943, 941, 939, 937, 936, 935, 934, 933, 933, 934,
    935, 937, 939, 941, 944, 948, 952, 956, 961, 965, 971, 976,
    981, 987, 992, 997, 1002, 1006, 1011, 1014, 1017, 1020, 1022, 1023,
    1023, 1022, 1021, 1018, 1014, 1010, 1004, 997, 990, 981, 971, 960,
    948, 935, 921, 907, 892, 876, 859, 842, 825, 807, 789, 771,
    753, 735, 717, 699, 682, 665, 648, 633, 618, 603, 590, 577,
    566, 555, 545, 536, 528, 522, 516, 511, 507, 504, 502, 501,
    500, 500, 501, 502, 504, 506, 508, 510, 513, 515, 517, 519,
    521, 522, 523, 523, 522, 521, 519, 516, 512, 507, 501, 495,
    487, 478, 468, 457, 446, 433, 420, 405, 390, 375, 358, 341,
    324, 306, 288, 270, 252, 234, 216, 198, 181, 164, 147, 131,
    116, 102, 88, 75, 63, 52, 42, 33, 26, 19, 13, 9,
    5, 2, 1, 0, 0, 1, 3, 6, 9, 12, 17, 21,
    26, 31, 36, 42, 47, 52, 58, 62, 67, 71, 75, 79,
    82, 84, 86, 88, 89, 90, 90, 89, 88, 87, 86, 84,
    82, 80, 77, 75, 73, 71, 69, 68, 67, 67, 67, 68,
    69, 72, 75, 80, 85, 92, 99, 108, 119, 130, 143, 156,
    171, 188, 205, 224, 244, 264, 286, 309, 332, 356, 381, 407,
    432, 459, 485
};

typedef struct{
    
    float aplha;
    float out;
    
}lp_filt_t;


float filter_lp_step(lp_filt_t *f, float input){

    f->out = (1 - f->aplha) * f->out + f->aplha * input;
    
    return f->out;
}

typedef struct{
    
    float aplha;
    float out;
    float prev_input;
    
}hp_filt_t;

float filter_hp_step(hp_filt_t *f, float input){

    f->out = f->aplha * (f->out + input - f->prev_input);
    f->prev_input = input;
    
    return f->out;
}

typedef struct{

    float kp, ki, kd;
    float integrator;
    float prev_err;
    
    float min, max;

}pid_t;

float pid_step(pid_t *pid, float setpoin, float measure){
    
    float error = setpoin - measure; 
    uint8_t int_ok = 1;
	
    float p = pid->kp * error;
    float new_int = pid->integrator +  pid->ki * error;
    float d = pid->kd * (error - pid->prev_err);

    
    float output = p + new_int + d;
    
    if(output < pid->min){
        output = pid->min;
        int_ok = 0;
    }
    else if(output > pid->max){
        output = pid->max;
        int_ok = 0;
    } 
    
	pid->prev_err = error;
	
    if(int_ok){
        pid->integrator = new_int;
    }
    
    return output;
}

#define MOVING_AVG_WINDOW 10
typedef struct
{
    float buffer[MOVING_AVG_WINDOW];
    float sum;
    size_t index;
    size_t count;
} mov_avg_t;

float mov_avg_step(mov_avg_t *ma, float input)
{
    if (ma->count < MOVING_AVG_WINDOW)
    {
        ma->buffer[ma->index] = input;
        ma->sum += input;
        ma->count++;
    }
    else
    {
        ma->sum -= ma->buffer[ma->index];
        ma->buffer[ma->index] = input;
        ma->sum += input;
    }

    ma->index++;
    if (ma->index >= MOVING_AVG_WINDOW)
    {
        ma->index = 0;
    }

    return ma->sum / (float)ma->count;
}

int main(void){
    
    _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, CLKCTRL_FRQSEL_24M_gc);
    uart_init(F_CPU, 115200);
    adc_init();
    millis_init();
    dac_init(); 
    sei();
    
    char msg_buf[64];
    uint8_t i = 0;
    
    lp_filt_t filter_lp = {.aplha=0.2, .out=0.0};
    hp_filt_t filter_hp = {.aplha=0.2, .out=0.0, .prev_input=0.0};
    mov_avg_t avg_filter = {.sum=0, .count=0, .index=0};
    
    adc_set_channel(3);
    
    uint32_t prev_time = get_millis();
    
    while (1)
    {
        
        if((get_millis() - prev_time) >= 10){
            prev_time = get_millis();
            /*
            uint16_t dac_val = (++i > 128) ? 700 : 100;
            dac_write(dac_val + rand() % 20);
            if(i >= 255){
                i = 0;
            }*/
            
            dac_write(waveform_lut[i++]);
        
            if(i >= sizeof(waveform_lut)/sizeof(waveform_lut[0])){
                i = 0;
            }
            
            
            uint16_t adc_raw = adc_read_raw();
            float adc_val = (float)adc_raw * 3300.0/4096.0;
            sprintf(msg_buf, "%.1f,%.1f,%.1f, %.1f\n", adc_val,
                    filter_lp_step(&filter_lp, (float)adc_val),
                    filter_hp_step(&filter_hp, adc_val), 
                    mov_avg_step(&avg_filter, adc_val));
            uart_write_str(msg_buf);
        }  
    }
}
