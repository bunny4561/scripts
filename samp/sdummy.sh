#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "ERROR:: You must be a root user to execute this script, now exiting script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql
    if [ $? -ne 0 ]
    then 
        echo "Error:: Installing mysql failed"
        exit 1
    else
        echo "Success:: Installing mysql executed"
    fi
else
    echo "Mysql is already installed"
fi

#####################

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo "$2 failed"
        exit 1
    else
        echo "$2 success"
    fi    
}

VALIDTE $? "Installing Mysql"