#!/bin/sh
# Program:
#   Run this shell script to get Python develop environment.
# History:
#   2019/01/30  wikinee First release
echo " Now, install python develop environment..."
echo "udate source list..."
sudo apt update
echo "udate source list end"
echo "install packages..."
sudo apt install python3-pip python3-dev python3-setuptools \
python-setuptools python-pip python-dev \
python3-doc python-doc
echo "install packages end"
