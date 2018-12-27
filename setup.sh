#!/bin/bash

# Root user check
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 
   exit 1
fi

# Copy brcm firmware
echo "--- Fixing Broadcom SDIO WiFi ---"
cp -f firmware/brcm/* /lib/firmware/brcm/

# Fixing audio
echo "--- Fixing audio ---"
mkdir /usr/share/alsa/ucm/Acer-OneS1003-V1.15-OneS1003
cp -f firmware/Acer-OneS1003-V1.15-OneS1003/* > /usr/share/alsa/ucm/Acer-OneS1003-V1.15-OneS1003/

# Fixing bluetooth
echo "--- Fixing bluetooth ---"
cp -f firmware/bluetooth/* /lib/firmware/brcm/

echo "All done, please reboot."
reboot
