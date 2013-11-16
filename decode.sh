while getopts "n:s:w:e:t:l:o:m:" OPTION
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
         l)
             lod=$OPTARG
             ;;
         o)
             owndata=$OPTARG
             ;;
         m)
             defaultmaterial=$OPTARG
             ;;
     esac
done
ptp=$(pwd)

if [ "$owndata" == "n" ]
then
cd gis/
bash gis.sh -n $n -s $s -w $w -e $e -p $ptp
cd ..
fi

rm -rf $PWD/work/landmass
rm -rf $PWD/work/grass
rm -rf $PWD/work/osm_forest_c
rm -rf $PWD/work/osm_forest_d
rm -rf $PWD/work/osm_forest_m
rm -rf $PWD/work/osm_motorway
rm -rf $PWD/work/osm_motorway_link
rm -rf $PWD/work/osm_trunk
rm -rf $PWD/work/osm_primary
rm -rf $PWD/work/osm_secondary
rm -rf $PWD/work/osm_tertiary
rm -rf $PWD/work/osm_water_poly
rm -rf $PWD/work/osm_marsh
rm -rf $PWD/work/osm_heath
rm -rf $PWD/work/osm_scrub
rm -rf $PWD/work/osm_urban
rm -rf $PWD/work/osm_railway
rm -rf $PWD/work/osm_tram
rm -rf $PWD/work/osm_industrial
rm -rf $PWD/work/osm_meadow
rm -rf $PWD/work/osm_farm
rm -rf $PWD/work/osm_parking
rm -rf $PWD/work/osm_railway_siding
rm -rf $PWD/work/osm_railway_spur
rm -rf $PWD/work/osm_water_river
rm -rf $PWD/work/osm_water_canal
rm -rf $PWD/work/osm_water_stream
rm -rf $PWD/work/osm_unclassified
rm -rf $PWD/work/osm_residential
rm -rf $PWD/work/osm_service
rm -rf $PWD/work/osm_raceway
rm -rf $PWD/work/osm_sand
rm -rf $PWD/work/osm_grass
rm -rf $PWD/work/osm_unpaved_roads

bash ogr_decode.sh -l $lod -t $tg -m $defaultmaterial

