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

sudo apt-get install git meld clang cmake vim-youcompleteme \
devhelp autojump zsh  classicmenu-indicator vpnc exfat-fuse unrar \
gnome-tweak-tool llvm exuberant-ctags

sudo apt-get upgrade;sudo apt-get autoremove
