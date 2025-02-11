#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOGS_FOLDER="/var/log/shellscript-logs"

LOG_FILE=$(echo $0 | cut -d "." -f1)

TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)

LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

validate (){                                                                # function to validate the installation
      if [ $1 -ne 0 ]                                                       # if condition to check the installation status
    then                                                                    # if condition to check the installation status
        echo -e "$2 ... $R failure"                                               # echo statement to print the output
        exit 1                                                              # exit status other than 0
    else                                                                    # else condition to check the installation status
        echo -e "$2... $G success"                                                # echo statement to print the output
    fi                                                                      # end of if condition

}               
                                                            # end of function

echo "script started executing at : $TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USERID -ne 0 ]                                                          # if condition to check the user id
then 
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXCUTE THIS SCRIPT"            # echo statement to print the output
    exit 1 # other than 0 s                                                   # exit status other than 0
fi                                                                            # end of if condition

dnf list installed mysql  &>>$LOG_FILE_NAME                                                 # dnf list installed mysql is used to check the mysql is installed or not

if [ $? -ne 0 ]                                                               # if condition to check the installation status
then                                                                          # if condition to check the installation status
    dnf install mysql -y    &>>$LOG_FILE_NAME                                                    # dnf install mysql -y is used to install the mysql
    validate $? "Installing MySql"                                            # validate function is used to validate the installation
else                                                                          # else condition to check the installation status
   echo -e "MySql is already ... $Y Installed"                                      # echo statement to print the output

fi                                                                            # end of if condition

dnf list installed git     &>>$LOG_FILE_NAME                                                      # dnf list installed git is used to check the git is installed or not

if [ $? -ne 0 ]                                                               # if condition to check the installation status
then                                                                          # if condition to check the installation status

    dnf install git -y          &>>$LOG_FILE_NAME                                                 # dnf install git -y is used to install the git
    validate $? "Installing Git"                                              # validate function is used to validate the installation
else                                                                          # else condition to check the installation status
    echo -e "git is already ... $Y installed"                                       # echo statement to print the output
fi               