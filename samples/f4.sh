#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "You must be root user to execute the scripts: now exiting the script"
    exit 1
fi

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 failed:exiting script"
    else
        echo "$2 success"
    fi
}

dnf list installed mysql
if [$? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "MySQL installation"
else
    echo "MySQl is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Git installation"
else
    echo "Git is already installed"
fi