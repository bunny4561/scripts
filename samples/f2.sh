#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Error , You must me a root user to login"
fi

dnf install mysql -y
if 