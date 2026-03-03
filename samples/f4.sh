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

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $R failed:exiting script"
    else
        echo -e "$2 $G success"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "MySQL installation"
else
    echo -e "MySQl is already $Y installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Git installation"
else
    echo -e "Git is already $Y installed"
fi