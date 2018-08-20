#!/bin/sh
# Program:
#	Run this shell script after Install Ubuntu.
# History:
# 2017/06/04  wikinee First release
# may be should install from source if you frequent install system：
#  vim, cmake, nodejs,

echo " Now, Update & Grade ..."

sudo apt-get update;sudo apt-get upgrade

echo "Install packages..."

sudo apt-get install zsh git meld devhelp dconf-editor exuberant-ctags \
    autojump screenfetch htop gitk unrar vim tree cmake wps-office lnav

echo "May be you also need vscode, sublime, chrome, and so on."
