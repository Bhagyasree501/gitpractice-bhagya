#!/bin/bash/

echo "all the variables passed during the runtime are : $@"
echo "the total number of variables passed to this script during runtime are $#"
echo "the name of the script that ran is: $0"
echo "the present working directory of the current user is : $PWD"
echo "the home directory of the current user is: $HOME"
echo "the Process ID (PID) of this script is: $$ "
sleep 250 &
echo "the process ID of the last background process executed by me is $!"