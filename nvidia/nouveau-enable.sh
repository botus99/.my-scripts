#!/usr/bin/env bash
#
# This script will remove Nouveau blacklist files and update either
# dracut or initramfs to use Nouveau at next reboot... then it reboots.

# Delete the Nouveau blacklist configuration to allow the open-source driver to load
sudo rm -f /etc/modprobe.d/blacklist-nouveau.conf /etc/modprobe.d/nvidia-installer-disable-nouveau.conf

# Regenerate the initramfs to activate Nouveau
if command -v update-initramfs >/dev/null 2>&1; then
    # On Debian 12 and below...
    sudo update-initramfs -u
elif command -v dracut >/dev/null 2>&1; then
    # On Debian 13 and above...
    sudo dracut --force
else
    echo "Can not find update-initramfs or dracut. Not sure what to do here..."
fi

echo "If all went well, you should consider rebooting to see if Nouveau is enabled now."
