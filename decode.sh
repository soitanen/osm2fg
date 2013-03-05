while getopts "n:s:w:e:t:l:o:" OPTION
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
rm -rf $PWD/work/osm_forest
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


if [ "$lod" -eq 1 ]
then
	echo $(date) Decoding osm_coastline into grass
	$tg/ogr-decode --continue-on-errors --area-type Grassland $PWD/work/grass $PWD/data/shapefiles/osm_coastline
	echo $(date) Decoding osm_motorway
	$tg/ogr-decode --max-segment 400 --area-type  Road --line-width 18 --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	#echo $(date) Decoding osm_links
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_trunk
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 18 $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 16 $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	#echo $(date) Decoding osm_secondary
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	#echo $(date) Decoding osm_tertiary
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	#echo $(date) Decoding osm_unclassified
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	#echo $(date) Decoding osm_residential
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	#echo $(date) Decoding osm_service
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 5 $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	#echo $(date) Decoding osm_raceway
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 --texture-lines $PWD/work/osm_raceway $PWD/data/shapefiles/osm_raceway
	echo $(date) Decoding osm_water_poly
	$tg/ogr-decode --max-segment 500 --area-type Lake $PWD/work/osm_water_poly $PWD/data/shapefiles/osm_water_poly
	#echo $(date) Decoding osm_marsh
	#$tg/ogr-decode --max-segment 500 --area-type Marsh $PWD/work/osm_marsh $PWD/data/shapefiles/osm_marsh
	#echo $(date) Decoding osm_heath
	#$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_heath $PWD/data/shapefiles/osm_heath
	#echo $(date) Decoding osm_scrub
	#$tg/ogr-decode --max-segment 500 --area-type Scrub $PWD/work/osm_scrub $PWD/data/shapefiles/osm_scrub
	echo $(date) Decoding osm_urban
	$tg/ogr-decode --max-segment 500 --area-type Town $PWD/work/osm_urban $PWD/data/shapefiles/osm_urban
	echo $(date) Decoding osm_forest
	$tg/ogr-decode --max-segment 500 --area-type DeciduousForest $PWD/work/osm_forest $PWD/data/shapefiles/osm_forest
	echo $(date) Decoding osm_water_river
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_river $PWD/data/shapefiles/osm_water_river
	echo $(date) Decoding osm_water_canal
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_canal $PWD/data/shapefiles/osm_water_canal
	#echo $(date) Decoding osm_water_stream
	#$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 5 $PWD/work/osm_water_stream $PWD/data/shapefiles/osm_water_stream
	echo $(date) Decoding osm_railway
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 8 $PWD/work/osm_railway $PWD/data/shapefiles/osm_railway
	#echo $(date) Decoding osm_railway_siding
	#$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_siding $PWD/data/shapefiles/osm_railway_siding
	#echo $(date) Decoding osm_railway_spur
	#$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_spur $PWD/data/shapefiles/osm_railway_spur
	#echo $(date) Decoding osm_tram
	#$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_tram $PWD/data/shapefiles/osm_tram
	echo $(date) Decoding osm_industrial
	$tg/ogr-decode --max-segment 500 --area-type Industrial $PWD/work/osm_industrial $PWD/data/shapefiles/osm_industrial
	#echo $(date) Decoding osm_meadow
	#$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_meadow $PWD/data/shapefiles/osm_meadow
	#echo $(date) Decoding osm_farm
	#$tg/ogr-decode --max-segment 500 --area-type ComplexCrop $PWD/work/osm_farm $PWD/data/shapefiles/osm_farm
	#echo $(date) Decoding osm_parking
	#$tg/ogr-decode --max-segment 500 --area-type Asphalt $PWD/work/osm_parking $PWD/data/shapefiles/osm_parking
	#echo $(date) Decoding osm_sand
	#$tg/ogr-decode --max-segment 500 --area-type Sand $PWD/work/osm_sand $PWD/data/shapefiles/osm_sand
