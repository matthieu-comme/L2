#include <stdio.h>
#include <string.h>

void exo1()
{
    char text[100];
	int i = 0;
	printf("Entrez une phrase : ");
	fgets(text, 100, stdin);
	while(text[i]!='\0')
		{
			if(text[i]=='e') text[i]=' ';
			i++;
		}
	printf("%s\n", text);}

void exo2()
{
    char text[200] = {'I', '$', 'f', 'q', 'b', 'o', '^', 'q', 'f', 'l', 'k', ' ', 'b', 'p', 'q', ' ', 'e', 'r', 'j', '^', 'f', 'k', 'b', ')', ' ', 'i', '^', ' ', 'o', 'b', '"', ' r ', ' o ', ' p ', ' f ', ' s ', ' f ', ' q ', ' b ', ' ', ' b ', ' p ', ' q ', ' ', ' a ', ' f ', ' s ', ' f ', ' k ', ' b', '\0'};
    int i = 0;
    // printf("Ecris une phrase : ");
    // scanf("%s", text);
    while (text[i] != '\0')
    {
        text[i] += 3;
        printf("%c", text[i]);
        i++;
    }
}

int lonChaine(char s[])
{
    int n = 0;
    while (s[n] != '\0')
        n++;
    return n;
}

void exo3()
{
    char text[1000];
    printf("Ecris ce que tu veux : ");
    fgets(text, 1000, stdin);
    printf("strlen : %d\n", strlen(text) - 1); // retourne le bon résultat +1 jsp pourquoi
    printf("lonChaine : %d\n", lonChaine(text) - 1);
}

void exo4()
{
    int lon;
    char text1[10], text2[10];
    printf("Entre un mot : ");
    scanf("%s", text1);
    lon = strlen(text1);
    for (int i = 0; i < lon; i++)
    {
        text2[i] = text1[lon - 1 - i];
        printf("%c", text2[i]);
    }

    if (strcmp(text1, text2) == 0)
        printf("\nc'est un palindrome"); // ne fonctionne pas
    else
        printf("\nrien de special");
}

int chercheChar(char s[], char c) // retourne 1 si présent, 0 sinon
{
    int i = 0;
    int trouve = 0;
    while ((i < strlen(s)) && (trouve == 0))
    {
        if (s[i] == c)
            trouve = 1;
        i++;
    }
    return trouve;
}

void exo5()
{
    char c;
    char s[100];
    printf("Ecris un truc : ");
    fgets(s, 100, stdin);
    printf("Quel est le caractere a chercher ? ");
    scanf("%c", &c);
    if (chercheChar(s, c))
        printf(" '%c' est bien present !", c);
    else
        printf("j'ai rien trouve chef");
}
