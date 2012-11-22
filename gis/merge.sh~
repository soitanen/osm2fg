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
ogr2ogr -update -append $PWD/$out/highway-line.shp $PWD/$in/highway-line.shp
ogr2ogr -update -append $PWD/$out/landuse-polygon.shp $PWD/$in/landuse-polygon.shp
ogr2ogr -update -append $PWD/$out/poi-polygon.shp $PWD/$in/poi-polygon.shp
ogr2ogr -update -append $PWD/$out/railway-line.shp $PWD/$in/railway-line.shp
ogr2ogr -update -append $PWD/$out/surface-polygon.shp $PWD/$in/surface-polygon.shp
ogr2ogr -update -append $PWD/$out/vegetation-polygon.shp $PWD/$in/vegetation-polygon.shp
ogr2ogr -update -append $PWD/$out/water-polygon.shp $PWD/$in/water-polygon.shp
ogr2ogr -update -append $PWD/$out/water-line.shp $PWD/$in/water-line.shp

