#!/bin/bash
ips="192.168.1.1 192.168.1.2"
read -p "Command Input: " cmdinput

for x in $ips
do
	echo "### Executing $cmdinput on $x ###"
	ssh $x "$cmdinput"
done
