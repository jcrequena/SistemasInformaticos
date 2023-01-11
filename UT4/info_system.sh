#!/bin/bash
### BEGIN INIT INFO
# Provides:       info-system
# Required-Start: 
# Required-Stop:  
# Default-Start: 4
# Default-Stop:   
# Short-Description: Información de acceso al sistema.
### END INIT INFO

# Esta secuencia de comandos devolverá el siguiente conjunto de información del sistema:
#Fecha de los datos de información de acceso al equipo.
echo -e "***** FECHA *****" >> /var/log/info-access.dat
echo `date` >> /var/log/info-access.dat

# -Información de nombre de usuario:
echo -e "***** INFORMACIÓN DEL HOSTNAME *****" >> /var/log/info-access.dat
hostnamectl >> /var/log/info-access.dat
echo "" >> /var/log/info-access.dat
# -El uso del espacio en disco del sistema de archivos:
echo -e "***** SISTEMA DE ARCHIVO DISCO ESPACIO UTILIZADO *****" >> /var/log/info-access.dat
df -h >> /var/log/info-access.dat
echo "" >> /var/log/info-access.dat
# - Memoria libre y usada en el sistema:
echo -e "***** MEMORIA UTILIZADA Y LIBRE *****" >> /var/log/info-access.dat
free >> /var/log/info-access.dat
echo "" >> /var/log/info-access.dat
# -Sistema de tiempo de actividad y carga:
echo -e "\e[31;43m ***** SISTEMA EN TIEMPO Y CARGA *****" >> /var/log/info-access.dat
uptime >> /var/log/info-access.dat
echo "" >> /var/log/info-access.dat
# -Usuarios Conectados:
echo -e "***** USUARIOS ACTUALMENTE REGISTRADOS *****" >> /var/log/info-access.dat
who >> /var/log/info-access.dat
echo "" >> /var/log/info-access.dat
# -Top 5 procesa en lo que respecta al uso de memoria
echo -e "***** TOP 5 PROCESOS DE CONSUMO DE MEMORIA *****" >> /var/log/info-access.dat
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6 >> /var/log/info-access.dat
echo "" >> /var/log/info-access.dat
echo -e "Fin del informe" >> /var/log/info-access.dat
