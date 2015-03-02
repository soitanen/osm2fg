#!/bin/bash

while getopts "x:y:" OPTION
do
     case $OPTION in
         x)
             lon=$OPTARG
             ;;
         y)
             lat=$OPTARG
             ;;
     esac
done

trunc () {
	retval=${1%.*}
}

floor () {
	rounded=${1%.*}
	gr0=$(awk "BEGIN {if ($1 >= 0) print "1"; else print "0"}")
	if (( $gr0 > 0 ))
		then
			retval=$rounded
		else
			int=$(awk "BEGIN {if ($1 % 1 == 0) print "0"; else print "1"}")
			if (( $int > 0))
			then
				((retval=rounded-1))
			else
				((retval=rounded))
			fi
	fi
}

abs () {
	rounded=${1%.*}
	gr0=$(awk "BEGIN {if ($1 >= 0) print "1"; else print "0"}")
	if (( $gr0 > 0 ))
		then
			retval=$rounded
		else
			((retval=rounded * -1))
	fi
}

floor $lat
basey=$retval
trunc $(awk "BEGIN {print ($lat - $basey) * 8}")
y=$retval

trunc $lat
truncedy=$retval
abs $truncedy
absy=$retval
if [ "$absy" -ge 0 ];
then
	if [ "$absy" -lt 22 ];
	then
		tilewidth=0.125
	fi
fi
if [ "$absy" -ge 22 ];
then
	if [ "$absy" -lt 62 ];
	then
		tilewidth=0.25
	fi
fi
if [ "$absy" -ge 62 ];
then
	if [ "$absy" -lt 76 ];
	then
		tilewidth=0.5
	fi
fi
if [ "$absy" -ge 76 ];
then
	if [ "$absy" -lt 83 ];
	then
		tilewidth=1
	fi
fi
if [ "$absy" -ge 86 ];
then
	if [ "$absy" -lt 88 ];
	then
		tilewidth=4
	fi
fi
if [ "$absy" -ge 88 ];
then
	if [ "$absy" -lt 89 ];
	then
		tilewidth=8
	fi
fi
if [ "$absy" -ge 89 ];
then
	if [ "$absy" -lt 90 ];
	then
		tilewidth=360
	fi
fi

floor $(awk "BEGIN {print $lon / $tilewidth}")
int1=$retval
floor $(awk "BEGIN {print $int1 * $tilewidth}")
basex=$retval
floor $(awk "BEGIN {print ($lon - $basex) / $tilewidth}")
x=$retval

lon180=$(awk "BEGIN  {print $basex + 180}")
lat90=$(awk "BEGIN  {print $basey + 90}")

index=$(awk "BEGIN {print $lon180*(2^14) + $lat90*(2^6) + $y*(2^3) + $x}")

# debug output
#echo "    Base_y =" $basey
#echo "         y =" $y
#echo "Tile width =" $tilewidth
#echo "    Base_x =" $basex
#echo "         x =" $x
#echo " lon + 180 =" $lon180
#echo "  lat + 90 =" $lat90
#echo "     index =" $index

#normal output
echo $index


