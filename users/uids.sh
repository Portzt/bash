#!/bin/bash
# List system level accounts (UID 999 or less) or user level accounts (UID 1000 or greater)
# Author: Thomas Portz

while true; do
  echo "Would you like to see [Ss]ystem accounts, [Uu]ser accounts or [Qq]uit?"
  read expression
  echo ""
    case $expression in
      "S" | "s" )
        echo "Showing system level accounts"
        sudo getent passwd | awk -F ':' '($3 <= 999) { print "User: "$1, "UID: "$3 }'
        exit 0
        ;;
      "U" | "u" )
        echo "Showing user level accounts"
        sudo getent passwd | awk -F ':' '($3 >= 1000) { print "User: "$1, "UID: "$3 }'
        exit 0
        ;;
      "Q" | "q" )
        echo "Exiting......"
        exit 0
        ;;
      *)
        echo "Choice invalid. Valid choices are [SsUuQq]"
        ;;
    esac
done
