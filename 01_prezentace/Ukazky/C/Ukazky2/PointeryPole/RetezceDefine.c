#include <stdio.h>

int main(){
	
	char slovo1[]="Ahoj";
	char slovo2[10]={'A', 'h', 'o', 'j', '\0'};
	
	printf("%s\n", slovo1);
	printf("%s\n", slovo2);
	printf("Delka slova je: %d\n", sizeof(slovo1));
	printf("Delka slova je: %d\n", sizeof(slovo2));
	
	return 0;
}
