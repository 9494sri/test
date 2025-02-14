#!/bin/bash

echo "All Variables passed : $@ " # All variables passed to the script
echo " Number of Variables : $# " # Number of variables passed to the script
echo " Script name : $0" # Script name
echo "Present working directory : $PWD  "  # Present working directory
echo "Home directory of current user : $HOME "  # Home directory of current user
echo "Which user is running this script : $USER " # Which user is running this script
echo "Process id of current script : $$ "  # Process id of current script
sleep 60 & # sleep command is used to pause the script for 60 seconds and & is used to run the command in background and & is used to run the command in background
echo "Process id of last command in background : $! " # Process id of last command in background