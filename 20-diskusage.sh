#!/bin/bash

THRESHOLD=5 #just to test my scenarios.in realtime we have to put 75
DISKUSAGE=$(df -hT | grep xfs)


while IFS= read -r line
do
FOLDERNAME=$(echo $line | awk -F " " '{print $NF}')
USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" f1)
    if [ $USAGE -ge $THRESHOLD]
    then
        echo "the storage used by $FOLDERNAME is: $USAGE. And this vlue is grated than $THRESHOLD "
    else 
        exit 1
    fi

done <<<$DISKUSAGE

