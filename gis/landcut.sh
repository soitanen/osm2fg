#!/bin/bash

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

i=$s
while [ $i -lt $n ]
do
	j=$w
	   while [ $j -lt $e ]
		do
		ni=$(($i+1))
		ej=$(($j+1))
		y=125
		while [ $y -lt 1001 ]
		do
			x=125
			ys=$(($y-125))
			in=$i
			yn=$y
				if [ "$y" -eq 1000 ];
					then
					in=$(($i+1))
					yn=0
				fi
			while [ $x -lt 1001 ]
			do
				xw=$(($x-125))
				xe=$x
				je=$j
				if [ "$x" -eq 1000 ];
					then
					je=$(($j+1))
					xe=0
				fi
#echo ogr2ogr -skipfailures -clipsrc $j.$xw $i.$ys $je.$xe $in.$yn $PWD/osm_coastline/land_polygons-cut_"$j"_"$xw"_"$i"_"$ys".shp $PWD/osm_coastline/land_polygons.shp
		ogr2ogr -skipfailures -clipsrc $j.$xw $i.$ys $je.$xe $in.$yn $PWD/osm_coastline/land_polygons-cut_"$j"_"$xw"_"$i"_"$ys".shp $PWD/osm_coastline/land_polygons-cut.shp
				x=$(($x+125))
			done
			y=$(($y+125))
		done
		j=$(($j+1))
	done
	i=$(($i+1))
done

rm $PWD/osm_coastline/land_polygons-cut.*
