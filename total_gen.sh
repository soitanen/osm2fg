#!/bin/bash

while getopts "n:s:w:e:t:g:i:l:a:h:d:o:m:" OPTION
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
         a)
             airports=$OPTARG
             ;;
         h)
             heights=$OPTARG
             ;;
         d)
             decode=$OPTARG
             ;;
         o)
             owndata=$OPTARG
             ;;
         m)
             defaultmaterial=$OPTARG
             ;;
     esac
done


echo "$(date): Starting generating terrain">terrlog.txt
echo "$(date): LOD level is set to: $lod">>terrlog.txt

if [ "$heights" == "y" ]
then
# height downloading and generation it in needed format
echo "$(date): Starting generating heights sh height_gen.sh -n $n -s $s -w $w -e $e -t $tg -g $gtopo">>terrlog.txt
bash height_gen.sh -n $n -s $s -w $w -e $e -t $tg -g $gtopo
fi

if [ "$airports" == "y" ]
then
# generation of airports in area + selected airports in folder
echo "$(date): Starting generating airports sh airport_gen.sh -n $n -s $s -w $w -e $e -t $tg">>terrlog.txt
bash airport_gen.sh -n $n -s $s -w $w -e $e -t $tg
fi

# generate terrain block in area
bash block_gen.sh -n $n -s $s -w $w -e $e -t $tg -i $tileid -l $lod -d $decode -o $owndata -m $defaultmaterial

echo "$(date): Finish generating terrain">>terrlog.txt
