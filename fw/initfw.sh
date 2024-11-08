#!/bin/bash

# Activar el reenvío de paquetes (bit de forwarding)
echo 1 > /proc/sys/net/ipv4/ip_forward

# Establecer políticas predeterminadas
iptables --policy INPUT DROP
iptables --policy FORWARD DROP
iptables --policy OUTPUT ACCEPT

# Permitir tráfico en loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Permitir tráfico relacionado y establecido
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Permitir ICMP (ping)
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# Guardar las reglas de iptables para que persistan al reiniciar el contenedor
# Esto es necesario para que no se pierdan las reglas tras el reinicio
iptables-save > /etc/iptables/rules.v4
