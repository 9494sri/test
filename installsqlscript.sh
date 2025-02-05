#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXCUTE THIS SCRIPT"
    exit 1 # other than 0 s
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then 
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo "installing mysql ... failure" 
        exit 1
    else 
        echo "installing mysql ... success"
    fi 
else 
   echo "MySql is already ... Installed" 

fi 

dnf list installed git 

if [ $? -ne 0 ]
then 

    dnf install git -y      
    if [ $? -ne 0]
    then 
        echo "installing git... failure"
        exit 1
    else 
        echo " installing git ... suceess"
    fi   
else 
    echo "git is already ... installed"
fi 





