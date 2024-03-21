# Process any remaining arguments
LOCATION=`echo "$@" | sed 's/,/ /'`

echo $LOCATION
for pos in `echo "$LOCATION"` ; do
  echo "Position: $pos"
done
unset pos
