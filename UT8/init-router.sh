#!/bin/bash
#interfaz externa - Adaptador puente de la Máquina virtual
WAN="enp0s3"

#interfaz interna - Adaptador Red Interna de la Máquina virtual
LAN="enp0s8"

# Interfaz con conexión a Internet
/sbin/iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE

# Interfaz red interna LAN
/sbin/iptables -A FORWARD -i $LAN -j ACCEPT



