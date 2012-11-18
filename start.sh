#!/bin/bash

ptp=$(pwd)
############################################
# Put here path to your terragear binaries #
############################################
tg=${HOME}/fgfs/install/terragear/bin
############################################

n=60
s=59
w=30
e=31

while getopts "n:s:w:e:u:" OPTION
do
     case $OPTION in
         n)
             n=$OPTARG
             ;;
         s)
             s=$OPTARG
             ;;
         w)
             w=$OPTARG
             ;;
         e)
             e=$OPTARG
             ;;
         u)
             update=$OPTARG
             ;;
     esac
done

if [ -f $PWD/first.run ]
then
	git clone https://www.github.com/soitanen/osm2fg.git osm2fg
	cd osm2fg
	sh first_run.sh
fi

if [ $update -eq "y"]
then
	sh $PWD/osm2fg/update.sh -t $tg -p $ptp
fi

cd $ptp/osm2fg
sh total_gen.sh -n $n -s $s -w $w -e $e -t $tg
