#!/bin/bash

# getting boundaries and folder in which will cut shapes (north-south-west-east and just name of folder)
# example: sh cut.sh -n 61 -s 59 -w 29 -e 31 -d RU-LEN
while getopts "n:s:w:e:d:" OPTION
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
	 d)
	     dir=$OPTARG
	     ;;
     esac
done

echo "Start to cut landuse"
# cutting shapefiles
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/$dir/highway-line-cut.shp $PWD/$dir/highway-line.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/$dir/landuse-polygon-cut.shp $PWD/$dir/landuse-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/$dir/poi-polygon-cut.shp $PWD/$dir/poi-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/$dir/railway-line-cut.shp $PWD/$dir/railway-line.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/$dir/surface-polygon-cut.shp $PWD/$dir/surface-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/$dir/vegetation-polygon-cut.shp $PWD/$dir/vegetation-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/$dir/water-polygon-cut.shp $PWD/$dir/water-polygon.shp -lco ENCODING=UTF-8
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/$dir/water-line-cut.shp $PWD/$dir/water-line.shp -lco ENCODING=UTF-8
echo "Finished to cut landuse. Start to cut landmass."
ogr2ogr -skipfailures -clipsrc $w $s $e $n $PWD/osm_coastline/land_polygons-cut.shp $PWD/land-polygons-split-4326/land_polygons.shp -lco ENCODING=UTF-8
echo "Finished cutting."
