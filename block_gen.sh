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

echo $n $s $w $e>>terrlog.txt

i=$s

echo "sh decode.sh -n $n -s $s -w $w -e $e -t $tg at:">>terrlog.txt
echo $(date)>>terrlog.txt
sh decode.sh -n $n -s $s -w $w -e $e -t $tg

echo "sh terrain_gen.sh -n $n -s $s -w $w -e $e -t $tg at:">>terrlog.txt
echo $(date)>>terrlog.txt
sh terrain_gen.sh -n $n -s $s -w $w -e $e -t $tg

while [ $i -lt $n ]
do
	j=$w
  	while [ $j -lt $e ]
	do
		ni=$(($i+1))
		ej=$(($j+1))
		y=125
#		echo "sh decode.sh -n $ni -s $i -w $j -e $ej -t $tg at:">>terrlog.txt
#		echo $(date)>>terrlog.txt
#		sh decode.sh -n $ni -s $i -w $j -e $ej -t $tg
#		echo "sh terrain_gen.sh -n $ni -s $i -w $j -e $ej -t $tg at:">>terrlog.txt
#		echo $(date)>>terrlog.txt
#		sh terrain_gen.sh -n $ni -s $i -w $j -e $ej -t $tg
#			while [ $y -lt 1000 ]
#			do
#				x=125
#				while [ $x -lt 1000 ]
#				do
#				echo "sh terrain_gen.sh -x $j.$x -y $i.$y -t $tg">>terrlog.txt
#				sh terrain_gen.sh -x $j.$x -y $i.$y -t $tg
#				x=$(($x+250))
#				done
#			y=$(($y+250))
#			done
  		j=$(($j+1))
		#echo "j=$j">>terrlog.txt
	done
i=$(($i+1))
#echo "i=$i">>terrlog.txt
done
