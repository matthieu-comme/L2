#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// A = 65 ; Z = 90
void printTab(int taille, char tab[][taille])
{
    for (int i = 0; i < taille; i++)
    {
        for (int j = 0; j < taille; j++)
            printf("%c%s", tab[i][j], (j < taille - 1) ? " " : "\n");
    }
}

char testAZ(char c)
{
    if (c > 'Z')
        c -= 26;
    return c;
}

char *messageChiffre(char msg[], char cle[], int taille_tab, char tab[][taille_tab])
{
    int lon_cle = strlen(cle);
    int lon_msg = strlen(msg);
    char res[lon_cle];
    // char *cle_allongee = malloc(lon_msg * sizeof(char));
    printf("MESSAGE CODE :\n");
    for (int i = 0; i < lon_msg; i++)
    { // FLEURFLEURFLEURFLEUR...
      // cle_allongee[i] = cle[i % (lon_cle)];
        // printf("%c", cle_allongee[i]);
        res[i] = tab[cle[i % (lon_cle)] - 65][msg[i] - 65]; // -65 pour A = 0, B = 1 etc
        printf("%c%s", res[i], (i < lon_msg - 1) ? "" : "\n");
    }
}

void dechiffre(char msg[], char cle[], int taille_tab, char tab[][taille_tab])
{
    int i, j;
    int c;
    int lon_cle = strlen(cle);
    int lon_msg = strlen(msg);
    char res[lon_msg];
    for (i = 0; i < lon_msg; i++)
    {
        for (j = 0; j < 26; j++) // on parcourt la colonne de c et cherche la lettre cryptée
        {
            c = cle[i % (lon_cle)] - 65;
            // printf("c = %d", c);
            if (tab[c][j] == msg[i])
            {
                res[i] = j + 65; // l'autre antécédent donc lettre dechiffrée
                break;
            }
        }
    }
    for (i = 0; i < lon_msg; i++)
        printf("%c%s", res[i], (i < lon_msg - 1) ? "" : "\n");
}

int main()
{
    int i, j;
    char tab[26][26];
    for (i = 0; i < 26; i++)
    {
        for (j = 0; j < 26; j++)
            tab[i][j] = testAZ('A' + i + j);
    }
    // printTab(26, tab);

    messageChiffre("VIVELEPRINTEMPSETLEBEAUTEMPS", "FLEUR", 26, tab);
    dechiffre("ATZYCJAVCEYPQJJJEPYSJLYNVRAW", "FLEUR", 26, tab);
    dechiffre("ULWXVALGUEHPWMRSDPYT", "FLEUR", 26, tab);
}
