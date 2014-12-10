while getopts "t:l:m:" OPTION
do
     case $OPTION in
         t)
             tg=$OPTARG
             ;;
         l)
             lod=$OPTARG
             ;;
         m)
             defaultmaterial=$OPTARG
             ;;
     esac
done


echo "LOD level set to $lod"
if [ "$lod" -ge 0 ]
then
	echo "**********************************************Decoding 0/$lod stage"
	echo $(date) Decoding osm_coastline into grass
	$tg/ogr-decode --continue-on-errors --area-type $defaultmaterial $PWD/work/grass $PWD/data/shapefiles/osm_coastline
	echo $(date) Decoding osm_water_poly
	$tg/ogr-decode --max-segment 500 --area-type Lake $PWD/work/osm_water_poly $PWD/data/shapefiles/osm_water_poly

fi

if [ "$lod" -ge 1 ]
then
	echo "**********************************************Decoding 1/$lod stage"
######## MOTORWAY #############################################
	echo $(date) Decoding osm_motorway 4 lanes
	$tg/ogr-decode --max-segment 400 --area-type 1x4_road --line-width 18 --where "LANES LIKE '%4%'" --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	echo $(date) Decoding osm_motorway 3 lanes
	$tg/ogr-decode --max-segment 400 --area-type 1x3_road --line-width 14 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	echo $(date) Decoding osm_motorway 2 lanes
	$tg/ogr-decode --max-segment 400 --area-type 2x2_road --line-width 10 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	echo $(date) Decoding osm_motorway NULL lanes
	$tg/ogr-decode --max-segment 400 --area-type 1x4_road --line-width 18 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%4%' AND LANES NOT LIKE '%2%'" --texture-lines $PWD/work/osm_motorway $PWD/data/shapefiles/osm_motorway
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 14 --where "HIGHWAY LIKE '%motorway%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###############################################################
############# TRUNK ###########################################
	echo $(date) Decoding osm_trunk 4 lanes two-way
	$tg/ogr-decode --max-segment 500 --area-type 2x4_road --line-width 18 --where "LANES LIKE '%4%' AND ONEWAY NOT LIKE '%yes%'" --texture-lines $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_trunk 4 lanes one-way
	$tg/ogr-decode --max-segment 500 --area-type 1x4_road --line-width 18 --where "LANES LIKE '%4%' AND ONEWAY LIKE '%yes%'" --texture-lines $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_trunk 2 lanes
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 12 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_trunk 3 lanes
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 15 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_trunk 1 lanes
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 8 --where "LANES LIKE '%1%'" --texture-lines $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	echo $(date) Decoding osm_trunk NULL lanes
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 15 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%2%' AND LANES NOT LIKE '%4%' AND LANES NOT LIKE '%1%'" --texture-lines $PWD/work/osm_trunk $PWD/data/shapefiles/osm_trunk
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 12 --where "HIGHWAY LIKE '%trunk%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###############################################################
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type 2x4_road --line-width 18 --where "LANES LIKE '%4%' AND ONEWAY NOT LIKE '%yes%'" --texture-lines $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type 1x4_road --line-width 18 --where "LANES LIKE '%4%' AND ONEWAY LIKE '%yes%'" --texture-lines $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 12 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 15 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 8 --where "LANES LIKE '%1%'" --texture-lines $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type 2x4_road --line-width 16 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%2%' AND LANES NOT LIKE '%4%' AND LANES NOT LIKE '%1%' AND ONEWAY NOT LIKE '%yes%'" --texture-lines $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	echo $(date) Decoding osm_primary
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 15 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%2%' AND LANES NOT LIKE '%4%' AND LANES NOT LIKE '%2%' AND ONEWAY LIKE '%yes%'" --texture-lines $PWD/work/osm_primary $PWD/data/shapefiles/osm_primary
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 12 --where "HIGHWAY LIKE '%primary%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###############################################################

	echo $(date) Decoding osm_forest
	$tg/ogr-decode --max-segment 500 --area-type EvergreenForest $PWD/work/osm_forest_c $PWD/data/shapefiles/osm_forest_c
	echo $(date) Decoding osm_forest
	$tg/ogr-decode --max-segment 500 --area-type DeciduousForest $PWD/work/osm_forest_d $PWD/data/shapefiles/osm_forest_d
	echo $(date) Decoding osm_forest
	$tg/ogr-decode --max-segment 500 --area-type MixedForest $PWD/work/osm_forest_m $PWD/data/shapefiles/osm_forest_m
	echo $(date) Decoding osm_urban
	$tg/ogr-decode --max-segment 500 --area-type Town $PWD/work/osm_urban $PWD/data/shapefiles/osm_urban

	echo $(date) Decoding osm_water_river
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_river $PWD/data/shapefiles/osm_water_river
	echo $(date) Decoding osm_water_canal
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 10 $PWD/work/osm_water_canal $PWD/data/shapefiles/osm_water_canal
	echo $(date) Decoding osm_railway
	$tg/ogr-decode --max-segment 500 --area-type Railroad_tex_1 --line-width 3 --texture-lines $PWD/work/osm_railway $PWD/data/shapefiles/osm_railway
	echo $(date) Decoding osm_industrial
	$tg/ogr-decode --max-segment 500 --area-type Industrial $PWD/work/osm_industrial $PWD/data/shapefiles/osm_industrial
