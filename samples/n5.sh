#!/bin/bash

N1=$1
N2=$2

TIMESTAMP=$(date)

echo "This script has been executed at $TIMESTAMP"

SUM=$((N1+N2))

echo "The sum of two numbers is : $SUM"
