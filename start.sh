#!/bin/bash

############################################
# Put here path to your terragear binaries #
############################################
tg=${HOME}/fgfs/install/terragear/bin
############################################

sh update.sh -t $tg

if [ -f $PWD/first.run ]
then
    sh first_run.sh
fi

cd osm2fg
sh total_gen.sh
