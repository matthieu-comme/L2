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
while [ $# -gt 0 ]
do
	if [ -d $1 ]
	then
		./sae_delete.sh $1/*
		rmdir $1
	elif [ -f $1 ]
	then
		FILENAME=`realpath $1`
		DIRNAME=`dirname $FILENAME`
		FILENAME=`basename $FILENAME `
		N=`cat $CORBEILLE/ID`
		mv $DIRNAME/$FILENAME $CORBEILLE/$N
		DATE=`date +%Y%m%d%H%M%S`
		echo "$N:$DIRNAME:$FILENAME:$DATE" >> $CORBEILLE/INDEX
		N=`expr $N + 1`
		echo $N > $CORBEILLE/ID
		echo "$FILENAME supprimé"
	else		
		echo "le fichier $1 n'existe pas"
	fi
	shift
done
