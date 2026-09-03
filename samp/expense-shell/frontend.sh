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

mkdir -p $LOGS_FOLDER

dnf install nginx -y &>>$LOG_FILE_NAME
VALIDATE $? "Istalling nginx"

systemctl enable nginx &>>$LOG_FILE_NAME
VALIDATE $? "Enabling nginx"

systemctl start nginx &>>$LOG_FILE_NAME
VALIDATE $? "Starting nginx"

rm -rf /usr/share/nginx/html/* &>>$LOG_FILE_NAME
VALIDATE $? "Remove default content of web server"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOG_FILE_NAME
VALIDATE $? "Downloading frontend code"

cd /usr/share/nginx/html

unzip /tmp/frontend.zip &>>$LOG_FILE_NAME
VALIDATE $? "Unziping frontend"

cp /home/ec2-user/scripts/samp/expense-shell/expense.conf /etc/nginx/default.d/expense.conf &>>$LOG_FILE_NAME
VALIDATE $? "Copied expense conf"

systemctl restart nginx &>>$LOG_FILE_NAME
VALIDATE $? "Restarting nginx service to load changes of configuration"