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
python-setuptools python2-pip python2-dev python3-doc python2-doc
echo "install packages end"
echo "install pip packages begin"
echo "pip3..."
sudo pip3 install thefuck pylint
echo "pip2..."
pip install --upgrade pip=20.3
echo "install pip packages end"
