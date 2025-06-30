#! /bin/bash

N1=$1
N2=$2
N3=$3
N4=$4
N5=$5

SUM=$(($N1+$N2+$N3+$N4+$N5))
echo "SUM of given numbers are :: $SUM"
TIMESTAMP=$(date)
echo " Script executed at timestamp is :: $TIMESTAMP"