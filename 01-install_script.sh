#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You must be the root user to excute the script"
fi

dnf install mysql -y