fi
if [ "$lod" -eq 2 ]
then
	echo $(date) Decoding osm_coastline into grass
	$tg/ogr-decode --continue-on-errors --area-type Grassland $PWD/work/grass $PWD/data/shapefiles/osm_coastline
	echo $(date) Decoding osm_motorway
	$tg/ogr-decode --max-segment 400 --area-type  Road --line-width 18 --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	echo $(date) Decoding osm_links
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_trunk
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 18 $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 16 $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	#echo $(date) Decoding osm_tertiary
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	#echo $(date) Decoding osm_unclassified
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	#echo $(date) Decoding osm_residential
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	#echo $(date) Decoding osm_service
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 5 $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	#echo $(date) Decoding osm_raceway
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 --texture-lines $PWD/work/osm_raceway $PWD/data/shapefiles/osm_raceway
	echo $(date) Decoding osm_water_poly
	$tg/ogr-decode --max-segment 500 --area-type Lake $PWD/work/osm_water_poly $PWD/data/shapefiles/osm_water_poly
	#echo $(date) Decoding osm_marsh
	#$tg/ogr-decode --max-segment 500 --area-type Marsh $PWD/work/osm_marsh $PWD/data/shapefiles/osm_marsh
	#echo $(date) Decoding osm_heath
	#$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_heath $PWD/data/shapefiles/osm_heath
	#echo $(date) Decoding osm_scrub
	#$tg/ogr-decode --max-segment 500 --area-type Scrub $PWD/work/osm_scrub $PWD/data/shapefiles/osm_scrub
	echo $(date) Decoding osm_urban
	$tg/ogr-decode --max-segment 500 --area-type Town $PWD/work/osm_urban $PWD/data/shapefiles/osm_urban
	echo $(date) Decoding osm_forest
	$tg/ogr-decode --max-segment 500 --area-type DeciduousForest $PWD/work/osm_forest $PWD/data/shapefiles/osm_forest
	echo $(date) Decoding osm_water_river
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_river $PWD/data/shapefiles/osm_water_river
	echo $(date) Decoding osm_water_canal
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_canal $PWD/data/shapefiles/osm_water_canal
	#echo $(date) Decoding osm_water_stream
	#$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 5 $PWD/work/osm_water_stream $PWD/data/shapefiles/osm_water_stream
	echo $(date) Decoding osm_railway
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 8 $PWD/work/osm_railway $PWD/data/shapefiles/osm_railway
	#echo $(date) Decoding osm_railway_siding
	#$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_siding $PWD/data/shapefiles/osm_railway_siding
	#echo $(date) Decoding osm_railway_spur
	#$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_spur $PWD/data/shapefiles/osm_railway_spur
	echo $(date) Decoding osm_tram
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_tram $PWD/data/shapefiles/osm_tram
	echo $(date) Decoding osm_industrial
	$tg/ogr-decode --max-segment 500 --area-type Industrial $PWD/work/osm_industrial $PWD/data/shapefiles/osm_industrial
	#echo $(date) Decoding osm_meadow
	#$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_meadow $PWD/data/shapefiles/osm_meadow
	echo $(date) Decoding osm_farm
	$tg/ogr-decode --max-segment 500 --area-type ComplexCrop $PWD/work/osm_farm $PWD/data/shapefiles/osm_farm
	#echo $(date) Decoding osm_parking
	#$tg/ogr-decode --max-segment 500 --area-type Asphalt $PWD/work/osm_parking $PWD/data/shapefiles/osm_parking
	#echo $(date) Decoding osm_sand
	#$tg/ogr-decode --max-segment 500 --area-type Sand $PWD/work/osm_sand $PWD/data/shapefiles/osm_sand
