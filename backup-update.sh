#!/bin/bash

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
# sudo rm -r ~/redis_data
sudo rm -r ~/mongo_data

echo
echo -----------------------
echo ESECUZIONE DI DOCKER-COMPOSE
cd ./sharelatex
sudo docker-compose up -d

echo
echo -----------------------
echo RIPRISTINO DEI DATI
sudo docker exec mongo mongorestore /dump

echo
echo -----------------------
echo VISUALIZZAZIONE DEI CONTAINER ATTIVI
sudo docker ps
