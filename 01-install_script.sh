#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You must be the root user to excute the script"
    exit 1
fi

dnf install mysql -y
