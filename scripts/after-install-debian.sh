#!/bin/sh
# Program:
#	Run this shell script after Install Ubuntu.
# History:
# 2017/06/04  wikinee First release
# may be should install from source if you frequent install system：
#  vim, cmake, nodejs,

echo "###################### Installing ###########################"

echo "Create directory..."
mkdir $HOME/Github $HOME/Workspace $HOME/Software

echo "Install chrome..."
cd $HOME/Softare
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "Install sublime..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

echo "Install vscode..."
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

echo " Now, Update & Grade ..."
sudo apt-get update;
# sudo apt-get upgrade

echo "Install packages..."
sudo apt-get install zsh git meld devhelp dconf-editor exuberant-ctags \
    autojump screenfetch htop gitk unrar vim tree cmake lnav shellcheck \
    d-feet apt-transport-https screenruler devscripts gnome-common fakeroot \
    qt5-default python3-pip python3-doc wget curl sublime-text code


echo "###################### Fonts ###########################"
cd $HOME/Github
echo "git clone git@gitee.com:wikinee/custom-fonts.git"
git clone https://gitee.com/wikinee/backup.git

echo "###################### Scripts  #######################"
sh $HOME/Github/backup/scripts/install-oh-my-zsh.sh
sh $HOME/Github/backup/scripts/build-python-dev.sh

