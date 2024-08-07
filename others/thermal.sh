#!/bin/bash


HOST_WIDTH=5
IP_WIDTH=15
TEMP_WIDTH=10

echo "------------CPU temperature------------"
for host in "m" "w1" "w2"; do
    ip=$(ssh "$host" "hostname -I" | awk '{print $1}')
    temp=$(ssh "$host" sensors | grep 'cpu_thermal-virtual-0' -A 2 | awk '/temp1:/ {print $2}')
    
    # Print formatted line
    printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TEMP_WIDTH}s\n" "$host" "$ip" "$temp"
done

echo ""
echo "------------NVME SSD temperature------------"
for host in "m" "w1" "w2"; do
    ip=$(ssh "$host" "hostname -I" | awk '{print $1}')
    temp=$(ssh "$host" sensors | grep 'nvme-pci-0100' -A 2 | awk '/Composite:/ {print $2}')
    
    # Print formatted line
    printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TEMP_WIDTH}s\n" "$host" "$ip" "$temp"
done

echo ""
echo "------------Fan RPM------------"
for host in "m" "w1" "w2"; do
    ip=$(ssh "$host" "hostname -I" | awk '{print $1}')
    rpm=$(ssh "$host" sensors | grep 'pwmfan-isa-0000' -A 2 | awk '/fan1:/ {print $2 " " $3}')
    
    # Print formatted line
    printf "%-${HOST_WIDTH}s %-${IP_WIDTH}s %-${TEMP_WIDTH}s\n" "$host" "$ip" "$rpm"
done

