sudo apt-get update
sudo apt-get install p7zip gdal-bin liblwp-protocol-https-perl libfile-slurp-perl sox

mkdir -p output
mkdir -p work
mkdir -p data

mkdir -p data/airports_base
mkdir -p data/ASTER
mkdir -p data/shapefiles
mkdir -p data/airports

rm first.run
