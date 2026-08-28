#!/bin/bash

NUM1=$1
NUM2=$2

SUM=$((NUM1+NUM2))
TIMESTAMP=$(date)
echo "Sum of two numbers are $SUM"
echo "Script executed at $TIMESTAMP"
echo "Sum of $NUM1 and $NUM2 are $SUM"
