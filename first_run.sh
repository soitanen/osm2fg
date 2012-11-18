sudo apt-get update
sudo apt-get install p7zip
sudo apt-get install gdal-bin
sudo apt-get install liblwp-protocol-https-perl
sudo apt-get install libfile-slurp-perl

git clone https://www.github.com/soitanen/osm2fg.git osm2fg

mkdir output
mkdir work
mkdir data
cd data
mkdir airports_base
mkdir ASTER
mkdir shapefiles
mkdir airports

rm first.run
