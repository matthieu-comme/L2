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
	echo "Merci de respecter le format: ./sae_delete.sh MDP fichier_1 [... fichier_n]"
	exit 1
fi
MDP=$1
shift

while [ $# -gt 0 ]
do
	if [ -d $1 ]
	then
		./sae_delete.sh $MDP $1/*
		rmdir $1
	elif [ -f $1 ] 		# suppression du fichier
	then
		FILENAME=`realpath $1`
		DIRNAME=`dirname $FILENAME`
		FILENAME=`basename $FILENAME `
		N=`cat $CORBEILLE/ID`
		uuencode -m $1 $1 > $CORBEILLE/$N
		rm $1
		DATE=`date +%Y%m%d%H%M%S`
		echo "$N:$DIRNAME:$FILENAME:$DATE" >> $CORBEILLE/INDEX
		./prog $CORBEILLE/$N $MDP
		N=`expr $N + 1`
		echo $N > $CORBEILLE/ID
		echo "$FILENAME supprimé"
	else		
		echo "le fichier $1 n'existe pas"
	fi
	shift
done
