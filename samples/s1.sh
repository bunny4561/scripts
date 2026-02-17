#!/bin/bash

NUM1=$1
NUM2=$2

SUM=$(($NUM1+$NUM2))

TIMESTAMP=$(date)

echo "Script executed at $TIMESTAMP"

echo "The sum of $NUM1 and $NUM2 values are::$SUM"