#!/bin/bash
# This script lists all users on a Linux system by reading the /etc/passwd file.

# Read the /etc/passwd file and extract usernames
echo "Counting users on the system..."
getent passwd | wc -l
echo ""

echo "Listing all users on the system:"
getent passwd | awk -F ':' '{ print $1 }' | sort
echo ""
