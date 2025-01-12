#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You must be the root user to excute the script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
dnf install mysql -y
if [ $? -ne 0 ]
    then
        echo "installing mysl ... failed"
        exit 1
    else
        echo "installing mysl ... sucess"
    fi
else
    echo "mysl is already installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
dnf install git -y
if [ $? -ne 0 ]
    then
        echo "installing git ... failed"
        exit 1
    else
        echo "installing git ... sucess"
    fi
else
    echo "git is already installed"
fi

