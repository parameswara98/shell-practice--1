#!/bin/bash

echo "All the variables passed : $@ "
echo " number of arguments passed : $# "
echo " script name : $0 "
echo " present working directory : $PWD"
echo " home directory of the user : $HOME "
echo " which user is running ther script : $USER"
echo " Process ID of the Script : $$"
sleep 10 &  
echo " process runnning in the background : $!"

