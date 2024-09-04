#!/bin/bash

# Check if /etc/pve is mounted
if mountpoint -q /etc/pve; then
    echo "Disabling Proxmox firewall..."

    # Ensure the firewall configuration file exists
    if [ -f /etc/pve/firewall/cluster.fw ]; then
        echo "enable: 0" > /etc/pve/firewall/cluster.fw
    else
        echo "Firewall configuration file not found!"
    fi

    # Restart firewall service to apply changes
    systemctl restart pve-firewall
else
    echo "/etc/pve is not mounted, cannot disable firewall!"
fi