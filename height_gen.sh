#!/bin/bash

#parsing boundaries
while getopts "n:s:w:e:t:g:" OPTION
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
         t)
             tg=$OPTARG
             ;;
         g)
             gtopo=$OPTARG
             ;;
     esac
done

rm -rf $PWD/work/SRTM-3
rm -rf $PWD/work/SRTM-1

if [ "$gtopo" == "y" ]
then
	sh srtm30.sh -n $n -s $s -w $w -e $e -t $tg
fi


#check for northen boundary (SRTM-3 have data only below N60)
if [ $n -gt 60 ]
then
	n=60
fi

ni=$((n-1))
ei=$((e-1))


#downloading hgt files from server
for lat in `seq $s $ni`;
    do
        for lon in `seq $w $ei`;
            do
		if [ $lon -gt 99 ]		
		then
			hgtfile="N$lat""E$lon.hgt.zip"
		else
			hgtfile="N$lat""E0$lon.hgt.zip"
		fi
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/Eurasia/$hgtfile --directory-prefix=$PWD/data/SRTM-3/
                unzip -uo $PWD/data/SRTM-3/$hgtfile -d $PWD/data/SRTM-3/
                rm $PWD/data/SRTM-3/$hgtfile
            done
    done

#formatting heights from SRTM
#for f in $PWD/data/SRTM-3/*.hgt; do $tg/hgtchop 3 $f $PWD/work/SRTM-3; done
$tg/gdalchop $PWD/work/SRTM-3 $PWD/data/SRTM-3/*.hgt
#formatting heights from ASTER GDEM format (if present)
for f in $PWD/data/ASTER/*.hgt; do $tg/hgtchop 1 $f $PWD/work/SRTM-1; done
#terrafit - removes some errors and make data more fast
$tg/terrafit --maxnodes 1000 --maxerror 0.1 $PWD/work/SRTM-3
$tg/terrafit --maxnodes 1000 --maxerror 0.1 $PWD/work/SRTM-1

rm -rf $PWD/data/SRTM-3
