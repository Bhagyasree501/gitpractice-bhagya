#!/bin/bash

THRESHOLD=5 #just to test my scenarios.in realtime we have to put 75
DISKUSAGE=$(df -hT | grep xfs)


while IFS= read -r line
do
USAGE=$($line | awk -F " " {'print $6F'} | cut -d "%" f1)
echo "hi"
done <<<$DISKUSAGE

