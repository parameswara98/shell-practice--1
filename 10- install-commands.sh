#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo " Error : please run this script using the root access "
exit 1 # give other than 0 upto 127
else
echo " you are running with the root access"
fi 
dnf list installed mysql 

if [ $? -ne 0 ]
then 
echo "my sql is not installed ...going to install "
dnf install mysql -y 

if [ $? -eq 0 ]
then 
echo " My sql is installed succesfully "
else
echo " Mysql is failed to install"
exit 1
fi 
else 
echo " mysql is already installed nothing to do "
fi 

# if [ $? -eq 0 ]
# then 
# echo " My sql is installed succesfully "
# else
# echo " Mysql is failed to install"
# exit 1
# fi 

# dnf list installed mysql 
#echo $?
# dnf list installed nginx
#echo $?