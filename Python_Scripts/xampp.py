#!/usr/bin/python

#Phyo Min Htun [phyominhtun1990@gmail.com] (15/8/2015)
#Script can perform xampp control

#import os
#import subprocess

print "\t################################################################"
print "\t#                  XAMPP SERVER CONTROL                        #"
print "\t#                        EMAIL                                 #"
print "\t#                phyominhtun1990@gmail.com                     #"
print "\t#                                                              #"
print "\t#                                       Written by PhyoMinHtun #"
print "\t################################################################"
  
print "\t################################################################"
print "\t# Help:                                                        #"
print "\t# 0: Type input [0 or stop] for xampp server stop              #"
print "\t# 1: Type input [1 or start] for xampp server start            #"  
print "\t# 6: Type input [6 or restart] for xampp server restart        #" 
print "\t################################################################"
login=raw_input("Do you want to run xampp server control script? yes or no? ")
if(login=="yes") or (login=="YES"):
   input=raw_input("Enter your input: ")
   if(input=="0") or (input=="stop"):
      print "xampp server is stop!"
   elif(input=="1") or (input=="start"):
      print "xampp server is start!"
   elif(input=="6") or (input=="restart"):
      print "xampp server is restart!"
   else:
      print "Input code doesn't match!"
elif(login=="no") or (login=="NO"):
   print "Thank you for your using xampp server control script..."
else:
   print "Input is not acceptable..Thanks!"
   print "Program Exit"
