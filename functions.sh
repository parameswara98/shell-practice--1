#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo " Error : please run this script using the root access "
exit 1 # give other than 0 upto 127
else
echo " you are running with the root access"
fi

VALIDATE() {
    if [ $1 -eq 0 ]
then 
echo " installing $2 is ...success"
else
echo " installing  $2 is failure"
exit 1
fi 
     
}
    dnf list installed mysql 

if [ $? -ne 0 ]
then 
echo "my sql is not installed ...going to install"
dnf install mysql -y 
VALIDATE $? "mysql"
else 
echo " mysql is already installed nothing to do "
fi 

dnf list installed python3 

if [ $? -ne 0 ]
then 
echo "python3 is not installed ...going to install"
dnf install python3 -y 
VALIDATE $? "Python3"
else 
echo " python3 is already installed nothing to do "
fi 

dnf list installed nginx

if [ $? -ne 0 ]
then 
echo " nginx is not installed ...going to install"
dnf install nginx -y 
VALIDATE $? "nginx"