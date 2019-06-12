Debian Hacks
-----

1. source list not secure

change /etc/apt/apt.conf.d/70debconf file, add Acquire::AllowInsecureRepositories "true"; 

and run 'apt-config dump' to check it works

