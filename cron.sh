#!/bin/bash

if [ $# -ne 5 ] 
then
  echo "cron.sh requires 4 arguments"
  exit 1
fi

drugID=$1
pillsPerTime=$2
minute=$3
hour=$4
day=$5

crontab -l > mycron
echo "$minute $hour \* \* $day ~/dispense_drug.sh $drugID $pillsPerTime" >> mycron
crontab mycron
rm mycron
