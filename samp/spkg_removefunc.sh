#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "Error: You must be a root user to execute the script"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo "$2 failed , exiting script"
        exit 1
    else 
        echo "$2 success"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "Mysql is not installed in server"
else 
    dnf remove mysql -y
    VALIDATE $? "Uninstalling Mysql"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    echo "Git is not installed in server"
else 
    dnf remove git -y
    VALIDATE $? "Uninstalling Git"
fi