#!/usr/bin/env bash
#
# Maybe you are uninstalling NVIDIA forever, maybe you are upgrading Debian...
# Either way, this will remove the sources, lists, and associated GPG key

sudo rm -f /etc/apt/sources.list.d/nvidia-drivers.sources /etc/apt/sources.list.d/nvidia-drivers.list
sudo rm -f /usr/share/keyrings/nvidia-drivers.gpg
sudo apt-get update
