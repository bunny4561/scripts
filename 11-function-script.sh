#! /bin/bash

USERID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo "$2 installation failed"
        exit 1
    else
        echo "$2 installation is successful"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "User who executed script is not root user, to execute script must be root user"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "MySql"
else
    echo "MySQL is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    VALIDATE $? "GIT"
else
    echo "Git is already installed"
fi