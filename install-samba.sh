#!/bin/bash

## TO INSTALL SAMBA, SET THE VARIABLE TO: YES
INST_SAMBA="YES";
SMB_DIR="/etc/samba/smb.conf";
CONF_DIR="conf/smb.conf"
if [[ $EUID -ne 0 ]]; then
	echo "You must be root!" 2>&1
	echo "Use sudo when running the script!"
	exit 1;
else
		if [[ "$INST_SAMBA" == "NO" ]]; then
        	echo "## Samba will not be installed... ##"
			sleep 2;
        	exit 1;
		else
        	echo "## Samba will now be installed... ##"
			sleep 2;
			#sudo apt-get install samba
		
			echo "## Removing old smb.conf... ##"
			sudo rm -r $CONF_DIR
			sleep 2;
			sudo mv $CONF_DIR $SMB_DIR	
			echo ""
			echo ""
			echo "Which linux user do you want to add to Samba? (user MUST exist!)"
			read user
			sudo smbpasswd -a $USER
		fi
fi