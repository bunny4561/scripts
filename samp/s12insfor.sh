#!/bin/bash

LOGS_FOLDER="/var/log/shellscript_logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILENAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

echo "Script executed at timestamp is $TIMESTAMP" &>>$LOG_FILENAME


USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "You must be a root user to execute this script"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 ...Failure"
        exit 1
    else
        echo "$2 ...Success"
    fi
}

for package in $@
do 
    dnf list installed $package &>>$LOG_FILENAME
    if [ $? -ne 0 ]
    then 
        dnf install $package -y &>>$LOG_FILENAME
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed in server"
    fi
done

echo "Script executed at timestamp is $TIMESTAMP" &>>$LOG_FILENAME