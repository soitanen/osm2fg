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
$tg/tg-construct --ignore-landmass --threads --work-dir=$PWD/work --output-dir=$PWD/output/Terrain --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --priorities=$PWD/default_priorities.txt AirportArea SRTM-3 AirportObj grass osm_forest osm_motorway osm_motorway_link osm_trunk osm_primary osm_secondary osm_tertiary osm_water_poly osm_marsh osm_heath osm_scrub osm_urban osm_railway osm_tram osm_industrial osm_meadow osm_farm osm_parking osm_railway_siding osm_railway_spur osm_water_river osm_water_canal osm_water_stream osm_unclassified osm_residential osm_service osm_raceway osm_sand osm_grass osm_unpaved_roads
else
$tg/tg-construct --ignore-landmass --threads --tile-id=$tileid --work-dir=$PWD/work --output-dir=$PWD/output/Terrain --min-lon=$w --max-lon=$e --min-lat=$s --max-lat=$n --priorities=$PWD/default_priorities.txt AirportArea SRTM-3 AirportObj grass osm_forest osm_motorway osm_motorway_link osm_trunk osm_primary osm_secondary osm_tertiary osm_water_poly osm_marsh osm_heath osm_scrub osm_urban osm_railway osm_tram osm_industrial osm_meadow osm_farm osm_parking osm_railway_siding osm_railway_spur osm_water_river osm_water_canal osm_water_stream osm_unclassified osm_residential osm_service osm_raceway osm_sand osm_grass osm_unpaved_roads
fi
