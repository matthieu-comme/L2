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
