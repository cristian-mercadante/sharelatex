#!/bin/bash

echo Sincronizzo \"mongodump_data\"
rsync -av ~/mongodump_data ~/backup_data/

echo ------------------------
echo Sincronizzo \"redis_data\"
rsync -av ~/redis_data ~/backup_data/

echo ------------------------
echo Sincronizzo \"sharelatex_data\"
rsync -av ~/sharelatex_data ~/backup_data/