fi

if [ "$lod" -ge 2 ]
then
	echo "**********************************************Decoding 2/$lod stage"
########## LINKS #############
	echo $(date) Decoding osm_links 4 lanes one-way
	$tg/ogr-decode --max-segment 500 --area-type 1x4_road --line-width 16 --where "LANES LIKE '%4%' AND ONEWAY LIKE '%yes%'" --texture-lines $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_links 4 lanes two-way
	$tg/ogr-decode --max-segment 500 --area-type 2x4_road --line-width 16 --where "LANES LIKE '%4%' AND ONEWAY NOT LIKE '%yes%'" --texture-lines $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_links 3 lanes
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 12 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_links 2 lanes
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 10 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_links 1 lane
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 6 --where "LANES LIKE '%1%'" --texture-lines $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	echo $(date) Decoding osm_links NULL lanes
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 8 --where "LANES NOT LIKE '%2%' AND LANES NOT LIKE '%1%' AND LANES NOT LIKE '%3%' AND LANES NOT LIKE '%4%'" --texture-lines $PWD/work/osm_motorway_link $PWD/data/shapefiles/osm_motorway_link
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 6 --where "HIGHWAY LIKE '%_link%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
#################################
########## SECONDARY ############
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type 2x4_road --line-width 16 --where "LANES LIKE '%4%' AND ONEWAYNOT LIKE '%yes%'" --texture-lines $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type 1x4_road --line-width 16 --where "LANES LIKE '%4%' AND ONEWAY LIKE '%yes%'" --texture-lines $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 14 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 10 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 8 --where "LANES LIKE '%1%'" --texture-lines $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	echo $(date) Decoding osm_secondary
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 12 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%2%' AND LANES NOT LIKE '%4%' AND LANES NOT LIKE '%1%'" --texture-lines $PWD/work/osm_secondary $PWD/data/shapefiles/osm_secondary
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 10 --where "HIGHWAY LIKE '%secondary%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###################################
	echo $(date) Decoding osm_tram
	$tg/ogr-decode --max-segment 500 --area-type Railroad_tex_1 --line-width 3 --texture-lines $PWD/work/osm_tram $PWD/data/shapefiles/osm_tram
	echo $(date) Decoding osm_farm
	$tg/ogr-decode --max-segment 500 --area-type IrrCrop $PWD/work/osm_farm $PWD/data/shapefiles/osm_farm
fi

if [ "$lod" -ge 3 ]
then
	echo "**********************************************Decoding 3/$lod stage"
####### TERTIARY ###################
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type 2x4_road --line-width 16 --where "LANES LIKE '%4%' AND ONEWAY NOT LIKE '%yes%'" --texture-lines $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type 1x4_road --line-width 16 --where "LANES LIKE '%4%' AND ONEWAY LIKE '%yes%'" --texture-lines $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 14 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 10 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 8 --where "LANES LIKE '%1%'" --texture-lines $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	echo $(date) Decoding osm_tertiary
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 10 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%2%' AND LANES NOT LIKE '%4%' AND LANES NOT LIKE '%1%'" --texture-lines $PWD/work/osm_tertiary $PWD/data/shapefiles/osm_tertiary
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 8 --where "HIGHWAY LIKE '%tertiary%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###################################
#### RACEWAY ######################
	echo $(date) Decoding osm_raceway
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 12 --texture-lines $PWD/work/osm_raceway $PWD/data/shapefiles/osm_raceway
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 8 --where "HIGHWAY LIKE '%raceway%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###################################
	echo $(date) Decoding osm_heath
	$tg/ogr-decode --max-segment 500 --area-type GrassCover $PWD/work/osm_heath $PWD/data/shapefiles/osm_heath
	echo $(date) Decoding osm_scrub
	$tg/ogr-decode --max-segment 500 --area-type Scrub $PWD/work/osm_scrub $PWD/data/shapefiles/osm_scrub
	echo $(date) Decoding osm_water_stream
	$tg/ogr-decode --max-segment 500 --area-type Stream --line-width 5 $PWD/work/osm_water_stream $PWD/data/shapefiles/osm_water_stream
	echo $(date) Decoding osm_railway_siding
	$tg/ogr-decode --max-segment 500 --area-type Railroad_tex_1 --line-width 3 --texture-lines $PWD/work/osm_railway_siding $PWD/data/shapefiles/osm_railway_siding
	echo $(date) Decoding osm_railway_spur
	$tg/ogr-decode --max-segment 500 --area-type Railroad_tex_1 --line-width 3 --texture-lines $PWD/work/osm_railway_spur $PWD/data/shapefiles/osm_railway_spur
	echo $(date) Decoding osm_meadow
	$tg/ogr-decode --max-segment 500 --area-type IrrCrop $PWD/work/osm_meadow $PWD/data/shapefiles/osm_meadow
	echo $(date) Decoding osm_grass
	$tg/ogr-decode --max-segment 500 --area-type Airport $PWD/work/osm_grass $PWD/data/shapefiles/osm_grass
	echo $(date) Decoding osm_sand
	$tg/ogr-decode --max-segment 500 --area-type Sand $PWD/work/osm_sand $PWD/data/shapefiles/osm_sand
