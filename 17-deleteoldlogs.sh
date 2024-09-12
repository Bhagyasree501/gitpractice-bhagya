#!/bnn/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

DIRPATH="/home/ec2-user/logs"
if [ -d $DIRPATH ]
then
    echo "given directory is $DIRPATH and it exists"
else
    echo "given directory path does not exist"
    exit 1
fi

LOG_FILES=$(find $DIRPATH -name "*.log" -mtime +14)
echo "the list of files which are older then 14 days are:$LOG_FILES"
 