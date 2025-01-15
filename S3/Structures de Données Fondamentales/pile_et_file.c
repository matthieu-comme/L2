#include <stdio.h>
#include <stdlib.h>
#define LONFILE 10
#define TRUE 1
#define FALSE 0

typedef struct Cellule
{
    int valeur;
    struct Cellule *suivant;
} Noeud;
typedef struct Cellule *Pile;

int sommet(Pile P)
{
    return P->valeur;
}

Pile empiler(int x, Pile P)
{
    Pile temp = (Pile)malloc(sizeof(struct Cellule));
    temp->valeur = x;
    temp->suivant = P;
    return temp;
}

Pile depiler(Pile P)
{
    return P->suivant;
}

int estVideP(Pile P)
{
    if (P == NULL)
        return TRUE;
    else
        return FALSE;
}

void printPile(Pile P)
{
    Pile p = P;
    while (p != NULL)
    {
        printf("%d ", p->valeur);
        p = p->suivant;
    }
    printf("\n");
}

int estPleine(int t[])
{
    if (t[LONFILE - 1] != -1)
        return TRUE;
    else
        return FALSE;
}

void enfiler(int x, int t[], int *tete, int *queue)
{
    if (estPleine(t) == TRUE)
        printf("Liste Pleine\n");
    else
    {
        t[*queue] = x;
        *queue = *queue + 1;
    }
}

int defiler(int t[], int *tete, int *queue)
{
    if (t[*tete] == -1)
        printf("Tete vide\n");
    else
    {
        int res = t[*tete];
        *tete = *tete + 1;
        return res;
    }
}

int estVideF(int t[], int tete, int queue)
{
    if (tete == queue)
        return TRUE;
    else
        return FALSE;
}

void printFile(int t[], int tete, int queue)
{
    for (int i = tete; i < queue; i++)
        printf("%d%s", t[i], (i == queue - 1) ? "\n" : " ");
}

void inverseFile(int F[], int *p_tete, int *p_queue)
{
    Pile P = NULL;
    int a;
    while (estVideF(F, *p_tete, *p_queue) != TRUE)
    {
        a = defiler(F, p_tete, p_queue);
        P = empiler(a, P);
    }
    while (estVideP(P) != TRUE)
    {
        a = sommet(P);
        P = depiler(P);
        enfiler(a, F, p_tete, p_queue);
    }
}

Pile triPile(Pile P)
{
    Pile P2 = NULL; // pile finale
    Pile P3 = NULL; // pile temp
    int a = sommet(P);
    P = depiler(P);
    P2 = empiler(a, P2);
    while (estVideP(P) == FALSE)
    {
        int a = sommet(P);
        P = depiler(P);
        if (a <= sommet(P2))
        {
            P2 = empiler(a, P2);
        }
        else
        {
            while (estVideP(P2) == FALSE && a > sommet(P2))
            {
                P3 = empiler(sommet(P2), P3);
                P2 = depiler(P2);
            }
            P2 = empiler(a, P2);
            while (estVideP(P3) == FALSE)
            {
                P2 = empiler(sommet(P3), P2);
                P3 = depiler(P3);
            }
        }
    }
    return P2;
}

Pile triSelectionMinimum(Pile P)
{
    Pile Q = NULL;
    Pile res = NULL;
    while (estVideP(P) == FALSE)
    {
        int a = 999;
        while (estVideP(P) == FALSE)
        {
            if (sommet(P) < a)
            {
                a = sommet(P);
            }
            Q = empiler(sommet(P), Q);
            P = depiler(P);
        }
        res = empiler(a, res);
        while (estVideP(Q) == FALSE)
        {
            if (sommet(Q) != a)
            {
                P = empiler(sommet(Q), P);
            }
            Q = depiler(Q);
        }
    }
    return res;
}

int main()
{

    int File[LONFILE]; // setup File
    for (int i = 0; i < LONFILE; i++)
        File[i] = -1;
    int tete = 0;
    int queue = 0;
    /*printFile(File, tete, queue);
    enfiler(15, File, &tete, &queue);
    enfiler(30, File, &tete, &queue);
    enfiler(45, File, &tete, &queue);
    enfiler(60, File, &tete, &queue);
    enfiler(75, File, &tete, &queue);
    printFile(File, tete, queue);
    inverseFile(File, &tete, &queue);
    printFile(File, tete, queue);*/

    Pile pile = NULL;
    pile = empiler(1, pile);
    pile = empiler(13, pile);
    pile = empiler(21, pile);
    pile = empiler(-91, pile);
    pile = empiler(109, pile);
    pile = empiler(8, pile);
    pile = empiler(-5, pile);
    printPile(pile);
    // pile = triPile(pile);
    pile = triSelectionMinimum(pile);
    printPile(pile);
}