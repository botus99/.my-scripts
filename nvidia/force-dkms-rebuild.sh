#!/usr/bin/env bash
#
# If DKMS fails to rebuild drivers after a kernel update,
# force DKMS to rebuild matching your current kernel

sudo apt install linux-headers-"$(uname -r)"
sudo dkms autoinstall && sudo update-initramfs -u
