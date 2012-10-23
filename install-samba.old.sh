#!/bin/bash

## TO INSTALL SAMBA, SET THE VARIABLE TO: YES
INST_SAMBA="YES";
CONF_DIR="/Users/thomass/Desktop/test.cfg";

if [[ "$INST_SAMBA" == "NO" ]]; then
        echo "## Samba will not be installed... ##"
		sleep 2;
        exit 1;
else
        echo "## Samba will now be installed... ##"
		sleep 2;
		#sudo apt-get install samba
		
			echo "## Removing old smb.conf... ##"
			rm -r $CONF_DIR
			touch $CONF_DIR
			sleep 2;
			echo "[global]" >> $CONF_DIR
			echo "" >> $CONF_DIR
			echo "workgroup = WORKGROUP" >> $CONF_DIR
			echo "" >> $CONF_DIR
			echo "server string = %h server(Samba, Ubuntu)" >> $CONF_DIR
			echo "# This tells Samba to use a separate log file for each machine that connects" >> $CONF_DIR
			echo "log file = /var/log/samba/log.%m" >> $CONF_DIR
			echo "# Cap the size of the individual log files (in KiB)." >> $CONF_DIR
			echo "max log size = 1000" >> $CONF_DIR
			echo "" >> $CONF_DIR
			echo "syslog = 0" >> $CONF_DIR
			echo "# Do something sensible when Samba crashes: mail the admin a backtrace" >> $CONF_DIR
			echo "panic action = /usr/share/samba/panic-action %d" >> $CONF_DIR
			echo "encrypt password = true" >> $CONF_DIR
			echo "passdb backend = tdbsam" >> $CONF_DIR
			echo "obey pam restrictions = yes" >> $CONF_DIR
			echo "unix password sync = yes" >> $CONF_DIR
			echo "passwd program = /usr/bin/passwd %u" >> $CONF_DIR
			echo "passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* ." >> $CONF_DIR
			echo "pam password change = yes" >> $CONF_DIR
			echo "map to guest = bad user" >> $CONF_DIR
			echo "SO_RCVBUF=8192 SO_SNDBUF=8192" >> $CONF_DIR
			echo "socket options = TCP_NODELAY" >> $CONF_DIR
			echo "" >> $CONF_DIR
			echo "# Home directory" >> $CONF_DIR
			echo "[homes]" >> $CONF_DIR
			echo "read only = No" >> $CONF_DIR
			echo "browseable = Yes" >> $CONF_DIR
			echo "create mask = 0644" >> $CONF_DIR
			echo "directory mask = 0755" >> $CONF_DIR
		
fi