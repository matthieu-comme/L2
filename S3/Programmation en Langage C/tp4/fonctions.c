#include <stdio.h>

void remplitGrid(int taille, char grid[][taille], char c) {
	for(int i = 0; i<3*taille;i++) {
		for(int j = 0; j<3*taille;j++) 
			grid[i][j]=c;
	}

}

void printGrid(int taille, char grid[][taille]) {
	int i, j;
	printf("Voici la grille de jeu :\n");
	for(i=0;i<taille;i++) {
		for(j=0;j<taille;j++)
			printf("%c ", grid[i][j]);
		printf("\n");
	}
	
}

void jouer(int taille, char grid[][taille], int row, int col, int tour) {
	char c;
	if(grid[row][col]!='-'||row>taille||col>taille) { // si la case est déjà occupée
		
		printf("Case deja jouee, veuillez reessayer une autre :\n");
		printf("Numero de ligne : ");
		scanf("%d",&row);
		printf("Numero de colonne : ");
		scanf("%d",&col);
	}
	if(tour%2==1)
		c='O';
	else
		c='X';
	grid[row][col] = c;
}
