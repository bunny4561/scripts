#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "Error: You must be a root user to execute the script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "Mysql is not installed in server"
else 
    dnf remove mysql
    if [ $? -ne 0 ]
    then
        echo "Uninstalling Mysql failed , exiting script"
        exit 1
    else 
        echo "Uninstalling mysql success"
    fi
fi