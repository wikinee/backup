# !/bin/bash
#  maybe you are using other bash,fix the first line.
# Program:
#  this program is for git push
#  before use this script, you must add you git private key,like follow shell command.
#  ssh-add you_ssh_private_key_path,like ssh-add ~/.ssh_github/id_rsa
# History:
#  2015/10  wikinee First release
# OS:
#  ubuntu 14.04 LTS
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin/:~/bin:$PATH
export PATH

echo "======================git config===================="
echo "Ignore Permission"
git config core.fileMode false
echo "======================git branch===================="
git branch
echo "======================git fetch======================"
echo "Input destination branch, must be already exist in remote.Enter use master:"
read to_branch
echo "Add tmp branch to store diff,This time will modify following:"
git fetch origin ${to_branch:=master}:tmp
git diff tmp
read -p "Merge it.Input Enter to continue: " yn
if [ "$yn" == "" ];then
    echo "now merge it."
    git merge tmp
else echo "Illeagal Character."
  exit
fi