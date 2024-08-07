#!/bin/bash


HOST_WIDTH=5
IP_WIDTH=15
TEMP_WIDTH=10

echo "------------CPU temperature------------"
for host in "m" "w1" "w2"; do
    # ip=$(ssh "$host" "hostname -I" | awk '{print $1}')
    # temp=$(ssh "$host" sensors | grep 'cpu_thermal-virtual-0' -A 2 | awk '/temp1:/ {print $2}')
    # echo "$host: $ip  -  $temp"
    ip=$(ssh "$host" "hostname -I" | awk '{print $1}')
    temp=$(ssh "$host" sensors | grep 'cpu_thermal-virtual-0' -A 2 | awk '/temp1:/ {print $2}')
    
    # Print formatted line
    printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TEMP_WIDTH}s\n" "$host" "$ip" "$temp"
done

echo ""
echo "------------NVME SSD temperature------------"
for host in "m" "w1" "w2"; do
    # ip=$(ssh "$host" "hostname -I" | awk '{print $1}')
    # temp=$(ssh "$host" sensors | grep 'cpu_thermal-virtual-0' -A 2 | awk '/temp1:/ {print $2}')
    # echo "$host: $ip  -  $temp"
    ip=$(ssh "$host" "hostname -I" | awk '{print $1}')
    temp=$(ssh "$host" sensors | grep 'nvme-pci-0100' -A 2 | awk '/Composite:/ {print $2}')
    
    # Print formatted line
    printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TEMP_WIDTH}s\n" "$host" "$ip" "$temp"
done

