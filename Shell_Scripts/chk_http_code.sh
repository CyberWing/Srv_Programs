#!/bin/bash 

echo "This script can check HTTP Header for website"
echo "#############################################"
#read -p "Type URL for check HTTP Header: " URL
echo -n "Type URL for check HTTP Header" && read URL
echo "Output HTTP Header Result Is = " `curl -o /dev/null --silent --head --write-out '%{http_code}\n' $URL`

