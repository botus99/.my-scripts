#!/usr/bin/env bash
#
# If the proprietary NVIDIA driver and open-source Nouveau driver load
# simultaneously, blacklist Nouveau permanently with this script.

echo "blacklist nouveau
options nouveau modeset=0" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u && sudo reboot
