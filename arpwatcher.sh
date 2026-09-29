!#/bin/bash

set -e


interface=$(ip -o addr | grep -E "(wl.*|en.*|eth.*)" | grep "inet " | head -n 1 | awk '{print $2}')
liveHostsInt=()

liveKubes=$(kubectl get pods --no-headers | awk '{print $1}')

while [ true ]; do
sleep 60000
hosts=$(ip neigh show dev "$interface" | grep -v "fe80:" | grep -E "REACHABLE|DELAY|STALE" | awk '{print $1}')

for host in $hosts; do
temp=0
for (( i=0; i<${#host}; i++)); do
charInt=$(printf "%d" "'${host:i:1}")
temp=$(( temp + charInt ))
done
liveHostsInt+=($temp)
done




done
