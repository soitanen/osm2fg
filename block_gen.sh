#!/bin/bash

while getopts "n:s:w:e:t:i:l:" OPTION
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
         l)
             lod=$OPTARG
             ;;
     esac
done

echo $n $s $w $e>>terrlog.txt

i=$s

echo "$(date): sh decode.sh -n $n -s $s -w $w -e $e -t $tg">>terrlog.txt
bash decode.sh -n $n -s $s -w $w -e $e -t $tg -l $lod

echo "$(date): sh terrain_gen.sh -n $n -s $s -w $w -e $e -t $tg">>terrlog.txt
bash terrain_gen.sh -n $n -s $s -w $w -e $e -t $tg -i $tileid
