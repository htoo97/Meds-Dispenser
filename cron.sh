#!/bin/bash/

if [ $# -ne 4 ]
then
  echo "cron.sh requires 4 arguments: drugID, minute, hour and day"
  exit 1
fi

# parse arguments
DrugID=$1
min=$2
hour=$3
day=$4


