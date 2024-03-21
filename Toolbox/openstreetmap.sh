#! /bin/zsh

# URL definition: https://wiki.openstreetmap.org/wiki/Browsing
#
# Parameter must be in this order:
#
# https://www.openstreetmap.org/?mlat=46.43120&mlon=7.52399#map=18/46.43120/7.52399&layers=Y
#
LOC="46.43120, 7.52399"
LAT="46.43120"
LON="7.52399"
MAP="#map=15/$LAT/$LON"
MARKER="?mlat=$LAT&mlon=$LON"
LAYER="&layers=Y"
URL="https://www.openstreetmap.org/"
FULLURL="$URL$MARKER$MAP$LAYER"
echo $FULLURL
open "$FULLURL"

