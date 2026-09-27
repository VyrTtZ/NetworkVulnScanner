!#/bin/bash

yay -S --noconfirm nmap

ipCidr=$(ip -o addr | grep "wl.*" | grep "inet\ " 2>/dev/null | awk '{print $4}')
hostsUp=$(nmap -sn -T4 -n "$ipCidr" | awk '/Nmap scan report/{print $NF}' | tr -d '()')

