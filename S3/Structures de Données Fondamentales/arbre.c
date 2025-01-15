#include <stdio.h>
#include <stdlib.h>
#define COUNT 10

// https://www.geeksforgeeks.org/introduction-to-binary-tree/

typedef struct Noeud
{
    int value;
    struct Noeud *g;
    struct Noeud *d;
} Noeud;
typedef Noeud *Arbre;

Arbre creerNoeud(int x)
{
    Arbre temp = (Arbre)malloc(sizeof(Noeud));
    temp->value = x;
    temp->g = temp->d = NULL;
    return temp;
}

// Function to print binary tree in 2D
// It does reverse inorder traversal
void print2DUtil(Arbre A, int space)
{
    // Base case
    if (A == NULL)
        return;

    // Increase distance between levels
    space += COUNT;

    // Process right child first
    print2DUtil(A->d, space);

    // Print current node after space
    // count
    printf("\n");
    for (int i = COUNT; i < space; i++)
        printf(" ");
    printf("%d\n", A->value);

    // Process left child
    print2DUtil(A->g, space);
}

// Wrapper over print2DUtil()
void print2D(Arbre A)
{
    // Pass initial space count as 0
    print2DUtil(A, 0);
    printf("\n* * * * * * * * * * * * * * * *\n");
}

Arbre ajouterFeuilleABR(int x, Arbre A)
{
    if (A == NULL)
    {
        return creerNoeud(x);
    }
    if (x <= A->value)
        A->g = ajouterFeuilleABR(x, A->g);
    else
        A->d = ajouterFeuilleABR(x, A->d);
    return A;
}

int maxArbre(Arbre A)
{
    if (A->d == NULL)
        return A->value;
    else
        return maxArbre(A->d);
}

Arbre dmax(Arbre A)
{
    if (A->d == NULL)
        return A->g;
    if (A->d->d == NULL)
        A->d = A->d->g;
    else
        A->d = dmax(A->d);
    return A;
}

Arbre supprABR(int x, Arbre A)
{
    if (A == NULL)
    {
        return NULL;
    }
    else if (x < A->value)
    {
        A->g = supprABR(x, A->g);
        // return A;
    }
    else if (x > A->value)
    {
        A->d = supprABR(x, A->d);
        // return A;
    }
    else
    {
        if (A->g == NULL)
            return A->d;
        if (A->d == NULL)
            return A->g;
        A->value = maxArbre(A->g);
        A->g = dmax(A->g);
    }
    return A;
}

Arbre rg(Arbre A)
{
    Arbre temp = A->d;
    A->d = temp->g;
    temp->g = A;
    return temp;
}

Arbre rd(Arbre A)
{
    Arbre temp = A->g;
    A->g = temp->d;
    temp->d = A;
    return temp;
}

Arbre rdg(Arbre A)
{
    A->d = rd(A->d);
    A = rg(A);
    return A;
}

Arbre rgd(Arbre A)
{
    A->g = rg(A->g);
    A = rd(A);
    return A;
}

int maximum(int x, int y)
{
    if (x > y)
        return x;
    else
        return y;
}
int hauteur(Arbre A)
{
    if (A == NULL)
        return -1;
    else
        return 1 + maximum(hauteur(A->g), hauteur(A->d));
}

int desequilibre(Arbre A)
{
    return hauteur(A->g) - hauteur(A->d);
}

Arbre reequilibrer(Arbre A)
{ // reequilibre un AVL
    int dA = desequilibre(A);
    if (dA > 1)
    {
        if (desequilibre(A->g) > 0)
        {
            A = rd(A);
        }
        if (desequilibre(A->g) < 0)
        {
            A = rgd(A);
        }
    }
    if (dA < -1)
    {
        if (desequilibre(A->d) < 0)
        {
            A = rg(A);
        }
        if (desequilibre(A->d) > 0)
        {
            A = rdg(A);
        }
    }
    return A;
}

Arbre ajouterAVL(int x, Arbre A)
{
    if (A == NULL)
    {
        A = creerNoeud(x);
        return A;
    }

    if (x < A->value)
    {
        A->g = ajouterAVL(x, A->g);
    }
    else if (x > A->value)
    {
        A->d = ajouterAVL(x, A->d);
    }
    else
    {
        return A;
    }
    return reequilibrer(A);
}

void parcoursMainDroite(Arbre A)
{
    if (A == NULL)
        return;
    parcoursMainDroite(A->d);
    printf("%d ", desequilibre(A));
    parcoursMainDroite(A->g);
}

int main()
{
    Arbre A = creerNoeud(8);

    /*  A = ajouterFeuilleABR(10, A);
     A = ajouterFeuilleABR(17, A);
     A = ajouterFeuilleABR(1, A);
     A = ajouterFeuilleABR(-3, A);
     A = ajouterFeuilleABR(0, A);
     A = ajouterFeuilleABR(2, A);
     A = ajouterFeuilleABR(5, A);
     A = ajouterFeuilleABR(6, A); */
    print2D(A);
    A = ajouterAVL(10, A);
    print2D(A);
    A = ajouterAVL(17, A);
    print2D(A);
    A = ajouterAVL(1, A);
    print2D(A);
    A = ajouterAVL(-3, A);
    print2D(A);
    A = ajouterAVL(0, A);
    print2D(A);
    A = ajouterAVL(2, A);
    print2D(A);
    A = ajouterAVL(5, A);
    print2D(A);
    A = ajouterAVL(6, A);

    /*
    A = ajouterFeuilleABR(44, A);
    A = ajouterFeuilleABR(30, A);
    A = ajouterFeuilleABR(32, A);
    A = ajouterFeuilleABR(16, A);
    */
    print2D(A);
    /*printf("max arbre A : %d\n", maxArbre(A));
    printf("max arbre g : %d\n", maxArbre(A->g));
    printf("max arbre d : %d\n", maxArbre(A->d));
    */
    /* A = supprABR(17, A);
    print2D(A);
    A = supprABR(2, A);
    print2D(A); */
    // printf("\npresent : %d", chercheABR(0, A));
    // A = rgd(A);
    // print2D(A);
    printf("hauteur de A : %d\nhauteur de G : %d\nhauteur de D : %d\n", hauteur(A), hauteur(A->g), hauteur(A->d));
    printf("desequilibre de A : %d\ndesequilibre de G : %d\ndesequilibre de D : %d\n", desequilibre(A), desequilibre(A->g), desequilibre(A->d));
    parcoursMainDroite(A);

    return 0;
}