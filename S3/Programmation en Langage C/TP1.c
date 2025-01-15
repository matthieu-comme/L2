#include <stdio.h>
#include <stdlib.h>

int sommep = 0;
// exo 5
	int entree;
	while (scanf("%d",&entree) != EOF)
	{
		if ((entree%2) == 0)
		{sommep = sommep + entree;}
	}
	printf("la somme des entiers entrés pairs est : %d\n",sommep);

void exo1()
{
    int age;
    printf("Bonjour! Quel age avez-vous ? ");
    scanf("%d", &age);
    while (age < 0)
    {
        printf("l'age ne peut etre negatif, coquin. reessaie : ");
        scanf("%d", &age);
    }
    if (age < 2)
        printf("Oh le gros bebe cadum, il n'a que %d an ! ", age);
    else
        printf("Bravo! Vous avez %d ans ! ", age);
}

void exo2()
{
    float x, max;
    printf("Veuillez saisir trois reels :\n");
    for (int i = 0; i < 3; i++)
    {
        scanf("%f", &x);
        if (i == 0 || x > max)
            max = x;
    }
    printf("Le plus grand est %.5f\n", max);
}

int sommeExo3(int n) // n>=0
{
    if (n != 0)
        n += sommeExo3(n - 1);
    return n;
}

void exo3()
{
    printf("La somme des 10 premiers entiers naturels est %d\n", sommeExo3(10));
}

void exo4()
{
    int cpt = 0;
    int n = 0;
    int som = 0;
    printf("Saisir un entier (-1 pour arreter) : ");
    scanf("%d", &n);
    while (n != -1)
    {
        som += n;
        cpt++;
        scanf("%d", &n);
    }
    printf("La moyenne est %d!\n", som / cpt);
}

void exo5()
{
    printf("!");
}

int log2exo6(int n) // n>=0
{
    if (n > 0)
        n = 1 + log2exo6(n / 2);
    return n;
}
void exo6()
{
    int a;
    printf("Saisir un entier : ");
    scanf("%d", &a);
    printf("La partie entiere du log 2 de %d est %d\n", a, log2exo6(a));
}

void exo7()
{
    printf("!");
}

int main()
{
    int choix = 1;
    while ((choix > 0) && (choix < 8))
    {
        printf("Quel exercice voulez-vous lancer ? 1 a 7 : ");
        scanf("%d", &choix);
        switch (choix)
        {
        case 1:
            exo1();
            break;
        case 2:
            exo2();
            break;
        case 3:
            exo3();
            break;
        case 4:
            exo4();
            break;
        case 5:
            exo5();
            break;
        case 6:
            exo6();
            break;
        case 7:
            exo7();
            break;

        default:
            break;
        }
    }
}
