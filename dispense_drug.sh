#!/bin/bash

SLEEP_TIME_PER_PILL=0.5

# GPIO constants
GPIO18=1
GPIO23=2
GPIO24=3
GPIO25=4
GPIO12=5
GPIO16=6
GPIO20=7
GPIO21=8

DrugID=$1
Times=$2

# script must have 2 arguments
if [ $# -ne 2 ] 
then
  echo "dispense_drug.sh requires two arguments: drug id and number of pills."
  exit 1
fi

case "$DrugID" in 
  $GPIO18)
    sudo echo 1 > /sys/class/gpio/gpio18/value
    sleepTime=`echo "$SLEEP_TIME_PER_PILL * $Times" | bc`
    sleep "$sleepTime"
    sudo echo 0 > /sys/class/gpio/gpio18/value
    ;;
  $GPIO23)
    sudo echo 1 > /sys/class/gpio/gpio23/value
    sleepTime=`echo "$SLEEP_TIME_PER_PILL * $Times" | bc`
    sleep "$sleepTime"
    sudo echo 0 > /sys/class/gpio/gpio23/value
    ;;
  $GPIO24)
    sudo echo 1 > /sys/class/gpio/gpio24/value
    sleepTime=`echo "$SLEEP_TIME_PER_PILL * $Times" | bc`
    sleep "$sleepTime"
    sudo echo 0 > /sys/class/gpio/gpio24/value
    ;;
  $GPIO25)
    sudo echo 1 > /sys/class/gpio/gpio25/value
    sleepTime=`echo "$SLEEP_TIME_PER_PILL * $Times" | bc`
    sleep "$sleepTime"
    sudo echo 0 > /sys/class/gpio/gpio25/value
    ;;
  $GPIO12)
    sudo echo 1 > /sys/class/gpio/gpio12/value
    sleepTime=`echo "$SLEEP_TIME_PER_PILL * $Times" | bc`
    sleep "$sleepTime"
    sudo echo 0 > /sys/class/gpio/gpio12/value
    ;;
  $GPIO16)
    sudo echo 1 > /sys/class/gpio/gpio16/value
    sleepTime=`echo "$SLEEP_TIME_PER_PILL * $Times" | bc`
    sleep "$sleepTime"
    sudo echo 0 > /sys/class/gpio/gpio16/value
    ;;
  $GPIO20)
    sudo echo 1 > /sys/class/gpio/gpio20/value
    sleepTime=`echo "$SLEEP_TIME_PER_PILL * $Times" | bc`
    sleep "$sleepTime"
    sudo echo 0 > /sys/class/gpio/gpio20/value
    ;;
  $GPIO21)
    sudo echo 1 > /sys/class/gpio/gpio21/value
    sleepTime=`echo "$SLEEP_TIME_PER_PILL * $Times" | bc`
    sleep "$sleepTime"
    sudo echo 0 > /sys/class/gpio/gpio21/value
    ;;
esac
