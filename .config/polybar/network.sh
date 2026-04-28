#!/bin/bash

# Ethernet d'abord
ETH=$(ip link show | awk '/^[0-9]+: e/{print $2}' | tr -d ':' | head -1)
if [ -n "$ETH" ] && ip link show "$ETH" | grep -q "state UP"; then
    IP=$(ip -4 addr show "$ETH" | grep -oP '(?<=inet )[^/]+')
    echo "  $ETH  $IP"
    exit 0
fi

# Sinon Wi-Fi
WLAN=$(ip link show | awk '/^[0-9]+: w/{print $2}' | tr -d ':' | head -1)
if [ -n "$WLAN" ] && ip link show "$WLAN" | grep -q "state UP"; then
    ESSID=$(iwgetid -r "$WLAN" 2>/dev/null || echo "?")
    DOWN=$(cat /sys/class/net/$WLAN/statistics/rx_bytes 2>/dev/null || echo "0")
    echo "  $ESSID"
    exit 0
fi

# Rien
echo "  no net"
