#!/bin/bash

NUMBER1=$1  # $1 is used to get the first argument passed to the script and variable name is NUMBER1 and argument is stored in NUMBER1
NUMBER2=$2  # $2 is used to get the second argument passed to the script and variable name is NUMBER2  and argument is stored in NUMBER2

TIMESTAMP=$(date) # date command is used to get the current date and time AND $() is used to execute the command

echo "script excuted at: $TIMESTAMP"  # this line is used to print the message

sum=$((NUMBER1 + NUMBER2))  # $(( )) is used to perform the arithmetic operation

echo "sum of $NUMBER1 and $NUMBER2 is $sum" # this line is used to print the message 

