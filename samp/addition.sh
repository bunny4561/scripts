#!/bin/bash

NUM1=$1
NUM2=$2

SUM=$(($NUM1 + $NUM2))
TIMESTAMP=$(date)
echo "Addition of two numbers are:: $SUM"

echo "Addition of two numbers executed at $TIMESTAMP is :: $SUM"