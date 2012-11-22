#!/usr/bin/perl

use POSIX;
use Carp;
use LWP::Simple;
use Math::Trig qw(great_circle_distance great_circle_destination great_circle_bearing deg2rad rad2deg);
use Getopt::Long;
use File::Slurp;
use File::Path qw(make_path remove_tree);

sub getnode
{
  my ($nodeid)=@_;
  my $lat;
  my $lon;

  if (defined $file) {
    print "Reading node $nodeid from file $file\n" if $verbose;
    ($nodeid,$lat,$lon)=getnodefromfile($nodeid);
    return ($nodeid,$lat,$lon);
  } else {
    print "Reading node $nodeid from api\n" if $verbose;
    ($nodeid,$lat,$lon)=getnodefromapi($nodeid);
    return ($nodeid,$lat,$lon);
  };
};

sub getnodefromapi
{
  my ($nodeid)=@_;
  my $nodexml=get("http://api.openstreetmap.org/api/0.6/node/$nodeid");
  my ($lat,$lon)=$nodexml=~/lat=[\'\"]([0-9\-\.]+)[\'\"] lon=[\'\"]([0-9\-\.]+)[\'\"]/gis;
  return ($nodeid,$lat,$lon);
};

sub getnodefromfile
{
  my ($nodeid)=@_;
  my $regex="(<node id=[\'\"]".$nodeid."[\'\"].*?\/>)";
  my $xml=read_file($file);
  ($nodexml)=$xml=~m#$regex#gis;
  my ($lat,$lon)=$nodexml=~/lat=[\'\"]([0-9\-\.]+)[\'\"] lon=[\'\"]([0-9\-\.]+)[\'\"]/gis;
  return ($nodeid,$lat,$lon);
};

sub getway
{
  my ($wayid)=@_;
  my $wayxml;
  
  if (defined $file) {
    print "Reading way $wayid from file $file\n" if $verbose;
    $wayxml=getwayfromfile($wayid);
    return ($wayxml);
  } else {
    print "Reading way $wayid from api\n" if $verbose;
    $wayxml=getwayfromapi($wayid);
    return ($wayxml);
  };
};

sub getwayfromapi
{
  my ($wayid)=@_;
  my $wayxml=get("http://api.openstreetmap.org/api/0.6/way/$wayid");
  return $wayxml;
};

sub getwayfromfile
{
  my ($wayid)=@_;
  my $regex="(<way id=\"".$wayid."\".*?<\/way>)";
  my $xml=read_file($file);
  ($wayxml)=$xml=~m#$regex#gis;
  return $wayxml;
};

sub rad2m
{
  my ($rad)=@_;
  return $rad*6377997;
};

sub m2rad
{
  my ($m)=@_;
  return $m/6377997;
};

sub bucket_span {
  my ($lat) = (@_);
  if ($lat>= 89.0 ) {
    return 360.0;
  } elsif ($lat>= 88.0 ) {
    return 8.0;
  } elsif ($lat>= 86.0 ) {
    return 4.0;
  } elsif ($lat>= 83.0 ) {
    return 2.0;
  } elsif ($lat>= 76.0 ) {
    return 1.0;
  } elsif ($lat>= 62.0 ) {
    return 0.5;
  } elsif ($lat>= 22.0 ) {
    return 0.25;
  } elsif ($lat>= -22.0 ) {
    return 0.125;
  } elsif ($lat>= -62.0 ) {
    return 0.25;
  } elsif ($lat>= -76.0 ) {
    return 0.5;
  } elsif ($lat>= -83.0 ) {
    return 1.0;
  } elsif ($lat>= -86.0 ) {
    return 2.0;
  } elsif ($lat>= -88.0 ) {
    return 4.0;
  } elsif ($lat>= -89.0 ) {
    return 8.0;
  } else {
    return 360.0;
  }
}

sub tile_index {

  my $EPSILON = 0.0000001;
  my ($lon, $lat) = (@_);
  my $lon_floor = POSIX::floor($lon);
  my $lat_floor = POSIX::floor($lat);
  my $span = bucket_span($lat);

  my $x;
  if ($span < $EPSILON) {
    $lon = 0;
    $x = 0;
  } elsif ($span <= 1.0) {
    $x = int(($lon - $lon_floor) / $span);
  } else {
    if ($lon >= 0) {
      $lon = int(int($lon/$span) * $span);
    } else {
      $lon = int(int(($lon+1)/$span) * $span - $span);
      if ($lon < -180) {
        $lon = -180;
      }
    }
    $x = 0;
  }

  my $y;
  $y = int(($lat - $lat_floor) * 8);

  my $index = 0;
  $index += ($lon_floor + 180) << 14;
  $index += ($lat_floor + 90) << 6;
  $index += $y << 3;
  $index += $x;

  return $index;
}

my @way;

# Constants
my $pi=3.14159265358979323846;
my $closedway=0;

# Defaults
my $wayid      = 29827954;
my $nodecount  = 0;
my $submitter  = "Auto-Bricky";
my $country    = "us";
my $desc       = "Auto Generated Bulding";
my $height     = 20;
my $modelname  = "Building";

$result = GetOptions ("h|height=f"     => \$height,
                      "lat=f"          => \$latitude,
                      "lon=f"          => \$longitude,
                      "n|name=s"       => \$modelname,
                      "v|verbose"      => \$verbose,
                      "w|way=i"        => \$wayid,
                      "x|xmlwrapper"   => \$wrapper,
                      "f|file=s"       => \$file,
                      "clean"          => \$clean );

my $wayxml=getway($wayid);

# Get osm building data from way
sub getosmdata {
  my ($wayheight) = $wayxml=~/tag k=\"height\" v=[\'\"]([0-9]+)[\'\"]/gis;
  my ($waylevels) = $wayxml=~/tag k=\"building:levels\" v=[\'\"]([0-9]+)[\'\"]/gis;
  my ($wayroofshape) = $wayxml=~/tag k=\"building:roof:shape\" v=[\'\"]([0-9]+)[\'\"]/gis;
  
  # No height given, number of floors maybe?
  if ($wayheight == "") {
    # One floor is roughly 3m
    $wayheight = $waylevels * 3;
  };
  # Use given/estimated height
  if ($wayheight != "") {
    $height = $wayheight;
  } 
  # Fall back to default height, with randomly an extra level
  else { 
    $height = $height + int(rand(2))*3;
  };
  
  if ($wayroofshape != "") {
    $roofshape = $wayroofshape;
  }
  # Estimate roof shape
  elsif ($height < 7) {
    $roofshape = "2.0";
  };
  
  return ($height,$waylevels,$roofshape);
};

my $wayxml=getway($wayid);
# Assemble way data structure
foreach ($wayxml=~/nd ref=[\'\"]([0-9]+)[\'\"]/gis)
{
  ($nodeid,$lat,$lon)=&getnode($_);
  $way[$nodecount]->{'node'} = $nodeid;
  $way[$nodecount]->{'lat'}  = $lat;
  $way[$nodecount]->{'lon'}  = $lon;
  $way[$nodecount]->{'x'}    = 0;
  $way[$nodecount]->{'y'}    = 0;
  print $nodecount." ".$nodeid." ".$lat." ".$lon."\n" if $verbose;
  $nodecount++;
};
my $reflat;
my $reflon;
if (defined($latitude)) {
  $reflat=$latitude;
} else {
  $reflat=$way[0]->{'lat'};
};
if (defined($longitude)) {
  $reflon=$longitude;
} else {
  $reflon=$way[0]->{'lon'};
};
# Process data structure
$max=@way-1;
if ($way[0]->{'node'}!=$way[$max]->{'node'})
{
# Work around!! Consider all ways "closed", even if they are not!!
  $closedway=1;

# $closedway=0;
# carp "This is not a closed way";
# exit 1;  
} else
{
  $closedway=1;
};

print "Positioning nodes:\n" if $verbose;
for ($node=0 ; $node<=$max ; $node++)
{
  if ($way[$node]->{'lon'}==$reflon && $way[$node]->{'lat'}==$reflat) {
    $way[$node]->{'x'} = 0;
    $way[$node]->{'y'} = 0;
  } else {
    $distancerad = great_circle_distance(deg2rad($reflon),deg2rad(90-$reflat)
                                    ,deg2rad($way[$node]->{'lon'}),deg2rad(90-$way[$node]->{'lat'}));
                                    $bearingrad = great_circle_bearing(deg2rad($reflon),deg2rad(90-$reflat)
                                    ,deg2rad($way[$node]->{'lon'}),deg2rad(90-$way[$node]->{'lat'}));
    $distancem=&rad2m($distancerad);
    $way[$node]->{'x'}=$distancem*cos($bearingrad);
    $way[$node]->{'y'}=$distancem*sin($bearingrad);
  };
  print $node." ".$way[$node]->{'x'}." ".$way[$node]->{'y'}."\n" if $verbose;
};

# Remove useless nodes
if ($clean) {
  sub cleaner {
    $maxi = $max-1;
    for ($n=@_; $n<=$maxi; $n++) {
      $node1 = $n+1;
      if ($node1 > $maxi) {
        $node1 = $node1-$maxi-1;
      };
      $node2 = $n+2;
      if ($node2 > $maxi) {
        $node2 = $node2-$maxi-1;
      };
    
      $x0 = $way[$n]->{'x'};
      $x1 = $way[$node1]->{'x'};
      $x2 = $way[$node2]->{'x'};
      $y0 = $way[$n]->{'y'};
      $y1 = $way[$node1]->{'y'};
      $y2 = $way[$node2]->{'y'};
      
      # Calculate distance from node to line between two adjacent nodes
      $labda = (($x2-$x0)*($x1-$x0)+($y2-$y0)*($y1-$y0))/(($x2-$x0)**2+($y2-$y0)**2);
      $dist = sqrt(($x1 - $x0 - $labda * ($x2-$x0))**2+($y1-$y0-$labda*($y2-$y0))**2);
      
      # Remove node if it is within 50 cm from the line
      if ($dist < 0.5){
        splice(@way,($node1),1);
        $maxi=$maxi-1;
        $max=$max-1;
        
        # Restart cleaner at the previous node, because the second node is different now.
        cleaner($n);
      };
    };
  };
  cleaner(0);
};

# Create ready-to-use output directory structure
my $path;
if ($reflon >= 0) {
  $path.="e".sprintf("%03d",floor($reflon/10)*10);
} else {
  $path.="w".sprintf("%03d",ceil(($reflon*-1)/10)*10);
} 
if ($reflat >= 0) {
  $path.="n".sprintf("%02d",floor($reflat/10)*10);
} else {
  $path.="s".sprintf("%02d",ceil($reflat/10)*10);
}
$path .= "/";
if ($reflon >= 0) {
  $path.="e".sprintf("%03d",floor($reflon));
} else {
  $path.="w".sprintf("%03d",ceil($reflon*-1));
}
if ($reflat >= 0) {
  $path.="n".sprintf("%02d",floor($reflat));
} else {
  $path.="s".sprintf("%02d",ceil($reflat));
}
# Create the folder
$path = "Output/Objects/".$path;
make_path($path);

$filebase = $path."/osm".$wayid;
open(AC,">$filebase.ac");

# Get osm building data
my ($height,$levels,$roofshape) = getosmdata();

# Number of vertices
my $totalverts;
my $layerverts;
if ($closedway==1) {
  $totalverts=(@way-1)*2;
  $layerverts=@way-1;
} else {
  $totalverts=(@way)*2;
  $layerverts=(@way);
};

# Disable gable roof for models with more than 4 corners.
if (($roofshape == 2.0) and ($totalverts!=8)) {
  $roofshape = 0;
}

# Textures
if ($roofshape == 2.0) {
  $walltexture = "wall.png"; 
} else {
  $walltexture = "flat".int(rand(3)).".png"; 
}
$rooftexture = "roof.png";

print AC "AC3Db
MATERIAL \"DefaultWhite\" rgb 1 1 1  amb 1 1 1  emis 0 0 0  spec 0.5 0.5 0.5  shi 64  trans 0
MATERIAL \"Roof\" rgb 1 1 1 amb 1 1 1 emis 0 0 0  spec 0.5 0.5 0.5  shi 64  trans 0
OBJECT world
kids 1
OBJECT group
name \"".$modelname."\"\n";
if ($roofshape == "2") {
  print AC "kids 2\n"
} else {
  print AC "kids 1\n"
};
print AC "OBJECT poly\"
name \"Walls\"
texture \"".$walltexture."\"
texrep 1 1\n";
if ($roofshape == "0") {
  print AC "numvert ".$totalverts."\n";
} else {
  print AC "numvert ".($totalverts+2)."\n";
};

for ($node=0 ; $node<$layerverts ; $node++)
{
  print AC $way[$node]->{'x'}." $height ".$way[$node]->{'y'}."\n";
};
for ($node=0 ; $node<$layerverts ; $node++)
{
  print AC $way[$node]->{'x'}." -5 ".$way[$node]->{'y'}."\n";
};
if ($roofshape == "2.0") {
  # Calculate length of two sides, to propose a roof orientation
  $side[0] = sqrt((abs($way[1]->{'x'}-$way[0]->{'x'})) ** 2+(abs($way[1]->{'y'}-$way[0]->{'y'})) ** 2);
  $side[1] = sqrt((abs($way[1]->{'x'}-$way[2]->{'x'})) ** 2+(abs($way[1]->{'y'}-$way[2]->{'y'})) ** 2);

  # Two vertices for the roof, location depends on roof orientation
  $roofheight = (2/3)*$side[$side[0] > $side[1]];
  if ($side[0] < $side[1]){ 
    $roofvert[0] = (($way[0]->{'x'}+$way[1]->{'x'})/2)." ".($height+$roofheight)." ".(($way[0]->{'y'}+$way[1]->{'y'})/2)."\n";
    $roofvert[1] = (($way[2]->{'x'}+$way[3]->{'x'})/2)." ".($height+$roofheight)." ".(($way[2]->{'y'}+$way[3]->{'y'})/2)."\n";
  } else {
    $roofvert[0] = (($way[1]->{'x'}+$way[2]->{'x'})/2)." ".($height+$roofheight)." ".(($way[1]->{'y'}+$way[2]->{'y'})/2)."\n";
    $roofvert[1] = (($way[3]->{'x'}+$way[0]->{'x'})/2)." ".($height+$roofheight)." ".(($way[3]->{'y'}+$way[0]->{'y'})/2)."\n";
  }
  print AC $roofvert[0];
  print AC $roofvert[1];
  
  $surfaces=$layerverts+2;
  print AC "numsurf ".$surfaces."\n";
} else {
  # Generate roof poly
  if ($closedway==1)
  {
    $surfaces=$layerverts+1;
    print AC "numsurf ".$surfaces."\n";
    print AC "SURF 0x20\n";
    print AC "mat 1\n";
    print AC "refs ".($layerverts-1)."\n";
    for ($node=$max-1 ; $node>0 ; $node--)
    {
      print AC $node ." 0 0\n";
    };
  } else
  {
    $surfaces=$layerverts-1;
    print AC "numsurf ".$surfaces."\n";
  };
};

# Generate walls
$sidenum = 0;
for ($wall=0 ; $wall<$layerverts ; $wall++)
{
  print AC "SURF 0x20\n";
  print AC "mat 0\n";
  print AC "refs 4\n";
  
  # Special case for final wall
  if (($wall==($layerverts-1)) and ($closedway==1))
  {
    $tl=0;
    $tr=$max-1;
    $bl=$max;
    $br=(2*$max)-1;
  } else {
    $tr=$wall;
    $tl=$wall+1;
    $br=$wall+$layerverts;
    $bl=$wall+$layerverts+1;
  };
  
  # calculate texture scales (how often should the texture repeat?)
  # one texture is 3m high and wide
  
  $texturex = 6;
  $texturey = 6;
  
  if ($levels == "") {
    if ($roofshape == 2.0) {
      $texturescaley = ($height+5) / $texturey;
    } else {
      $texturescaley = ($height+5) / 3 / 2 / 10;
    };
  } else { 
    if ($roofshape == 2.0) {
      $texturescaley = $levels / 2 / 2;
    } else {
      $texturescaley = $levels / 2 / 10;
    };
  };
  $texturescalex = $side[$sidenum] / 2 / $texturex;
  if ($sidenum == 1) {
    $sidenum = 0;
  } else {
    $sidenum++;
  };
  
  print AC $tr." -".$texturescalex." 0\n";
  print AC $tl." ".$texturescalex." 0\n";
  print AC $bl." ".$texturescalex." -".$texturescaley."\n";
  print AC $br." -".$texturescalex." -".$texturescaley."\n";
};
# Vertical end faces of the triangle roof
if ($roofshape=="2.0") {
  $texturescaley = $roofheight / $texturey;
  $texturescalex = $side[($side[0] < $side[1])] / 2 / $texturex;
  
  for ($node=0 ; $node<2 ; $node++) {
    $bl=1+(2*$node)+($side[0] > $side[1]);
    $br=2*$node+($side[0] > $side[1]);
    $tc=($totalverts)+$node;
    if ($bl > 3) { $bl = 0; };
    if ($br > 3) { $br = 0; };
    
    print AC "SURF 0x20\n";
    print AC "mat 0\n";
    print AC "refs 3\n";
    print AC $bl." ".$texturescalex." 0\n";
    print AC $br." ".$texturescalex." 0\n";
    print AC $tc." 0 ".$texturescaley."\n";
  };
  print AC "kids 0\n";
  
  print AC "OBJECT poly
name \"Roof\"
texture \"roof.png\"
texrep 1 1\n";
  print AC "numvert 6\n";
  for ($node=0 ; $node<$layerverts ; $node++) {
    print AC $way[$node]->{'x'}." $height ".$way[$node]->{'y'}."\n";
  };
  # Two vertices for the roof
  print AC $roofvert[0];
  print AC $roofvert[1];
  
  print AC "numsurf 2\n";
  
  $texturescaley = $roofheight / $texturey;
  $texturescalex = $side[($side[0] < $side[1])] / 4 / $texturex;
  
  # Actual roof, exists of two faces
  for ($node=0 ; $node<2 ; $node++) {
    $bl=(2*$node)+($side[0] > $side[1]);
    $br=$bl-1;
    $tl=5-$node;
    $tr=5-1+$node;
    if ($bl > 3) { $bl = $bl-3; };
    if ($br > 3) { $br = $br-3; };
    if ($bl < 0) { $bl = $bl+4; };
    if ($br < 0) { $br = $br+4; };
    
    print AC "SURF 0x20\n";
    print AC "mat 1\n";
    print AC "refs 4\n";
    print AC $bl." ".$texturescalex." 0\n";
    print AC $br." -".$texturescalex." 0\n";
    print AC $tl." -".$texturescalex." 1\n";
    print AC $tr." ".$texturescalex." 1\n";
  };
  print AC "kids 0\n";
};
close(AC);

# Write xml wrapper
if ($wrapper)
{
  open(XML,">$filebase.xml");
  print XML "<?xml version=\"1.0\"?>\n";
  print XML "<PropertyList>\n";
  print XML "    <path>osm".$wayid.".ac</path>\n";
  print XML "    <animation>\n";
  print XML "        <type>range</type>\n";
  print XML "        <min-m>0</min-m>\n";
  print XML "        <max-m>15000</max-m>\n";
  print XML "    </animation>\n";
  print XML "    <animation>\n";
  print XML "        <type>select</type>\n";
  print XML "        <condition>\n";
  print XML "            <property>/scenery/osm</property>\n";
  print XML "        </condition>\n";
  print XML "    </animation>\n";
  print XML "    <effect>\n";
  print XML "        <inherits-from>Effects/lightmap</inherits-from>\n";
  print XML "        <parameters>\n";
  print XML "            <texture n=\"1\">\n";
  print XML "                <image>flat-lit.png</image>\n";
  print XML "            </texture>\n";
  print XML "        </parameters>\n";
  print XML "        <object-name>".$modelname."</object-name>\n";
  print XML "    </effect>\n";
  print XML "</PropertyList>\n";
  close (XML);
};

# Write stg 
$tile=tile_index($reflon,$reflat);
$stgfile = $path."/".$tile.".stg";
open(STG,">>$stgfile");
#print STG "#desc: Auto-generated building ref $filebase\n";
#print STG "#tile: $tile\n";
if ($wrapper)
{
  print STG "OBJECT_STATIC osm".$wayid.".xml ".$reflon." ".$reflat." -9999 180\n";
} else
{
  print STG "OBJECT_STATIC osm".$wayid.".ac ".$reflon." ".$reflat." -9999 180\n";
};
close(STG);

exit 0;
