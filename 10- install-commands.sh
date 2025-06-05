#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo " Error : please run this script using the root access "
exit 1 # give other than 0 upto 127
else
echo " you are running with the root access"
fi 
dnf install mysql -y 

if [ $? -eq 0 ]
then 
echo " My sql is installed succesfully "
else
echo " Mysql is failed to install"
exit 1
fi 