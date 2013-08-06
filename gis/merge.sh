#!/bin/bash

# getting input and output folder. output folder must exist.
while getopts "o:i:" OPTION
do
     case $OPTION in
         o)
             out=$OPTARG
             ;;
         i)
             in=$OPTARG
             ;;
     esac
done
echo "Output folder is: $out"
echo "Input  folder is: $in"

mkdir $out

#merging IN folder into OUT. All info now in OUT folder
ogr2ogr -skipfailures -update -append $PWD/$out/highway-line.shp $PWD/$in/data/highway-line.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -update -append $PWD/$out/landuse-polygon.shp $PWD/$in/data/landuse-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -update -append $PWD/$out/poi-polygon.shp $PWD/$in/data/poi-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -update -append $PWD/$out/railway-line.shp $PWD/$in/data/railway-line.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -update -append $PWD/$out/surface-polygon.shp $PWD/$in/data/surface-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -update -append $PWD/$out/vegetation-polygon.shp $PWD/$in/data/vegetation-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -update -append $PWD/$out/water-polygon.shp $PWD/$in/data/water-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -update -append $PWD/$out/water-line.shp $PWD/$in/data/water-line.shp -lco ENCODING=UTF-8