fi
if [ "$lod" -eq 3 ]
then
	echo $(date) Decoding osm_coastline into grass
	$tg/ogr-decode --continue-on-errors --area-type Grassland $PWD/work/grass $PWD/data/shapefiles/osm_coastline
	echo $(date) Decoding osm_motorway
	$tg/ogr-decode --max-segment 400 --area-type  Road --line-width 18 --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	echo $(date) Decoding osm_links
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_trunk
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 18 $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 16 $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	#echo $(date) Decoding osm_unclassified
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	#echo $(date) Decoding osm_residential
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	#echo $(date) Decoding osm_service
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 5 $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	echo $(date) Decoding osm_raceway
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 --texture-lines $PWD/work/osm_raceway $PWD/data/shapefiles/osm_raceway
	echo $(date) Decoding osm_water_poly
	$tg/ogr-decode --max-segment 500 --area-type Lake $PWD/work/osm_water_poly $PWD/data/shapefiles/osm_water_poly
	#echo $(date) Decoding osm_marsh
	#$tg/ogr-decode --max-segment 500 --area-type Marsh $PWD/work/osm_marsh $PWD/data/shapefiles/osm_marsh
	echo $(date) Decoding osm_heath
	$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_heath $PWD/data/shapefiles/osm_heath
	echo $(date) Decoding osm_scrub
	$tg/ogr-decode --max-segment 500 --area-type Scrub $PWD/work/osm_scrub $PWD/data/shapefiles/osm_scrub
	echo $(date) Decoding osm_urban
	$tg/ogr-decode --max-segment 500 --area-type Town $PWD/work/osm_urban $PWD/data/shapefiles/osm_urban
	echo $(date) Decoding osm_forest
	$tg/ogr-decode --max-segment 500 --area-type DeciduousForest $PWD/work/osm_forest $PWD/data/shapefiles/osm_forest
	echo $(date) Decoding osm_water_river
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_river $PWD/data/shapefiles/osm_water_river
	echo $(date) Decoding osm_water_canal
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_canal $PWD/data/shapefiles/osm_water_canal
	echo $(date) Decoding osm_water_stream
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 5 $PWD/work/osm_water_stream $PWD/data/shapefiles/osm_water_stream
	echo $(date) Decoding osm_railway
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 8 $PWD/work/osm_railway $PWD/data/shapefiles/osm_railway
	echo $(date) Decoding osm_railway_siding
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_siding $PWD/data/shapefiles/osm_railway_siding
	echo $(date) Decoding osm_railway_spur
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_spur $PWD/data/shapefiles/osm_railway_spur
	echo $(date) Decoding osm_tram
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_tram $PWD/data/shapefiles/osm_tram
	echo $(date) Decoding osm_industrial
	$tg/ogr-decode --max-segment 500 --area-type Industrial $PWD/work/osm_industrial $PWD/data/shapefiles/osm_industrial
	echo $(date) Decoding osm_meadow
	$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_meadow $PWD/data/shapefiles/osm_meadow
	echo $(date) Decoding osm_farm
	$tg/ogr-decode --max-segment 500 --area-type ComplexCrop $PWD/work/osm_farm $PWD/data/shapefiles/osm_farm
	#echo $(date) Decoding osm_parking
	#$tg/ogr-decode --max-segment 500 --area-type Asphalt $PWD/work/osm_parking $PWD/data/shapefiles/osm_parking
	echo $(date) Decoding osm_sand
	$tg/ogr-decode --max-segment 500 --area-type Sand $PWD/work/osm_sand $PWD/data/shapefiles/osm_sand
fi
if [ "$lod" -eq 4 ]
then
	echo $(date) Decoding osm_coastline into grass
	$tg/ogr-decode --continue-on-errors --area-type Grassland $PWD/work/grass $PWD/data/shapefiles/osm_coastline
	echo $(date) Decoding osm_motorway
	$tg/ogr-decode --max-segment 400 --area-type  Road --line-width 18 --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	echo $(date) Decoding osm_links
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_trunk
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 18 $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 16 $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	echo $(date) Decoding osm_unclassified
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	echo $(date) Decoding osm_residential
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	#echo $(date) Decoding osm_service
	#$tg/ogr-decode --max-segment 500 --area-type Road --line-width 5 $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	echo $(date) Decoding osm_raceway
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 --texture-lines $PWD/work/osm_raceway $PWD/data/shapefiles/osm_raceway
	echo $(date) Decoding osm_water_poly
	$tg/ogr-decode --max-segment 500 --area-type Lake $PWD/work/osm_water_poly $PWD/data/shapefiles/osm_water_poly
	echo $(date) Decoding osm_marsh
	$tg/ogr-decode --max-segment 500 --area-type Marsh $PWD/work/osm_marsh $PWD/data/shapefiles/osm_marsh
	echo $(date) Decoding osm_heath
	$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_heath $PWD/data/shapefiles/osm_heath
	echo $(date) Decoding osm_scrub
	$tg/ogr-decode --max-segment 500 --area-type Scrub $PWD/work/osm_scrub $PWD/data/shapefiles/osm_scrub
	echo $(date) Decoding osm_urban
	$tg/ogr-decode --max-segment 500 --area-type Town $PWD/work/osm_urban $PWD/data/shapefiles/osm_urban
	echo $(date) Decoding osm_forest
	$tg/ogr-decode --max-segment 500 --area-type DeciduousForest $PWD/work/osm_forest $PWD/data/shapefiles/osm_forest
	echo $(date) Decoding osm_water_river
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_river $PWD/data/shapefiles/osm_water_river
	echo $(date) Decoding osm_water_canal
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_canal $PWD/data/shapefiles/osm_water_canal
	echo $(date) Decoding osm_water_stream
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 5 $PWD/work/osm_water_stream $PWD/data/shapefiles/osm_water_stream
	echo $(date) Decoding osm_railway
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 8 $PWD/work/osm_railway $PWD/data/shapefiles/osm_railway
	echo $(date) Decoding osm_railway_siding
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_siding $PWD/data/shapefiles/osm_railway_siding
	echo $(date) Decoding osm_railway_spur
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_spur $PWD/data/shapefiles/osm_railway_spur
	echo $(date) Decoding osm_tram
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_tram $PWD/data/shapefiles/osm_tram
	echo $(date) Decoding osm_industrial
	$tg/ogr-decode --max-segment 500 --area-type Industrial $PWD/work/osm_industrial $PWD/data/shapefiles/osm_industrial
	echo $(date) Decoding osm_meadow
	$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_meadow $PWD/data/shapefiles/osm_meadow
	echo $(date) Decoding osm_farm
	$tg/ogr-decode --max-segment 500 --area-type ComplexCrop $PWD/work/osm_farm $PWD/data/shapefiles/osm_farm
	#echo $(date) Decoding osm_parking
	#$tg/ogr-decode --max-segment 500 --area-type Asphalt $PWD/work/osm_parking $PWD/data/shapefiles/osm_parking
	echo $(date) Decoding osm_sand
	$tg/ogr-decode --max-segment 500 --area-type Sand $PWD/work/osm_sand $PWD/data/shapefiles/osm_sand
