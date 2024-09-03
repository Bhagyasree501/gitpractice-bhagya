#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m]"


USER=$(id -u)

CHECK_ROOT(){
    if [ $USER -ne 0 ]
    then
        echo -e "$R hey!you are not a root user.please try with root user access. $N"
        exit 1
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R hey! looks like installation of mysql failed.please check your shell script $N"
        exit 1
    else
        echo -e "$G hey! looks like installation of mysql has been successful. $N"
}

CHECK_ROOT #I am calling CHECK_ROOT function

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "$Y hey!looks like mysql is not installed.let me install it now $N"
    dnf install mysql -y
    VALIDATE $? # I am calling validate function here
else
    echo -e "$B hey! looks like mysql is already installed.nothing to do $N"
fi