Automatic converter from OpenStreetMap data to FlightGear scenery format

WARNING!!! This script at this moment can generate terrain only in Russia and CIS countries. Script was written in Ubuntu 12.10, and I can't guarantee proper work on other systems.

Installation: a) If downloaded in archive:

unzip in any folder (ex. /home/your_name/osm2fg/) b) Obtained from git:
just see Usage section. You can even delete files and folders except start.sh, first.run, tgpath.txt and this README General: Open file tgpath.txt in any text editor and edit path to your Terragear binaries.
Usage:

Run Terminal
Change directory to /home/your_name/osm2fg/ (if you unzipped or obtained from git in that directory)
run "bash start.sh -n xx -s xx -w xx -e xx -u y/n -b y/n -t y/n -g y/n -i 1234567 -l 1/2/3/4/5" where: -n xx - nothern boundary of genereated area -s xx - southern boundary of genereated area -w xx - western boundary of genereated area -e xx - eastern boundary of genereated area -u y/n - default: n If YES, script will make autoupdate and try to update Terragear (ONLY if Terragear and Simgear was compiled with download_and_compile.sh and terragear_download_and_compile.sh scripts.) Use this with Caution!!! Make backup of stable working Terragear before update it. osm2fg also will try to download script of automated compilation, if you don't have them. -b y/n - default: n If YES, script will generate buildings from OSM. Warning! Many objects will be killing for FPS. -t y/n - default: y If YES, script will generate scenery. If NO, script will do nothing. -g y/n - default: n If YES, script will use GTOPO30 elevation data, where SRTM-3 or ASTER is not present. If NO, script will use only SRTM-3 data and manualy putted ASTER data in *.hgt format. -i 1234567 If number is set here, script will generate only one tile with present id. Make effect only on terrain, not for OSM building. Coordinates do not computed automatically. If key -i is not used, script will generate all area in BBOX. -l 1/2/3/4/5 - default: 3 Level od detail from 1 (spase) to 5 (dense).
Script will create folder osm2fg inside installation folder. All needed data will automaticly downloaded. After finish you will hear "Fasten seatbelt" sound from Airbus. Generated terrain will be placed in .../osm2fg/output/

Please feedback to soitanen.michael@gmail.com
