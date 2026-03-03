#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "You must be root user to execute the scripts: now exiting the script"
    exit 1
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOG_FOLDER="/scripts/samples"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $R failed:exiting script"
    else
        echo -e "$2 $G success"
    fi
}

echo "Script started executing at $TIMESTAMP" &>> $LOG_FILE_NAME  

dnf list installed mysql &>> $LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>> $LOG_FILE_NAME
    VALIDATE $? "MySQL installation"
else
    echo -e "MySQl is already $Y installed"
fi

dnf list installed git &>> $LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>> $LOG_FILE_NAME
    VALIDATE $? "Git installation"
else
    echo -e "Git is already $Y installed"
fi