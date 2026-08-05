#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:You must be a root user to execute this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then    
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Error in installing mysql: exiting script"
        exit 1
    else
        echo "MySql has been installed"
    fi
else
    echo "Mysql is already installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git
    if [ $? -ne 0 ]
    then
        echo "Error installing git: exiting script"
        exit 1
    else
        echo "Git  installation success"
    fi
else
    echo "Git is already installed"
fi

SCRIPT1=$1
SCRIPT2=$2

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You must be a root user to execute this script:now exiting the script"
    exit 1
fi

dnf list installed $SCRIPT1

if [ $? -ne 0 ]
then
    dnf install $SCRIPT1 -y
    if [ $? -ne 0 ]
    then
        echo "Error installing $SCRIPT1:exiting script"
        exit 1
    else
        echo "$SCRIPT1 installation success"
    fi
else
    echo "$SCRIPT1 is already installed"
fi

dnf list installed $SCRIPT2

if [ $? -ne 0 ]
then
    dnf install $SCRIPT2 -y
    if [ $? -ne 0 ]
    then
        echo "Error installing $SCRIPT2:exiting script"
        exit 1
    else
        echo "$SCRIPT2 installation success"
    fi
else
    echo "$SCRIPT2 is already installed"
fi


#Functions

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You must be a root user to execute this script:now exiting the script"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 ... Failure"
        exit 1
    else
        echo "$2 ... Success"
    fi
}

VALIDATE () {
    if [ $1 -ne 0 ]
    then
        echo "$2 failed"
    else
        echo "$2 success"
    fi
}

VALIDATE $? "Installing software"

VALIDATE () {
    if [ $1 -ne 0 ]
    then 
        echo "$2 failed"
    else 
        echo "$2 success"
    fi
}

VALIDATE $? "INSTALLING SOFTWARE"
