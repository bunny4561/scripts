#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "Entered user is not root user , you must be a root user to execript this script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install msql
    if [ $? -ne 0 ]
    then 
        echo "Installing script failed :: exiting script"
        exit 1
    else
        echo "Installing script success"
    fi
else
    echo "Mysql is already intalled"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git
    if [ $? -ne 0 ]
    then
        echo "Installing script failed:: exiting script"
        exit 1
    else
        echo "Instaling script success"
    fi
else 
    echo "git is already installed"
fi