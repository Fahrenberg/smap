#
# Input : 46.43120, 7.52399
#
# URL definition: https://wiki.openstreetmap.org/wiki/Browsing
#
# Parameter must be in this order:
#
# https://www.openstreetmap.org/?mlat=46.43120&mlon=7.52399#map=18/46.43120/7.52399&layers=Y
#
LOCATION=$(echo "$@" | sed 's/,/ /')
set -- $LOCATION

LAT=$1
LON=$2
MAP="#map=15/$LAT/$LON"
MARKER="?mlat=$LAT&mlon=$LON"
LAYER="&layers=Y"
URL="https://www.openstreetmap.org/"
FULLURL="$URL$MARKER$MAP$LAYER"
echo $FULLURL
open "$FULLURL"

