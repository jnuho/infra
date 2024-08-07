#!/bin/bash


HOST_WIDTH=10
IP_WIDTH=15
TEMP_WIDTH=15
TITLE_WIDTH=20

printf "\n"
printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TITLE_WIDTH}s %-${TITLE_WIDTH}s %-${TITLE_WIDTH}s\n" "HOST" "Node IP" \
    "𓇲  CPU °C" "📥 SSD °C" "🍃 Fan RPM"

for host in "m" "w1" "w2"; do
    hostname=$(ssh "$host" "hostname" | awk '{print $1}')
    ip=$(ssh "$host" "hostname -I" | awk '{print $1}')
    cpu_temp=$(ssh "$host" sensors | grep 'cpu_thermal-virtual-0' -A 2 | awk '/temp1:/ {print $2}')
    ssd_temp=$(ssh "$host" sensors | grep 'nvme-pci-0100' -A 2 | awk '/Composite:/ {print $2}')
    rpm=$(ssh "$host" sensors | grep 'pwmfan-isa-0000' -A 2 | awk '/fan1:/ {print $2 " " $3}')
    
    # Print formatted line
    # printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TEMP_WIDTH}s\n" "$host" "$ip" "$cpu_temp"
    printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TITLE_WIDTH}s %-${TITLE_WIDTH}s %-${TITLE_WIDTH}s\n" "$hostname" "$ip" "$cpu_temp" "$ssd_temp" "$rpm"
done
printf "\n"