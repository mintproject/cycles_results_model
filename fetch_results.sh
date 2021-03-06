#!/bin/bash
CROP_NAME=$2
START_PLANTING_DAY=$4
FERTILIZER_RATE=$6
WEED_FRACTION=$8

HOST="https://cycles-results.mint.isi.edu"

#mkdir -p outputs
sleep 5

echo "date,country,admin1,admin2,admin3,crop_production,grain_yield" > outputs/cycles-output.csv
curl -s "$HOST/getCyclesResults/$CROP_NAME/$START_PLANTING_DAY/$FERTILIZER_RATE/$WEED_FRACTION" >> outputs/cycles-output.csv
