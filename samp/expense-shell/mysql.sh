#!/bin/bash

LOGS_FOLDER="/var/log/espense_shell_logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USERID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo "$2 .... Failed , exiting script"
        exit 1
    else
        echo "$2 .... Success"
    fi
}

CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then
        echo "You must be a root user to execute this script:"
        exit 1
    fi
}

CHECK_ROOT

echo "Script executed at $TIMESTAMP"

dnf install mysql-server -y
VALIDATE $? "Installing mysql-server"

systemctl enable mysqld
VALIDATE $? "Enabling mysqld service"

systemctl start mysqld
VALIDATE $? "Starting mysqld service"

mysql -h mysql.daws82s.online -u root -pExpenseApp@1 -e 'show databases;

if [ $? -ne 0 ]
then
    echo "MySQL Root password not setup" 
    mysql_secure_installation --set-root-pass ExpenseApp@1
    VALIDATE $? "Setting Root Password"
else
    echo "MySQL Root password already setup ...SKIPPING"
fi