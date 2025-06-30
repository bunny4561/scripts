#! /bin/bash

echo "All variables passed    $@"   
echo "Number of variables  $#"
echo "Script Name   $0"
echo "Present Working Directory   $PWD"
echo "HOME directory of current user   $HOME"
echo "Which user is running the script   $USER"
echo "Process id of current script   $$"
sleep 90 &
echo "Process id of last command in background   $!"
