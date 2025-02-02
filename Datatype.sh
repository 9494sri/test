#!/bin/bash

NUMBER1=$1  # $1 is used to get the first argument passed to the script
NUMBER2=$2  # $2 is used to get the second argument passed to the script

TIMESTAMP=$(date) # date command is used to get the current date and time AND $() is used to execute the command

echo "script excuted at: $TIMESTAMP"  # this line is used to print the message

sum=$((NUMBER1 + NUMBER2))  # $(( )) is used to perform the arithmetic operation

echo "sum of $NUMBER1 and $NUMBER2 is $sum" # this line is used to print the message 

