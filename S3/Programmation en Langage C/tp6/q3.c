#include <stdio.h> 
#include <stdlib.h>
#include <string.h> 
#define LON_MAX 250

int main( int argc, char* argv[]) {
	
	FILE *input = fopen(argv[1], "r");
	if(input==NULL) {
		printf("Erreur lors de la lecture du fichier %s\n", argv[1]);
		return 1;
	}
	char *ext = strrchr(argv[1], '.'); // cherche la derniere occurence du "."
	/*if (!ext) {
		printf("Pas d'extension\n");
	} else {
		printf("extension is %s\n", ext + 1);
	}*/
	if(strcmp(ext+1,"txt")!=0) {
		printf("%s n'est pas un .csv\n", argv[1]);	
		return 1;
	}
	else {
		printf("%s est bien un .csv\n", argv[1]);
		char* c; int cpt_L = 0; int cpt_W = 1;
		//char *buffer = malloc(LON_MAX);
		//fgets(buffer, LON_MAX, input);
		//printf("%s", buffer);
		/*while( (c=fgetc(input)) != EOF) {
				if(c=='\n')
					cpt_L++;
			printf("%c", c);
		}*/
		
		for(c=fgets(input); c!=NULL ; c=fgets(input)) {
				cpt_L++;
			if(c==EOF)
				printf("EOF !!!!");
			printf("%c", c);}
		printf("test");
		while( (c=fgetc(input)) != '\n') {
			if( c==';')
				cpt_W++;								
			}		
		printf("W = %d et L = %d\n", cpt_W, cpt_L);
		
				//char *tab = malloc(cpt_L);				
				
	}			
}
