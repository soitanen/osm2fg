#!/bin/bash

while getopts "n:s:w:e:t:g:i:l:" OPTION
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
         i)
             tileid=$OPTARG
             ;;
         l)
             lod=$OPTARG
             ;;
     esac
done


echo "$(date): Starting generating terrain">terrlog.txt
echo "$(date): LOD level is set to: $lod">>terrlog.txt


# height downloading and generation it in needed format
echo "$(date): Starting generating heights sh height_gen.sh -n $n -s $s -w $w -e $e -t $tg -g $gtopo">>terrlog.txt
bash height_gen.sh -n $n -s $s -w $w -e $e -t $tg -g $gtopo
# generation of airports in area + selected airports in folder
echo "$(date): Starting generating airports sh airport_gen.sh -n $n -s $s -w $w -e $e -t $tg">>terrlog.txt
sh airport_gen.sh -n $n -s $s -w $w -e $e -t $tg
# generate terrain block in area
sh block_gen.sh -n $n -s $s -w $w -e $e -t $tg -i $tileid -l $lod

echo "$(date): Finish generating terrain">>terrlog.txt
