#!/usr/bin/python

#Script can perform check server-health....

import os
import subprocess

print "Open TCP ports:"
a=os.popen('nmap -p- -T4 127.0.0.1')
scan=a.read()
print scan
print "======================================="
print "Last logins:"
b=os.popen('last -a |head -3')
last=b.read()
print last
print "======================================="
print "Check Disk,System Info: and memory usage:"
subprocess.call(["df","-h"])
subprocess.call(["free","-m"])
print ""
print "System Information is: \n",subprocess.call(["uname","-a"])
print "======================================="
print "Utilization and most expensive processes:"
c=os.popen('top -b |head -3')
process=c.read()
print process
print "======================================="
print "Current connections:"
d=os.popen('ss -s')
socket=d.read()
print socket
print "======================================="
#print "Check Server Public IP"
#e=os.popen('wget -qO- ifconfig.me/ip')
#ip=e.read()
#print ip
print "======================================="
print "Show who is logged on"
os.system("w -s")






