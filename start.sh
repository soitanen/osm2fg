#!/bin/bash

ptp=$(pwd)
############################################
# Put here path to your terragear binaries #
############################################
read tg <tgpath.txt
############################################

n=60
s=59
w=30
e=31
update="n"
osmbuild="n"
terrain="y"
gtopo="n"
tileid=0
lod=3
airports=7  #1-only x-plane base; 2-only svn; 4-only by-hand. Summable.
heights="y"
decode="y"
owndata="n"
defaultmaterial="Grassland"

while getopts "n:s:w:e:u:b:t:g:i:l:a:h:d:o:m:" OPTION
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
         g)
             gtopo=$OPTARG
             ;;
         i)
             tileid=$OPTARG
             ;;
         l)
             lod=$OPTARG
             ;;
         a)
             airports=$OPTARG
             ;;
         h)
             heights=$OPTARG
             ;;
         d)
             decode=$OPTARG
             ;;
         o)
             owndata=$OPTARG
             ;;
         m)
             defaultmaterial=$OPTARG
             ;;
     esac
done

if [ -f $PWD/first.run ]
then
	git clone https://www.github.com/soitanen/osm2fg.git osm2fg
	cd osm2fg
	sh first_run.sh
fi

cd $ptp

if [ "$update" == "y" ]
then
	sh $PWD/osm2fg/update.sh -t $tg -p $ptp
fi

if [ "$terrain" == "y" ]
then
	cd $ptp/osm2fg
	bash total_gen.sh -n $n -s $s -w $w -e $e -t $tg -g $gtopo -i $tileid -l $lod -a $airports -h $heights -d $decode -o $owndata -m $defaultmaterial
fi

cd $ptp

if [ "$osmbuild" == "y" ]
then
	cd osm2fg
	bash osm_build.sh -n $n -s $s -w $w -e $e
fi

cd $ptp
cd osm2fg

if [ -f $PWD/finish.wav ]
then
	play finish.wav
fi
