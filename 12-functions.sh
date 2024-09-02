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
    echo "mysql package is not installed yet. will install now"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "installation process has failed. please check your shell script"
        exit 1
    else
        echo "installation is successful."
    fi
else
 echo "mysql package is already installed.nothing to do"
fi