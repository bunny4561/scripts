#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]
then
    echo "Entered number: $NUMBER is larger than 100"
else
    echo "Enter number: $NUMBER is equal to or lesser than 100"
fi
