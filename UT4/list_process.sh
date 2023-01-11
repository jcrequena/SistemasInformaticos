#!/bin/bash
### BEGIN INIT INFO
# Provides:       list_process
# Required-Start: 
# Required-Stop: 
# Default-Start:  5
# Default-Stop:   
# Short-Description: List State Process
### END INIT INFO

echo `date` >> /var/log/process-list.dat
echo "---------------------------------" >> /var/log/estado-procesos.dat
ps -aux >> /var/log/process-list.dat
echo "---------------------------------" >> /var/log/process-list.dat
