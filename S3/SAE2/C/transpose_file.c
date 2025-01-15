#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
  Programme créé le 10 nov. 2024 par Matthieu COMME, mis à jour le 27 nov. 2024
  Prend 2 paramètres : un fichier source et une valeure entiere k de transposition.
  Partition du fichier source en k fichiers en transposant sur k colonnes. 
*/

int main (int argc, char* argv[]) {
  if(argc < 3) {
    printf("Il manque %d parametre%s\n", (3-argc), (argc==2)?"":"s");
    return 1;
  }
  
  char* nom_src = (char*)malloc(strlen(argv[1]) + 1);
  strcpy(nom_src, argv[1]);
  FILE* fichier = fopen(nom_src, "r");
  if(fichier == NULL) {
    printf("erreur lors de l'ouverture du fichier %s\n", nom_src);
    return 2;
  }  
  int k = strtol(argv[2], NULL, 10); // nombre de fichiers de sortie
  FILE** tabFile = (FILE**)malloc(k*sizeof(FILE*)); // tab de pointeurs pour chaque fichier de sortie
  for(int i = 0; i < k; i++) {  // création des sorties
    char buffer[100];
    snprintf(buffer, 99, "%s-PART-%d", nom_src, i);
    tabFile[i] = fopen(buffer, "w");
  }
  char c;
  int cpt = 0;
  while ( (c = fgetc(fichier)) != EOF) {
    fputc(c, tabFile[cpt%k]); 
    cpt++;
  }
  fclose(fichier);
  if(remove(nom_src) == 1)
    printf("erreur lors de la suppression du fichier source");  
  for(int i = 0; i < k ; i++)
  	fclose(tabFile[i]);
  free(tabFile);
  free(nom_src);
  printf("Transposition terminee !\n");
  return 0;  
}
