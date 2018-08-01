#!/bin/bash

echo Eseguo "mongodump"
sudo docker exec mongo mongodump

echo ------------------------
echo Sincronizzo \"mongodump_data\"
rsync -av ~/mongodump_data ~/sincro_data/

echo ------------------------
echo Sincronizzo \"redis_data\"
rsync -av ~/redis_data ~/sincro_data/

echo ------------------------
echo Sincronizzo \"sharelatex_data\"
rsync -av ~/sharelatex_data ~/sincro_data/
