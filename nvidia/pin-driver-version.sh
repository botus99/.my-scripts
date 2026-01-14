#!/usr/bin/env bash
#
# By default, Debian’s package manager updates NVIDIA drivers
# when newer versions become available. For production systems
# or environments requiring stability, NVIDIA provides
# version-locking packages that prevent automatic driver upgrades.
# These packages pin your system to track a specific driver branch
# (e.g., 535.x series) or exact version.

# sudo apt install nvidia-driver-pinning-<version>
