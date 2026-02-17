#!/bin/bash

echo "Please enter your number::"
read $NUM
if [ $NUM -gt 100 ]
then
    echo "Entered number $NUM is greater than 100"
else
    if [ $NUM -eq 100 ]
    then
        echo "Entered number $NUM is equals to 100"
    else
        echo "Entered number $NUM is less than 100"
    fi
fi
