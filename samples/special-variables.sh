#!/bin/bash

echo "All variables passed:: $@"
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo " Which user is running the sctript: $USER"
echo "processes id of current running script: $$"
sleep 30 &
echo "processed id of last command running in background: $!"
