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

for package in $@
do
    dnf list linstalled $package
    if [ $? -ne 0 ]
    then
        dnf install $package -y
        VALIDATE &? "Installing $package"
    else
        echo "$package is already installed"
    fi
done