#include <stdio.h>
#include <stdlib.h>
#include "fonctions.h"

int main()
{
    int choix = 1;
    while ((choix > 0) && (choix < 6))
    {
        printf("Quel exercice voulez-vous lancer ? 1 a 5 : ");
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
        default:
            break;
        }
    }
    printf("Merci et a bientot !");
}