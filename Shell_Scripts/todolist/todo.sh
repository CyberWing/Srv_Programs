#!/bin/bash

createtodo(){
	read -p "Title: " todotitle
	read -p "Description: " tododesc
	read -p "Deadline: " deadline
	echo "[ ] $todotitle 		|$deadline		|$tododesc" >> todolist.txt
        echo "-----------------------------------------------------------------"
}

listalltodo(){
        echo "-----------------------------------------------------------------"
	echo "    Title		|DeadLine	|Description"
	echo "-----------------------------------------------------------------"
	cat todolist.txt
        echo "-----------------------------------------------------------------"
}

listundonelist(){
        echo "-----------------------------------------------------------------"
        echo "    Title         |DeadLine       |Description"
        echo "-----------------------------------------------------------------"
	cat todolist.txt | grep "\[ \]"
        echo "-----------------------------------------------------------------"
}

listdonelist(){
        echo "-----------------------------------------------------------------"
        echo "    Title         |DeadLine       |Description"
        echo "-----------------------------------------------------------------"
	cat todolist.txt | grep "\[x\]"
        echo "-----------------------------------------------------------------"
}

markdone(){
	read -p "Line Number: " lineno
	sed -i "${lineno}s/\[ \]/[x]/" todolist.txt
        echo "-----------------------------------------------------------------"
}

markundone(){
	read -p "Line Number: " lineno2
	sed -i "${lineno2}s/\[x\]/[ ]/" todolist.txt
        echo "-----------------------------------------------------------------"
}

deleteitem(){
	read -p "Line Number: " lineno3
	sed -i "${lineno3}d" todolist.txt
        echo "-----------------------------------------------------------------"
}

aboutscript(){
        echo "-----------------------------------------------------------------"
	echo "This todo script is written by Yan Naing Myint (Orca Krilozona)"
	echo "This script is released as it is without any warranty and you are free to do whatever you want with this"
	echo "Any bug found in this script shall be reported back to yannaing@cyberwings.asia"
        echo "-----------------------------------------------------------------"
}

while true
do
echo "1. Create"
echo "2. List All"
echo "3. List Undone"
echo "4. List Done"
echo "5. Mark Done"
echo "6. Mark Undone"
echo "7. Delete Item"
echo "8. About"
echo "99. Exit"
read -p "yourchoice: " choice

case $choice in
	1) createtodo
		;;
	2) listalltodo
		;;
	3) listundonelist
		;;
	4) listdonelist
		;;
	5) markdone
		;;
	6) markundone
		;;
	7) deleteitem
		;;
	8) aboutscript
		;;
	99) exit
		;;
	*) echo "ERROR INPUT!"
esac
done
