#include <stdio.h>
#include <string.h>
#include "fonctions.h"


int main() {
	int taille = 0;
	char nom1[10]; // joue les O
	char nom2[10]; //      les X
	char joueur[10];
	int tour = 1 ; // %2 = 1 -> tour du joueur 1
	int fini = 0;
	int row, col; // position du coup du joueur
	printf("Quel est le nom du joueur 1 ? ");
	scanf("%s", nom1);
	printf("Quel est le nom du joueur 2 ? ");
	scanf("%s", nom2);
	while(taille<3 || taille%2!=1) {
		printf("Taille de la grille (nombre impair >=3) : ");
		scanf("%d", &taille);
	}
	char grid[9][9];
	remplitGrid(taille, grid, '-');
	printGrid(taille, grid);
	while(fini==0) {
		if(tour%2==1)
			strcpy(joueur, nom1);
		else
			strcpy(joueur, nom2);
		printf("Au tour de %s !\n",joueur);
		printf("Numero de ligne : ");
		scanf("%d",&row);
		printf("Numero de colonne : ");
		scanf("%d",&col);
		jouer(taille, grid, row-1, col-1, tour);
		printGrid(taille, grid);
		tour++;
	}
}