fi
if [ "$lod" -eq 5 ]
then
	echo $(date) Decoding osm_coastline into grass
	$tg/ogr-decode --continue-on-errors --area-type Grassland $PWD/work/grass $PWD/data/shapefiles/osm_coastline
	echo $(date) Decoding osm_motorway
	$tg/ogr-decode --max-segment 400 --area-type  Road --line-width 18 --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	echo $(date) Decoding osm_links
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_trunk
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 18 $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 16 $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 10 $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	echo $(date) Decoding osm_unclassified
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	echo $(date) Decoding osm_residential
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 7 $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	echo $(date) Decoding osm_service
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 5 $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	echo $(date) Decoding osm_raceway
	$tg/ogr-decode --max-segment 500 --area-type Road --line-width 12 --texture-lines $PWD/work/osm_raceway $PWD/data/shapefiles/osm_raceway
	echo $(date) Decoding osm_water_poly
	$tg/ogr-decode --max-segment 500 --area-type Lake $PWD/work/osm_water_poly $PWD/data/shapefiles/osm_water_poly
	echo $(date) Decoding osm_marsh
	$tg/ogr-decode --max-segment 500 --area-type Marsh $PWD/work/osm_marsh $PWD/data/shapefiles/osm_marsh
	echo $(date) Decoding osm_heath
	$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_heath $PWD/data/shapefiles/osm_heath
	echo $(date) Decoding osm_scrub
	$tg/ogr-decode --max-segment 500 --area-type Scrub $PWD/work/osm_scrub $PWD/data/shapefiles/osm_scrub
	echo $(date) Decoding osm_urban
	$tg/ogr-decode --max-segment 500 --area-type Town $PWD/work/osm_urban $PWD/data/shapefiles/osm_urban
	echo $(date) Decoding osm_forest
	$tg/ogr-decode --max-segment 500 --area-type DeciduousForest $PWD/work/osm_forest $PWD/data/shapefiles/osm_forest
	echo $(date) Decoding osm_water_river
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_river $PWD/data/shapefiles/osm_water_river
	echo $(date) Decoding osm_water_canal
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_canal $PWD/data/shapefiles/osm_water_canal
	echo $(date) Decoding osm_water_stream
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 5 $PWD/work/osm_water_stream $PWD/data/shapefiles/osm_water_stream
	echo $(date) Decoding osm_railway
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 8 $PWD/work/osm_railway $PWD/data/shapefiles/osm_railway
	echo $(date) Decoding osm_railway_siding
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_siding $PWD/data/shapefiles/osm_railway_siding
	echo $(date) Decoding osm_railway_spur
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_railway_spur $PWD/data/shapefiles/osm_railway_spur
	echo $(date) Decoding osm_tram
	$tg/ogr-decode --max-segment 500 --area-type Railroad --line-width 4 $PWD/work/osm_tram $PWD/data/shapefiles/osm_tram
	echo $(date) Decoding osm_industrial
	$tg/ogr-decode --max-segment 500 --area-type Industrial $PWD/work/osm_industrial $PWD/data/shapefiles/osm_industrial
	echo $(date) Decoding osm_meadow
	$tg/ogr-decode --max-segment 500 --area-type NaturalCrop $PWD/work/osm_meadow $PWD/data/shapefiles/osm_meadow
	echo $(date) Decoding osm_farm
	$tg/ogr-decode --max-segment 500 --area-type ComplexCrop $PWD/work/osm_farm $PWD/data/shapefiles/osm_farm
	echo $(date) Decoding osm_parking
	$tg/ogr-decode --max-segment 500 --area-type Asphalt $PWD/work/osm_parking $PWD/data/shapefiles/osm_parking
	echo $(date) Decoding osm_sand
	$tg/ogr-decode --max-segment 500 --area-type Sand $PWD/work/osm_sand $PWD/data/shapefiles/osm_sand
fi



