#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You must have root previligies to execute the script : now exiting the script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql
    if [ $? -ne 0 ]
    then
        echo "Installation failed:exiting script"
        exit 1
    else
        echo "Installation succeed"
    fi
else
    echo "Mysql is already installed"
fi


#!/bin/bash
USERID=$(id -u)

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "Installation  $2 failed:exiting script"
        exit 1
    else
        echo "Installation $2 succeed"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "You must have root previligies to execute the script : now exiting the script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql
    VALIDATE $? "My SQL installation"
else
    echo "My SQL already installed"
fi