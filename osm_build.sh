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
i=$s
while [ $i -lt $n ]
do
	j=$w
  	while [ $j -lt $e ]
	do
		y=0
		while [ $y -lt 1000 ]
		do
			yi=$(($y+100))
			x=0
			while [ $x -lt 1000 ]
			do
				xi=$(($x+100))
				if [ "$xi" -gt 999 ]
				then
					xi=99999999
				fi
				if [ "$yi" -gt 999 ]
				then
					yi=99999999
				fi
				wget -N "http://overpass-api.de/api/xapi?way[bbox=$j.$x,$i.$y,$j.$xi,$i.$yi][building=*][@meta]"
				mv "xapi?way[bbox=$j.$x,$i.$y,$j.$xi,$i.$yi][building=*][@meta]" "$j.$x-$i.$y-$j.$xi-$i.$yi.osm"
				grep "<way" "$j.$x-$i.$y-$j.$xi-$i.$yi.osm"|cut -f2 -d\">file.txt
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
echo Number of elements in $j.$x-$i.$y-$j.$xi-$i.$yi.osm: ${#ARRAY[@]}
echo "$(date): Number of elements in $j.$x-$i.$y-$j.$xi-$i.$yi.osm: ${#ARRAY[@]}">>terrlog.txt
num=${#ARRAY[@]}
totalsum=$(($totalsum+$num))
exec 0<&10 10<&-
##################################################################################
k=0
while [ $k -lt "$num" ]
do
	echo "Processing element number $k of $num: ${ARRAY[k]}"
	perl bob.pl -w ${ARRAY[k]} -f "$j.$x-$i.$y-$j.$xi-$i.$yi.osm"
	k=$(($k+1))
done

unset ARRAY


				x=$(($x+100))
			done
			y=$(($y+100))
		done
  		j=$(($j+1))
	done
	i=$(($i+1))
done

rm -rf $PWD/*.osm
echo "$(date): Total number of buildings is $totalsum">>terrlog.txt
echo "$(date): Finish of building generation">>terrlog.txt
