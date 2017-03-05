#!/bin/bash

# output gpio pins that determines which drug to dispense
# gpio 18 - DRUG 1
sudo echo 18 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio18/direction
sudo echo 0 > /sys/class/gpio/gpio18/value
# gpio 23 - DRUG 2
sudo echo 23 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio23/direction
sudo echo 0 > /sys/class/gpio/gpio23/value
# gpio 24 - DRUG 3
sudo echo 24 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio24/direction
sudo echo 0 > /sys/class/gpio/gpio24/value
# gpio 25 - DRUG 4
sudo echo 25 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio25/direction
sudo echo 0 > /sys/class/gpio/gpio25/value
# gpio 12 - DRUG 5
sudo echo 12 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio12/direction
sudo echo 0 > /sys/class/gpio/gpio12/value
# gpio 16 - DRUG 6
sudo echo 16 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio16/direction
sudo echo 0 > /sys/class/gpio/gpio16/value
# gpio 20 - DRUG 7
sudo echo 20 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio20/direction
sudo echo 0 > /sys/class/gpio/gpio20/value
# gpio 21 - DRUG 8
sudo echo 21 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio21/direction
sudo echo 0 > /sys/class/gpio/gpio21/value

