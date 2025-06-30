#! /bin/bash

NUM=$1

if [ $NUM -gt 100 ]
then 
    echo "Given number $NUM is greater than 100"
else
    echo "Given number $NUM is lesser than 100"
fi