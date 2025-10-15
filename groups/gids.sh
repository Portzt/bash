#!/bin/bash
# List system level groups (GID 999 or less) or user level groups (GID 1000 or greater)
# Author: Thomas Portz

while true; do
  echo "Would you like to see [Ss]ystem groups, [Uu]ser groups or [Qq]uit?"
  read expression
  echo ""
    case $expression in
      "S" | "s" )
        echo "Showing system level groups"
        sudo getent group | awk -F ':' '($3 <= 999) { print "Group: "$1, "GID: "$3 }'
        exit 0
        ;;
      "U" | "u" )
        echo "Showing user level groups"
        sudo getent group | awk -F ':' '($3 >= 1000) { print "Group: "$1, "GID: "$3 }'
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
