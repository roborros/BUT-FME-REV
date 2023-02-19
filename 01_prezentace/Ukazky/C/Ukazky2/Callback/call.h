#ifndef CALL_H
#define CALL_H

typedef void(*reg_function)(void);

void callback(void);
void register_callback(reg_function fun);

#endif
