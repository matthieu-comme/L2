#include <stdio.h>
#include <stdlib.h>

typedef struct Cellule
{
    int valeur;
    struct Cellule *suivant;
} Noeud;
typedef struct Cellule *Liste;

Liste creerListe(int x, Liste L)
{
    Liste p = (Liste)malloc(sizeof(struct Cellule));
    p->valeur = x;
    p->suivant = L;
    return p;
}

int tete(Liste L)
{
    return L->valeur;
}

Liste queue(Liste L)
{
    return L->suivant;
}

int estVide(Liste L)
{
    if (L == NULL)
        return 1;
    else
        return 0;
}

void printListe(Liste L)
{
    Liste p = L;
    while (p != NULL)
    {
        printf("%d ", p->valeur);
        p = queue(p);
    }
    printf("\n");
}

Liste dansL1maispasL2(Liste L1, Liste L2) // O(n^2)
{
    Liste L = NULL; // resultat
    while (L1 != NULL)
    {
        int a = L1->valeur;
        int trouve = 0;
        Liste temp = L2;
        while (temp != NULL && !trouve)
        {
            if (temp->valeur == a)
                trouve = 1;
            temp = queue(temp);
        }
        if (trouve == 0)
            L = creerListe(a, L);
        L1 = queue(L1);
    }
    return L;
}

Liste insererPositionk(Liste L, int x, int k)
{
    if (k == 1)
    {
        Liste p = creerListe(x, L);
        return p;
    }
    int cpt = 1;
    Liste p = L;
    while (cpt != k - 1)
    {
        p = queue(p);
        cpt++;
    }
    Liste q = creerListe(x, p->suivant);
    p->suivant = q;
    return L;
}

int main()
{
    Liste L = creerListe(2, NULL);
    L = creerListe(9, L);
    L = creerListe(4, L);
    L = creerListe(-999, L);
    L = creerListe(55, L);

    /*Liste M = creerListe(5, NULL);
    M = creerListe(9, M);
    M = creerListe(1, M);
    M = creerListe(3, M);
    M = creerListe(11, M);
    M = creerListe(4, M);
    printf("L1 : ");
    printListe(L);
     printf("L2 : ");
     printListe(M);
     Liste res = dansL1maispasL2(L, M);
    printf("Entiers dans L1 mais non L2 : ");
     printListe(res);*/

    /*L = insererPositionk(L, 66, 1);
    printListe(L);
    L = insererPositionk(L, 77, 2);
    printListe(L);
    L = insererPositionk(L, 88, 4);
    printListe(L);*/

        return 0;
}