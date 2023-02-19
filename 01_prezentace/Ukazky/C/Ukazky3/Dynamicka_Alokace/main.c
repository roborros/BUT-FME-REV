#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *gimme_memory(int len);

void gimme_memory_arg(char **p,int len);

char g_str[] = "Z pointeru se zhroutim!\n";

int main(void){
	
	char *p1 = gimme_memory(sizeof(g_str));
	
	if(p1 == NULL){
		return -1;
	}
	
	strcpy(p1, g_str);
	
	printf("%s", p1);
	
	free(p1);
		
	char *p2;
	
	gimme_memory_arg(&p2, sizeof(g_str));
	
	if(p2 == NULL){
		return -1;
	}
	
	strcpy(p2, g_str);
	
	printf("%s", p2);
	
	free(p2);
		
	return 0;
}

void gimme_memory_arg(char **p,int len){
	
	*p = (char*)malloc(len * sizeof(char));
	
}

char *gimme_memory(int len){
	
	char *ret_p = (char*)malloc(len * sizeof(char));
	
	if(ret_p == NULL){
		return NULL;
	}
	return ret_p;
}
