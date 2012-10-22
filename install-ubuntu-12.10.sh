#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "You must be root!" 2>&1
	exit 1;
else
	echo "Now installing web services..."
	echo ""
	echo "Installing MySQL-server"
	sleep 1
	sudo apt-get install mysql-server mysql-client libmysqlclient-dev
	echo ""
	echo "Installing Apache2-server"
	sleep 1
	sudo apt-get install apache2 apache2.2-common apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert libapache2-mod-php5 php5 php5-common php5-gd php5-mysql php5-imap phpmyadmin php5-cli php5-cgi libapache2-mod-fcgid apache2-suexec php-pear php-auth php5-mcrypt mcrypt php5-imagick imagemagick libapache2-mod-suphp libruby libapache2-mod-ruby libapache2-mod-python
	echo ""
	echo "Installing php5-xcache for caching and optimizing PHP intermidiate code"
	sleep 1
	#sudo apt-get install libapache2-mod-php5 libapache2-mod-ruby libapache2-mod-python php5 php5-common php5-curl php5-dev php5-gd php5-idn php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-mysql php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
	apt-get install php5-xcache
fi