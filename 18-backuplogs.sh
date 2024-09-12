#!/bin/bash/

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${$3: -14} #picks arg3 value provided by user. If not, takes 14 days as default value.
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo "USAGE: sh <file name> <arg1> <arg2> <arg3>"
    exit 1
}

if [$# -lt 2]
then
    USAGE
fi

if [ -d SOURCE_DIR ]
then
    echo "the source directory $SOURCE_DIR exists "
else
    echo "the source directory provided by user does not exist"
    exit 1
fi

if [ -d DEST_DIR ]
then
    echo "the destination directory $DEST_DIR exists"
else
    echo "the destination directory provided by user does not exist"
    exit 1
fi

VAR=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
if [ ! -z $VAR ]
then
    echo "the files which are older than $DAYS are: $VAR"
    ZIPFILENAME= "$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip "$ZIPFILENAME" -@
    if [ -f $ZIPFILENAME ]
    then
        echo "successfully zipped files older than $DAYS"
        while IFS= read -r FILES
        do
        echo "the file getting deleted in source directory is: $FILES"
        rm -rf $FILES
        done <<<$VAR

    else
        echo "zipping older log files had failed"
    fi
else
    echo "there are no files older than $DAYS"
    exit 1
fi

