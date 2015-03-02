#!/bin/bash

while getopts "n:s:w:e:t:i:" OPTION
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
         i)
             tileid=$OPTARG
             ;;
     esac
done

#if need for debug:  --debug-shapes=$tileid:all

if [ "$tileid" -eq 0 ]
then

old_tile=0

#counting maximum possible tiles amount
((max_x = (e - w) * 8 ))
((max_y = (n - s) * 8 ))

for y in `seq 1 $max_y`;
do
	for x in `seq 1 $max_x`;
	do
		tile_x=$(awk "BEGIN {print $w + 0.0625 + ($x - 1)*0.125}")
		tile_y=$(awk "BEGIN {print $s + 0.0625 + ($y - 1)*0.125}")
		tile_index=$(./tile.sh -x $tile_x -y $tile_y)
		if [[ $tile_index -ne $old_tile ]];
			then
				$tg/tg-construct --ignore-landmass --threads --tile-id=$tile_index --work-dir=$PWD/work --output-dir=$PWD/output/Terrain --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --priorities=$PWD/default_priorities.txt AirportArea SRTM-3 AirportObj grass osm_forest_c osm_forest_m osm_forest_d osm_motorway osm_motorway_link osm_trunk osm_primary osm_secondary osm_tertiary osm_water_poly osm_marsh osm_heath osm_scrub osm_urban osm_railway osm_tram osm_industrial osm_meadow osm_farm osm_parking osm_railway_siding osm_railway_spur osm_water_river osm_water_canal osm_water_stream osm_unclassified osm_residential osm_service osm_raceway osm_sand osm_grass osm_unpaved_roads				
		fi
		old_tile=$tile_index
	done
done


else
$tg/tg-construct --ignore-landmass --threads --tile-id=$tileid --work-dir=$PWD/work --output-dir=$PWD/output/Terrain --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --priorities=$PWD/default_priorities.txt AirportArea SRTM-3 AirportObj grass osm_forest_c osm_forest_m osm_forest_d osm_motorway osm_motorway_link osm_trunk osm_primary osm_secondary osm_tertiary osm_water_poly osm_marsh osm_heath osm_scrub osm_urban osm_railway osm_tram osm_industrial osm_meadow osm_farm osm_parking osm_railway_siding osm_railway_spur osm_water_river osm_water_canal osm_water_stream osm_unclassified osm_residential osm_service osm_raceway osm_sand osm_grass osm_unpaved_roads
fi
