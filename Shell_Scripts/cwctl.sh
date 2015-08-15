#!/bin/bash
subcmd=$1
ssubcmd=$2
sssubcmd=$3
ssssubcmd=$4

error(){
echo "cwctl v1.0 (beta)"
echo "cwctl is private tool written for The Cyber Wings Team Members"
echo
echo "Usage: cwctl [OPTIONS...]"
echo
echo "Installing Servers OPTIONS"
echo "  install lamp            Install LAMP Server"
echo "  install firewall        Install FirewallD"
echo "  install av              Install Antivirus"
echo "  install cockpit		Install Cockpit"
echo "  install tomcat		Install Tomcat Server"
echo
echo "Apache Web Server"
echo "	add vhost		Add and config virtual host"
}
if [ "${subcmd:-0}" = "install" ]
then
	case $ssubcmd in
		lamp) echo "Installing LAMP Server"
		yum install httpd mariadb mariadb-server php php-mysql php-pspell php-mbstring php-dom php-gd php-imap -y
		systemctl start httpd mariadb
		systemctl enable httpd mariadb
		;;
		firewall) yum install firewalld -y
		systemctl start firewalld
		systemctl enable firewalld
		firewall-cmd --zone=public --add-service=http --permanent
		firewall-cmd --zone=public --add-service=https --permanent
		firewall-cmd --reload
		;;
		av) yum install clamav clamav-scanner clamav-update -y
		sed -i 's/Example/#Example/' /etc/freshclam.conf
		freshclam
		;;
		cockpit) yum install cockpit-assets
		systemctl start cockpit.service cockpit.socket
		systemctl enable cockpit.service cockpit.socket
		;;
		--help) error
		;;
		-h) error
		;;
		*) error 
		;;
	esac
elif [ "${subcmd:-0}" = "add" ]
then
	if [ "${ssubcmd:-0}" = "vhost" ]
	then
		if [ -s /etc/httpd/conf/httpd.conf ]
		then
			read -p "Enter your domain name: " vhost
		else
			echo "Error: Apache Web Server is not installed"
			exit
		fi
		
		if [ -z $vhost ]
		then
			echo "Error: Please enter domain name"
			exit
		fi

		echo "<VirtualHost *:80>" >> /etc/httpd/conf.d/vhost.conf
		echo "	ServerName $vhost" >> /etc/httpd/conf.d/vhost.conf
		echo "	DocumentRoot /var/www/$vhost/public_html/" >> /etc/httpd/conf.d/vhost.conf
		echo "	ErrorLog /var/www/$vhost/logs/error.log" >> /etc/httpd/conf.d/vhost.conf
		echo "	TransferLog /var/www/$vhost/logs/transfer.log" >> /etc/httpd/conf.d/vhost.conf
		echo "</VirtualHost>" >> /etc/httpd/conf.d/vhost.conf
		echo "" >> /etc/httpd/conf.d/vhost.conf
		mkdir /var/www/$vhost
		mkdir /var/www/$vhost/public_html
		mkdir /var/www/$vhost/logs
		touch /var/www/$vhost/logs/error.log
		touch /var/www/$vhost/logs/transfer.log
		restorecon -rv /var/www/$vhost/
		
	else
		error
	fi
elif [ "${subcmd:-0}" = "--about" ]
then
	echo "cwctl v1.0 (beta)"
        echo "cwctl is private tool written for The Cyber Wings Team Members, especially for Server Administration Team"
        echo
        echo "Written by Yan Naing Myint (Orca Krilozona)"
        echo "Any difficulties shall be reported to yannaing@cyberwings.asia"
else
	error
fi
