
LOCATION=`echo "$@" | sed 's/,/ /'`
for word in `echo "$LOCATION"`; do 
  echo "$word"
done

LAT=`echo "$1"`

echo $LOCATION
echo $LAT
echo $LONG
echo "Done"
