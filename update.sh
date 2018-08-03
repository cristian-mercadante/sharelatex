#!/bin/bash

# Controllo numero dei parametri = 1
case $# in
1)	;;
*)	echo Numero di parametri invalido
	echo Utilizzo: update.sh directory
	exit 1
	;;	
esac

# Assegnamenti
D=$1
TEX=0

# Controllo $D directory traversabile
if test ! -d $D -o ! -x $D; then
	echo Errore: $D non e\' una directory traversabile
	exit 2
fi

echo ESECUZIONE DI MONGODUMP...
sudo docker exec mongo mongodump

echo
echo -----------------------
echo STOP DEI DOCKER CONTAINER
sudo docker stop sharelatex mongo redis

echo
echo -----------------------
echo RIMOZIONE DEI DOCKER CONTAINER
sudo docker rm sharelatex mongo redis

echo
echo -----------------------
echo BACKUP DEI DATI
~/copyData.sh

echo
echo -----------------------
echo RIMOZIONE DEI DATI
sudo rm -r ~/redis_data
sudo rm -r ~/mongo_data

echo
echo -----------------------
echo ESECUZIONE DI DOCKER-COMPOSE
cd $D
sudo docker-compose up -d
# Se il comando fallisce, allora interrompi
if test $? -ne 0; then
	exit 1
fi

echo
echo -----------------------
echo RIPRISTINO DEI DATI
sudo docker exec mongo mongorestore /dump

echo
echo -----------------------
echo VISUALIZZAZIONE DEI CONTAINER ATTIVI
sudo docker ps

# Installazione tex live

echo
echo -----------------------
echo Procedere con l\'installazione completa di TeX Live?
echo L\'operazione richiede molto tempo.
while true; do
	read -p "(S/N): " TEX
	case $TEX in
	[Ss]*)	echo INSTALLAZIONE COMPLETA DI TEX LIVE
		sudo docker exec sharelatex tlmgr install scheme-full
		break
		;;
	[Nn]*)	echo Installazione completa annullata
		exit 3
		;;
	*)	echo "Input non valido (S/N)"
		;;
	esac
done

