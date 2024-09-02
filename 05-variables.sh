#!/bin/bash

echo "please enter your user name"
read USERNAME # updates the username input provided by user on terminal into variable USERNAME
echo "the user name provided by you is $USERNAME"

echo "please provide your password"
read -s PASSWORD #updated the passowrd provided by user on terminal into variable PASSWORD but while user is providing password, the terminal hides information because we provided -s to "read" command
echo "the password provided by you is $PASSWORD"