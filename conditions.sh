#!/bin/bash

NUMBER=$1

# -gt , -lt, -eq, -ne, -le, -ge
# -gt is greater than 
# -lt is less than
# -eq is equal to
# -ne is not equal to
# -le is less than or equal to
# -ge is greater than or equal to

if [ $NUMBER -gt 100 ]  # if condition to check the given number is greater than 100

then  

echo "given number is greater than 100"

else # else condition to check the given number is less than 100

echo "given number is less than 100" # echo statement to print the output

fi # end of if condition