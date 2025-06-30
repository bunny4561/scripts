#! /bin/bash

NUM1=$1
NUM2=$2

TIMESTAMP=$(date)
echo "Script executed at : $TIMESTAMP"
SUM=$(($NUM1+$NUM2))
echo "Sum of 2 numbers is:: $SUM"