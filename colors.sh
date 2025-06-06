#!/bin/bash 

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
echo -e  "$R Error : please run this script using the root access $N "
exit 1 # give other than 0 upto 127
else
echo " you are running with the root access"
fi

VALIDATE() {
    if [ $1 -eq 0 ]
then 
echo -e "installing $2 is ...$G success $N"
else
echo -e  "installing  $2 is $R failure $N"
exit 1
fi 
# echo -e "\e[32m hello world \e[0m"
# echo "no colors"
     
}
    dnf list installed mysql 

if [ $? -ne 0 ]
then 
echo "my sql is not installed ...going to install"
dnf install mysql -y 
VALIDATE $? "mysql"
else 
echo -e  "$Y nothing to do mysql is already installed $N"
fi 

dnf list installed python3 

if [ $? -ne 0 ]
then 
echo "python3 is not installed ...going to install"
dnf install python3 -y 
VALIDATE $? "Python3"
else 
echo "$Y nothing to do python3 is already installed $N"
fi 

dnf list installed nginx

if [ $? -ne 0 ]
then 
echo " nginx is not installed ...going to install"
dnf install nginx -y 
VALIDATE $? "nginx"
else 
echo -e "$Y nothing to do nginx is already installed $N"
fi