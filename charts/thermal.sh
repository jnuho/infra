#!/bin/bash

HOST_WIDTH=10
IP_WIDTH=15
TEMP_WIDTH=15
TITLE_WIDTH=20

curr_time=$(date +"%T")
curr_date=$(date +"%Y-%m-%d")
printf "$curr_date. $curr_time\n\n"
printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TITLE_WIDTH}s %-${TITLE_WIDTH}s %-${TITLE_WIDTH}s\n" "HOST" "Node IP" \
    "𓇲  CPU °C" "📥 SSD °C" "🍃 Fan RPM"

#start=$(date +%s)

for host in "m" "w1" "w2"; do
    hostname=$(ssh "$host" "hostname" | awk '{print $1}')
    ip=$(ssh "$host" "hostname -I" | awk '{print $1}')

    TEXT=$(ssh "$host" "sensors")
    cpu_temp=$(echo "$TEXT" | grep -A 2 'cpu_thermal-virtual-0' | awk '/temp1:/ {print $2}')
    ssd_temp=$(echo "$TEXT" | grep -A 2 'nvme-pci-0100' | awk '/Composite:/ {print $2}')
    rpm=$(echo "$TEXT" | grep -A 2 'pwmfan-isa-0000' | awk '/fan1:/ {print $2}')

    # Print formatted line
    printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TITLE_WIDTH}s %-${TITLE_WIDTH}s %-${TITLE_WIDTH}s\n" "$hostname" "$ip" "$cpu_temp" "$ssd_temp" "$rpm"
done
printf "\n"

# endtime=$(date +%s)
# runtime=$((endtime-start))
# echo "Runtime: $runtime seconds"
