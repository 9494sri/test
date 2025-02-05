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

USERID=$(id -u) # id -u is used to get the user id of the current user

validate (){  # function to validate the installation
      if [ $1 -ne 0 ] # if condition to check the installation status
    then                # if condition to check the installation status
        echo "$2 ... failure"   # echo statement to print the output
        exit 1         # exit status other than 0
    else          # else condition to check the installation status
        echo "$2... success" # echo statement to print the output
    fi      # end of if condition

}                   # end of function

if [ $USERID -ne 0 ]    # if condition to check the user id
then 
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXCUTE THIS SCRIPT"      # echo statement to print the output
    exit 1 # other than 0 s         # exit status other than 0
fi          # end of if condition

dnf list installed mysql   # dnf list installed mysql is used to check the mysql is installed or not

if [ $? -ne 0 ]             # if condition to check the installation status
then                       # if condition to check the installation status
    dnf install mysql -y        # dnf install mysql -y is used to install the mysql
    validate $? "Installing MySql"     # validate function is used to validate the installation
else                                  # else condition to check the installation status
   echo "MySql is already ... Installed"  # echo statement to print the output

fi                                    # end of if condition

dnf list installed git      # dnf list installed git is used to check the git is installed or not

if [ $? -ne 0 ]           # if condition to check the installation status
then                        # if condition to check the installation status

    dnf install git -y                  # dnf install git -y is used to install the git
    validate $? "Installing Git"        # validate function is used to validate the installation
else                                        # else condition to check the installation status
    echo "git is already ... installed"     # echo statement to print the output
fi                                       # end of if condition





