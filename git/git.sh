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

echo "======================git status===================="
git status
echo "Input git add parameter,like -A"
read add_file
git add $add_file
echo "======================git commit===================="
read -p "Git Commit This Changes? Enter Continue: " yn
if [ "$yn" == "" ];then
    echo "Now You Can Input Commit Message:"
else
    echo "Illeagal Character and Not Committed."
    exit
fi
read commit_msg
git commit -m "$commit_msg" -a
echo "======================git push======================"
echo "Push to git? Enter Continue"
read push_choice
if [ "$push_choice" == "" ] ;then
    echo "Now push files, input parameter 1 or Enter,Default 'origin'."
    read remote_des_origin
    echo "Now push files, input parameter 2 or Enter,Default 'master'."
    read remote_des_branch
    git push -u ${remote_des_origin:=origin} ${remote_des_branch:=master}
else
    echo "Already Commit, but Not Pushed"
fi
