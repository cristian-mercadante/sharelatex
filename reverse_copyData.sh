#!/bin/bash

echo Sincronizzo \"mongodump_data\"
rsync -av ~/backup_data/mongodump_data ~/

echo ------------------------
echo Sincronizzo \"redis_data\"
rsync -av ~/backup_data/redis_data ~/

echo ------------------------
echo Sincronizzo \"sharelatex_data\"
rsync -av ~/backup_data/sharelatex_data ~/
