#!/bin/bash
CROP_NAME=$1
START_PLANTING_DAY=$2
FERTILIZER_RATE=$3
WEED_FRACTION=$4

OUTPUT_FILE=$5

psql -d cycles -c "\copy (SELECT date,country,admin1,admin2,admin3,production,grain_yield FROM cycles_results WHERE crop_name='$CROP_NAME' AND start_planting_day=$START_PLANTING_DAY AND fertilizer_rate=$FERTILIZER_RATE AND weed_fraction='$WEED_FRACTION') TO '$OUTPUT_FILE' WITH CSV"
