#!/bin/bash/
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #picks arg3 value provided by user. If not, takes 14 days as default value.
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo -e "$R USAGE: sh <file name> <arg1> <arg2> <arg3> $N"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ -d $SOURCE_DIR ]
then
    echo -e "$G the source directory $SOURCE_DIR exists $N "
else
    echo -e " $R the source directory $SOURCE_DIR provided by user does not exist $N"

    exit 1
fi

if [ -d $DEST_DIR ]
then
    echo -e "$G the destination directory $DEST_DIR exists $N"
else
    echo -e "$R the destination directory $DEST_DIR provided by user does not exist $N"
    exit 1
fi

VAR=$(find ${SOURCE_DIR} -name "*.log" -type f -mtime +$13)
echo "$VAR"
if [ ! -z $VAR ]
then
    echo -e "$G the files which are older than $DAYS days are: $VAR $N"
    ZIPFILENAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip "$ZIPFILENAME" -@
    if [ -f $ZIPFILENAME ]
    then
        echo -e "$G successfully zipped files older than $DAYS days $N"
        while IFS= read -r FILES
        do
        echo -e "$G the file getting deleted in source directory is: $FILES $N"
        rm -rf $FILES
        done <<<$VAR

    else
        echo -e "$R zipping older log files had failed $N"
    fi
else
    echo -e "$R there are no files older than $DAYS $N"
    exit 1
fi

