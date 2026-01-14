#!/usr/bin/env bash
#
# NVIDIA drivers reside in Debian’s non-free repositories due to their proprietary
# licensing. Before installation, you must enable the contrib and non-free repositories.
# The required components differ by version:
# Debian 12+ needs contrib non-free non-free-firmware
# Debian 11 uses only contrib non-free.

# Debian 12+
sudo sed -i 's/Components: main/Components: main contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources

# Debian 11-
# sudo sed -i 's/main$/main contrib non-free/' /etc/apt/sources.list

# Refresh package cache
sudo apt-get update
