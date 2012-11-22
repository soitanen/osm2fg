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
update="n"
osmbuild="n"
terrain="y"

while getopts "n:s:w:e:u:b:t:" OPTION
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
         b)
             osmbuild=$OPTARG
             ;;
         t)
             terrain=$OPTARG
             ;;
     esac
done

if [ -f $PWD/first.run ]
then
	git clone https://www.github.com/soitanen/osm2fg.git osm2fg
	cd osm2fg
	sh first_run.sh
fi

if [ "$update" == "y" ]
then
	sh $PWD/osm2fg/update.sh -t $tg -p $ptp
fi

if [ "$terrain" == "y" ]
then
	cd $ptp/osm2fg
	sh total_gen.sh -n $n -s $s -w $w -e $e -t $tg
fi

cd $ptp

if [ "$osmbuild" == "y" ]
then
	cd osm2fg
	sh osm_build.sh -n $n -s $s -w $w -e $e
fi
