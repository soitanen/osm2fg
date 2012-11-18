#!/bin/bash

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

#echo "$tg/tg-construct --work-dir=$PWD/work --output-dir=$PWD/output/Terrain --lon=$x --lat=$y --xdist=0.125 --ydist=0.125">>terrlog.txt
$tg/tg-construct --work-dir=$PWD/work --output-dir=$PWD/output/Terrain --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --priorities=$PWD/default_priorities.txt AirportArea SRTM-3 AirportObj landmass grass osm_forest osm_motorway osm_motorway_link osm_trunk osm_primary osm_secondary osm_tertiary osm_water_poly osm_marsh osm_heath osm_scrub osm_urban osm_railway osm_tram osm_industrial osm_meadow osm_farm osm_parking osm_railway_siding osm_railway_spur osm_water_river osm_water_canal osm_water_stream osm_unclassified osm_residential osm_service osm_raceway osm_sand
