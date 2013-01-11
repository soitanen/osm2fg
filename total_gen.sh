#!/bin/bash

while getopts "n:s:w:e:t:g:" OPTION
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
         g)
             gtopo=$OPTARG
             ;;
     esac
done


echo "$(date): Starting generating terrain">terrlog.txt


# height downloading and generation it in needed format
echo "$(date): Starting generating heights sh height_gen.sh -n $n -s $s -w $w -e $e -t $tg">>terrlog.txt
bash height_gen.sh -n $n -s $s -w $w -e $e -t $tg -g $gtopo
# generation of airports in area + selected airports in folder
echo "$(date): Starting generating airports sh airport_gen.sh -n $n -s $s -w $w -e $e -t $tg">>terrlog.txt
sh airport_gen.sh -n $n -s $s -w $w -e $e -t $tg
# generate terrain block in area
sh block_gen.sh -n $n -s $s -w $w -e $e -t $tg

echo "$(date): Finish generating terrain">>terrlog.txt
