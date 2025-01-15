#include <stdio.h>
#include <string.h>

int main (int argc, char* argv[]) {
	FILE *input;
	char c;
	input = fopen(argv[2], "r" ) ;
	if (input == NULL) {
		printf("erreur lors de l'ouverture du fichier %s\n", argv[2]);
		return 1;
	}	
	int cpt = 0; 
	if(strcmp(argv[1], "-c") == 0) {
		while( (c=fgetc(input)) != EOF) {
			cpt++;
		}
		printf("C = %d\n", cpt);
	}	
	else if(strcmp(argv[1], "-w") == 0) { 
		int flag = 0; // = 1 en fin de mot ; = 0 au premier caractere 
		while( (c=fgetc(input)) != EOF) {
			if( c==' ' || c=='\n' ) {
				if(flag==0) {
					cpt++;
					flag = 1;
				}					
			}
			else
				flag = 0;
		}		
		printf("W = %d\n", cpt);
	}	
	else if(strcmp(argv[1], "-l") == 0) {
		while( (c=fgetc(input)) != EOF) {
			if(c=='\n')
				cpt++;
		}
		printf("L = %d\n", cpt);
	}
	else
		printf("erreur de syntaxe lors de l'utilisation du programme\n");
	
	fclose(input);
}
