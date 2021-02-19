#!/bin/bash

echo "###########################################################################"
echo "# H265ize Server - " `date`
echo "# Input: " $INPUT
echo "# Output: " $OUTPUT
echo "# Temp: " $TEMP
echo "# Quality: " $QUALITY
echo "# Preset: " $PRESET
echo "# Overide: " $OVERIDE
echo "# Delete: " $DELETE
echo "# Replace: " $REPLACE
echo "# Preview: " $PREVIEW
echo "# Sleep: " $SLEEP
echo "# Debug: " $DEBUG
echo "###########################################################################"

args=()
args+=( "$INPUT" '-d' "$OUTPUT" '-t' "$TEMP" )
[ "$QUALITY" != "" ] && args+=( '-q' "$QUALITY" )
[ "$OVERIDE" == "true" ] && args+=( '-o' )
[ "$DELETE" == "true" ] && args+=( '--delete' )
[ "$REPLACE" == "true" ] && args+=( '--replace' )
[ "$PREVIEW" == "true" ] && args+=( '--preview' )
[ "$ASPRESET" != "" ] && args+=( '--as-preset' "$ASPRESET" )
[ "$PRESET" != "" ] && args+=( '-m' "$PRESET" )
[ "$TUNE" != "" ] && args+=( '--tune' "$TUNE" )
[ "$REF" != "" ] && args+=( '--ref' "$REF" )
[ "$WEIGHTB" == "true" ] && args+=( '--weightb' )
[ "$BFRAMES" != "" ] && args+=( '--bframes' "$BFRAMES" )
[ "$SCALE" != "" ] && args+=( '--scale' "$SCALE" )
[ "$DEBUG" == "true" ] && args+=( '--debug' )
[ "$STATSFREQUENCY" != "" ] && args+=( '--stats-frequency', "$STATSFREQUENCY" )

while :
do
echo "Executing h265ize " ${args[@]}
/usr/local/bin/h265ize "${args[@]}"
echo "Sleeping for " $SLEEP " seconds"
sleep $SLEEP
done
