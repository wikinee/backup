#!/bin/bash
# Description:
#   git clone for MySelf
# History:
#   2020/10/21 First release
# Author:
#   wikinee

set -e
mkdir $HOME/Github
cd $HOME/Github

git clone git@gitee.com:wikinee/backup.git
git clone git@gitee.com:wikinee/custom-fonts.git
git clone git@gitee.com:wikinee/powerline-fonts.git
git clone git@gitee.com:jiangxuefeng/v2rayL.git

sh backup/scripts/install-oh-my-zsh.sh
sudo mkdir -p /usr/local/share/fonts
sudo cp -r custom-fonts/* /usr/loca/share/fonts
cd /usr/loca/share/fonts
sudo ./CleanCache.sh