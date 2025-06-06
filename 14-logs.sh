#!/bin/bash 

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=($LOGS_FOLDER/$SCRIPT_NAME.log)

mkdir -p $LOGS_FOLDER
echo "script started and executing at : $(date)" &>>$LOG_FILE
if [ $USERID -ne 0 ]
then 
echo -e  "$R Error : please run this script using the root access $N " &>>$LOG_FILE
exit 1 # give other than 0 upto 127
else
echo " you are running with the root access"&>>$LOG_FILE
fi

VALIDATE() {
    if [ $1 -eq 0 ]
then 
echo -e "installing $2 is ...$G success $N"&>>$LOG_FILE
else
echo -e  "installing  $2 is $R failure $N"&>>$LOG_FILE
exit 1
fi 
# echo -e "\e[32m hello world \e[0m"
# echo "no colors"
     
}
    dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then 
echo "my sql is not installed ...going to install"&>>$LOG_FILE
dnf install mysql -y &>>$LOG_FILE
VALIDATE $? "mysql"
else 
echo -e  "$Y nothing to do mysql is already installed $N"&>>$LOG_FILE
fi 

dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then 
echo "python3 is not installed ...going to install"&>>$LOG_FILE
dnf install python3 -y &>>$LOG_FILE
VALIDATE $? "Python3"
else 
echo "$Y nothing to do python3 is already installed $N"&>>$LOG_FILE
fi 

dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then 
echo " nginx is not installed ...going to install" &>>$LOG_FILE
dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "nginx"
else 
echo -e "$Y nothing to do nginx is already installed $N" &>>$LOG_FILE
fi