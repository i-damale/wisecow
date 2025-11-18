#!/usr/bin/env bash

# Author: Somnath D
# Script: System Health Monitor
# version: 1.0
# Date Nov 17 2025

# Threshold values
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Log file
LOGFILE="system_health.log"

# Timestamp 
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# CPU Usage 
# top -bn1 → batch mode, 1 iteration
# grep "Cpu(s)" → extract CPU line
# awk '{print 100 - $8}' → CPU used = 100 - idle_percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# Memory Usage 
# free → memory info
# awk '{print ($3/$2)*100}' → used_memory / total_memory * 100
MEM_USAGE=$(free | grep Mem | awk '{print ($3/$2)*100}')

# Disk Usage 
# df / → filesystem usage of root
# awk '{print $5}' → extract "45%"
# sed 's/%//' → remove % sign, leave number only
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

# Logging 
echo "[$TIMESTAMP] CPU: ${CPU_USAGE}% | MEM: ${MEM_USAGE}% | DISK: ${DISK_USAGE}%" >> $LOGFILE

# Threshold Checks
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "[$TIMESTAMP] ALERT: CPU usage exceeded ${CPU_THRESHOLD}%!" >> $LOGFILE
fi

if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
    echo "[$TIMESTAMP] ALERT: Memory usage exceeded ${MEM_THRESHOLD}%!" >> $LOGFILE
fi

if (( DISK_USAGE > DISK_THRESHOLD )); then
    echo "[$TIMESTAMP] ALERT: Disk usage exceeded ${DISK_THRESHOLD}%!" >> $LOGFILE
fi
