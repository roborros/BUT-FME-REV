
int main(void) {
    
    char *DIRSETB = (char*)(0x0420 + 0x01);
    char *OUTTGLB = (char*)(0x0420 + 0x07);
    
    *DIRSETB  |= (1 << 3);
    
    volatile long i;
    
    while(1){
    
        for(i = 0; i < 100000; i++){
        
        }
        
        *OUTTGLB |= (1 << 3);
    
    }
    
}
