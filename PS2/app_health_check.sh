#!/usr/bin/env bash

# -----------------------------------------
# Author: Somnath D
# Application Health Checker
# Date: 17 Nov 2025
# GitHub: i-damale
#
# Usage:
#   ./app_health_check.sh https://example.com
#
# Checks an application's status using HTTP
# status codes. Treats redirects as UP.
# -----------------------------------------

URL=$1
LOGFILE="app_health.log"

if [ -z "$URL" ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# 200 = UP  
# 3xx = Redirect → also treat as UP
if [ "$STATUS_CODE" -eq 200 ] || [[ "$STATUS_CODE" -ge 300 && "$STATUS_CODE" -lt 400 ]]; then
    echo "[$TIMESTAMP] $URL STATUS: UP " | tee -a $LOGFILE
else
    echo "[$TIMESTAMP] $URL STATUS: DOWN " | tee -a $LOGFILE
fi
