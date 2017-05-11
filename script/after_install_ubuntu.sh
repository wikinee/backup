#!/bin/sh
# Program:
#	Run this shell script after Install Ubuntu.
#History:
#2016/10/29  wikinee First release

echo " Now, Update & Grade ..."

sudo apt-get update
 
sudo apt-get remove libreoffice-common unity-webapps-common thunderbird \
totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot \
gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku \
landscape-client-ui-install onboard deja-dup

sudo apt-get install git meld devhelp autojump \
zsh unrar-free exuberant-ctags fonts-noto-cjk fonts-noto fonts-noto-mono

sudo apt-get upgrade;sudo apt-get autoremove
