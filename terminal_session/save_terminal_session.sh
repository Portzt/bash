#!/bin/bash
# This Script is from Black Hat Bash - No Starch Press - ISBN-13 978-1-7185-0374-8
# This script will save off your terminal session to a file
# Add this to your .bashrc or .zshrc file to have it run automatically

# Create the log filename with date and time
FILENAME=$(date +%m_%d_%Y_%H\:%M\:%S).log

# Create the sessions directory if it doesn't exist
if [[ ! -d ~/sessions ]]; then
  mkdir ~/sessions
fi

# Starting a script session
# -z Checks if the variable is empty
# If SCRIPT variable is not set, set it to the default path
# Start the script command to log the session
if [[ -z $SCRIPT ]]; then
  export SCRIPT="/home/${USERNAME}/sessions/${FILENAME}"
  script -q -f "${SCRIPT}"
fi