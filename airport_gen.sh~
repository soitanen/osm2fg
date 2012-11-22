#!/bin/bash

#parsing boundaries
while getopts "n:s:w:e:t:" OPTION
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
     esac
done

#downloading apt.dat
wget -N http://dev.x-plane.com/update/data/AptNav201208XP900.zip --directory-prefix=$PWD/data/airports_base/
unzip -uo $PWD/data/airports_base/AptNav201208XP900.zip apt.dat -d $PWD/data/airports_base/

#deleting old data from Work directory
rm -rf $PWD/work/AirportArea
rm -rf $PWD/work/AirportObj
rm -rf $PWD/work/Shared

#parsing all airports in area
#$tg/genapts850 --input=$PWD/data/airports_base/apt.dat --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --work=$PWD/work
#parsing airports, that placed in airports folder by hand
for i in $PWD/data/airports/*.dat; do $tg/genapts850 --input=$i --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --work=$PWD/work; done
