#!/bin/sh
# Program:
#	Run this shell script after Install Ubuntu.
# History:
# 2019/10/30  wikinee First release
# may be should install from source if you frequent install system：
#  sublime, vscode
echo "Now, install some package..."
sudo yum install gcc rpm-build rpm-devel rpmlint make \
python bash coreutils diffutils patch rpmdevtools meson \
cmake3 python3

echo "Now, add ~/.rpmmacros example"
echo "%_topdir %(echo \`pwd\`)" >> ~/.rpmmacros
echo "%packager Ni Yongliang<yongliang@cpu-os.ac.cn>" >> ~/.rpmmacros
cat ~/.rpmmacros
