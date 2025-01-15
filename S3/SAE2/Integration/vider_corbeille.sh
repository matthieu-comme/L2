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
echo "Attention, cette opération est définitive. Entrez OUI pour confirmer"
read r
if [ $r = "OUI" ]
then
	cd .sh-trashbox
	rm *
	touch INDEX
	echo "1" > ID	
	echo "La corbeille est maintenant vide"
else
	echo "Opération annulée"
fi
