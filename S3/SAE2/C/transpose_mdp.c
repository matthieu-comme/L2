#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
  Programme créé le 10 nov. 2024 par Matthieu COMME, mis à jour le 13 nov. 2024
  Prend 2 paramètres : un fichier source et une chaine (= mdp)
  Partition du fichier source en k fichiers en transposant selon le mdp, avec k = lon(mdp)
  -d : opération inverse soit la détransposition
  exemples: 
    ./prog toto CLEFSAE2425
    ./prog -d toto CLEFSAE2425  
*/

int charDansTab(char c, char* tab, int lon) { // retourne 1 si c est dans tab, 0 sinon
  int trouve = 0;
  int i = 0;
  while((i < lon) && !trouve) {
    if(tab[i] == c)
      trouve = 1;
    i++;
  }
  return trouve;
}

int main (int argc, char* argv[]) {
  argc--; argv++;
  if(argc < 2 || argc != 3 && strcmp(argv[0], "-d") == 0) {
    printf("\nVeuillez respecter le nombre et l'ordre des parametres !\nTransposer : ./prog nom_fichier clef\nDetransposer : ./prog -d nom_fichier clef\n\n");
    return 1;
  }
  
  int detranspose = 0;
  if(strcmp(argv[0], "-d") == 0)
    	detranspose = 1;   
  char* nom_src = (char*)malloc(strlen(argv[0+detranspose]) + 1);
  strcpy(nom_src, argv[0+detranspose]);
  int k = strlen(argv[1+detranspose]); // nombre de parties
  char* mdp = (char*)malloc(k+1);
  strcpy(mdp, argv[1+detranspose]);
  
  int *tabOrdre = (int*)malloc(k*sizeof(int)); // ordre de transposition
  if(tabOrdre == NULL) {
    printf("erreur malloc tabOrdre\n");
    return 3;
  }
  char *tabOrdre_char= (char*)malloc(k); // on va y stocker les char déjà rencontrés du mdp 
   if(tabOrdre_char == NULL) {
    printf("erreur malloc tabOrdre_char\n");
    return 3;
  }
  int p;
  for(int i = 0; i < k ; i++) { // détermine l'ordre de la transposition
    p = 0;
    for(int j = 0; j < k; j++) {
      if(mdp[i] > mdp[j])
        p++;
      if(mdp[i] == mdp[j] && i != j && charDansTab(mdp[j], tabOrdre_char, k)) // si le char est en doublon dans le mdp
        p++;
    }    
    tabOrdre[i] = p;
    tabOrdre_char[i] = mdp[i];    
  }
  FILE** tabFile = (FILE**)malloc(k*sizeof(FILE*)); // tab de pointeurs pour chaque fichier de sortie
  if(tabFile == NULL) {
    printf("erreur malloc tabFile\n");
    return 3;
  }
  char c = '0';
  int cpt = 0;
  
  if(!detranspose) {  // transposition
    FILE* file_src = fopen(nom_src, "r");
    if(file_src == NULL) {
      printf("erreur lors de l'ouverture du fichier %s\n", nom_src);
      return 2;
    } 
    for(int i = 0; i < k; i++) {  // création des sorties
      char buffer[100];
      snprintf(buffer, 99, "%s-PART-%d", nom_src, i);
      tabFile[i] = fopen(buffer, "w");
    }
    while ( (c = fgetc(file_src)) != EOF) {      
      int i_avec_mdp = tabOrdre[cpt%k];
      fputc(c, tabFile[i_avec_mdp]);
      cpt++;
  }
  fclose(file_src);
  if(remove(nom_src) == 1)
    printf("erreur lors de la suppression du fichier source %s\n", nom_src);
  }
  
  else {  // détransposition
    FILE* result_file = fopen(nom_src,"r");
    if(result_file != NULL) {
      printf("erreur: le fichier %s existe deja et ne peut etre detranspose\n",nom_src);
      return 4;
    }
    result_file = fopen(nom_src, "w");
    for(int i = 0; i < k; i++) {  // ouvre les parties
      char buffer[100];
      snprintf(buffer, 99, "%s-PART-%d", nom_src, i);
      tabFile[i] = fopen(buffer, "r");
      if(tabFile[i] == NULL) {
        printf("erreur ouverture de la partie %d\n", i);
        remove(nom_src);
        return 2;
      }
    }
    
    int i_avec_mdp = tabOrdre[0];    
    while ( (c = fgetc(tabFile[i_avec_mdp]) ) != EOF) {       
      fputc(c, result_file);
      cpt++;
      i_avec_mdp = tabOrdre[cpt%k];
    }
    fclose(result_file);
  }
  for(int i = 0; i < k; i++)
    fclose(tabFile[i]);
  if(detranspose) { // supprimer les parties après la détransposition
    for(int i = 0; i < k; i++) {
      char buffer[100];
      snprintf(buffer, 99, "%s-PART-%d", nom_src, i);
      if(remove(buffer) == 1)
        printf("erreur lors de la suppression du fichier %s\n", buffer);
    }
  }
  free(nom_src); free(mdp); free(tabOrdre); free(tabOrdre_char); free(tabFile);
  return 0;  
}
