#!/usr/bin/env bash
#
# Uninstall NVIDIA and CUDA drivers that were installed
# from your distro's package manager

sudo apt autoremove nvidia* --purge
sudo apt autoremove cuda* libnvidia* --purge
