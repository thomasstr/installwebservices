#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "You must be root!" 2>&1
	exit 1;
else
	echo "Now installing web services..."
	echo ""
	echo "Installing MySQL-server"
	sleep 1
	#apt-get install mysql-server mysql-client libmysqlclient-dev
	echo ""
	echo "Installing Apache2-server"
fi