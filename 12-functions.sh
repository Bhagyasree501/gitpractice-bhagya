#!/bin/bash/
#In this software, we are trying to install 2 different software packages through one script
#There is a repeated piece of code that we are making it as a function and calling that function when and where needed.

USER=$(id -u)
echo "your user id is: $USER"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo " $2 is not successfully installed yet by bhagya"
    else
        echo "$2 is successfully installed by bhagya"
    fi
}

if [ $USER -ne 0 ]
then
    echo "hey! you are not having root access. try repeating with root access"
    exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "looks like mysql is not installed.I am instaaling it now!"
    dnf install mysql -y
    VALIDATE $? "mysql"

else
    echo "hey! looks like mysql is already installed.nothing to do"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "looks like nginx is not installed.I am instaaling it now!"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "hey! looks like nginx is already installed.nothing to do"
fi