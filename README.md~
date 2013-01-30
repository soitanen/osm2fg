osm2fg
======

Automatic converter from OpenStreetMap data to FlightGear scenery format

WARNING!!!
This script at this moment can generate terrain only in Russia and CIS countries.
Script was written in Ubuntu 12.10, and I can't guarantee proper work on other systems.

Installation:
a) If downloaded in archive:
   - unzip in any folder (ex. /home/your_name/osm2fg/)
b) Obtained from git:
   - just see Usage section. You can even delete files and folders except start.sh, first.run and this README
General:
Open file start.sh in any text editor and edit path to your Terragear binaries.

Usage:
- Run Terminal
- Change directory to /home/your_name/osm2fg/ (if you unzipped or obtained from git in that directory)
- run "bash start.sh -n xx -s xx -w xx -e xx -u y/n -b y/n -t y/n" where:
  -n xx - nothern boundary of genereated area
  -s xx - southern boundary of genereated area
  -w xx - western boundary of genereated area
  -e xx - eastern boundary of genereated area
  -u y/n - default: n
           If YES, script will make autoupdate and try to update Terragear (ONLY if Terragear and Simgear was compiled
           with download_and_compile.sh and terragear_download_and_compile.sh scripts.)
           Use this with Caution!!! Make backup of stable working Terragear before update it.
           osm2fg also will try to download script of automated compilation, if you don't have them.
  -b y/n - default: n
           If YES, script will generate buildings from OSM.
           Warning! Many objects will be killing for FPS.
  -t y/n - default: y
           If YES, script will generate scenery.
           If NO, script will do nothing.

Script will create folder osm2fg inside installation folder. All needed data will automaticly downloaded.
After finish you will hear "Fasten seatbelt" sound from Airbus.
Generated terrain will be placed in .../osm2fg/output/

Please feedback to soitanen.michael@gmail.com
