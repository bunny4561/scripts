#!/bin/bash

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

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql
    VALIDATE $? "Installing Mysql"
else 
    echo "Mysql is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed"
fi

