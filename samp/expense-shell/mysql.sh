#!/bin/bash

LOGS_FOLDER="/var/log/expense_shell_logs"
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

echo "Script executed at $TIMESTAMP" &>>$LOG_FILE_NAME

mkdir -p /var/logs/expense_shell_logs &>>$LOG_FILE_NAME

dnf install mysql-server -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing mysql-server"

systemctl enable mysqld &>>$LOG_FILE_NAME
VALIDATE $? "Enabling mysqld service"

systemctl start mysqld &>>$LOG_FILE_NAME
VALIDATE $? "Starting mysqld service"

mysql -h 172.31.20.69 -u root -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    echo "MySQL Root password not setup" 
    mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOG_FILE_NAME
    VALIDATE $? "Setting Root Password"
else
    echo "MySQL Root password already setup ...SKIPPING"
fi

echo "Script ended at $TIMESTAMP" &>>$LOG_FILE_NAME