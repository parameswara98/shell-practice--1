#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo " Error : please run this script using the root access "
else
echo " you are running with the root access"
fi 
dnf install mysql -y 