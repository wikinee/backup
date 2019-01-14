#! /bin/bash
# Program:
# 	Run this shell script if you need redshif
# History:
# 	2019/01/14 wikinee first release

echo -n "Are you need install redshift? (yes/no)"
read install_choose

case $install_choose in
	"N"|"NO"|"no"|"No"|"n")
		echo "Do nothing, exit.";;
	"Y"|"y"|"Yes"|"yes"|"YES")
		echo "will install redshift and redshift-gtk";;
		sudo apt install redshift redshift-gtk
		systemctl enable /usr/lib/systemd/user/redshift.service
		start redshift.service
	*)
		echo "Do nothing, exit.";;
esac