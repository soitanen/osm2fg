#!/bin/bash

while getopts "n:s:w:e:t:i:l:d:o:" OPTION
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
         d)
             decode=$OPTARG
             ;;
         o)
             owndata=$OPTARG
             ;;
     esac
done

echo $n $s $w $e>>terrlog.txt

i=$s

if [ "$decode" == "y" ]
then
echo "$(date): sh decode.sh -n $n -s $s -w $w -e $e -t $tg">>terrlog.txt
bash decode.sh -n $n -s $s -w $w -e $e -t $tg -l $lod -o $owndata
fi

echo "$(date): sh terrain_gen.sh -n $n -s $s -w $w -e $e -t $tg">>terrlog.txt
bash terrain_gen.sh -n $n -s $s -w $w -e $e -t $tg -i $tileid
