#!/bin/sh
iptables -F

iptables -P INPUT DROP
iptables -A INPUT -s localhost -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
#Allow git
#iptables -A OUTPUT -o eth0 -p tcp --dport 9418 -m state --state NEW,ESTABLISHED -j ACCEPT 
iptables -A INPUT -i eth0 -p tcp --sport 9418 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
