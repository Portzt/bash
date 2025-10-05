#!/bin/bash
# This Script is from Black Hat Bash - No Starch Press - ISBN-13 978-1-7185-0374-8
# This script will grab banners using curl

# SET A DEFAULT PORT NUMBER
DEFAULT_PORT=80

# GET IP AND PORT FROM USER
read -r -p "Type a target IP address: " ip
read -r -p "Type a target port number (default is 80): " port

# Catch if the user didn't enter an IP address
if [[ -z $ip ]]; then
  echo "You must enter an IP address"
    exit 1
fi

# Catch if the user didn't enter a port number
if [[ -z $port ]]; then
    port=${DEFAULT_PORT}
    echo "No port number entered, using default port $DEFAULT_PORT"
fi

# GRAB THE BANNER
echo "Grabbing http banner from $ip on port $port"
result=$(curl -s --head "http://${ip}:${port}" | grep 'Server' | awk -F ':' '{print $2}')

# Catch if no banner was found
if [[ -z $result ]]; then
    result="No banner found"
fi

# DISPLAY THE RESULTS
echo "The banner for $ip on port $port is: $result"
