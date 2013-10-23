#!/bin/bash

#parsing boundaries
while getopts "n:s:w:e:t:a:" OPTION
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
         a)
             airports=$OPTARG
             ;;
     esac
done

#downloading apt.dat
wget -N http://dev.x-plane.com/update/data/AptNav201310XP900.zip --directory-prefix=$PWD/data/airports_base/
unzip -uo $PWD/data/airports_base/AptNav201310XP900.zip apt.dat -d $PWD/data/airports_base/

#deleting old data from Work directory
rm -rf $PWD/work/AirportArea
rm -rf $PWD/work/AirportObj
rm -rf $PWD/work/Shared

if [ $airports -eq 1 -o $airports -eq 3 -o $airports -eq 5 -o $airports -eq 7 ]
then
#parsing all airports in area
$tg/genapts850 --threads --input=$PWD/data/airports_base/apt.dat --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --work=$PWD/work
fi


if [ $airports -eq 2 -o $airports -eq 3 -o $airports -eq 6 -o $airports -eq 7 ]
then
#reading airports from svn repository
#svn co http://svn.dev.flightgear.ru/osm-terrain $PWD/data/airports_svn
if [ -d "$PWD/data/rus_aptdat" ]
then
	cd $PWD/data/rus_aptdat
	git pull
	cd ../..
else
	git clone https://github.com/soitanen/rus_aptdat.git $PWD/data/rus_aptdat
fi

#parsing airports, that placed in airports_svn folder
for i in $PWD/data/rus_aptdat/*.dat
do
	$tg/genapts850 --threads --max-slope=0.02 --input=$i --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --work=$PWD/work
done
fi

if [ $airports -eq 4 -o $airports -eq 5 -o $airports -eq 6 -o $airports -eq 7 ]
then
#parsing airports, that placed in airports folder by hand
for i in $PWD/data/airports/*.dat
do
	$tg/genapts850 --threads --input=$i --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --work=$PWD/work
done
fi
