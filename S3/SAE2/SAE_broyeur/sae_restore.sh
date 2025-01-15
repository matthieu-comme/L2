#!/bin/bash
working_directory=SAE_broyeur
if ! pwd | grep $working_directory > /dev/null 2>&1 ; then
  echo "Vous n'êtes pas dans le dossier $working_directory !!";
  exit 1
fi
CORBEILLE=.sh-trashbox
if ! [ -d $CORBEILLE ]
then
	echo "La corbeille n'existe pas"
	exit 1
fi
if [ $# -eq 0 ]
then
	echo "help : ./sae_restore.sh [option] fichier_1 [... fichier_n]"
	echo -e "\t-r\n\t\tmode récursif qui restaure le fichier à son adressage d'origine"
	echo -e "\t-d OUTPUT\n\t\trestaure le fichier dans le dossier OUTPUT"
	exit 2
fi
INDEX=$CORBEILLE/INDEX
rec="non"
if [ "$1" = "-r" ] # option récursive
then
	shift
	if [ $# -eq 0 ]
	then
		echo "Veuillez saisir au moins un fichier à restaurer"
		exit 2	
	fi
	rec="oui"
elif [ "$1" = "-d" ] # gestion de l'OUTPUT
then
	shift
	if [ $# -lt 2 ]
	then
		echo "help : ./sae_restore.sh -d OUTPUT fichier_1 [... fichier_n]"
		exit 2	
	fi
	OUTPUT=$1
	shift			
else
	OUTPUT="./"
fi
while [ $# -gt 0 ]
do 
	nbFile=`cat $INDEX | cut -d ":" -f 1-3 | grep -c -E "^[0-9]+:.*:$1$"` # savoir si plusieurs fichiers ont le même nom
	if [ $nbFile -eq 0 ] 
	then
		echo "Le fichier $1 n'existe pas"
		i_fichier="none"
		nom_fichier="none"
	else
		if ! [ $nbFile -eq 1 ] 
		then			
			echo "$nbFile fichiers portent ce nom, le plus récent est choisi"
		fi
		ligne=`cat $INDEX | cut -d ":" -f 1-3 | grep -E "^[0-9]+:[^:]+:$1$" | tail -n1` # le plus récent = le dernier ajouté à la liste
		i_fichier=`echo $ligne | cut -d ":" -f1` 
		nom_fichier=`echo $ligne | cut -d ":" -f3` 			
		if [ $rec = "oui" ]
		then
			OUTPUT=`echo $ligne | cut -d ":" -f2`
		fi		
	fi	
	if ! [ $nom_fichier = "none" ]
	then 
		if ! [ -d $OUTPUT ]
		then
			mkdir -p -v $OUTPUT # retirer -v si on veut silencieux	
		fi
		mv $CORBEILLE/$i_fichier $OUTPUT/$nom_fichier # restaure
		sed -i "/^$i_fichier:/d" $INDEX # efface de l'index le fichier restauré 
		echo "$nom_fichier restauré"
	fi
	shift
done
