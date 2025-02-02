#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)

echo "script excuted at: $TIMESTAMP"

sum=$((NUMBER1 + NUMBER2))

echo "sum of $number1 and $number2 is $sum"

