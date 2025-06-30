#! /bin/bash

USERID=$(id -u)
if [ $USERID -ne o ]
then
    echo "User who executed script is not root user, to execute script must be root user"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "MySQl installation failed"
        exit 1
    else
        echo "MySQL installation is successful"
    fi
else
    echo "MySQL is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Git installation failed"
        exit1
    else
        echo "Git installation is successful"
    fi
else
    echo "Git is already installed"
fi