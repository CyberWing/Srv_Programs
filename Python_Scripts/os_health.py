#!/usr/bin/python

#Script can perform server health check....
#Modified Date 21/Aug/2015
######

import os
import subprocess
import time

print "\t################################################################"
print "\t#             LINUX SERVER HEALTH CHECK PROGRAM                #"
print "\t#                          EMAIL :                             #"
print "\t#                phyominhtun1990@gmail.com                     #"
print "\t#                                                              #"
print "\t#                                       Written by PhyoMinHtun #"
print "\t################################################################"
pass
time.sleep(1)
os.system("date")
print "\t#########################################################################"
print "\t# Help:                                                                 #"
print "\t# 0: Type input [0 or exit] for exit program:                           #"
print "\t# 1: Type input [1] for checking TCP ports:                             #"  
print "\t# 2: Type input [2] for last logins:                                    #" 
print "\t# 3: Type input [3] for check Disk,System Info: and memory usage:       #"
print "\t# 4: Type input [4] for utilization and most expensive processes:       #"  
print "\t# 5: Type input [5] for current socket connections:                     #" 
print "\t# 6: Type input [6] for check public IP address:                        #"
print "\t# 7: Type input [7] for Show who is logged on and what they are doing:  #"
print "\t#########################################################################"

def exit():
   exit

def nmap():
   print "checking TCP ports:"
   chk_port="nmap -p- -T4 127.0.0.1"
   os.system(chk_port)
   print "======================================="

def lastlogin():
   print "Last logins:"
   b=os.popen('last -a |head -3')
   last=b.read()
   print last
   print "======================================="

def chk_info():
   print "Check Disk,System Info: and memory usage:"
   subprocess.call(["df","-h"])
   subprocess.call(["free","-m"])
   print ""
   print "System Information is: \n",subprocess.call(["uname","-a"])
   print "======================================="

def utilize_expensive_process():
   print "Utilization and most expensive processes:"
   c=os.popen('top -b |head -3')
   process=c.read()
   print process
   print "======================================="

def current_socket_con():
   print "Current connections:"
   d=os.popen('ss -s')
   socket=d.read()
   print socket
   os.system("netstat -nlpt")
   print "======================================="

def chk_pubip():
   print "Check Server Public IP:"
   e=os.popen('wget -qO- ifconfig.me/ip')
   ip=e.read()
   print ip
   print "======================================="

def chk_login():
   print "Show who is logged on and what they are doing:"
   os.system("w -s")


def main():
   login=raw_input("Do you want to run this script?yes or no? ")
   if(login=="yes") or (login=="YES"):
      input=raw_input("Enter your input: ")
      if(input=="0") or (input=="exit"):
         exit()
      if(input=="1"):
         nmap()
      if(input=="2"):
         lastlogin()
      if(input=="3"):
         chk_info()
      if(input=="4"):
         utilize_expensive_process()
      if(input=="5"):
         current_socket_con()
      if(input=="6"):
         chk_pubip()
      if(input=="7"):
         chk_login()
   elif (login=="no") or (login=="NO"):
      print "Thank you for your using server health check script..."
   else:
      print "Invalid Input Key!"

main()

#DONE


