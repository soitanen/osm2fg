#!/bin/bash

############################################
# Put here path to your terragear binaries #
############################################
tg=${HOME}/fgfs/install/terragear/bin
############################################

if [ -f $PWD/first.run ]
then
    sh first_run.sh
fi

echo "Starting at:">terrlog.txt
echo $(date)>>terrlog.txt

# setting boundaries of generation
# WARNING!!! Here must be only integer numbers!!!
n=60
s=59
w=30
e=31

# height downloading and generation it in needed format
sh height_gen.sh -n $n -s $s -w $w -e $e -t $tg
# generation of airports in area + selected airports in folder
sh airport_gen.sh -n $n -s $s -w $w -e $e -t $tg
# generate terrain block in area
sh block_gen.sh -n $n -s $s -w $w -e $e -t $tg

echo "Finish at:">>terrlog.txt
echo $(date)>>terrlog.txt
