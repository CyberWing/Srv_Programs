#!/bin/bash

# Functions Starts
addserver(){
	read -p "Server IP or Domain: " srvipdomain
	echo "$srvipdomain" >> targetservers.txt
}

delserver(){
	read -p "Server IP or Domain: " srvipdomain2
	sed -i "/$srvipdomain2/d" targetservers.txt
}

listservers(){
	cat targetservers.txt
}

execucmd(){
	read -p "Command to execute: " cmdexecu
	for x in `cat targetservers.txt`
	do
		ssh $x $cmdexecu
	done
}

# Functions Ends

# Loop & Menu Starts
while true
do
echo "1. Add Server to list"
echo "2. Delete Server from list"
echo "3. List the servers"
echo "4. Execute a command to all servers in the list"
echo "99. Exit"
read -p "Your Choice: " urchoice

case $urchoice in
	1) addserver
		;;
	2) delserver
		;;
	3) listservers
		;;
	4) execucmd
		;;
	99) exit
		;;
	*) echo "ERROR INPUT!"
esac
done
