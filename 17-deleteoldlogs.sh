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

while IFS= read -r logfile
do
    echo "the file we are deleting is $logfile"
    rm -rf $logfile
done <<<$LOG_FILES # this is the variable holding the list of  filtered .log files and this variable is provided as inpt to whileloop

 # IFS=Internal Field Separator
 # IFS by default uses space,tab,next line for spearating fields while parsing input
 # we can change the IFS to , also as per our requirement
 # read -r means reads the input , i mean $LOG_FILES without considering escape characters. Instead it will consider them literally
 #and puts it into variable 'logfile'