#!/bin/bash

USERNAME="glassfish"
GLASSFISH="glassfish-3.1.2.2.zip"
CONFPATH="conf"

if [[ EUID -ne 0 ]]; then
	echo "You must be root!" 2>&1
	echo "Use sudo when running the script!"
	exit 1;
else
	echo "Installing glassfish..."
	sleep 2;
	if [[ id -u $USERNAME >/dev/null 2>&1 ]];then
		echo "User $USERNAME exists!"
		echo "Run sudo deluser glassfish && sudo delgroup glassfishadm"
		echo "and run script again"
	else
		echo "Adding a new user called glassfish..."
		#sudo adduser --home /home/glassfish --system --shell /bin/bash glassfish
		sleep 1;
		echo "Add a new group for glassfish administration..."
		#sudo groupadd glassfishadm
		sleep 1;
		echo -n "What user would you like to add as Glassfish administrator?\n"
		read administrator
		#sudo usermod -a -G glassfishadm $administrator
		echo "\n\n"
		sudo apt-get install unzip
		sudo su - glassfish
		mkdir downloads
		cd /home/$USERNAME/downloads
		wget http://download.java.net/glassfish/3.1.2.2/release/$GLASSFISH
		unzip $GLASSFISH
		mv /home/$USERNAME/downloads/glassfishv3/* /home/$USERNAME
		exit
		echo "\n\nSetting permissions..."
		sleep 2;
		sudo chgrp -R glassfishadm /home/$USERNAME
		sudo chown -R glassfish /home/$USERNAME
		sudo chmod -R +x /home/$USERNAME/bin/
		sudo chmod -R +x /home/$USERNAME/glassfish/bin
		sudo chgrp -R glassfishadm /home/$USERNAME
		sudo mv $CONFPATH/glassfish /etc/init.d/
		sudo chmod a+x /etc/init.d/glassfish
		sudo su - glassfish
		echo "Set your master password for Glassfish"
		sleep 3;
		/home/glassfish/bin/asadmin change-master-password --savemasterpassword=true
		echo "\n\nDo you want to install autostart of glassfish on each startup?"
		
	fi
fi