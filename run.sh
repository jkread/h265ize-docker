#!/bin/bash

echo "###########################################################################"
echo "# H265ize Server - " `date`
echo "# Input: " $INPUT
echo "# Output: " $OUTPUT
echo "# Quality: " $QUALITY
echo "# Preset: " $PRESET
echo "# Overide: " $OVERIDE
echo "# Delete: " $DELETE
echo "# Sleep: " $SLEEP
echo "###########################################################################"

args=()
args+=( "$INPUT" '-d' "$OUTPUT" )
[ "$QUALITY" != "" ] && args+=( '-q' "quality" )
[ "$OVERIDE" = "true" ] && args+=( '-o' )
[ "$DELETE" = "true" ] && args+=( '--delete' )
[ "$ASPRESET" != "" ] && args+=( '--as-preset' "$ASPRESET" )
[ "$PRESET" != "" ] && args+=( '-m' "$PRESET" )

while :
do
echo "Executing h265ize " ${args[@]}
/usr/local/bin/h265ize "${args[@]}"
echo "Sleeping for " $SLEEP " seconds"
sleep $SLEEP
done
