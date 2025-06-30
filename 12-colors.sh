#! /bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 $R installation failed"
        exit 1
    else
        echo -e "$2 $G installation is successful"
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
    echo -e "MySQL is already $Y installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    VALIDATE $? "GIT"
else
    echo -e "Git is already $Y installed"
fi