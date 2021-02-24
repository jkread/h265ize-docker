#!/bin/bash

echo "###########################################################################"
echo "# H265ize Server" 
echo "# " `date`
echo "# Input: " $INPUT
echo "# Output: " $OUTPUT
echo "# Temp: " $TEMP
args=()
args+=( "$INPUT" '-d' "$OUTPUT" '-t' "$TEMP" )
[ "$QUALITY" != "" ] && args+=( '-q' "$QUALITY" ) && echo "# Quality: " $QUALITY
[ "$PRESET" != "" ] && args+=( '-m' "$PRESET" ) && echo "# Preset: " $PRESET
[ "$ASPRESET" != "" ] && args+=( '--as-preset' "$ASPRESET" ) && echo "# AS Preset: " $ASPRESET
[ "$OVERRIDE" == "true" ] && args+=( '-o' ) && echo "# Override: " $OVERRIDE
[ "$DELETE" == "true" ] && args+=( '--delete' ) && echo "# Delete: " $DELETE
[ "$REPLACE" == "true" ] && args+=( '--replace' ) && echo "# Replace: " $REPLACE
[ "$PREVIEW" == "true" ] && args+=( '--preview' ) && echo "# Preview: " $PREVIEW
[ "$PREVIEWlength" != "" ] && args+=( '--preview-length' $(( $PREVIEWLENGTH * 1000 )) ) && echo "# Preview Length: " $PREVIEWLENGTH
[ "$TUNE" != "" ] && args+=( '--tune' "$TUNE" ) && echo "# Tune: " $TUNE
[ "$REF" != "" ] && args+=( '--ref' "$REF" ) && echo "# Ref Frames: " $REF
[ "$WEIGHTB" == "true" ] && args+=( '--weightb' ) && echo "# Weight B: " $WEIGHTB
[ "$BFRAMES" != "" ] && args+=( '--bframes' "$BFRAMES" ) && echo "# B Frames: " $BFRAMES
[ "$SCALE" != "" ] && args+=( '--scale' "$SCALE" ) && echo "# Scale Y: " $SCALE
[ "$DEBUG" == "true" ] && args+=( '--debug' ) && echo "# DEBUG: " $DEBUG
[ "$STATSFREQUENCY" != "" ] && args+=( '--stats-frequency' "$STATSFREQUENCY" ) && echo "# Stata Frequency: " "$STATSFREQUENCY"
[ "$DIFFLIMIT" != "" ]&& args+=( '--diff-limit' "$DIFFLIMIT" ) && echo "# Diff Limit: " "$DIFFLIMIT"
echo "# Sleep: " $SLEEP
echo "###########################################################################"

while :
do
echo "Executing h265ize " ${args[@]}
/usr/local/bin/h265ize "${args[@]}"
echo "Sleeping for " $SLEEP " seconds"
sleep $SLEEP
done
