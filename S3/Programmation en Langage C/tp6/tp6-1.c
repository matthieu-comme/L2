#include <stdio.h>
#include <stdlib.h>
#define FAUX 0
#define VRAI 1
typedef int bool;

int main (int argc, char* argv[]) {
	if(argc==1) {
		printf("La liste est vide\n");
		return 1;
	}
	bool asc = VRAI; 
	int i = 1;
	while(i<argc-1 && asc == VRAI) { // on compare au suivant
		if(atoi(argv[i])>atoi(argv[i+1])) // atoi = array to int
			asc = FAUX;
		i++;
	}
	if(asc == VRAI)
		printf("la liste est bien croissante\n");
	else
		printf("non\n");
}
