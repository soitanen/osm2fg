#!/bin/bash

while getopts "t:" OPTION
do
     case $OPTION in
     	t)
             tg=$OPTARG
             ;;
     esac
done

cd $tg
cd ..
cd ..
cd ..
sh download_and_compile.sh OSG
sh download_and_compile.sh SIMGEAR
sh terragear_download_and_compile.sh TERRAGEAR



if [ -d "osm2fg" ]
				then
					echo "osm2fg exists already."
				else
					# no repository yet - need to clone a fresh one
					git clone https://www.github.com/soitanen/osm2fg.git osm2fg
				fi

				cd osm2fg

				git fetch origin
									
					git branch -f master origin/master 2> /dev/null || true
					# switch to unstable branch. No error is reported if we're already on the branch.
					git checkout -f master
					# pull latest version from the unstable branch
					git pull
				

				cd ..

