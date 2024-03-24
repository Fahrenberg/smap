
LOCATION=$(echo "$@" | sed 's/,/ /')
set -- $LOCATION

echo $1
echo $2
echo $0

for i in $*; do
  echo $i
done
echo "Done"
