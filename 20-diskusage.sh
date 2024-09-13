#!/bin/bash

THRESHOLD=5 #just to test my scenarios.in realtime we have to put 75
DISKUSAGE=$(df -hT | grep xfs)
G="e\[32m"
N="\e[om"


while IFS= read -r line
do
    FOLDERNAME=$(echo $line | awk -F " " '{print $NF}')
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    echo -e "$G storage of $FOLDERNAME is : $USAGE $N"
    if [ "$USAGE" -ge "$THRESHOLD" ]
    then
        echo "the storage used by $FOLDERNAME is: $USAGE. And this vlue is grated than $THRESHOLD "
    else 
        exit 1
    fi
done <<<$DISKUSAGE

