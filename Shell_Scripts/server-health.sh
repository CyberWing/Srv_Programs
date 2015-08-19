#!/bin/bash

# Functions Starts

machineinfo(){
    echo "Checking Your Linux Machine Information"
    date;
    echo "uptime:"
    uptime
}

currentlyconnected(){
    echo "Currently connected:"
    w
    echo "--------------------"
}

lastlogins(){
    echo "Last logins:"
    last -a |head -3
    echo "--------------------"
}

diskandramusage(){
    echo "Disk and memory usage:"
    df -h | xargs | awk '{print "Free/total disk: " $11 " / " $9}'
    free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}'
    echo "--------------------"
    start_log=`head -1 /var/log/messages |cut -c 1-12`
    oom=`grep -ci kill /var/log/messages`
    echo -n "OOM errors since $start_log :" $oom
    echo ""
    echo "--------------------"
}

utilizationandmostexpensiveprocesses(){
    echo "Utilization and most expensive processes:"
    top -b |head -3
    echo
    top -b |head -10 |tail -4
    echo "--------------------"
    echo "Open TCP ports:"
    nmap -p- -T4 127.0.0.1
    echo "--------------------"
    echo "Current connections:"
    ss -s
    echo "--------------------"
    echo "processes:"
    ps auxf --width=200
    echo "--------------------"
    echo "vmstat:"
    vmstat 1 5
}

horbar(){
        ccount=0
        until [ $ccount -eq $(tput cols) ]
        do
                echo -n "="
                ccount=`expr $ccount + 1`
        done
        echo 
}

# Functions Ends

# Menu Starts
while true
do
horbar
echo "1. Machine Information"
echo "2. Currently Connected Connections"
echo "3. Last logins"
echo "4. Disk and RAM usage"
echo "5. Utilization and Most Expensive Processes"
echo "6. Exit Program"
read -p "Choose a number: " userinput
horbar
# Menu Ends

# Input filtering and output starts
case $userinput in
	1) machineinfo
	;;
	2) currentlyconnected
	;;
	3) lastlogins
	;;
	4) diskandramusage
	;;
	5) utilizationandmostexpensiveprocesses
	;;
	6) exit 0
	;;
	*) echo "ERROR INPUT: Please choose 1 to 5"
esac
done
# EOF