fi

if [ "$lod" -ge 4 ]
then
	echo "**********************************************Decoding 4/$lod stage"
####### RESIDENTIAL ###################
	echo $(date) Decoding osm_residential
	$tg/ogr-decode --max-segment 500 --area-type 2x4_road --line-width 14 --where "LANES LIKE '%4%' AND ONEWAY NOT LIKE '%yes%'" --texture-lines $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	echo $(date) Decoding osm_residential
	$tg/ogr-decode --max-segment 500 --area-type 1x4_road --line-width 14 --where "LANES LIKE '%4%' AND ONEWAY LIKE '%yes%'" --texture-lines $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	echo $(date) Decoding osm_residential
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 12 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	echo $(date) Decoding osm_residential
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 8 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	echo $(date) Decoding osm_residential
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 6 --where "LANES LIKE '%1%'" --texture-lines $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	echo $(date) Decoding osm_residential
	$tg/ogr-decode --area-type 2x2_road --line-width 8 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%2%' AND LANES NOT LIKE '%4%' AND LANES NOT LIKE '%1%'" --texture-lines $PWD/work/osm_residential $PWD/data/shapefiles/osm_residential
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 5 --where "HIGHWAY LIKE '%residential%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###################################
####### UNCLASSIFIED ###################
	echo $(date) Decoding osm_unclassified
	$tg/ogr-decode --max-segment 500 --area-type 2x4_road --line-width 14 --where "LANES LIKE '%4%' AND ONEWAY NOT LIKE '%yes%'" --texture-lines $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	echo $(date) Decoding osm_unclassified
	$tg/ogr-decode --max-segment 500 --area-type 1x4_road --line-width 14 --where "LANES LIKE '%4%' AND ONEWAY LIKE '%yes%'" --texture-lines $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	echo $(date) Decoding osm_unclassified
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 12 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	echo $(date) Decoding osm_unclassified
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 8 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	echo $(date) Decoding osm_unclassified
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 6 --where "LANES LIKE '%1%'" --texture-lines $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	echo $(date) Decoding osm_unclassified
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 8 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%2%' AND LANES NOT LIKE '%4%' AND LANES NOT LIKE '%1%'" --texture-lines $PWD/work/osm_unclassified $PWD/data/shapefiles/osm_unclassified
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 5 --where "HIGHWAY LIKE '%unclassified%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###################################
	echo $(date) Decoding osm_marsh
	$tg/ogr-decode --max-segment 500 --area-type Marsh $PWD/work/osm_marsh $PWD/data/shapefiles/osm_marsh
fi
	
if [ "$lod" -ge 5 ]
then
	echo "**********************************************Decoding 5/$lod stage"
####### SERVICE ###################
	echo $(date) Decoding osm_service
	$tg/ogr-decode --max-segment 500 --area-type 1x3_road --line-width 10 --where "LANES LIKE '%3%'" --texture-lines $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	echo $(date) Decoding osm_service
	$tg/ogr-decode --max-segment 500 --area-type 2x2_road --line-width 7 --where "LANES LIKE '%2%'" --texture-lines $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	echo $(date) Decoding osm_service
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 5 --where "LANES LIKE '%1%'" --texture-lines $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	echo $(date) Decoding osm_service
	$tg/ogr-decode --max-segment 500 --area-type 1x1_road --line-width 7 --where "LANES NOT LIKE '%3%' AND LANES NOT LIKE '%2%' AND LANES NOT LIKE '%1%'" --texture-lines $PWD/work/osm_service $PWD/data/shapefiles/osm_service
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 4 --where "HIGHWAY LIKE '%service%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
###################################
	echo $(date) Decoding osm_parking
	$tg/ogr-decode --max-segment 500 --area-type Asphalt $PWD/work/osm_parking $PWD/data/shapefiles/osm_parking
fi

if [ "$lod" -ge 6 ]
then
	echo "**********************************************Decoding 6/$lod stage"
	echo $(date) Decoding osm_track
	$tg/ogr-decode --max-segment 400 --area-type dirt_road --line-width 4 --where "HIGHWAY LIKE '%track%'" --texture-lines $PWD/work/osm_unpaved_roads $PWD/data/shapefiles/osm_unpaved_roads
fi


