/*
 * AVR128DB48 + ULN2003 + unipolar stepper motor
 * Example: 28BYJ-48
 *
 * Connections:
 * PC0 -> IN1 (ULN2003)
 * PC1 -> IN2
 * PC2 -> IN3
 * PC3 -> IN4
 *
 * Compiler: avr-gcc / MPLAB XC8 for AVR
 */

#define F_CPU 4000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <stdint.h>

/* ---- Nastavení ---- */
#define STEPPER_MASK     0x0F      // PC0..PC3

/* Full-step sekvence pro 4fázový unipolární motor
   Bit0 = IN1, Bit1 = IN2, Bit2 = IN3, Bit3 = IN4 */
static const uint8_t step_table[4] = {
    0x08,   // 1000
    0x02,   // 0010
    0x04,   // 0100
    0x01    // 0001
};

static const uint8_t step_table_smooth[8] = {
    0x08,   // 1000
    0x0a,   // 1010
    0x02,   // 0010
    0x06,   // 0110
    0x04,   // 0100
    0x05,   // 0101
    0x01,   // 0001
    0x09    // 1001
};

static uint8_t current_step = 0;

/* Inicializace GPIO */
void stepper_init(void)
{
    /* PC0-PC3 jako výstupy */
    PORTC.DIRSET = STEPPER_MASK;

    /* Vypnout v?echny cívky */
    PORTC.OUT &= ~STEPPER_MASK;
}

/* Zapsání jednoho kroku na výstupy */
void stepper_output(uint8_t pattern)
{
    /* Zachovat ostatní bity portu, zm?nit jen PC0-PC3 */
    PORTC.OUT = (PORTC.OUT & ~STEPPER_MASK) | (pattern & STEPPER_MASK);
}

/* Jeden krok dop?edu */
void stepper_step_forward(void)
{
    current_step++;
    if (current_step == 4)
        current_step = 0;

    stepper_output(step_table[current_step]);
}

void stepper_step_forward_smooth(void)
{
    current_step++;
    if (current_step == 8)
        current_step = 0;

    stepper_output(step_table_smooth[current_step]);
}

/* Jeden krok dozadu */
void stepper_step_backward(void)
{
    if (current_step == 0)
        current_step = 3;
    else
        current_step--;

    stepper_output(step_table[current_step]);
}

void stepper_step_backward_smooth(void)
{
    if (current_step == 0)
        current_step = 7;
    else
        current_step--;

    stepper_output(step_table_smooth[current_step]);
}

/* Více krok?*/
void stepper_rotate(uint16_t steps, uint8_t dir)
{
    for (uint16_t i = 0; i < steps; i++)
    {
        if(dir){
            stepper_step_forward();
        }
        else{
            stepper_step_backward();
        }
        _delay_ms(3);
    }
}

/* Více krok?*/
void stepper_rotate_smooth(uint16_t steps, uint8_t dir)
{
    for (uint16_t i = 0; i < steps; i++)
    {
        if(dir){
            stepper_step_forward_smooth();
        }
        else{
            stepper_step_backward_smooth();
        }
        _delay_ms(3);
    }
}

/* Vypnutí motoru */
void stepper_off(void)
{
    PORTC.OUT &= ~STEPPER_MASK;
}

int main(void)
{
    stepper_init();

    while (1)
    {
        /* P?ibli?n? 1 otá?ka pro 28BYJ-48 s p?evodovkou
           bývá kolem 2048 full-step krok?, podle konkrétní verze motoru. */
        //stepper_rotate(2048, 1);
        stepper_rotate_smooth(2048, 1);
        _delay_ms(100);

        //stepper_rotate(2048, 0);
        stepper_rotate_smooth(2048, 0);
        _delay_ms(100);

        stepper_off();
        _delay_ms(1000);
    }
}