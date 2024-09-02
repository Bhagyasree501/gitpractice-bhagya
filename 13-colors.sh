#!/bin/bash/
#we are trying to add colors to the comments by assigning color codes to variables and using the variables in the echo statements

USER=$(id -u)
echo "your user id is: $USER"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo " $2 is not successfully installed yet by bhagya"
    else
        echo -e "$G $2 is successfully installed by bhagya $N"
    fi
}

if [ $USER -ne 0 ]
then
    echo -e "$R hey! you are not having root access. try repeating with root access $N"
    exit 1
fi


dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "$Y looks like mysql is not installed.I am instaaling it now! $N"
    dnf install mysql -y
    VALIDATE $? "mysql"

else
    echo  -e "$B hey! looks like mysql is already installed.nothing to do $N"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "looks like nginx is not installed.I am instaaling it now!"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$B hey! looks like nginx is already installed.nothing to do $N"
fi