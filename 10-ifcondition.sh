#!/bin/bash

NUMBER1=$1

if [ $NUMBER1 -gt 20 ]
then
    echo "$NUMBER1 is greater than 20"
else 
    echo "$NUMBER1 is less than or equal to 20"
fi