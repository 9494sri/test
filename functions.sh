#!/bin/bash

# This script installs MySQL and Git if they are not already installed on the system.
# It requires sudo access to execute.

# Check if the script is being run with sudo privileges.
# If not, it will print an error message and exit.

# Check if MySQL is installed.
# If not, it will attempt to install MySQL.
# If the installation fails, it will print an error message and exit.
# If the installation succeeds, it will print a success message.
# If MySQL is already installed, it will print a message indicating that.

# Check if Git is installed.
# If not, it will attempt to install Git.
# If the installation fails, it will print an error message and exit.
# If the installation succeeds, it will print a success message.
# If Git is already installed, it will print a message indicating that.

USERID=$(id -u)

validate (){
      if [ $1 -ne 0 ]
    then 
        echo "$2 ... failure" 
        exit 1
    else 
        echo "$2... success"
    fi 

}

if [ $USERID -ne 0 ]
then 
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXCUTE THIS SCRIPT"
    exit 1 # other than 0 s
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then 
    dnf install mysql -y 
    validate $? "Installing MySql"
else 
   echo "MySql is already ... Installed" 

fi 

dnf list installed git 

if [ $? -ne 0 ]
then 

    dnf install git -y      
    validate $? "Installing Git"
else 
    echo "git is already ... installed"
fi 





