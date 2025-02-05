#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then 
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXCUTE THIS SCRIPT"

fi

dnf install mysql -y 


