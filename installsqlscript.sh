#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXCUTE THIS SCRIPT"
    exit 1 # other than 0 s
fi
 

dnf install mysqll -y        

dnf install git -y 


