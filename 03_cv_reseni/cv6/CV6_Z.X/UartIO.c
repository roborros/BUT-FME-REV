#include <xc.h>
int UART_GetChar(void){ // nacte jeden znak
    char output = 0;
    if (RCSTA1bits.OERR){
        RCSTA1bits.CREN = 0;
        RCSTA1bits.CREN = 1;
    }
    if(RC1IF){
        output = RCREG1;
        RC1IF = 0;
    }
    return output;
}
    
void UART_PutChar(char c){       // vypise jeden znak
    while(!TX1IF);
    TXREG1 = c;
}

int UART_CharAvailable(void){       // vrati nenulovou hodnotu prave kdyz je alespon jeden znak k dispozici pro cteni
    if (RC1IF){
        return 1;
    }else{
        return 0;
    }
}
void UART_PutStr(char * str){   // vypise retezec az do nuloveho znaku
    int i = 0;
    while(str[i] != '\0'){
        UART_PutChar(str[i]);
        i++;
    }    
}

void putch(unsigned char data){
    while(!TX1IF);
    TXREG1 = data;
}

char getch (void){
    if (RCSTA1bits.OERR){
        RCSTA1bits.CREN = 0;
        RCSTA1bits.CREN = 1;
    }
    while(!RC1IF);    
    return RCREG1;
}