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

     

USAGE(){

    echo -e "$R USAGE :: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"  # echo statement to print the output  
    exit 1 # other than 0 status                                               # exit status other than 0
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ] 
then 
  USAGE
fi

if [ ! -d $SOURCE_DIR ] 
then 
    echo -e "$R ERROR : $N $SOURCE_DIR is not a valid directory" 
    exit 1 
fi

if [ ! -d $DEST_DIR ] 
then 
    echo -e "$R ERROR : $N $DEST_DIR is not a valid directory" 
    exit 1 
fi

echo "script started executing at : $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS) # find command to find the files older than 14 days

if [ -n "$FILES" ] 
then 
    echo "Files to backup : $FILES" 
    ZIP_FILE="$DEST_DIR/applogs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ] 
    then 
       echo -e "$G Successfully created zip file for files older than $DAYS days $N"

       while read -r filepath
       do
          echo "Deleting file : $filepath" &>>$LOG_FILE_NAME
          rm -rf $filepath
          echo "Deleted file : $filepath"

        done <<< $FILES

    else 
      echo -e "$R ERROR : $N Failed to create zip file"
      exit 1    
    fi
else 
    echo "No files to backup older than $DAYS days" 

fi
