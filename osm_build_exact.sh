#!/bin/bash

echo "$(date): Start generating OSM buildings">>terrlog.txt

while getopts "n:s:w:e:" OPTION
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
     esac
done

totalsum=0

				wget -N "http://overpass-api.de/api/xapi?way[bbox=$w,$s,$e,$n][building=*][@meta]"
				mv "xapi?way[bbox=$w,$s,$e,$n][building=*][@meta]" "$w-$s-$e-$n.osm"
				grep "<way" "$w-$s-$e-$n.osm"|cut -f2 -d\">file.txt
################################################################################
declare -a ARRAY
#  (stdin)
exec 10<&0
exec < $PWD/file.txt
let count=0
while read LINE; do
    ARRAY[$count]=$LINE
    ((count++))
done
echo Number of elements in $w-$s-$e-$n.osm: ${#ARRAY[@]}
echo "$(date): Number of elements in $w-$s-$e-$n.osm: ${#ARRAY[@]}">>terrlog.txt
num=${#ARRAY[@]}
totalsum=$(($totalsum+$num))
exec 0<&10 10<&-
##################################################################################
k=0
while [ $k -lt "$num" ]
do
	echo "Processing element number $k of $num : ${ARRAY[k]}"
	perl bob.pl -w ${ARRAY[k]} -f "$w-$s-$e-$n.osm"
	k=$(($k+1))
done

unset ARRAY


rm -rf $PWD/*.osm

echo "$(date): Total number of buildings is $totalsum">>terrlog.txt
echo "$(date): Finish of building generation">>terrlog.txt
