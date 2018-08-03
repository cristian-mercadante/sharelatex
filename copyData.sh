#!/bin/bash

echo Sincronizzo \"mongodump_data\"
rsync -av --delete ~/mongodump_data/ ~/backup_data/mongodump_data/

echo ------------------------
echo Sincronizzo \"redis_data\"
rsync -av --delete ~/redis_data/ ~/backup_data/redis_data/

echo ------------------------
echo Sincronizzo \"sharelatex_data\"
rsync -av --delete ~/sharelatex_data/ ~/backup_data/sharelatex_data/
