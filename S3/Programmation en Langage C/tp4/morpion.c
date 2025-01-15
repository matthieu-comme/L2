#include <stdio.h>
#include <string.h>
//#include "fonctions.h"

void remplitGrid(int taille, char grid[][taille], char c)
{
    for (int i = 0; i < taille; i++)
    {
        for (int j = 0; j < taille; j++)
            grid[i][j] = c;
    }
}

void printGrid(int taille, char grid[][taille])
{
    int i, j;
    printf("Voici la grille de jeu :\n\n");
    for (i = 0; i < taille; i++)
    {
        for (j = 0; j < taille; j++)
            printf("%c ", grid[i][j]);
        printf("\n");
    }
    printf("\n");
}

char aQuiLeTour(int tour) { // retourne 'O' ou 'X'
	char c;
	if (tour % 2 == 1)
        c = 'O';
    else
        c = 'X';
    return c;
}

void testCoup(int *p_row, int *p_col, int taille, char grid[][taille])
{
    while (grid[*p_row][*p_col] != '-' || *p_row > taille || *p_col > taille || *p_row < 0 || *p_col < 0) // erreur dans saisie
    {
        if (*p_row > taille || *p_col > taille || *p_row < 0 || *p_col < 0)
            printf("Ligne et/ou colonne saisie incorrecte.s\n");
        else
            printf("Case deja occupee...\n");
        printf("Numero de ligne : "); scanf("%d", p_row);
        printf("Numero de colonne : "); scanf("%d", p_col);
    }
}

void jouer(int taille, char grid[][taille], int *p_row, int *p_col, int tour)
{
    char c = aQuiLeTour(tour);
    testCoup(p_row, p_col, taille, grid);
    grid[*p_row][*p_col] = c;
}

int gg(int taille, char grid[][taille], int tour, int *p_win) // win = 1 si victoire
{ // peut remplacer les for par des while
    int cpt = 0;
    char c = aQuiLeTour(tour);
    for (int i = 0; i < taille; i++) // teste les lignes
    {
        for (int j = 0; j < taille; j++)
        {
            if (grid[i][j] != c)
            { // cpt == 0 si ligne gagnante
                cpt++;
                break;
            }
        }
        if (cpt == 0)
        {
            *p_win = 1;
            return 0;
        }
        cpt = 0;
    }

    for (int j = 0; j < taille; j++) // teste les colonnes
    {
        for (int i = 0; i < taille; i++)
        {
            if (grid[i][j] != c)
            { // cpt == 0 si ligne gagnante
                cpt++;
                break;
            }
        }
        if (cpt == 0)
        {
            *p_win = 1;
            return 0;
        }
        cpt = 0;
    }
    
    for (int i = taille - 1; i >= 0; i--) // teste l'autre diag
    {
        if (grid[i][i] != c)
        { // cpt == 0 si ligne gagnante
            cpt++;
            break;
        }        
    }
    if (cpt == 0)
    {
            *p_win = 1;
            return 0;
    }
    
    cpt = 0;    
    for (int i = 0; i < taille; i++) // teste une diag
    {
        if (grid[i][i] != c)
        { // cpt == 0 si ligne gagnante
            cpt++;
            break;
        }        
    }
    if (cpt == 0)
    {
    	*p_win = 1;
    	return 0;
    }
}

int egalite(int taille, char grid[][taille], int tour, int *p_win) { // win = -1 si égalité
	for(int i = 0; i < taille ; i++) { // stop dès qu'une case dispo est trouvée
		for (int j = 0; j < taille ; j++) {
			if(grid[i][j]=='-')
				return 0;
		}		
	}
	*p_win = -1;
}

int main() // égalite en 3x3 10 11 02 21 01 00 22 12 20
{
    int taille = 0;
    char nom1[10]; // joue les O
    char nom2[10]; //      les X
    char joueur[10];
    int tour = 0; // %2 = 1 -> tour du joueur 1
    int win = 0; // 0 : match en cours;
    int *p_win = &win;
    int row, col; // position du coup du joueur
    int *p_row = &row;
    int *p_col = &col;
    printf("Quel est le nom du joueur 1 ? ");
    scanf("%s", nom1);
    printf("Quel est le nom du joueur 2 ? ");
    scanf("%s", nom2);
    while (taille < 3 || taille % 2 != 1)
    {
        printf("Taille de la grille (nombre impair 3 <= n <= 11) : ");
        scanf("%d", &taille);
    }
    char grid[11][11];
    remplitGrid(taille, grid, '-');
    printf("Repere : le coin superieur gauche est ligne 0 colonne 0\n");

    while (win == 0)
    {
        tour++;
        printGrid(taille, grid);
        if (tour % 2 == 1)
            strcpy(joueur, nom1);
        else
            strcpy(joueur, nom2);
        printf("Au tour de %s !\n", joueur);
        printf("Numero de ligne : "); scanf("%d", &row);
        printf("Numero de colonne : "); scanf("%d", &col);
        jouer(taille, grid, p_row, p_col, tour);
        gg(taille, grid, tour, p_win);
        egalite(taille, grid, tour, p_win);
    }
    if (win == 1)
    	printf("\nBravo a %s qui est le vainqueur de cette partie en %d tours !\n", joueur, tour);
    else
    	printf("\nJoli afffrontement entre %s et %s qui resulte en une egalite !\n", nom1, nom2);
    printGrid(taille, grid);
}
