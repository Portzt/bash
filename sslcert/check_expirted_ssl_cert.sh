#!/bin/bash
# This script checks for expired SSL certificates on a domain.

DOMAIN=$1
EXPIRY_DATE=$(echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)
DAYS_LEFT=$(( ( $(date -d "$EXPIRY_DATE" +%s) - $(date +%s) ) / 86400 ))
if [ $DAYS_LEFT -le 0 ]; then
    echo "The SSL certificate for $DOMAIN has expired."
else
    echo "The SSL certificate for $DOMAIN is valid for $DAYS_LEFT more days."
fi