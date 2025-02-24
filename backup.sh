#!/bin/bash



R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1

DEST_DIR=$2

DAYS=${3:-14}  # default value is 14 days if not provided by the user 

LOGS_FOLDER="/home/ec2-user/shellscript-logs"

LOG_FILE=$(echo $0 | cut -d "." -f1)

TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)

LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

validate (){                                                                # function to validate the installation
      if [ $1 -ne 0 ]                                                       # if condition to check the installation status
    then                                                                    # if condition to check the installation status
        echo -e "$2 ... $R failure $N"                                               # echo statement to print the output
        exit 1                                                              # exit status other than 0
    else                                                                    # else condition to check the installation status
        echo -e "$2... $G success $N"                                                # echo statement to print the output
    fi                                                                      # end of if condition

}       

USAGE(){

    echo -e "$R USAGE :: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"  # echo statement to print the output  
    exit 1 # other than 0 status                                               # exit status other than 0
}

mkdir -p /home/ec2-user/shellscript-logs/
if [$# -lt 2]
then 
  USAGE
if
echo "script started executing at : $TIMESTAMP" &>>$LOG_FILE_NAME
