#!/bin/bash
### BEGIN INIT INFO
# Provides:       list_process
# Required-Start: 
# Required-Stop: 
# Default-Start:  3 4 5
# Default-Stop:   1 2
# Short-Description: List State Process
### END INIT INFO

echo `date` >> /var/log/process-list.dat
echo "---------------------------------" >> /var/log/process-list.dat
ps -aux >> /var/log/process-list.dat

