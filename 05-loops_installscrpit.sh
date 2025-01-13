#!/bin/bash

# for i in {0..10}
# do 
#     echo $i
# done

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

if [ ! -d "$Log_Folder" ]
then
    echo "File doesn't exist. Creating now"
    mkdir .$Log_Folder
    echo "File created"
else
    echo "File exists"
fi


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

for package in $@
do
        dnf list installed $package &>>$Log_File_Name
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$Log_File_Name
        VALIDATE $? " installing $package"
    else
        echo -e " $Y $package is already installed $N "
    fi
done