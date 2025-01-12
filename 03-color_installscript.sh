#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"



VALIDATE(){
if [ $1 -ne 0 ]
    then
        echo -e " $2 ... $R failed $N"
        exit 1
    else
        echo -e "$2 ...  $G  sucess $N"            
    fi

}

if [ $USERID -ne 0 ]
then
    echo -e " $R  You must be the root user to excute the script $N "
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? " installing mysql"
else
    echo -e " $G mysql is already installed $N "
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo -e " $R git is already installed $N"
fi

