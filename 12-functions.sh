#!/bin/bash
USER=$(id -u)
echo "your user id is : $USER"
if [ $USER -ne 0 ]
then
    echo "you are not root user at this moment. please try being a root user"
    exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not seen in the installed packages list.hence installing it.."
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql package installation has failed. please check the shellscript again"
        exit 1
    else
        echo "mysql successfully installed"
    fi
else
    echo "mysql package is already installed.Nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not seen in the installed packages list.hence installing it.."
    dnf install nginx -y
    if [ $? -ne 0 ]
    then
        echo "nginx package installation has failed. please check the shellscript again"
        exit 1
    else
        echo "nginx successfully installed"
    fi
else
    echo "nginx package is already installed.Nothing to do"
fi