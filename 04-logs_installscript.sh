#!/bin/bash

USERID=$(id -u)

# colors
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

#logs
Log_Folder="/var/log/shell_script"
Log_File=$( echo $0 | cut -d "." -f1 ) 
TimeStamp=$(date "+%Y-%m-%d_%H-%M-%S")
Log_File_Name="$Log_Folder/$Log_File-$TimeStamp.log"


VALIDATE(){
if [ $1 -ne 0 ]
    then
        echo -e " $2 ... $R failed $N"
        exit 1
    else
        echo -e "$2 ...  $G  sucess $N"            
    fi

}

echo  -e " script started at $TimeStamp" >> $$Log_File_Name

if [ $USERID -ne 0 ]
then
    echo -e " $R  You must be the root user to excute the script $N "
    exit 1
fi

dnf list installed mysql &>>$Log_File_Name
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$Log_File_Name
    VALIDATE $? " installing mysql"
else
    echo -e " $G mysql is already installed $N "
fi


dnf list installed git &>>$Log_File_Name
if [ $? -ne 0 ]
then
    dnf install git -y &>>$Log_File_Name
    VALIDATE $? "installing git"
else
    echo -e " $R git is already installed $N"
fi

