# NVIDIA driver install for Debian

NVIDIA is... inconsistant with their reliability and ease of installation.

This folder is an attempt to contain the scripts and general information needed to install NVIDIA drivers for Debian. They may also work for Linux Mint Debian Edition or Ubuntu-based distributions, but I haven't tested these on anything besides Debian-Testing.

I have personally messed up my NVIDIA drivers several times in the past. Please learn from my stupidity and read everything that you can about NVIDIA drivers on Debian before continuing! You can also learn from my stupidity and bypass all of this with an AMD gpu... just saying.

## Choose Between Proprietary and Open-Source Driver Variants

Starting with driver version 515, NVIDIA publishes two kernel module flavors:
 * Proprietary (closed-source)
 * Open (open-source kernel modules with closed-source firmware and userspace).
 
The open variant targets newer hardware from Turing architecture forward, while the proprietary variant supports legacy hardware.
Blackwell is the first architecture that requires the open variant exclusively.

Architecture support breakdown:
 * Open variant: Turing (GTX 16/RTX 20 series), Ampere (RTX 30 series), Ada Lovelace (RTX 40 series), and Blackwell (RTX 50 series) architectures
 * Proprietary variant: Maxwell (GTX 900/10 series), Pascal (GTX 10 series), Volta, Turing, Ampere, and Ada Lovelace architectures
 * Legacy drivers (390xx): Older architectures (Kepler, Fermi) not supported by current drivers; 390xx is available only on Debian 11

Generally, most users should choose proprietary drivers for proven stability and full feature support. However, the open variant offers better Linux kernel integration but may have reduced performance on some GPU models. Choose open drivers when you need open-source licensing, better kernel compatibility, or have Blackwell-series hardware that requires them.

## METHOD 1: Download the .run driver installers

Check out [Nvidia's driver search](https://www.nvidia.com/en-us/drivers/results/). Enter your graphic card's info and download the drivers that you are looking for.

HIGHLY ADVISED to download more than one driver!!! Download the latest Production, Beta, and New Feature Branch. Download the last 2 or 3 Production drivers. Whatever you do, download more than one so that if the installation fails and you boot into the terminal you can try another one. Use the driver search link above and your common sense as a guide for what to download.

## METHOD 2: Install nvidia-driver with apt

You could always try installing `nvidia-driver` from your package manager (apt, nala, whatever...), but I don't suggest it for the following reasons...
 * Mismatched driver/CUDA/library version updates (sometimes an update is ready for *this* nvidia package, but not *the other*, typically leading to major issues)
 * A simple system upgrade can lead to a black screen on the next reboot (with access to the terminal *IF* you are lucky)
 * If you want to use hardware encoding/decoding with ffmpeg or pass your GPU to containers or VMs, you will run into an issue somewhere. Just trust me.

Sure, maybe others may have had luck with it. Maybe I had other things in my system that caused the issues with NVIDIA/CUDA drivers. And MAYBE it is the better and safer driver for the average joe that doesn't worry about CUDA or proprietary ffmpeg codecs. Maybe...

### Links for more info...
[linuxcapable](https://linuxcapable.com/install-nvidia-drivers-on-debian/#install-nvidia-cuda-repo)
[docs.nvidia.cuda](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#debian-installation)
