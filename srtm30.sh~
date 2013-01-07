#!/bin/bash

#parsing boundaries
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

rm -rf $PWD/work/SRTM-30

if [ "$n" -gt 40 ]
then
	ni="n90"
	if [ "$w" -lt -140 -a "$e" -gt -180 ]
	then
		wi="w180"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -100 -a "$e" -gt -140 ]
	then
		wi="w140"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -60 -a "$e" -gt -100 ]
	then
		wi="w100"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -20 -a "$e" -gt -60 ]
	then
		wi="w060"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 20 -a "$e" -gt -20 ]
	then
		wi="w020"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 60 -a "$e" -gt 20 ]
	then
		wi="e020"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 100 -a "$e" -gt 60 ]
	then
		wi="e060"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 140 -a "$e" -gt 100 ]
	then
		wi="e100"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 180 -a "$e" -gt 140 ]
	then
		wi="e140"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
fi

if [ "$n" -gt -10 -a "$s" -lt 40 ]
then
	ni="n40"
	if [ "$w" -lt -140 -a "$e" -gt -180 ]
	then
		wi="w180"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -100 -a "$e" -gt -140 ]
	then
		wi="w140"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -60 -a "$e" -gt -100 ]
	then
		wi="w100"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -20 -a "$e" -gt -60 ]
	then
		wi="w060"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 20 -a "$e" -gt -20 ]
	then
		wi="w020"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 60 -a "$e" -gt 20 ]
	then
		wi="e020"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 100 -a "$e" -gt 60 ]
	then
		wi="e060"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 140 -a "$e" -gt 100 ]
	then
		wi="e100"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 180 -a "$e" -gt 140 ]
	then
		wi="e140"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
fi

if [ "$s" -lt -10 ]
then
	ni="s10"
	if [ "$w" -lt -140 -a "$e" -gt -180 ]
	then
		wi="w180"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -100 -a "$e" -gt -140 ]
	then
		wi="w140"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -60 -a "$e" -gt -100 ]
	then
		wi="w100"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt -20 -a "$e" -gt -60 ]
	then
		wi="w060"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 20 -a "$e" -gt -20 ]
	then
		wi="w020"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 60 -a "$e" -gt 20 ]
	then
		wi="e020"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 100 -a "$e" -gt 60 ]
	then
		wi="e060"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 140 -a "$e" -gt 100 ]
	then
		wi="e100"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
	if [ "$w" -lt 180 -a "$e" -gt 140 ]
	then
		wi="e140"
		hgtfile="$wi""$ni"
                wget -N http://dds.cr.usgs.gov/srtm/version2_1/SRTM30/$hgtfile/$hgtfile.dem.zip --directory-prefix=$PWD/data/SRTM-30/
                unzip -uo $PWD/data/SRTM-30/$hgtfile.dem.zip -d $PWD/data/SRTM-30/
                rm $PWD/data/SRTM-30/$hgtfile.dem.zip
	fi
fi


#formatting heights from SRTM
#for f in $PWD/data/SRTM-30/*.dem; do $tg/hgtchop 3 $f $PWD/work/SRTM-3; done
#formatting heights from ASTER GDEM format (if present)
#for f in $PWD/data/ASTER/*.hgt; do $tg/hgtchop 1 $f $PWD/work/SRTM-1; done
#terrafit - removes some errors and make data more fast
#$tg/terrafit --maxnodes 1000 --maxerror 0.1 $PWD/work/SRTM-3
#$tg/terrafit --maxnodes 1000 --maxerror 0.1 $PWD/work/SRTM-1
