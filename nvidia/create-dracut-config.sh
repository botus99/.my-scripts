#!/usr/bin/env bash
#
# Specifically, Debian 13 Trixie uses dracut for initramfs generation instead of
# initramfs-tools. Systems using dracut require explicit modprobe configuration
# file inclusion to ensure NVIDIA drivers load correctly during early boot.
# Skip this if you use Debian 12 or 11.
#
# Configure dracut before installing NVIDIA drivers to avoid boot issues.
# If you already installed drivers without this configuration,
# create the dracut config file and rebuild your initramfs:
# 'sudo dracut --force'

# create a dracut configuration file that includes NVIDIA modprobe settings
echo 'install_items+=" /etc/modprobe.d/nvidia-blacklists-nouveau.conf /etc/modprobe.d/nvidia.conf /etc/modprobe.d/nvidia-options.conf "' | sudo tee /etc/dracut.conf.d/10-nvidia.conf

# Force NVIDIA modules to load during initramfs rather than on-demand after boot.
# This ensures the DRM subsystem is fully initialized before the display manager starts.
# Create a dracut configuration file that adds the NVIDIA modules to early boot
echo 'add_drivers+=" nvidia nvidia_modeset nvidia_uvm nvidia_drm "' | sudo tee /etc/dracut.conf.d/nvidia-early-load.conf

# Rebuild the initramfs to apply the change
sudo dracut --force
