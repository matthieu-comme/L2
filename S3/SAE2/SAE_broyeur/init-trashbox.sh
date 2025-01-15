#!/bin/bash
working_directory=SAE_broyeur
if ! pwd | grep $working_directory > /dev/null 2>&1 ; then
  echo "Vous n'êtes pas dans le dossier $working_directory !!";
  exit 1
fi
if [ -d ".sh-trashbox" ]
then
	echo "La corbeille existe déjà"
else
	mkdir .sh-trashbox
	echo "1" > .sh-trashbox/ID  
	touch .sh-trashbox/INDEX
	echo "La corbeille est initialisée"	
fi
