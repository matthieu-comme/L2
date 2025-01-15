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
if ! [ -f "prog" ]
then
	if [ -f "transpose_mdp.c" ]
	then
		gcc transpose_mdp.c -o prog
	else
		echo "Erreur : fichier transpose_mdp.c manquant"
		exit 1
	fi
fi
if [ $# -lt 2 ]
then
	echo "help : ./sae_restore.sh [option] MDP fichier_1 [... fichier_n]"
	echo -e "\t-r\n\t\tmode récursif qui restaure le fichier à son adressage d'origine"
	echo -e "\t-d OUTPUT\n\t\trestaure le fichier dans le dossier OUTPUT"
	exit 2
fi
INDEX=$CORBEILLE/INDEX
rec="non"
if [ "$1" = "-r" ] # option récursive
then
	shift
	if [ $# -lt 2 ]
	then
		echo "help : ./sae_restore.sh -r MDP fichier_1 [... fichier_n]"
		exit 2	
	fi
	rec="oui"
elif [ "$1" = "-d" ] # gestion de l'OUTPUT
then
	shift
	if [ $# -lt 3 ]
	then
		echo "help : ./sae_restore.sh -d OUTPUT MDP fichier_1 [... fichier_n]"
		exit 2	
	fi
	OUTPUT=$1
	shift			
else
	OUTPUT="./"
fi
MDP=$1
shift
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
		./prog -d $CORBEILLE/$i_fichier $MDP # détranspose
		if [ $? -eq 1 ]
		then
			echo "erreur lors de la restauration de $nom_fichier"
		else
			uudecode -o $OUTPUT/$nom_fichier $CORBEILLE/$i_fichier 		
			rm $CORBEILLE/$i_fichier
			sed -i "/^$i_fichier:/d" $INDEX # efface de l'index le fichier restauré 
			echo "$nom_fichier restauré"
		fi
	fi
	shift
done
