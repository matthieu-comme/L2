#!/bin/bash
working_directory=SAE_broyeur
if ! pwd | grep $working_directory > /dev/null 2>&1 ; then
  echo "Vous n'êtes pas dans le dossier $working_directory !!";
  exit 1
fi
if ! [ -d .sh-trashbox ]
then
	echo "La corbeille n'existe pas"
	exit 1
fi
INDEX=".sh-trashbox/INDEX"
nL=`wc -l < $INDEX`
if [ $nL -eq 0 ]
then 
	echo "La corbeille est vide"
else
	sed -E "s/^[0-9]+:([^:]+):([^:]+):([0-9]{4})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})$/[ \1\/ ] \2 supprimé le \5-\4-\3 à \6:\7:\8/" $INDEX
fi
#while IFS= read -r ligne
#do	
#	FILE="[ `echo $ligne | cut -d ":" -f2`/ ] `echo $ligne | cut -d ":" -f3`"
#	DATE="`echo $ligne | cut -d ":" -f4`"
#	echo "$FILE supprimé le `date --date="${DATE:0:8} ${DATE:8:2}:${DATE:10:2}:${DATE:12:2}"`" 
	#{DATE:0:8} : chaine DATE, on prend 8 char à partir de i=0 pour YYYYMMDD
#done < $INDEX
