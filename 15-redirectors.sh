#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
FILE_NAME="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USER=$(id -u)

CHECK_ROOT(){
    if [ $USER -ne 0 ]
    then
        echo -e "$R hey!you are not a root user.please try with root user access. $N" &>>$FILE_NAME
        exit 1
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R hey! looks like installation of $2 failed.please check your shell script $N" &>>$FILE_NAME
        exit 1
    else
        echo -e "$G hey! looks like installation of $2 has been successful. $N" &>>$FILE_NAME
    fi
}

CHECK_ROOT #I am calling CHECK_ROOT function

for PACKAGE in $@ # all arugemttns provided by user are saved into #@. variable 'PACKAGE' picks one arg at a time while suing for loop.
do
dnf list installed $PACKAGE
if [ $? -ne 0 ]
then
    echo -e "$Y hey!looks like $PACKAGE is not installed.let me install it now $N" &>>$FILE_NAME
    dnf install $PACKAGE -y
    VALIDATE $? "$PACKAGE" # I am calling validate function here
else
    echo -e "$B hey! looks like $PACKAGE is already installed.nothing to do $N" &>>$FILE_NAME
fi
done