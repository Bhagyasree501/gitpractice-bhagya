#!/bin/bash/
USER=$(id -u)
echo "your user id is: $USER"
if [ $USER -ne 0 ]
then
    echo "hey! you are not having root access. try repeating with root access"
    exit 1
fi
dnf list installed mysql
if[ $? -ne 0 ]
then
    echo "looks like mysql is not installed.I am instaaling it now!"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "hey! installation process failed.please check yourshell script"
        exit 1
    else
        echo "hey! mysql is successfully intalled now"
    fi
else
    echo "hey! looks like mysql is already installed.nothing to do"
fi