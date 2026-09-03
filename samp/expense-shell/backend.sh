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

mkdir -p /var/log/expense_shell_logs &>>$LOG_FILE_NAME

dnf module disable nodejs -y &>>$LOG_FILE_NAME
VALIDATE $? "Disabling nodejs"

dnf module enable nodejs:20 -y &>>$LOG_FILE_NAME
VALIDATE $? "Enabling nodejs:20"

dnf install nodejs -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing nodejs"

id expense &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then 
    echo "Adding expense User"
    useradd expense &>>$LOG_FILE_NAME
else
    echo "User expense already exists ...Skipping"
fi

mkdir -p /app &>>$LOG_FILE_NAME

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOG_FILE_NAME
VALIDATE $? "Downloading build"

cd /app &>>$LOG_FILE_NAME
rm -rf /app/* &>>$LOG_FILE_NAME

unzip /tmp/backend.zip &>>$LOG_FILE_NAME
VALIDATE $? "Unziping the backend files"

npm install &>>$LOG_FILE_NAME
VALIDATE $? "Installing npm"

cp /home/ec2-user/scripts/samp/expense-shell/backend.service /etc/systemd/system/backend.service &>>$LOG_FILE_NAME



dnf install mysql -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing mysql client"

mysql -h 172.31.20.69 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$LOG_FILE_NAME
VALIDATE $? "Setting up transaction schemas and tables"

systemctl daemon-reload &>>$LOG_FILE_NAME
VALIDATE $? "Daemon Reload"

systemctl enable backend &>>$LOG_FILE_NAME
VALIDATE $? "Enabling backend"

systemctl restart backend &>>$LOG_FILE_NAME
VALIDATE $? "Restarting backend"

