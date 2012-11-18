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


echo "Starting at:">terrlog.txt
echo $(date)>>terrlog.txt

# height downloading and generation it in needed format
sh height_gen.sh -n $n -s $s -w $w -e $e -t $tg
# generation of airports in area + selected airports in folder
sh airport_gen.sh -n $n -s $s -w $w -e $e -t $tg
# generate terrain block in area
sh block_gen.sh -n $n -s $s -w $w -e $e -t $tg

echo "Finish at:">>terrlog.txt
echo $(date)>>terrlog.txt
