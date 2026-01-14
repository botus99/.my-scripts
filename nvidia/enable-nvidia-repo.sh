#!/usr/bin/env bash
#
# enable NVIDIA proprietary driver and CUDA repo
# Be sure to use uncomment the correct version needed

sudo apt install ca-certificates curl gpg dkms -y

# Debian 13
curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/8793F200.pub | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-drivers.gpg
echo "Types: deb
URIs: https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/
Suites: /
Signed-By: /usr/share/keyrings/nvidia-drivers.gpg" | sudo tee /etc/apt/sources.list.d/nvidia-drivers.sources

# Debian 12
#curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/3bf863cc.pub | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-drivers.gpg
#echo "Types: deb
#URIs: https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/
#Suites: /
#Signed-By: /usr/share/keyrings/nvidia-drivers.gpg" | sudo tee /etc/apt/sources.list.d/nvidia-drivers.sources

# Debian 11
#curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/3bf863cc.pub | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-drivers.gpg
#echo 'deb [signed-by=/usr/share/keyrings/nvidia-drivers.gpg] https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/ /' | sudo tee /etc/apt/sources.list.d/nvidia-drivers.list
