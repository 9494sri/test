#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then

echo "ERROR : You must have suod access to execute this script"

fi

dnf install mysql -y

