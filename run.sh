#!/bin/bash

echo "###########################################################################"
echo "# H265ize Server - " `date`
echo "# Input: " $INPUT
echo "# Output: " $OUTPUT
echo "# Quality: " $QUALITY
echo "# Preset: " $PRESET
echo "# Overide: " $OVERIDE
echo "# Delete: " $DELETE
echo "###########################################################################"

args=()
args+=( "$INPUT" '-d' "$OUTPUT" '-q' "$QUALITY" '-m' "$PRESET" )
(( OVERIDE == "true" )) && args+= ( '-o' )
(( DELETE == "true" )) && args+= ( '--delete' )

echo ""
echo "Executing h265ize " ${args[@]}

/usr/local/bin/h265ize "${args[@]}"
